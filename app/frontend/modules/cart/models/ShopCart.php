<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/12
 * Time: 16:45
 */

namespace app\frontend\modules\cart\models;


use app\common\exceptions\AppException;
use app\common\models\BaseModel;
use app\framework\Http\Request;
use app\frontend\models\MemberCart;
use app\frontend\modules\cart\discount\models\PreCartDiscount;
use app\frontend\modules\cart\manager\CartGiftGoodsCollection;
use app\frontend\modules\cart\manager\CartGoodsCollection;
use app\frontend\modules\cart\manager\CartGoodsManager;
use app\frontend\modules\member\services\MemberCartService;
use Yunshop\Marketing\models\Marketing;
use Yunshop\Marketing\service\MarketingEnoughReduceService;
use Yunshop\Marketing\service\MarketingService;
use Yunshop\Overseas\util\Res\StandardRes;
use Yunshop\Overseas\util\Res\SucRes;

/**
 * Class ShopCart
 * @property CartGoodsCollection carts
 * @property CartGiftGoodsCollection giftCarts
 * @package app\frontend\modules\cart\models
 */
class ShopCart extends BaseModel
{

    protected $member;

    protected $request;

    protected $disable;

    protected $marketingService;

    protected $hidden = ['marketingService'];

    public function init(CartGoodsCollection $carts, $member = null, $request = null)
    {

        $this->member = $member;

        $this->setRequest($request);

        $this->setMarketingService($carts->first()->memberCart->marketingService); //设置营销活动信息

        $this->setCarts($carts);

        $this->cartValidate();

    }

    public function cartValidate()
    {
        $this->carts->cartValidate();
    }

    public function giftCartValidate()
    {
        $this->giftCarts->cartValidate();
    }


    public function setRequest(Request $request)
    {
        $this->request = $request;
    }

    /**
     * 获取request对象
     * @return Request
     */
    public function getRequest()
    {
        if (!isset($this->request)) {
            $this->request = request();
        }
        return $this->request;
    }

    /**
     * 获取url中关于本订单的参数
     * @param null $key
     * @return mixed
     */
    public function getParams($key = null)
    {
        $result = collect(json_decode($this->getRequest()->input('orders'), true))->where('pre_id', $this->pre_id)->first();
        if (isset($key)) {
            return $result[$key];
        }

        return $result;
    }


    //注入店铺的购物车商品记录
    public function setCarts(CartGoodsCollection $carts)
    {
        $this->setRelation('carts', $carts);
        $this->carts->setShop($this);
    }

    public function setGiftCarts(CartGiftGoodsCollection $giftCarts)
    {
        $this->setRelation('giftCarts', $giftCarts);
        $this->giftCarts->setShop($this);
    }


    public function isCheckedCartGoods()
    {
        return $this->carts->isCheckedCartGoods();
    }

    /**
     * 设置前端是否可选状态
     * @param ShopCart $firstShop 首选购物车店铺
     *
     */
    public function setDisable($firstShop)
    {
        $isDisable = is_null($firstShop)?false:$firstShop->isAlone();

        //是特殊店铺、已有勾选商品
        if ($this->isAlone() && !is_null($firstShop)) {
            //勾选的商品与未勾选的商品得店铺对应
            $bool = !($isDisable && $firstShop->getShopId() == $this->getShopId());
            $this->special($bool); //特殊商品
        } else {
            $this->normal($isDisable); //正常商品
        }
    }

    /**
     * 特殊商品是否可选状态
     */
    public function special($isDisable)
    {
        $this->disable = $isDisable;
        $this->setCartDisable($isDisable);
    }

    /**
     * 正常商品是否可选状态
     */
    public function normal($isDisable)
    {
        $this->disable = $isDisable;
        $this->setCartDisable($isDisable);
    }


    /**
     * 禁用购物车商品选择
     * @return mixed
     */
    public function setCartDisable($isDisable)
    {
        return $this->carts->setCartDisable($isDisable);
    }


    /**
     * 判断这个店铺只能单独下单
     * @return bool
     */
    public function isAlone()
    {
        return false;
    }

    //店铺活动优惠满减
    public function getDiscountActivity()
    {
        if(!\Setting::get('enoughReduce.open')){
            return [];
        }
        if ($this->marketingService) {
            $occurred_marketing = $this->getOccurredMarketingRule();
            //命中营销活动且配置不可叠加，不显示满减活动
            if($occurred_marketing && !$this->marketingService->inStackableAct(Marketing::STACKABLE_ACT_ENOUGH_REDUCE)){
                return [];
            }
        }
        //与营销活动不可叠加时，不显示系统自己的营销活动
        if(!MarketingEnoughReduceService::inStackableAct(MarketingEnoughReduceService::getCartTypeByGoods($this->carts->first()->goods),Marketing::STACKABLE_ACT_ENOUGH_REDUCE)){
            return [];
        }
        // 获取满减设置,按enough倒序
        $settings = \Setting::get('enoughReduce.enoughReduce');
        if (empty($settings)) {
            return [];
        }
        $str = '';
        foreach ($settings as $setting) {
            $str .= empty($str) ? '满'.$setting['enough'].'减'.$setting['reduce']:'，满'.$setting['enough'].'减'.$setting['reduce'];
        }

        if (\Setting::get('enoughReduce.freeFreight.open')) {
            // 设置为0 全额包邮
            if (\Setting::get('enoughReduce.freeFreight.enough') === 0 || \Setting::get('enoughReduce.freeFreight.enough') === '0') {
                $str.= empty($str) ? '全额包邮':'，全额包邮';
            } elseif(\Setting::get('enoughReduce.freeFreight.enough')) {
                $str.= empty($str) ? '满额'.\Setting::get('enoughReduce.freeFreight.enough').'包邮':'，满额'.\Setting::get('enoughReduce.freeFreight.enough').'包邮';
            }
        }

        return [[
            'name'=> '满减',
            'code'=> 'enoughReduce',
            'type'=> 'string',
            'desc'=> $str,
        ]];

    }

    /**
     * 获取总金额
     * @return int|mixed
     * @throws \app\common\exceptions\AppException
     */
    public function getDiscountAmount($total)
    {

        if(!\Setting::get('enoughReduce.open')){
            return 0;
        }
        // 获取满减设置,按enough倒序
        $settings = collect(\Setting::get('enoughReduce.enoughReduce'));

        if (empty($settings)) {
            return 0;
        }

        $settings = $settings->sortByDesc(function ($setting) {
            return $setting['enough'];
        });

        // 订单总价满足金额,则返回优惠金额
        foreach ($settings as $setting) {

            if ($total >= $setting['enough']) {
                return min($setting['reduce'],$total);
            }
        }
        return 0;
    }


    protected $cartDiscounts;

    public function cartDiscounts()
    {

        if (isset($this->cartDiscounts)) {
            return $this->cartDiscounts;
        }


        $cartGoodsDiscounts = $this->carts->getCartGoodsDiscounts();
        $cartGoodsDiscounts = $cartGoodsDiscounts->merge($this->giftCarts->getCartGoodsDiscounts());
        $discountsItems = collect([]);
        // 按每个种类的优惠分组 求金额的和
        $cartGoodsDiscounts->each(function ($cartGoodsDiscount) use ($discountsItems) {
            // 新类型添加
            if ($discountsItems->where('code', $cartGoodsDiscount->code)->isEmpty()) {
                $preCartDiscount = new PreCartDiscount([
                    'code' => $cartGoodsDiscount->code,
                    'amount' => $cartGoodsDiscount->amount,
                    'name' => $cartGoodsDiscount->name,

                ]);
                $discountsItems->push($preCartDiscount);
                return;
            }

            // 已存在的类型累加
            $discountsItems->where('code', $cartGoodsDiscount->code)->first()->amount += $cartGoodsDiscount->amount;
        });

       return  $this->cartDiscounts = $discountsItems;
    }

    protected  $cartExtraCharges;


    /**
     * 其他费用
     * @return \Illuminate\Support\Collection
     */
    public function cartExtraCharges()
    {
        if (isset($this->cartExtraCharges)) {
            return $this->cartExtraCharges;
        }


        $cartGoodsExtraCharges = $this->carts->getCartGoodsExtraCharges();
        $itemsAggregate  = collect([]);
        // 按每个种类分组 求金额的和
        $cartGoodsExtraCharges->each(function ($cartGoodsItem) use ($itemsAggregate) {
            // 新类型添加
            if ($itemsAggregate->where('code', $cartGoodsItem->code)->isEmpty()) {
                $model = new CartBaseModel([
                    'code' => $cartGoodsItem->code,
                    'amount' => $cartGoodsItem->amount,
                    'name' => $cartGoodsItem->name,

                ]);
                $itemsAggregate->push($model);
                return;
            }

            // 已存在的类型累加
            $itemsAggregate->where('code', $cartGoodsItem->code)->first()->amount += $cartGoodsItem->amount;
        });

        return  $this->cartExtraCharges = $itemsAggregate;
    }

    protected  $cartDeductions;

    /**
     * 抵扣
     * @return \Illuminate\Support\Collection
     */
    public function cartDeductions()
    {
        if (isset($this->cartDeductions)) {
            return $this->cartDeductions;
        }


        $cartDeductions = $this->carts->getCartGoodsDeductions();
        $itemsAggregate  = collect([]);
        // 按每个种类分组 求金额的和
        $cartDeductions->each(function ($cartGoodsItem) use ($itemsAggregate) {
            // 新类型添加
            if ($itemsAggregate->where('code', $cartGoodsItem->code)->isEmpty()) {
                $model = new CartBaseModel([
                    'code' => $cartGoodsItem->code,
                    'amount' => $cartGoodsItem->amount,
                    'name' => $cartGoodsItem->name,

                ]);
                $itemsAggregate->push($model);
                return;
            }

            // 已存在的类型累加
            $itemsAggregate->where('code', $cartGoodsItem->code)->first()->amount += $cartGoodsItem->amount;
        });

        return  $this->cartDeductions = $itemsAggregate;
    }


    public function getGoodsPrice()
    {
        return bcadd($this->carts->getPrice(), $this->giftCarts->getPrice(), 2);
    }

    public function getPrice()
    {
        //商品总价
       return $this->getEstimatedPrice();

    }

    public function getEstimatedPrice()
    {
        return bcadd($this->carts->getEstimatedPrice(), $this->giftCarts->getEstimatedPrice(), 2);
    }


    public function getCode()
    {
        return 'shop';
    }

    public function getName()
    {
        return \Setting::get('shop.shop')['name']?:'自营';
    }
    public function getShopId()
    {
        return md5('shop');
    }

    public function getLink()
    {
        return '';
    }

    public function getMerchantId()
    {
        return 0;
    }


    public function setInitAttributes()
    {
        $attributes = array(
            'is_alone' => $this->isAlone(),
            'link' => $this->getLink(),
            'code' => $this->getCode(),
            'name' => $this->getName(),
            'merchant_id' => $this->getMerchantId(),
            'shop_id' => $this->getShopId(),
            'discount_activity' => $this->getDiscountActivity(),
            'marketing' => $this->getMarketing(),
            'checked' => $this->getChecked(),
            'price' => sprintf('%.2f', $this->getPrice()),
        );

        $this->setRawAttributes($attributes);
    }

    /**
     * 店铺是否选中
     * @return bool
     */
    public function getChecked(){
        return $this->carts->every(function($cart){
            return $cart->checked;
        });
    }

    /**
     * 设置店铺上的活动
     * @param MarketingService $marketingService
     * @return void
     */
    public function setMarketingService(MarketingService $marketingService = null){
        $this->marketingService = $marketingService;
    }

    /**
     * 店铺上的活动
     * @return MarketingService|null
     */
    public function getMarketingService(){
        return $this->marketingService;
    }

    /**
     * 活动详情
     * @return array
     * @throws \app\common\exceptions\ApiException
     */
    public function getMarketing()
    {
        $marketingService = $this->getMarketingService();
        if (!is_null($marketingService)) {
            return [
                'act_id' => $marketingService->marketing->id,
                'gift_type' => $marketingService->giftType(),
                'simple_tag' => $marketingService->getSimpleTag(),
                'cart_detail' => $marketingService->getDescCart($this),
                'goods_list_detail' => $marketingService->getDescGoodsList($this),
                'goods_tag' => $marketingService->getGoodsAllTags($this->goods()),
            ];
        }
        return [];
    }

    /**
     * 活动命中规则
     * @return array|mixed
     * @throws \app\common\exceptions\ApiException
     */
    public function getOccurredMarketingRule()
    {
        $occurredMarketingDescCart = $this->getOccurredMarketingDescCart();
        return $occurredMarketingDescCart ? $occurredMarketingDescCart['rule'] : [];
    }
    /**
     * 活动命中购物车描述
     * @return array|mixed
     * @throws \app\common\exceptions\ApiException
     */
    public function getOccurredMarketingDescCart()
    {
        $marketingService = $this->getMarketingService();
        if (!is_null($marketingService)) {
            $cart_detail = $marketingService->getDescCart($this);
            return $cart_detail;
        }
        return [];
    }

    /**
     * 获取购物车商品对象组
     * @param $shopCart
     * @throws \Exception
     */
    public function getCartGiftGoods()
    {
        $marketingService = $this->getMarketingService();
        $marketing_id = $marketingService ? $marketingService->marketing->id : null;
        if (is_null($marketing_id)) {
            return new CartGiftGoodsCollection([]);
        }
        $this->autoCheckedCart();
        $member_id =  \YunShop::app()->getMemberId();
        $memberCarts = MemberCart::where('member_id', $member_id)->where('is_gift',1)->where('marketing_id', $marketing_id)->get();
//        $memberCarts = \app\common\models\MemberCart::where('member_id', $member_id)->where('is_gift',1)->where('marketing_id', $marketing_id)->get();
        //如果赠品数量 不等于 已经选择的赠品数量，那么清空赠品，让用户重新选择
        $res = $this->tryClearUpGiftCart($memberCarts);
        if ($res instanceof SucRes || $memberCarts->isEmpty()) {
            return new CartGiftGoodsCollection([]);
        }
        $result = $memberCarts->map(function ($memberCart){
            if($memberCart->marketing_id !== $this->getMarketingService()->marketing->id){
                throw new AppException('下单异常'.$memberCart->marketingService->marketing->id.":".$this->getMarketingService()->marketing->id);
            }
            /**
             * @var $memberCart MemberCart
             */
            $data = [
                'cart_id' => $memberCart->id,
                'goods_id' => (int)$memberCart->goods_id,
                'goods_option_id' => (int)$memberCart->option_id,
                'total' => (int)$memberCart->total,
            ];

            /**
             * @var $cartGoodsManager CartGoodsManager
             */
            $cartGoodsManager = app('CartContainer')->make('CartGoodsManager');
            /**
             * 根据商品获取不同的 CartGoods模型
             * @var $cartGiftGoods CartGiftGoods
             */
            $cartGiftGoods = $cartGoodsManager->getCartGiftGoods($memberCart->goods);
            $cartGiftGoods->setRelation('goodsOption', $memberCart->goodsOption);
            $cartGiftGoods->initialAttributes($data);
            $cartGiftGoods->setRelation('memberCart', $memberCart);
            return $cartGiftGoods;
        });
        return new CartGiftGoodsCollection($result->values());
    }

    /**
     * 如果赠品数量 不等于 已经选择的赠品数量，那么清空赠品，让用户重新选择
     * @param $shopCart
     * @param $memberCarts
     * @return \Yunshop\Overseas\util\Res\ErrRes|SucRes
     * @throws AppException
     */
    private function tryClearUpGiftCart($memberCarts)
    {
        $maketing = $this->getMarketing();
        if(!isset($maketing['cart_detail']['rule']['goods_num'])){
            if (!$memberCarts->isEmpty()) {
                MemberCartService::clearCartByIds($memberCarts->pluck('id')->toArray());
            }
            return StandardRes::success([],'没命中活动');
        }elseif($maketing['cart_detail']['rule']['goods_num'] < $memberCarts->count() && $memberCarts->count() != 0){
            MemberCartService::clearCartByIds($memberCarts->pluck('id')->toArray());
            return StandardRes::success([],'命中规则中的商品数小于赠品数'.$maketing['cart_detail']['rule']['goods_num'].':'.$memberCarts->count());
        }elseif($maketing['cart_detail']['rule']['goods_num'] > $memberCarts->count() && $memberCarts->count() != 0){
            MemberCartService::clearCartByIds($memberCarts->pluck('id')->toArray());
            return StandardRes::success([],'命中规则中的商品数大于赠品数');
        }
        foreach($memberCarts as $memberCart){
            $goods_info = collect($maketing['cart_detail']['rule']['goods_list'])->keyBy('id')->get($memberCart->goods_id);
            if ($goods_info['num'] != $memberCart->total) {
                MemberCartService::clearCartByIds($memberCarts->pluck('id')->toArray());
                return StandardRes::success([],'命中规则中的商品个数与购物车中的个数不相等');
            }
        }
        if ($maketing['cart_detail']['rule']['goods_num'] == 0) {
            return StandardRes::success([],'命中规则中的商品个数为0');
        }
        return StandardRes::error();
    }

    /**
     * @return \Yunshop\Overseas\util\Res\ErrRes
     * @throws AppException
     * @throws \app\common\exceptions\ApiException
     */
    public function autoCheckedCart()
    {
        if ($this->request['custom_gift']) {
            return StandardRes::error();
        }
        $marketingService = $this->getMarketingService();
        if($marketingService->giftType() != Marketing::GIFT_TYPE_GOODS){
            return StandardRes::error();
        }
        $maketing = $this->getMarketing();
        $goods_list = [];
        if(count($maketing['cart_detail']['rule']['goods_list']) == $maketing['cart_detail']['rule']['goods_num'] && $maketing['cart_detail']['rule']['goods_num'] == 1){
            foreach ($maketing['cart_detail']['rule']['goods_list'] as $goods) {
                $goods_list[] = [
                    'marketing_id' => $maketing['act_id'],
                    'goods_id' => $goods['id'],
                    'total' => $goods['num'],
                    'option_id' => isset($goods['option_id']) ? $goods['option_id'] : 0,
                    'is_gift' => 1,
                    'checked' => 1,
                ];
            }
            return MarketingService::addGiftToMemberCarts($goods_list, $this->member->uid);
        }
        return StandardRes::error();
    }

    public function beforeFormat()
    {
        $this->setAttribute('disable',$this->disable);
    }

    /**
     * @return array
     */
    public function toArray()
    {
        $this->setInitAttributes();
        $this->beforeFormat();
        return parent::toArray();
    }


    public function goods()
    {
        return $this->carts->first()->goods;
    }


    public function getPriceAttribute()
    {
        return  sprintf('%.2f', $this->getPrice());
    }

    public function getDiscountActivityAttribute()
    {
        return $this->getDiscountActivity();
    }

    public function getCodeAttribute()
    {
        return $this->getCode();
    }

    public function getNameAttribute()
    {

        return $this->getName();
    }

    public function getShopIdAttribute()
    {
        return $this->getShopId();
    }
}