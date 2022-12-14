<?php

namespace app\frontend\modules\goods\controllers;

use app\backend\modules\goods\models\Brand;
use app\common\components\ApiController;
use app\common\components\BaseController;
use app\common\exceptions\AppException;
use app\common\exceptions\MemberNotLoginException;
use app\common\facades\Setting;
use app\common\models\Category;
use app\common\models\goods\Privilege;
use app\common\models\OrderGoods;
use app\frontend\models\Member;
use app\frontend\modules\goods\models\Goods;
use app\common\models\GoodsSpecItem;
use app\common\services\goods\SaleGoods;
use app\common\services\goods\VideoDemandCourseGoods;
use app\common\models\MemberShopInfo;
use app\frontend\modules\member\controllers\ServiceController;
use app\frontend\modules\member\services\MemberService;
use Illuminate\Support\Facades\DB;
use Monolog\Handler\IFTTTHandler;
use Yunshop\Commission\Common\Services\GoodsDetailService;
use Yunshop\Designer\models\ViewSet;
use Yunshop\FreightPricing\models\ContentModel;
use Yunshop\GoodsLink\services\GetGoodsDocService;
use Yunshop\MarketSub\models\MarketSubGoods;
use Yunshop\ProductMarket\models\ProductMarketGoodsModel;
use Yunshop\Room\models\Room;
use Yunshop\ServiceFee\models\ServiceFeeModel;
use Yunshop\StoreCashier\common\services\CustomerService;
use Yunshop\StoreCashier\store\models\StoreGoods;
use Yunshop\TeamDividend\Common\Services\TeamDividendGoodsDetailService;
use Yunshop\Commission\models\Agents;
use Yunshop\Love\Common\Models\GoodsLove;
use app\frontend\modules\coupon\models\Coupon;
use app\frontend\modules\coupon\controllers\MemberCouponController;
use app\common\services\goods\LeaseToyGoods;
use Yunshop\Supplier\common\models\SupplierGoods;
use Yunshop\TeamDividend\models\TeamDividendAgencyModel;
use app\common\models\MemberLevel;
use app\common\models\MemberGroup;
use Yunshop\StoreCashier\common\models\StoreSetting;
use app\frontend\modules\goods\models\Comment;
use Yunshop\TeamSales\common\services\GoodsListService;
use Yunshop\Decorate\models\DecorateTempletModel;
use Yunshop\WxVideoLink\common\model\WxVideoLikeSetModel;

/**
 * Created by PhpStorm.
 * Author: ???????????? www.yunzshop.com
 * Date: 2017/3/3
 * Time: 22:16
 */
class OldGoodsController extends GoodsController
{
    protected $publicAction = ['getRecommendGoods'];
    protected $ignoreAction = ['getRecommendGoods'];

    // ??????getGoods??????????????????????????????????????????????????????????????????????????????????????????????????????getGoods?????????
    protected function _getGoods($id, $integrated = null)
    {
        $goods_model = \app\common\modules\shop\ShopConfig::current()->get('goods.models.commodity_classification');
        $goods_model = new $goods_model;
        try {
            $member = Member::current()->yzMember;
        } catch (MemberNotLoginException  $e) {
            if (\YunShop::request()->type == 1) {
                return;
            }

            throw new MemberNotLoginException($e->getMessage(), $e->getData());
        }

        $goodsModel = $goods_model->uniacid()
            ->with([
                'hasManyParams' => function ($query) {
                    return $query->select('goods_id', 'title', 'value')->orderby('displayorder', 'asc');
                },
                'hasManySpecs' => function ($query) {
                    return $query->select('id', 'goods_id', 'title', 'description');
                },
                'hasManyOptions' => function ($query) {
                    return $query->select('id', 'goods_id', 'title', 'thumb', 'product_price', 'market_price', 'stock', 'specs', 'weight');
                },
                'hasManyDiscount' => function ($query) use ($member) {
                    return $query->where('level_id', $member->level_id);
                },
                'hasOneBrand' => function ($query) {
                    return $query->select('id', 'logo', 'name', 'desc');
                },
                'hasOneShare',
                'hasOneGoodsDispatch',
                'hasOnePrivilege',
                'hasOneSale',
                'hasOneGoodsCoupon',
                'hasOneInvitePage',
                'hasOneGoodsLimitBuy',
                'hasOneGoodsVideo',
            ])
            ->find($id);

        $goodsModel->vip_level_status;
        if (!$goodsModel) {
            if (is_null($integrated)) {
                return $this->errorJson('???????????????.');
            } else {
                return show_json(0, '???????????????.');
            }
        }

        //????????? todo ???????????? ?????????????????????
//        $current_time = time();
//        if (!is_null($goodsModel->hasOneGoodsLimitBuy)) {
//            if ($goodsModel->hasOneGoodsLimitBuy->end_time < $current_time && $goodsModel->hasOneGoodsLimitBuy->status == 1) {
//                $goodsModel->status = 0;
//                $goodsModel->save();
//            }
//        }

        $current_time = time();
        if (!is_null($goodsModel->hasOneGoodsLimitBuy)) {
            if ($goodsModel->hasOneGoodsLimitBuy->end_time < $current_time && $goodsModel->hasOneGoodsLimitBuy->status == 1) {
                if (is_null($integrated)) {
                    return $this->errorJson('????????????????????????.');
                } else {
                    return show_json(0, '????????????????????????.');
                }
            }
        }

        if (!$goodsModel->status) {
            if (is_null($integrated)) {
                return $this->errorJson('???????????????.');
            } else {
                return show_json(0, '???????????????.');
            }
        }

        $goodsModel->is_added = \Setting::get('shop.member.added') ?: 1;

        //??????????????????
        if ($goodsModel->hasOneBrand) {
            $goodsModel->hasOneBrand->desc = html_entity_decode($goodsModel->hasOneBrand->desc);
            $goodsModel->hasOneBrand->logo = yz_tomedia($goodsModel->hasOneBrand->logo);
        }

        //????????????????????????
        if ($goodsModel->hasManyOptions && $goodsModel->hasManyOptions->toArray()) {
            foreach ($goodsModel->hasManyOptions as &$item) {
                $item->thumb = replace_yunshop(yz_tomedia($item->thumb));
            }
        }
        $goodsModel->content = html_entity_decode($goodsModel->content);
        if ($goodsModel->has_option) {
            $goodsModel->min_price = $goodsModel->hasManyOptions->min("product_price");
            $goodsModel->max_price = $goodsModel->hasManyOptions->max("product_price");
            $goodsModel->stock = $goodsModel->hasManyOptions->sum('stock');
        }
        foreach ($goodsModel->hasManySpecs as &$spec) {
            $spec['specitem'] = GoodsSpecItem::select('id', 'title', 'specid', 'thumb')->where('show', 1)->where('specid', $spec['id'])->orderBy('display_order', 'asc')->get();
            foreach ($spec['specitem'] as &$specitem) {
                $specitem['thumb'] = yz_tomedia($specitem['thumb']);
            }
        }

        $goodsModel->setHidden(
            [
                'deleted_at',
                'created_at',
                'updated_at',
                'cost_price',
                'real_sales',
                'is_deleted',
                'reduce_stock_method',
            ]);

        //??????????????????
        if ($goodsModel->thumb) {
            $goodsModel->thumb = yz_tomedia($goodsModel->thumb);
        }
        if ($goodsModel->thumb_url) {
            $thumb_url = unserialize($goodsModel->thumb_url);
            foreach ($thumb_url as &$item) {
                $item = yz_tomedia($item);
            }
            $goodsModel->thumb_url = $thumb_url;
        }

        //??????????????????
        if (!is_null($goodsModel->hasOneGoodsVideo) && $goodsModel->hasOneGoodsVideo->goods_video) {
            $goodsModel->goods_video = yz_tomedia($goodsModel->hasOneGoodsVideo->goods_video);
            $goodsModel->video_image = $goodsModel->hasOneGoodsVideo->video_image ? yz_tomedia($goodsModel->hasOneGoodsVideo->video_image) : yz_tomedia($goodsModel->thumb);
        } else {
            $goodsModel->goods_video = '';
            $goodsModel->video_image = '';
        }

        //??????????????????
        $this->validatePrivilege($goodsModel, $member);

        //???????????? todo ????????????
        $goodsModel->goods_sale = $this->getGoodsSaleV2($goodsModel, $member);
        $goodsModel->love_shoppin_gift = $this->loveShoppingGift($goodsModel);

        //??????????????????
        $goodsModel->member_discount = $this->getDiscount($goodsModel, $member);

        //??????????????????????????????
        $goodsModel->availability = $this->couponsMemberLj($member);


        // ??????????????????
        if (\app\common\modules\shop\ShopConfig::current()->get('goods_detail')) {
            foreach (\app\common\modules\shop\ShopConfig::current()->get('goods_detail') as $key_name => $row) {
                $row_res = $row['class']::{$row['function']}($id, true);
                if ($row_res) {
                    $goodsModel->$key_name = $row_res;
                    //???????????????????????????
                    $class = new $row['class']();
                    if (method_exists($class, 'getGoodsIdsBySid')) {
                        $supplier_goods_id = SupplierGoods::getGoodsIdsBySid($goodsModel->supplier->id);
                        $supplier_goods_count = Goods::select('id')
                            ->whereIn('id', $supplier_goods_id)
                            ->where('status', 1)
                            ->count();
                        $goodsModel->supplier_goods_count = $supplier_goods_count;
                    }
                }
            }
        }


        if ($goodsModel->hasOneShare) {
            $goodsModel->hasOneShare->share_thumb = yz_tomedia($goodsModel->hasOneShare->share_thumb);
        }
        /*
        //??????????????????????????????
        $this->setGoodsPluginsRelations($goodsModel);
        */
        //?????????????????????
        $goodsModel->show_push = $goodsModel->hasOneSale ? SaleGoods::getPushGoods($goodsModel->hasOneSale) : [];
        //???????????????????????????????????????
//        $goodsModel->show_sales += $goodsModel->virtual_sales;

        $goodsModel->get_comment = $this->getComment($id);

        $goodsModel->favorable_rate = $this->favorableRate($id);
        return $goodsModel;
    }

    public function getGoods($request, $integrated = null)
    {
        app('db')->cacheSelect = true;
        $id = intval(\YunShop::request()->id);
        if (!$id) {
            if (is_null($integrated)) {
                return $this->errorJson('?????????????????????.');
            } else {
                return show_json(0, '?????????????????????.');
            }

        }

        $goodsModel = $this->_getGoods($id);
        //??????????????????????????????
        $this->setGoodsPluginsRelations($goodsModel);

        //?????????logo?????????
        if (!empty($goodsModel->supplier)) {
            $goodsModel->supplier->logo = yz_tomedia($goodsModel->supplier->logo);
        }
        //???????????????????????????
        if ($goodsModel->supplier->store_name == 'null') {
            $goodsModel->supplier->store_name = $goodsModel->supplier->user_name;
        }

        //??????????????????????????????????????????
        $videoDemand = new VideoDemandCourseGoods();
        $goodsModel->is_course = $videoDemand->isCourse($id);

        //????????????
        //TODO ???????????????????????? $lease_switch
        $lease_switch = LeaseToyGoods::whetherEnabled();
        $this->goods_lease_set($goodsModel, $lease_switch);

        //????????????????????????
        $goodsModel->is_hotel = $goodsModel->plugin_id == 33 ? 1 : 0;
        $goodsModel->is_store = $goodsModel->plugin_id == 32 ? 1 : 0;


        if (app('plugins')->isEnabled('label')) {
            $goodsModel->label = '';
            $pic = Setting::get('plugin.label');
            if ($pic['is_label']) {
                $goodsModel->label = $pic;
            }
        }

//        $goodsModel->get_comment = $this->getComment($id);
//
//        $goodsModel->favorable_rate = $this->favorableRate($id);

        //???????????????
        $this->goodsServiceFree($goodsModel);

        $this->goodsProductMarket($goodsModel);

        //????????????
        $coupon = \app\common\models\Coupon::uniacid()->where('use_type', 2)->where('get_type', 1)->get();
        $goods_coupon = null;
        if (\Setting::get('shop.coupon.is_show_coupon')) {
            foreach ($coupon as $key => $value) {
                if ($value->time_limit == 1) {
                    if (time() < $value->time_statt || time() > $value->time_end) continue;
                }
                if (in_array($goodsModel->id, $value['goods_ids']) || $goodsModel->id == $value['goods_ids']) {
                    if ($value['coupon_method'] == 1) {
                        $goods_coupon['deduct_price'] = bcsub($goodsModel->price, $value['deduct'], 2);  //????????????//????????????
                        $goods_coupon['coupon_method'] = $value['coupon_method'];
                        $goods_coupon['deduct'] = $value['deduct'];
                        $goods_coupon['discount'] = $value['discount'];
                    } else if ($value['coupon_method'] == 2) {
                        $goods_coupon['deduct_price'] = bcmul($goodsModel->price, $value['discount'] / 10, 2); //????????????
                        $goods_coupon['coupon_method'] = $value['coupon_method'];
                        $goods_coupon['discount'] = $value['discount'];
                        $goods_coupon['deduct'] = $value['deduct'];
                    }
                    if ($goods_coupon['deduct_price'] < 0) {
                        $goods_coupon['deduct_price'] = 0;
                    }
                }
            }
        }

        $goodsModel->coupon = $goods_coupon;


        if (app('plugins')->isEnabled('team-sales')) {
            $goodsModel->team_sales_first = GoodsListService::getFirstDividendDetail($goodsModel);
        }


        if (is_null($integrated)) {
            return $this->successJson('??????', $goodsModel);
        } else {
            return show_json(1, $goodsModel);
        }

    }

    public function getGoodsPage()
    {
        if (!miniVersionCompare('1.1.96') || !versionCompare('1.1.096')) {
            return $this->oldgetGoodsPage();
        }
        $goods_id = request()->id;
        //??????????????????
        $goods_model = app('GoodsDetail')->make('Goods')->find($goods_id);
        if (is_null($goods_model)) {
            return $this->errorJson('???????????????');
        }
        //??????????????????????????????
        app('GoodsDetail')->initDetailInstance();
        //????????????????????????
        app('GoodsDetail')->setDetailInstance($goods_model);
        //????????????????????????
        $detail_service = app('GoodsDetail')->make('GoodsDetailInstance');
        //???????????????
        $detail_service->init($goods_model);
        //??????????????????
        $detail_service->getData();
        return $this->successJson('??????', $detail_service->detail_data);
    }

    public function oldgetGoodsPage()
    {
        //???????????????
        app('db')->cacheSelect = true;
        $is_new_goods = 0;

        if (app('plugins')->isEnabled('decorate') && \Setting::get('plugin.decorate.is_open') == "1") {
            //????????????
            $pc_status = 0;
            if (!empty(\YunShop::request()->pc) && app('plugins')->isEnabled('pc-terminal')) {
                $pc_status = \Yunshop\PcTerminal\service\SetService::getPcStatus(); //PC???????????????
            }
            if (!empty($pc_status)) {
                $view_set = DecorateTempletModel::getList(['is_default' => 1, 'type' => 6], '*', false);
                if ($view_set && $view_set->code == 'PCGoods02') {
                    $is_new_goods = 1;
                }
            } else {
                $view_set = DecorateTempletModel::getList(['is_default' => 1, 'type' => 4], '*', false);
                if ($view_set && $view_set->code == 'goods02') {
                    $is_new_goods = 1;
                }
            }
        } elseif (app('plugins')->isEnabled('designer')) {
            //????????????
            $view_set = ViewSet::uniacid()->where('type', 'goods')->first();
            if (!empty($view_set) && $view_set->names == '02') {
                $is_new_goods = 1;
            }
        }

        //????????????
        $this->apiData['is_room'] = (integer)(app('plugins')->isEnabled('room') && Setting::get('plugin.room_set_basic')['is_open_room']);

        //????????????
        //1.??????????????????
        $shopSet = \Setting::get('shop.shop');
        $shop_cservice = $shopSet['cservice'] ?: '';

        foreach ((new ServiceController())->index() as $k => $v) {
            $this->apiData[$k] = $v;
        }
        //2.??????????????????
        $alonge_cservice = $this->apiData['cservice'];

        if (!is_null(\app\common\modules\shop\ShopConfig::current()->get('customer_service'))) {
            $class = array_get(\app\common\modules\shop\ShopConfig::current()->get('customer_service'), 'class');
            $function = array_get(\app\common\modules\shop\ShopConfig::current()->get('customer_service'), 'function');
            $ret = $class::$function(request()->id, request()->type);
            if ($ret) {
                if (is_array($ret)) {
                    foreach ($ret as $rk => $rv) {
                        $this->apiData[$rk] = $rv;
                    }
                }
            }
        }


        //3.????????????????????????
        $store_cservice = "";
        if (class_exists('\Yunshop\StoreCashier\common\services\CustomerService')) {
            $storeSet = CustomerService::getCservice(request()->id, request()->type);
            if ($storeSet) {
                if (is_array($storeSet)) {
                    foreach ($storeSet as $sk => $sv) {
                        $this->apiData[$sk] = $sv;
                    }
                }
                //?????????????????????????????????cservice??????
                if ($storeSet['cservice']) {
                    $store_cservice = $storeSet['cservice'];
                }
            }

        }

        $rg_cservice = "";
        if ($is_new_goods == 1) {
            $newGoodsController = new NewGoodsController();
            $request = request();
            $this->dataIntegrated($newGoodsController->getGoods($request, true), 'get_goods');
            $this->dataIntegrated($newGoodsController->getGoodsType($request, true), 'goods_type');

            $storeId = $this->apiData['get_goods']->store_goods->store_id;

            //4.??????????????????
            if ($storeId) {
                if (class_exists('\Yunshop\StoreCashier\store\models\StoreService')) {
                    $storeModel = new \Yunshop\StoreCashier\store\models\StoreService();
                    $store_service = $storeModel->where("store_id", $storeId)->first();
                    if ($store_service) {
                        $rg_cservice = $store_service['service'];
                    }
                }
            }


            if ($storeId) {
                if (class_exists('\Yunshop\StoreCashier\frontend\store\NewGoodsController')) {
                    if ($this->apiData['goods_type']['store_id']) {
                        $this->dataIntegrated(\Yunshop\StoreCashier\frontend\store\NewGoodsController::getStoreService($request, true, $this->apiData['goods_type']['store_id']), 'store_service');
                    }
                    $this->dataIntegrated(\Yunshop\StoreCashier\frontend\store\NewGoodsController::getInfobyStoreId($request, true, $storeId), 'get_store_Info');
                    if (MemberService::isLogged()) {
                        $this->dataIntegrated(\Yunshop\StoreCashier\frontend\shoppingCart\MemberCartController::index($request, true, $storeId), 'member_cart');
                    }
                } else {
                    return $this->errorJson('?????????????????????');
                }
            }

            if ($this->apiData['get_goods']->is_hotel) {
                if (class_exists('\Yunshop\Hotel\frontend\hotel\NewGoodsController')) {
                    $this->dataIntegrated(\Yunshop\Hotel\frontend\hotel\NewGoodsController::getGoodsDetailByGoodsId($request, true), 'get_hotel_info');
                } else {
                    return $this->errorJson('?????????????????????');
                }
            }

            if (Setting::get('shop.member')['display_page'] == 1 && Setting::get('shop.member')['level_type'] == 2) {
                $this->apiData['display_page'] = 1;
            } else {
                $this->apiData['display_page'] = 0;
            }

            $this->dataIntegrated($this->pluginEnabled(), 'pluginEnabled');
        } else {
            $request = request();
            $this->dataIntegrated($this->getGoods($request, true), 'get_goods');
            $this->dataIntegrated($this->getGoodsType($request, true), 'goods_type');
            $storeId = $this->apiData['get_goods']->store_goods->store_id;

            //??????????????????
            if ($storeId) {
                if (class_exists('\Yunshop\StoreCashier\store\models\StoreService')) {
                    $storeModel = new \Yunshop\StoreCashier\store\models\StoreService();
                    $store_service = $storeModel->where("store_id", $storeId)->first();
                    if ($store_service) {
                        $rg_cservice = $store_service['service'];
                    }
                }
            }

            if ($storeId) {
                if (class_exists('\Yunshop\StoreCashier\frontend\store\GetStoreInfoController')) {
                    if ($this->apiData['goods_type']['store_id']) {
                        $this->dataIntegrated(\Yunshop\StoreCashier\frontend\store\StoreController::getStoreService($request, true, $this->apiData['goods_type']['store_id']), 'store_service');
                    }
                    $this->dataIntegrated(\Yunshop\StoreCashier\frontend\store\GetStoreInfoController::getInfobyStoreId($request, true, $storeId), 'get_store_Info');
                    $this->dataIntegrated(\Yunshop\StoreCashier\frontend\shoppingCart\MemberCartController::index($request, true, $storeId), 'member_cart');
                    if (!is_null($event_arr = \app\common\modules\shop\ShopConfig::current()->get('form_store_member_cart'))) {
                        foreach ($event_arr as $v) {
                            $class = array_get($v, 'class');
                            $function = array_get($v, 'function');
                            $this->dataIntegrated($class::$function($this->apiData), 'member_cart');
                        }
                    }
                } else {
                    return $this->errorJson('?????????????????????');
                }
                // todo ????????????????????????
            }
            if ($this->apiData['get_goods']->is_hotel) {
                if (class_exists('\Yunshop\Hotel\frontend\hotel\GoodsController')) {
                    $this->dataIntegrated(\Yunshop\Hotel\frontend\hotel\GoodsController::getGoodsDetailByGoodsId($request, true), 'get_hotel_info');
                } else {
                    return $this->errorJson('?????????????????????');
                }
            }

            if (app('plugins')->isEnabled('guide-page')) {
                if (class_exists('\Yunshop\GuidePage\frontend\GuidePageController')) {
                    $this->dataIntegrated(\Yunshop\GuidePage\frontend\GuidePageController::index(), 'get_guidepage_info');
                } else {
                    return $this->errorJson('????????????????????????');
                }
            }

            if (Setting::get('shop.member')['display_page'] == 1 && Setting::get('shop.member')['level_type'] == 2) {
                $this->apiData['display_page'] = 1;
            } else {
                $this->apiData['display_page'] = 0;
            }

            $this->dataIntegrated(\app\frontend\modules\member\controllers\MemberHistoryController::store($request, true), 'store');
            $this->dataIntegrated(\app\frontend\modules\member\controllers\MemberFavoriteController::isFavorite($request, true), 'is_favorite');

            $this->dataIntegrated($this->pluginEnabled(), 'pluginEnabled');
        }

        //??????1.?????????????????? 2.???????????? 3.???????????? 4.??????
        if ($store_cservice) {
            $this->apiData['cservice'] = $store_cservice;
        } else if ($alonge_cservice) {
            $this->apiData['cservice'] = $alonge_cservice;
        } else if ($rg_cservice) {
            $this->apiData['cservice'] = $rg_cservice;
        } else {
            $this->apiData['cservice'] = $shop_cservice;
        }


        //?????????
        if (!is_null(\app\common\modules\shop\ShopConfig::current()->get('selfbuy_discount_show')) && empty($is_new_goods)) {
            $class = array_get(\app\common\modules\shop\ShopConfig::current()->get('selfbuy_discount_show'), 'class');
            $function = array_get(\app\common\modules\shop\ShopConfig::current()->get('selfbuy_discount_show'), 'function');
            if (empty($this->api_data['get_goods']['member_discount'])) {
                $g = $this->_getGoods($request->id, true);
                $g = $g ? ['get_goods' => $g->toArray()] : [];
                $this->dataIntegrated($class::$function($request, $g), 'selfbuy_discount');
            } else {
                $this->dataIntegrated($class::$function($request, $this->apiData), 'selfbuy_discount');
            }
        }

        $this->apiData["wechatcircle_open"] = 0;
        if (app('plugins')->isEnabled('wechatcircle_products') && Setting::get("plugin.wechatcircle_products")['is_open'] == 1) {
            $this->apiData["wechatcircle_open"] = 1;
        }

        //????????????
        if (!is_null(\app\common\modules\shop\ShopConfig::current()->get('broadcast_data'))) {
            $class = array_get(\app\common\modules\shop\ShopConfig::current()->get('broadcast_data'), 'class');
            $function = array_get(\app\common\modules\shop\ShopConfig::current()->get('broadcast_data'), 'function');
            $ret = $class::$function();
            if ($ret) {
                $this->apiData['broadcast_data'] = $ret;
            }
        }


        //?????????
        if ($this->apiData['goods_type']['customer_development'] == 1) {
            if (app('plugins')->isEnabled('customer-development')) {
                if (!is_null(\app\common\modules\shop\ShopConfig::current()->get('customer_development_goods'))) {
                    $class = array_get(\app\common\modules\shop\ShopConfig::current()->get('customer_development_goods'), 'class');
                    $function = array_get(\app\common\modules\shop\ShopConfig::current()->get('customer_development_goods'), 'function');
                    $this->apiData['customer_development'] = $class::$function(request()->id);
                }
            } else {
                return $this->errorJson('????????????????????????');
            }
        }

        //????????????
        if (!is_null(\app\common\modules\shop\ShopConfig::current()->get('luck-draw'))) {
            $class = array_get(\app\common\modules\shop\ShopConfig::current()->get('luck-draw'), 'class');
            $function = array_get(\app\common\modules\shop\ShopConfig::current()->get('luck-draw'), 'function');
            $ret = $class::$function($request->id);
            if ($ret) {
                $this->apiData['luck_draw'] = $ret;
            }
        }

        return $this->successJson('', $this->apiData);
    }


    /**
     * ??????????????????????????????
     * @return array
     */
    protected function pluginEnabled()
    {
        $data['package_deliver_enabled'] = app('plugins')->isEnabled('package-deliver') ? 1 : 0;
        $data['help_center_enabled'] = app('plugins')->isEnabled('help-center') ? 1 : 0;

        if (app('plugins')->isEnabled('wx-video-link')) {
            $set = WxVideoLikeSetModel::uniacid()->first();
            $data['wx_video_link'] = $set['is_open'];
//	        $data['wx_video_link'] = app('plugins')->isEnabled('wx-video-link')?1:0;
        }

        return show_json(1, $data);
    }

    /**
     * todo ???????????????????????????????????????????????????????????????????????????????????????
     * todo ???????????????????????????????????????????????????????????????
     * @param $request
     * @param null $integrated
     * @return array|\Illuminate\Http\JsonResponse
     */
    public function getGoodsType($request, $integrated = null)
    {
        app('db')->cacheSelect = true;
        $goods_type = 'goods';//??????
        $id = request()->id;
        if (!$id) {
            if (is_null($integrated)) {
                return $this->errorJson('?????????????????????.');
            } else {
                return show_json(0, '?????????????????????.');
            }
        }

        $goodsModel = Goods::uniacid()->find($id);

        $data['title'] = $goodsModel->title;
        // ??????????????????
        if (\app\common\modules\shop\ShopConfig::current()->get('goods_detail')) {
            foreach (\app\common\modules\shop\ShopConfig::current()->get('goods_detail') as $key_name => $row) {
                $row_res = $row['class']::{$row['function']}($id, true);
                if ($row_res) {
                    $goodsModel->$key_name = $row_res;
                }
            }
        }
        //??????????????????????????????????????????
        $isCourse = (new VideoDemandCourseGoods())->isCourse($id);
        if ($isCourse) {
            $goods_type = 'course';
        }
        //????????????????????????
        if ($goodsModel->plugin_id == 33) {
            $goods_type = 'hotelGoods';
        }
        if ($goodsModel->plugin_id == 66) {
            $goods_type = 'voiceGoods';
        }
        //????????????
        if ($goodsModel->plugin_id == 32 && $goodsModel->store_goods) {
            $goods_type = 'store_goods';
            $store_id = $goodsModel->store_goods->store_id;
            $data['store_id'] = $store_id;
            if (!is_null(\app\common\modules\shop\ShopConfig::current()->get('customer_development_judge'))) {
                $class = array_get(\app\common\modules\shop\ShopConfig::current()->get('customer_development_judge'), 'class');
                $function = array_get(\app\common\modules\shop\ShopConfig::current()->get('customer_development_judge'), 'function');
                $judge_res = $class::$function($goodsModel->id);
                if ($judge_res == 1) {
                    $data['customer_development'] = 1;
                }
            }
        }
        //???????????????
        if ($goodsModel->plugin_id == 92 && $goodsModel->supplier) {
            $goods_type = 'supplierGoods';
        }
        //??????????????????
        if ($goodsModel->plugin_id == 47) {
            $goods_type = 'staging_buy_car_goods';
        }
        //????????????
        if ($goodsModel->plugin_id == 101) {
            $goods_type = 'appointment_goods';
        }
        //????????????????????????
        if ($goodsModel->plugin_id == 103) {
            $goods_type = 'yun_sign_goods';
        }
        $data['goods_type'] = $goods_type;

        if (is_null($integrated)) {
            return $this->successJson('??????', $data);
        } else {
            return show_json(1, $data);
        }
    }

    /**
     * @param $goodsModel
     * @param $member
     * @throws \app\common\exceptions\AppException
     */
    public function validatePrivilege($goodsModel, $member)
    {
        Privilege::validatePrivilegeLevel($goodsModel, $member);
        Privilege::validatePrivilegeGroup($goodsModel, $member);
    }

    private function setGoodsPluginsRelations($goods)
    {
        $goodsRelations = app('GoodsManager')->tagged('GoodsRelations');

        collect($goodsRelations)->each(function ($goodsRelation) use ($goods) {
            $goodsRelation->setGoods($goods);
        });
    }

    public function searchGoods()
    {
        app('db')->cacheSelect = true;
        $requestSearch = \YunShop::request()->search;

        $order_field = \YunShop::request()->order_field;

        $goods_model = \app\common\modules\shop\ShopConfig::current()->get('goods.models.commodity_classification');
        $goods_model = new $goods_model;
        if (!in_array($order_field, ['price', 'show_sales', 'comment_num'])) {
            $order_field = 'display_order';
        } else {
            if ($order_field == 'show_sales') {
                //????????????????????????
                $order_field = 'total_sales';
            }
        }
        $order_by = (\YunShop::request()->order_by == 'asc') ? 'asc' : 'desc';

        if ($requestSearch) {
            $requestSearch = array_filter($requestSearch, function ($item) {
                return !empty($item) && $item !== 0 && $item !== "undefined";
            });

            $categorySearch = array_filter(\YunShop::request()->category, function ($item) {
                return !empty($item);
            });

            if ($categorySearch) {
                $requestSearch['category'] = $categorySearch;
            }
        }
        $build = $goods_model->Search($requestSearch)->selectRaw("thumb,real_sales+virtual_sales total_sales,market_price,price,cost_price,title, " . DB::getTablePrefix() . "yz_goods.id as goods_id")
            ->where("yz_goods.status", 1)
            ->whereInPluginIds();

        //todo ??????????????????id, ??????mysql where in?????????
        /*$id_arr = collect($list->get())->map(function ($rows) {
            return $rows['id'];
        });*/

        $list = $build->orderBy($order_field, $order_by)
            ->orderBy('yz_goods.id', 'desc')
            ->paginate(20);


        if ($list->isEmpty()) {
            return $this->errorJson('??????????????????.');
        }


        //TODO ???????????????????????? $lease_switch
        $lease_switch = LeaseToyGoods::whetherEnabled();

        //???????????? foreach ????????? ????????????
        $list->map(function ($item) use ($lease_switch) {

            $item->thumb = yz_tomedia($item->thumb);
            //????????????
            $this->goods_lease_set($item, $lease_switch);
            $item->id = $item->goods_id;
            //??????vip??????
            $item->vip_price = $item->vip_price;
            $item->vip_next_price = $item->vip_next_price;
            $item->vip_level_status = $item->vip_level_status;
            $item->price_level = $item->price_level;
            $item->is_open_micro = $item->is_open_micro;
            return $item;
        });

        $list = $list->toArray();

        $category_data = [
            'names' => '01',
            'type' => 'goodsList',
        ];

        if (app('plugins')->isEnabled('decorate') && \Setting::get('plugin.decorate.is_open') == 1) {

//            $view_set = \Yunshop\Decorate\models\DecorateTempletModel::uniacid()
//                ->where('code','goodsList02')
//                ->where('type',5)
//                ->where('is_default',1)
//                ->first();
//            $category_data = $view_set ? ['names' => '02', 'type' => 'goodsList']: $category_data;

            $view_set = \Yunshop\Decorate\models\DecorateTempletModel::uniacid()
                ->whereIn('code', ['goodsList01', 'goodsList02', 'goodsList03'])
                ->where('type', 5)
                ->where('is_default', 1)
                ->first();
            $tmp = [
                'goodsList01' => '01',
                'goodsList02' => '02',
                'goodsList03' => '03',
            ];
            $category_data = $view_set ? ['names' => $tmp[$view_set->code], 'type' => 'goodsList'] : $category_data;

            if ($view_set) {
                $list['data'] = $this->getGoodsCouponSale($list['data']);
                //??????????????????????????????
                if (app('plugins')->isEnabled('team-sales')) {
                    $list['data'] = GoodsListService::getFirstDividend($list['data']);
                }
            }

            if ($category_data['names'] == '03') {
                if (app('plugins')->isEnabled('love')) {//?????????????????????
                    $list['data'] = \Yunshop\Love\Frontend\Models\GoodsLove::setGoodsLove($list['data']);
                }
            }

        } elseif (app('plugins')->isEnabled('designer')) {
            //??????????????????
//            $view_set = ViewSet::uniacid()->where('type', 'goodsList')->first();
            $view_set = ViewSet::uniacid()->where('type', 'goodsList')->select('names', 'type')->first();
            $category_data = $view_set ?: $category_data;
            if (!empty($view_set) && $view_set->names == '02') {
                $list['data'] = $this->getGoodsCouponSale($list['data']);
                //??????????????????????????????
                if (app('plugins')->isEnabled('team-sales')) {
                    $list['data'] = GoodsListService::getFirstDividend($list['data']);
                }
            }
        }

        //??????????????????
        if (app('plugins')->isEnabled('goods-link')) {
            $list['data'] = GetGoodsDocService::getDoc($list['data']);
        }

        //????????????
        if (app('plugins')->isEnabled('point-mall')) {
            $list['data'] = \Yunshop\PointMall\api\models\PointMallGoodsModel::setPointGoods($list['data']);
        }

        $list['goods_template'] = $category_data;

        return $this->successJson('??????', $list);
    }

    private function getGoodsCouponSale($goods)
    {
        //$memberLevel = MemberShopInfo::where('member_id', \YunShop::app()->getMemberId())->with(['level'])->first(); ???????????????????????????
        $coupon = \app\common\models\Coupon::uniacid()->where('use_type', 2)->where('get_type', 1)->get();
        foreach ($goods as $k => &$v) {
            $v['coupon']['coupon_method'] = 0;                                   //??????????????????
            foreach ($coupon as $key => $value) {
                if ($value->time_limit == 1) {
                    if (time() < $value->time_statt || time() > $value->time_end) continue;
                }
                if (in_array($v['goods_id'], $value['goods_ids']) || $v['goods_id'] == $value['goods_ids']) {
                    if ($value['coupon_method'] == 1) {
                        $v['coupon']['deduct_price'] = bcsub($v['price'], $value['deduct'], 2);  //????????????
                        $v['coupon']['coupon_method'] = $value['coupon_method'];
                        $v['coupon']['deduct'] = $value['deduct'];
                        $v['coupon']['discount'] = $value['discount'];
                    } else if ($value['coupon_method'] == 2) {
                        $v['coupon']['deduct_price'] = bcmul($v['price'], $value['discount'] / 10, 2); //????????????
                        $v['coupon']['coupon_method'] = $value['coupon_method'];
                        $v['coupon']['discount'] = $value['discount'];
                        $v['coupon']['deduct'] = $value['deduct'];
                    }
                    if ($v['coupon']['deduct_price'] < 0) {
                        $v['coupon']['deduct_price'] = 0;
                    }
                    if ($v['coupon']['enough'] > 0 && $v['price'] < $value['enough']) {
                        $v['coupon']['deduct_price'] = 0;
                    }
                }
            }
        }
        return $goods;
    }

    public function getGoodsCategoryList()
    {
        $category_id = intval(\YunShop::request()->category_id);

        if (empty($category_id)) {
            return $this->errorJson('??????????????????????????????.');
        }

        $order_field = \YunShop::request()->order_field;
        if (!in_array($order_field, ['price', 'show_sales', 'comment_num'])) {
            $order_field = 'display_order';
        }

        $order_by = (\YunShop::request()->order_by == 'asc') ? 'asc' : 'desc';

        $categorys = Category::uniacid()->select("name", "thumb", "id")->where(['id' => $category_id])->first();

        if ($categorys) {
            $categorys->thumb = yz_tomedia($categorys->thumb);
        }

        $goodsList = Goods::uniacid()->select('yz_goods.id', 'yz_goods.id as goods_id', 'title', 'thumb', 'price', 'market_price')
            ->join('yz_goods_category', 'yz_goods_category.goods_id', '=', 'yz_goods.id')
            ->where("category_id", $category_id)
            ->where('status', '1')
            ->orderBy($order_field, $order_by)
            ->paginate(20)->toArray();


        if (empty($goodsList)) {
            return $this->errorJson('????????????????????????.');
        }
        $goodsList['data'] = set_medias($goodsList['data'], 'thumb');

        $categorys->goods = $goodsList;

        return $this->successJson('??????', $categorys);
    }

    public function getGoodsBrandList()
    {
        $goods_model = \app\common\modules\shop\ShopConfig::current()->get('goods.models.commodity_classification');
        $goods_model = new $goods_model;
        $brand_id = intval(\YunShop::request()->brand_id);
        $order_field = \YunShop::request()->order_field;
        if (!in_array($order_field, ['price', 'show_sales', 'comment_num'])) {
            $order_field = 'display_order';
        }

        $order_by = (\YunShop::request()->order_by == 'asc') ? 'asc' : 'desc';


        if (empty($brand_id)) {
            return $this->errorJson('????????????????????????id.');
        }

        $brand = Brand::uniacid()->select("name", "logo", "id")->where(['id' => $brand_id])->first();

        if (!$brand) {
            return $this->errorJson('???????????????.');
        }

        $brand->logo = yz_tomedia($brand->logo);

        $goodsList = $goods_model->uniacid()->select('id', 'id as goods_id', 'title', 'thumb', 'price', 'market_price')
            ->where('status', '1')
            ->where('brand_id', $brand_id)
            ->whereInPluginIds()
            ->orderBy($order_field, $order_by)
            ->paginate(20)->toArray();
        $goodsList->vip_level_status;

        if (empty($goodsList)) {
            return $this->errorJson('????????????????????????.');
        }

        $goodsList['data'] = set_medias($goodsList['data'], 'thumb');

        $category_data = [
            'names' => '01',
            'type' => 'goodsList',
        ];
        if (app('plugins')->isEnabled('decorate') && \Setting::get('plugin.decorate.is_open') == 1) {

//            $view_set = \Yunshop\Decorate\models\DecorateTempletModel::uniacid()
//                ->where('code', 'goodsList02')
//                ->where('type', 5)
//                ->where('is_default', 1)
//                ->first();
//            $category_data = $view_set ? ['names' => '02', 'type' => 'goodsList'] : $category_data;
//
            $view_set = \Yunshop\Decorate\models\DecorateTempletModel::uniacid()
                ->whereIn('code', ['goodsList01', 'goodsList02', 'goodsList03'])
                ->where('type', 5)
                ->where('is_default', 1)
                ->first();
            $tmp = [
                'goodsList01' => '01',
                'goodsList02' => '02',
                'goodsList03' => '03',
            ];
            $category_data = $view_set ? ['names' => $tmp[$view_set->code], 'type' => 'goodsList'] : $category_data;

            if ($view_set) {
                $goodsList['data'] = $this->getGoodsCouponSale($goodsList['data']);
                //??????????????????????????????
                if (app('plugins')->isEnabled('team-sales')) {
                    $goodsList['data'] = GoodsListService::getFirstDividend($goodsList['data']);
                }
            }

            if ($category_data['names'] == '03') {
                if (app('plugins')->isEnabled('love')) {//?????????????????????
                    $goodsList['data'] = \Yunshop\Love\Frontend\Models\GoodsLove::setGoodsLove($goodsList['data']);
                }
            }

        } elseif (app('plugins')->isEnabled('designer')) {
            //??????????????????
            // $view_set = ViewSet::uniacid()->where('type', 'goodsList')->first();
            $view_set = ViewSet::uniacid()->where('type', 'goodsList')->select('names', 'type')->first();
            $category_data = $view_set ?: $category_data;
            if (!empty($view_set) && $view_set->names == '02') {
                $goodsList['data'] = $this->getGoodsCouponSale($goodsList['data']);
                //??????????????????????????????
                if (app('plugins')->isEnabled('team-sales')) {
                    $goodsList['data'] = GoodsListService::getFirstDividend($goodsList['data']);
                }
            }
        }
        //??????????????????
        if (app('plugins')->isEnabled('goods-link')) {
            $goodsList['data'] = GetGoodsDocService::getDoc($goodsList['data']);
        }

        //????????????
        if (app('plugins')->isEnabled('point-mall')) {
            $goodsList['data'] = \Yunshop\PointMall\api\models\PointMallGoodsModel::setPointGoods($goodsList['data']);
        }

        $goodsList['goods_template'] = $category_data;
        $brand->goods = $goodsList;

        return $this->successJson('??????', $brand);
    }

    public function getRecommendGoods()
    {
        $list = Goods::uniacid()
            ->select('id', 'id as goods_id', 'title', 'thumb', 'price', 'market_price')
            ->where('is_recommand', '1')
            ->whereStatus('1')
            ->orderBy('id', 'desc')
            ->get();

        if (!$list->isEmpty()) {
            $list = set_medias($list->toArray(), 'thumb');
        }

        return $this->successJson('????????????????????????', $list);
    }

    /**
     * ????????????????????????
     * @param Goods $goodsModel
     * @param  [type] $discountModel [description]
     * @return array [type]                [description]
     */
    public function getDiscount($goodsModel, $memberModel)
    {
        if ($goodsModel->vip_price === null) {
            return [];
        }
        $discount_switch = Setting::get('shop.member.discount');
        $level_type = Setting::get('shop.member.level_type');
        $display_page = Setting::get('shop.member.display_page');
        if ($memberModel->level) {
            $data = [
                'level_name' => $memberModel->level->level_name,
                'discount_value' => $goodsModel->vip_price,
                'discount' => $discount_switch,
                'next_level_price' => $goodsModel->next_level_price,
                'next_level_name' => $goodsModel->next_level_name,
                'level_type' => $level_type,
                'display_page' => $display_page
            ];
        } else {
            $level = Setting::get('shop.member.level_name');
            $level_name = $level ?: '????????????';

            $data = [
                'level_name' => $level_name,
                'discount_value' => $goodsModel->vip_price,
                'discount' => $discount_switch,
                'next_level_price' => $goodsModel->next_level_price,
                'next_level_name' => $goodsModel->next_level_name ?: MemberLevel::value('level_name'),
                'level_type' => $level_type,
                'display_page' => $display_page
            ];
        }

        return $data;
    }

    public function getGoodsSaleV2($goodsModel, $member)
    {
        $sale = [];
        //??????????????????
        $set = \Setting::get('point.set');

        //??????????????????: ?????? ??????????????? ????????????????????????
        $shopSet = \Setting::get('shop.shop');


        if ($goodsModel->hasOneSale->ed_num || $goodsModel->hasOneSale->ed_money) {
            $data['name'] = '??????';
            $data['key'] = 'ed_num';
            $data['type'] = 'array';
            if ($goodsModel->hasOneSale->ed_num) {
                $data['value'][] = '????????????' . $goodsModel->hasOneSale->ed_num . '?????????';
            }

            if ($goodsModel->hasOneSale->ed_money) {
                $data['value'][] = '???????????????' . $goodsModel->hasOneSale->ed_money . '??????';

            }
            array_push($sale, $data);
            $data = [];
        }

        if ($goodsModel->hasOneSale->all_point_deduct && $goodsModel->hasOneSale->has_all_point_deduct) {//????????????
            $data['name'] = $shopSet['credit1'] ? $shopSet['credit1'] . '????????????' : '??????????????????';
            $data['key'] = 'all_point_deduct';
            $data['type'] = 'string';
            $data['value'] = '?????????' . $goodsModel->hasOneSale->all_point_deduct . '???' . ($shopSet['credit1'] ? $shopSet['credit1'] . '??????????????????' : '????????????????????????');
            array_push($sale, $data);
            $data = [];
        }


        if ((bccomp($goodsModel->hasOneSale->ed_full, 0.00, 2) == 1) && (bccomp($goodsModel->hasOneSale->ed_reduction, 0.00, 2) == 1)) {
            $data['name'] = '??????';
            $data['key'] = 'ed_full';
            $data['type'] = 'string';
            $data['value'] = '???????????????' . $goodsModel->hasOneSale->ed_full . '?????????' . $goodsModel->hasOneSale->ed_reduction;
            array_push($sale, $data);
            $data = [];
        }

        if ($goodsModel->hasOneSale->award_balance) {
            $data['name'] = $shopSet['credit'] ?: '??????';
            $data['key'] = 'award_balance';
            $data['type'] = 'string';
            $data['value'] = '????????????' . $goodsModel->hasOneSale->award_balance . $data['name'];
            array_push($sale, $data);
            $data = [];
        }


        $point = [];
        if (app('plugins')->isEnabled('store-cashier')) {//??????????????????
            $store_goods = StoreGoods::where('goods_id', $goodsModel->id)->first();
            $point = StoreSetting::getStoreSettingByStoreId($store_goods->store_id)->where('key', 'point')->first();
        }

        $data['name'] = $shopSet['credit1'] ?: '??????';
        $data['key'] = 'point';
        $data['type'] = 'array';

        if ((strlen($goodsModel->hasOneSale->point) === 0) || $goodsModel->hasOneSale->point != 0) {
            if ($goodsModel->hasOneSale->point) {
                $points = $goodsModel->hasOneSale->point;
            } elseif (!empty($point['value']['set']['give_point']) && $point['value']['set']['give_point'] != 0) {//??????????????????
                $points = $point['value']['set']['give_point'] . '%';
            } else {
                $points = $set['give_point'] ? $set['give_point'] : 0;
            }
            if (!empty($points)) {
                $data['value'][] = '????????????' . $points . $data['name'];
            }
        }
        //???????????????0,??????????????????
        //????????????????????? ?????????????????? ---> ???????????? ---> ??????????????????

        if ($set['point_deduct'] && (strlen($goodsModel->hasOneSale->max_point_deduct) === 0 || $goodsModel->hasOneSale->max_point_deduct != 0)) {
            if ($goodsModel->hasOneSale->max_point_deduct) {
                $max_point_deduct = $goodsModel->hasOneSale->max_point_deduct . '???';
            } elseif (strlen($point['value']['set']['money_max']) !== 0) {
                if (!($point['value']['set']['money_max'] === 0 || $point['value']['set']['money_max'] === '0')) {
                    $max_point_deduct = $point['value']['set']['money_max'] . '%';
                }
            } else {
                $max_point_deduct = $set['money_max'] ? $set['money_max'] . '%' : 0;
            }

            if (!empty(mb_substr($max_point_deduct, 0, -1))) {
                $data['value'][] = '????????????' . $max_point_deduct;
            }
        }

        if ($set['point_deduct'] && (strlen($goodsModel->hasOneSale->min_point_deduct) === 0 || $goodsModel->hasOneSale->min_point_deduct != 0)) {
            if ($goodsModel->hasOneSale->min_point_deduct) {
                $min_point_deduct = $goodsModel->hasOneSale->min_point_deduct . '???';
            } else {
                $min_point_deduct = $set['money_min'] ? $set['money_min'] . '%' : 0;
            }
            if (!empty(mb_substr($min_point_deduct, 0, -1))) {
                $data['value'][] = '????????????' . $min_point_deduct;
            }
        }


        if (!empty($data['value'])) {
            array_push($sale, $data);
        }
        $data = [];

        if ($goodsModel->hasOneGoodsCoupon->is_give) {
            $data['name'] = '????????????';
            $data['key'] = 'coupon';
            $data['type'] = 'string';
            $data['value'] = $goodsModel->hasOneGoodsCoupon->send_type ? '??????????????????????????????' : '????????????????????????';
            array_push($sale, $data);
            $data = [];
        }

        //?????????
        $exist_love = app('plugins')->isEnabled('love');
        if ($exist_love) {

            $love_goods = $this->getLoveSet($goodsModel, $goodsModel->id);

            $data['name'] = $love_goods['name'];
            $data['key'] = 'love';
            $data['type'] = 'array';
            if ($love_goods['deduction']) {
                $data['value'][] = '????????????' . $love_goods['deduction_proportion'] . $data['name'];
            }

            if ($love_goods['award'] && \Setting::get('love.goods_detail_show_love') != 2) {
                $data['value'][] = '????????????' . $love_goods['award_proportion'] . $data['name'];
            }

            if (!empty($data['value'])) {
                array_push($sale, $data);
            }
            $data = [];
        }

        //??????
        $exist_commission = app('plugins')->isEnabled('commission');
        if ($exist_commission) {
            $is_agent = $this->isValidateCommission($member);
            if ($is_agent) {
                $commission_data = (new GoodsDetailService($goodsModel))->getGoodsDetailData();
                if ($commission_data['commission_show'] == 1) {
//                    $data['name'] = '??????';
                    $data['key'] = 'commission';
                    $data['type'] = 'array';
                    $lang = isset($lang) ? $lang : \Setting::get('shop.lang');
                    $commission_alisa = array_get($lang, 'zh_cn.commission.commission_alias', '??????') ?: '??????';
                    $data['name'] = $commission_alisa;
                    $data['desc'] = '????????????' . $commission_alisa . '?????????????????????' . $commission_alisa . '????????????????????????????????????????????????,??????????????????' . $commission_alisa . '??????!';

                    if (!empty($commission_data['first_commission']) && ($commission_data['commission_show_level'] > 0)) {
//                        $data['value'][] = '????????????' . $commission_data['first_commission'] . '???';
                        $data['value'][] = '??????' . $commission_alisa . $commission_data['first_commission'] . '???';
                    }
                    if (!empty($commission_data['second_commission']) && ($commission_data['commission_show_level'] > 1)) {
//                        $data['value'][] = '????????????' . $commission_data['second_commission'] . '???';
                        $data['value'][] = '??????' . $commission_alisa . $commission_data['second_commission'] . '???';
                    }
                    if (!empty($commission_data['third_commission']) && ($commission_data['commission_show_level'] > 2)) {
//                        $data['value'][] = '????????????' . $commission_data['third_commission'] . '???';
                        $data['value'][] = '??????' . $commission_alisa . $commission_data['third_commission'] . '???';
                    }
                    array_push($sale, $data);
                    $data = [];
                }
            }
        }

        //???????????????
        $exist_team_dividend = app('plugins')->isEnabled('team-dividend');
        if ($exist_team_dividend) {
            //?????????????????????????????????
            $is_agent = $this->isValidateTeamDividend($member);
            if ($is_agent) {
//                $lang = \Setting::get('shop.lang');
                $lang = isset($lang) ? $lang : \Setting::get('shop.lang');
                $team_dividend_name = array_get($lang, 'zh_cn.team_dividend.title', '?????????') ?: '?????????';
                $dividend_alisa = array_get($lang, 'zh_cn.team_dividend.dividend_alias', $team_dividend_name . '??????') ?: $team_dividend_name . '??????';
                //?????????????????????????????????  ????????????????????????
                $team_dividend_data = (new TeamDividendGoodsDetailService($goodsModel))->getGoodsDetailData();
                if ($team_dividend_data['team_dividend_show'] == 1) {
//                    $data['name'] = $team_dividend_name.'??????';
                    $data['name'] = $dividend_alisa;
                    $data['key'] = 'team-dividend';
                    $data['type'] = 'array';
//                    $data['value'][] = $team_dividend_name.'??????' . $team_dividend_data['team_dividend_royalty'];
                    $data['value'][] = $dividend_alisa . $team_dividend_data['team_dividend_royalty'];
                    array_unshift($sale, $data);
                    $data = [];
                }
            }

        }

        $exist_pending_order = app('plugins')->isEnabled('pending-order');
        if ($exist_pending_order) {
            $pending_order_goods = \Yunshop\PendingOrder\services\PendingOrderGoodsService::getGoodsWholesaleSend($goodsModel->id);
            $pending_order['name'] = '?????????';
            $pending_order['key'] = 'pending-order';
            $pending_order['type'] = 'array';
            if ($pending_order_goods['send_condition']['code']) {
                $pending_order['value'][] = $pending_order_goods['send_condition']['msg'];
                array_push($sale, $pending_order);
            }
        }

        return [
            'sale_count' => count($sale),
//            'first_strip_key' => $sale ? $sale[rand(0, (count($sale) - 1))] : [],
            'first_strip_key' => $sale[0] ? $sale[0] : [],
            'sale' => $sale,
        ];
    }

    public function isValidateCommission($member)
    {
        return Agents::getAgentByMemberId($member->member_id)->first();
    }

    public function isValidateTeamDividend($member)
    {
        return TeamDividendAgencyModel::getAgencyByMemberId($member->member_id)->first();
    }

    /**
     * ???????????????
     * @param  [type] $goodsModel [description]
     * @return [type]             [description]
     */
    public function getGoodsSale($goodsModel)
    {
        $set = \Setting::get('point.set');

        $shopSet = \Setting::get('shop.shop');

        if (!empty($shopSet['credit1'])) {
            $point_name = $shopSet['credit1'];
        } else {
            $point_name = '??????';
        }

        $data = [
            'first_strip_key' => 0,
            'point_name' => $point_name, //????????????
            'love_name' => '?????????',
            'ed_num' => 0,      //????????????
            'ed_money' => 0,    //????????????
            'ed_full' => 0,      //????????????
            'ed_reduction' => 0, //????????????
            'award_balance' => 0, //????????????
            'point' => 0,        //????????????
            'max_point_deduct' => 0, //??????????????????
            'min_point_deduct' => 0, //??????????????????
            'coupon' => 0,         //?????????????????????
            'deduction_proportion' => 0, //?????????????????????
            'award_proportion' => 0, //???????????????
            'sale_count' => 0,      //????????????
        ];


        if (ceil($goodsModel->hasOneSale->ed_full) && ceil($goodsModel->hasOneSale->ed_reduction)) {
            $data['ed_full'] = $goodsModel->hasOneSale->ed_full;
            $data['ed_reduction'] = $goodsModel->hasOneSale->ed_reduction;

            $data['first_strip_key'] = 'ed_full';
            $data['sale_count'] += 1;

        }

        if ($goodsModel->hasOneSale->award_balance) {
            $data['award_balance'] = $goodsModel->hasOneSale->award_balance;

            $data['first_strip_key'] = 'award_balance';
            $data['sale_count'] += 1;

        }

        if ($goodsModel->hasOneSale->point !== '0') {

            $data['point'] = $set['give_point'] ? $set['give_point'] : 0;

            if ($goodsModel->hasOneSale->point) {
                $data['point'] = $goodsModel->hasOneSale->point;
            }

            if (!empty($data['point'])) {
                $data['first_strip_key'] = 'point';
                $data['sale_count'] += 1;
            }

        }

        if ($set['point_deduct'] && $goodsModel->hasOneSale->max_point_deduct !== '0') {

            $data['max_point_deduct'] = $set['money_max'] ? $set['money_max'] . '%' : 0;

            if ($goodsModel->hasOneSale->max_point_deduct) {

                $data['max_point_deduct'] = $goodsModel->hasOneSale->max_point_deduct;
            }
            if (!empty($data['max_point_deduct'])) {
                $data['first_strip_key'] = 'max_point_deduct';
                $data['sale_count'] += 1;
            }
        }
        if ($set['point_deduct'] && $goodsModel->hasOneSale->min_point_deduct !== '0') {

            $data['min_point_deduct'] = $set['money_min'] ? $set['money_min'] . '%' : 0;

            if ($goodsModel->hasOneSale->min_point_deduct) {

                $data['min_point_deduct'] = $goodsModel->hasOneSale->min_point_deduct;
            }
            if (!empty($data['min_point_deduct'])) {
                $data['first_strip_key'] = 'min_point_deduct';
                $data['sale_count'] += 1;
            }
        }
        if ($goodsModel->hasOneGoodsCoupon->is_give) {

            $data['coupon'] = $goodsModel->hasOneGoodsCoupon->send_type ? '??????????????????????????????' : '????????????????????????';

            $data['first_strip_key'] = 'coupon';
            $data['sale_count'] += 1;
        }

        if ($goodsModel->hasOneSale->ed_num) {
            $data['ed_num'] = $goodsModel->hasOneSale->ed_num;

            $data['first_strip_key'] = 'ed_num';
            $data['sale_count'] += 1;
        }

        if ($goodsModel->hasOneSale->ed_money) {
            $data['ed_money'] = $goodsModel->hasOneSale->ed_money;

            $data['first_strip_key'] = 'ed_money';
            $data['sale_count'] += 1;

        }

        $exist_love = app('plugins')->isEnabled('love');
        if ($exist_love) {
            $love_goods = $this->getLoveSet($goodsModel, $goodsModel->id);
            $data['love_name'] = $love_goods['name'];
            if ($love_goods['deduction']) {
                $data['deduction_proportion'] = $love_goods['deduction_proportion'];
                $data['first_strip_key'] = 'deduction_proportion';
                $data['sale_count'] += 1;
            }

            if ($love_goods['award']) {
                $data['award_proportion'] = $love_goods['award_proportion'];
                $data['first_strip_key'] = 'award_proportion';
                $data['sale_count'] += 1;
            }

        }
        $exist_commission = app('plugins')->isEnabled('commission');
        if ($exist_commission) {
            $commission_data = (new GoodsDetailService($goodsModel))->getGoodsDetailData();
            if ($commission_data['commission_show'] == 1) {
                $data['sale_count'] += 1;
                $data['first_strip_key'] = 'commission_show';
            }
            $data = array_merge($data, $commission_data);
        }
        return $data;
    }

    /**
     * ???????????????????????????
     */
    public function getLoveSet($goods, $goods_id)
    {
        $data = [
            'name' => \Setting::get('love.name') ?: '?????????',
            'deduction' => 0, //??????????????????????????? 0??????1???
            'deduction_proportion' => 0, //?????????????????????
            'award' => 0, //??????????????????????????? 0??????1???
            'award_proportion' => 0, //???????????????
        ];

        $love_set = \Setting::get('love');

        $res = app('plugins')->isEnabled('store-cashier');
        if ($res) {//??????????????????
            $store_goods = StoreGoods::where('goods_id', $goods_id)->first();
            $love = StoreSetting::getStoreSettingByStoreId($store_goods->store_id)->where('key', 'love')->first();
            $set = \Setting::get('plugin.store_widgets', 'deduction_proportion');
//            dd($set['love']['deduction_proportion'],$love->value['deduction_proportion']);
        }

        $item = GoodsLove::ofGoodsId($goods->id)->first();
//         dd($item->deduction);
        $deduction = 0;
//            $deduction_proportion = (bccomp($item->deduction_proportion, 0.00, 2) == 1) ? $item->deduction_proportion : \Setting::get('love.deduction_proportion');
        $deduction_proportion = \Setting::get('love.deduction_proportion');


        if ($item->deduction) {//??????????????????
            if ($love_set['deduction']) {
                $deduction_proportion = $love_set['deduction_proportion'];
                $deduction = $love_set['deduction'];
            }
//            if (!empty($set['love']['deduction'])){//????????????
//                $deduction_proportion = $set['love']['deduction_proportion'];
//                $deduction = $set['love']['deduction'];
//            }
            // $price = $goods->price * ($deduction_proportion / 100);love[deduction_proportion_low]
            if (!empty($love) && $love->value['deduction_proportion'] && $love->value['deduction_proportion'] != 0) {//????????????
                $deduction_proportion = $love->value['deduction_proportion'];
                $deduction = $love->value['deduction'];
            }

            if ($item->deduction_proportion && $item->deduction_proportion != 0) {
                $deduction_proportion = $item->deduction_proportion;
                $deduction = $item->deduction;
            }
            $data['deduction'] = $deduction;//$item->deduction;
            $data['deduction_proportion'] = $deduction_proportion . '%';

        }

//            $award_proportion = (bccomp($item->award_proportion, 0.00, 2) == 1) ? $item->award_proportion : \Setting::get('love.award_proportion');
        if ($item->award) {
            $award = $item->award;
            //?????????????????????
            $award_proportion = \Setting::get('love.award_proportion');

            //????????????
//            if (!empty($set)){
//                $award_proportion = $set['love']['award_proportion'];
//                $award = $set['love']['award'];
//            }

            // $award_price = $goods->price * ($award_proportion / 100);
            //????????????
            if (!empty($love) && $love->value['award_proportion'] && $love->value['award_proportion'] != 0) {
                $award_proportion = $love->value['award_proportion'];
                $award = $love->value['award'];
            }

            //??????????????????
            if ($item->award_proportion && $item->award_proportion != 0) {
                $award_proportion = $item->award_proportion;//bccomp($item->award_proportion, 0.00, 2);
                $award = $item->award;
            }

            $data['award'] = $love_set['award'] ? $award : 0;//$item->award;
            $data['award_proportion'] = $award_proportion . '%';
        }
//        dd(\Setting::get('love.award_proportion'),$set['love']['award_proportion'],$love->value['award_proportion'],$item->award_proportion,bccomp(66, 0.00, 2));

        return $data;
    }

    /**
     * ????????????????????????
     * @param $member
     * @return \Illuminate\Http\JsonResponse|int
     */
    public function couponsMemberLj($member)
    {
        if (empty($member)) {
            throw new AppException('?????????????????????');
        }
        $memberLevel = $member->level_id;

        $now = strtotime('now');
        $coupons = Coupon::getCouponsForMember($member->member_id, $memberLevel, null, $now)
            ->orderBy('display_order', 'desc')
            ->orderBy('updated_at', 'desc')
            ->get();
        if ($coupons->isEmpty()) {
            return 0;
        }

        foreach ($coupons as $v) {
            if (($v->total == MemberCouponController::NO_LIMIT) || ($v->has_many_member_coupon_count < $v->total)) {
                return 1;
            }
        }

        return 0;
    }

    private function goods_lease_set(&$goodsModel, $lease_switch)
    {
        if ($lease_switch) {
            //TODO ?????????????????? $id
            if (is_array($goodsModel)) {
                $goodsModel['lease_toy'] = LeaseToyGoods::getDate($goodsModel['id']);

            } else {
                $goodsModel->lease_toy = LeaseToyGoods::getDate($goodsModel->id);
            }

        } else {
            if (is_array($goodsModel)) {

                $goodsModel['lease_toy'] = [
                    'is_lease' => $lease_switch,
                    'is_rights' => 0,
                    'immed_goods_id' => 0,
                ];
            } else {
                $goodsModel->lease_toy = [
                    'is_lease' => $lease_switch,
                    'is_rights' => 0,
                    'immed_goods_id' => 0,
                ];
            }
        }
    }

    public function loveShoppingGift($goodsModel)
    {

        //?????????
        $exist_love = app('plugins')->isEnabled('love');
        if ($exist_love) {
            $love_goods = $this->getLoveSet($goodsModel, $goodsModel->id);

            if ($love_goods['award'] && \Setting::get('love.goods_detail_show_love') == 2) {
                return '????????????' . $love_goods['award_proportion'] . $love_goods['name'];
            }
        }

        return '';
    }

    private function goodsServiceFree(&$goodsModel)
    {
        if (app('plugins')->isEnabled('service-fee')) {
            $serviceFee = Setting::get('plugins.service-fee');
            if ($serviceFee['service']['open'] == 1) {
                $serviceFees = ServiceFeeModel::where('goods_id', $goodsModel->id)->first();
                if ($serviceFees->is_open) {
                    $fee = ['name' => $serviceFee['service']['name'], 'money' => $serviceFees->fee];
                    $goodsModel->fee = $fee;
                }
            }
        }
        return;
    }

    private function goodsProductMarket(&$goodsModel)
    {
        if (app('plugins')->isEnabled('product-market')) {
            $productMarket = ProductMarketGoodsModel::where('goods_id', $goodsModel->id)->first();
            if ($productMarket['product']) {
                $goodsModel->prdocut_market = $productMarket['product'];
            }
        }
        if (app('plugins')->isEnabled('market-sub')) {
            $productMarket = MarketSubGoods::where('goods_id', $goodsModel->id)->first();
            if ($productMarket['product']) {
                $goodsModel->prdocut_market = $productMarket['product'];
            }
        }
        return;
    }

    public function showPush()
    {
        $id = intval(\YunShop::request()->id);
        $goods = Goods::with('hasOneSale')->find($id);
        $show_push = SaleGoods::getPushGoods($goods->hasOneSale);//SaleGoods::getPushGoods($goodsModel->hasOneSale)
        $data['show_push'] = $show_push ?: [];
        $data['content'] = html_entity_decode($goods->content) ?: '';

        return $this->successJson('????????????', $data);
    }

    public function getComment($goodsId)
    {
        app('db')->cacheSelect = true;
//        $goodsId = \YunShop::request()->goods_id;
        $pageSize = 5;
        $list = Comment::getCommentsByGoods($goodsId)->paginate($pageSize);//

        if ($list) {
            foreach ($list as &$item) {
                $item->nick_name = self::substrCut($item->nick_name);
                $item->reply_count = $item->hasManyReply->count('id');
                $item->head_img_url = $item->head_img_url ? replace_yunshop(yz_tomedia($item->head_img_url)) : yz_tomedia(\Setting::get('shop.shop.logo'));
            }
            //???????????????????????????????????????????????????????????????url
            $list = $list->toArray();
            foreach ($list['data'] as &$item) {
                self::unSerializeImage($item);
            }
            return $list;
        }
        return $list;
    }

    /*
    * ?????????????????????
    */
    public function favorableRate($id)
    {
        //?????????????????????????????????????????????
        $total = \app\common\models\Comment::where(['goods_id' => $id, 'type' => 1])->count('id');//????????????
        if ($total <= 0) return '100%';

        $level_comment = \app\common\models\Comment::where(['goods_id' => $id, 'type' => 1])->sum('level');//??????????????????
        $mark = bcmul($total, 5, 2);//???????????????  = ????????? * 5

        //??????????????? = ??????????????????/??????????????????/100
        $have_comment = bcmul(bcdiv($level_comment, $mark, 2), 100, 2);

        return $have_comment . '%';

//        $total = OrderGoods::with(['hasOneOrder',function($q){
//            $q->where('status',3);
//        }])->where('goods_id',$id)->count('id');//?????????
//
//        if ($total <= 0){
//            return '100%';
//        }
//        $level_comment = \app\common\models\Comment::where(['goods_id' => $id,'type'=>  1])->sum('level');//??????????????????
//        $comment = \app\common\models\Comment::where(['goods_id' => $id,'type'=>1])->count('id');//????????????
//        $mark = bcmul($total,5,2);//?????????  = ????????? * 5
//        $no_comment = bcmul(bcsub($total,$comment,2) ,5,2);//????????? = ????????? - ???????????????
//        $have_comment = bcmul(bcdiv(bcadd($level_comment,$no_comment,2),$mark,2),100,2);//???????????????
//        //??????????????? = ????????????????????? + ???????????? / ????????????/100
//        return $have_comment.'%';
    }

    // ??????????????????
    public static function unSerializeImage(&$arrComment)
    {
        $arrComment['images'] = unserialize($arrComment['images']);
        foreach ($arrComment['images'] as &$image) {
            $image = yz_tomedia($image);
        }

//        if ($arrComment['append']) {
//            foreach ($arrComment['append'] as &$comment) {
//                $comment['images'] = unserialize($comment['images']);
//                foreach ($comment['images'] as &$image) {
//                    $image = yz_tomedia($image);
//                }
//            }
//        }

        if ($arrComment['append']) {
            $arrComment['append']['images'] = unserialize($arrComment['append']['images']);
            foreach ($arrComment['append']['images'] as &$image) {
                $image = yz_tomedia($image);
            }
        }

        if ($arrComment['has_many_reply']) {
            foreach ($arrComment['has_many_reply'] as &$comment) {
                $comment['images'] = unserialize($comment['images']);
                foreach ($comment['images'] as &$image) {
                    $image = yz_tomedia($image);
                }
            }
        }
    }

    //?????????
    public function getRoom()
    {
        app('db')->cacheSelect = true;
        $goods_id = intval(request()->goods_id);
        $rooms = Room::select('yz_room.*', 'yz_room_record_file.id as back_id')
            ->where(function ($querys) {
                $querys->whereIn('status', [2, 3])
                    ->orwhere(function ($query) {
                        $query->where('status', 4)
                            ->where('yz_room_record_file.id', '>', 0)
                            ->where('yz_room_record_file.is_show', 1);
                    });
            })
            ->leftJoin('yz_room_record_file', function ($join) {
                $join->on('yz_room_record_file.room_id', '=', 'yz_room.id');
            })
            ->with('hasOneMember')
            ->wherehas('hasManyGoods', function ($query) use ($goods_id) {
                $query->where('goods_id', $goods_id);
            })
            ->whereNull('yz_room_record_file.deleted_at')
            ->orderByRaw("FIELD(status, " . implode(", ", [3, 2, 4]) . ")")
            ->orderBy('yz_room.recommend', 'asc')
            ->orderBy('yz_room_record_file.recommend', 'asc')
            ->orderBy('yz_room.id', 'desc')
            ->paginate(10);
        $room = [];
        foreach ($rooms as $key => $val) {
            $room[$key]['avatar'] = $val->hasOneMember['avatar_image'];
            $room[$key]['nickname'] = $val->hasOneMember['nickname'];
            $room[$key]['id'] = $val->id;
            $room[$key]['status'] = $val->status;
            $room[$key]['title'] = $val->title;
            $room[$key]['cover'] = yz_tomedia($val->cover);
            $room[$key]['banner'] = yz_tomedia($val->banner);
            $room[$key]['live_time'] = $val->live_time;
            $room[$key]['view_num'] = $val->view_count + $val->virtual;
            if (empty($val->goods)) {
                $room[$key]['goods_num'] = 0;
            } else {
                $room[$key]['goods_num'] = count(explode(',', $val->goods));
            }
            if ($val->status == 2) {
                $room[$key]['play_type'] = 3;
            } elseif ($val->status == 3) {
                $room[$key]['play_type'] = 1;
            } else {
                $room[$key]['play_type'] = 2;
                $room[$key]['back_id'] = $val->back_id;
            }
        }
        $json = $rooms->toArray();
        $json['data'] = $room;
        return $this->successJson('??????', $json);
    }


    /**
     * ????????????????????????????????????????????????*?????????????????????????????????????????????
     * @param string $user_name ??????
     * @return string ?????????????????????
     */
    function substrCut($user_name)
    {
        $strlen = mb_strlen($user_name, 'utf-8');
        $firstStr = mb_substr($user_name, 0, 1, 'utf-8');
        $lastStr = mb_substr($user_name, -1, 1, 'utf-8');
        if ($strlen < 2) {
            return $user_name;
        } else {
            return $strlen == 2 ? $firstStr . str_repeat('*', mb_strlen($user_name, 'utf-8') - 1) : $firstStr . str_repeat("*", $strlen - 2) . $lastStr;
        }
    }


}
