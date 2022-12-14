<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/6
 * Time: 17:12
 */

namespace app\frontend\modules\cart\models;


use app\common\exceptions\AppException;
use app\common\models\BaseModel;
use app\common\models\GoodsOption;
use app\frontend\models\Goods;
use app\frontend\modules\cart\deduction\BaseCartDeduction;
use app\frontend\modules\cart\deduction\models\PreCartGoodsDeduction;
use app\frontend\modules\cart\discount\BaseCartDiscount;
use app\frontend\modules\cart\discount\EnoughReduceDiscount;
use app\frontend\modules\cart\discount\FullPiece;
use app\frontend\modules\cart\discount\GiftEnoughDiscount;
use app\frontend\modules\cart\discount\MemberLevelDiscount;
use app\frontend\modules\cart\discount\models\PreCartGoodsDiscount;
use app\frontend\modules\cart\discount\SingleEnoughReduceDiscount;
use app\frontend\modules\cart\extra\BaseCartExtraCharges;
use app\frontend\modules\cart\manager\GoodsAdapter;
use app\frontend\modules\cart\manager\GoodsOptionAdapter;
use app\frontend\modules\cart\node\CartGoodsBaseCartExtraChargesPriceNode;
use app\frontend\modules\cart\node\CartGoodsDeductionsPriceNode;
use app\frontend\modules\cart\node\CartGoodsDiscountPriceNode;
use app\frontend\modules\cart\node\CartGoodsPriceNodeBase;
use app\frontend\modules\cart\services\CartGoodsInterface;
use app\frontend\modules\member\services\MemberCartService;
use app\frontend\modules\order\PriceNode;
use app\frontend\modules\order\PriceNodeTrait;
use Yunshop\Marketing\models\Marketing;
use Yunshop\Marketing\service\MarketingService;

/**
 * Class CartGoods
 * @package app\frontend\modules\cart\models
 * @property Goods goods
 * @property GoodsOption goodsOption
 * @property \app\common\models\MemberCart memberCart
 *
 */
class CartGoods extends BaseModel implements CartGoodsInterface
{
    use PriceNodeTrait;

    protected $appends = ['checked', 'disable', 'gift_price','is_gift'];

    protected $hidden = ['memberCart', 'goods','goodsOption'];

    /**
     * @var $shop ShopCart
     */
    public $shop;

    protected $goodsAdapter;

    protected $isChecked;

    protected $disable;

    protected $estimated_price;

    protected $price;


    //?????????
    public function _getPriceNodes()
    {
        // ??????????????????
        $nodes = collect([
            new CartGoodsPriceNodeBase($this, 1000)
        ]);

        //???????????????
        $discountNodes = $this->getDiscounts()->map(function (BaseCartDiscount $discount) {
            return new CartGoodsDiscountPriceNode($this, $discount, 2000);
        });

        //???????????????
        $deductionsNodes = $this->getDeductions()->map(function (BaseCartDeduction $deduction) {
            return new CartGoodsDeductionsPriceNode($this, $deduction, 3000);
        });


        //??????????????????
        $extraChargesNodes = $this->getExtraCharges()->map(function (BaseCartExtraCharges $extraCharges) {
            return new CartGoodsBaseCartExtraChargesPriceNode($this, $extraCharges, 4000);
        });


        // ??????weight??????
        return $nodes->merge($discountNodes)
            ->merge($deductionsNodes)
            ->merge($extraChargesNodes)
            ->sortBy(function (PriceNode $priceNode) {
                return $priceNode->getWeight();
            })->values();
    }

    /**
     * ????????????
     * @return \Illuminate\Support\Collection
     */
    public function getDiscounts()
    {

        $default = collect([
            new MemberLevelDiscount($this),new GiftEnoughDiscount($this), new SingleEnoughReduceDiscount($this), new FullPiece($this), new EnoughReduceDiscount($this),
        ]);

//        $default = collect([
//            new SingleEnoughReduceDiscount($this), new EnoughReduceDiscount($this),
//        ]);

        $aggregate = $default->merge($this->setDiscounts());

        return $aggregate;
    }

    public function setDiscounts()
    {
       return collect([]);
    }

    /**
     * ????????????
     * @return \Illuminate\Support\Collection
     */
    public function getDeductions()
    {
        $default = collect([]);

        $aggregate = $default->merge($this->setDeductions());

        return $aggregate;
    }

    public function setDeductions()
    {
        return collect([]);
    }

    /**
     * ????????????
     * @return \Illuminate\Support\Collection
     */
    public function getExtraCharges()
    {
        $default = collect([]);

        $aggregate = $default->merge($this->setExtraCharges());

        return $aggregate;
    }

    public function setExtraCharges()
    {
        return collect([]);
    }


    /*
     * ?????????????????????
     */
    public function initialAttributes($data)
    {
        $this->setRawAttributes($data);

        $this->beforeCreating();
    }

    public function beforeCreating()
    {

    }

    /**
     * @throws AppException
     */
    public function goodsValidate()
    {
        //??????????????????
        if (!$this->isChecked()) {
            return true;
        }

        if (!isset($this->goods)) {
            $this->memberCart->delete();
            throw new AppException('(ID:' . $this->goods_id . ')??????????????????????????????');
        }

        //todo ??????????????????????????????
        $this->goods->verifyOption($this->goods_option_id);

        if (empty($this->goods->status)) {
            throw new AppException($this->goods->title.'(ID:' . $this->goods->id . ')???????????????');
        }

        if ($this->isOption()) {
            $this->goodsOptionValidate();
        }
    }
    /**
     * ????????????
     * @throws AppException
     */
    public function goodsOptionValidate()
    {
        if (!$this->goods->has_option) {
            throw new AppException($this->goods->title.'(ID:' . $this->goods_id . ')?????????????????????');
        }
        if (!isset($this->goodsOption)) {
            throw new AppException($this->goods->title.'(ID:' . $this->goods_id . ')??????????????????????????????');
        }

        if ($this->goods_id != $this->goodsOption->goods_id) {
            throw new AppException('??????('.$this->option_id.')'.$this->goodsOption->title.'???????????????('.$this->goods_id.')'.$this->goods->title);
        }
    }

    /**
     * ???????????????
     * @param $shop
     */
    public function setShop($shop)
    {
        $this->shop = $shop;
    }

    /**
     * @return ShopCart
     * @throws AppException
     */
    final public function getShop()
    {
        if (!isset($this->shop)) {
            throw new AppException('??????????????????,???????????????????????????');
        }
        return $this->shop;
    }


    public function setDisable($bool)
    {
        $this->disable = $bool;
    }

    /**
     * @return bool
     */
    public function getDisableAttribute()
    {
        return $this->disable;
    }

    /**
     * @return bool
     * @throws AppException
     */
    public function getCheckedAttribute()
    {
        return $this->isChecked();
    }

    /**
     * ?????????????????????
     * @return bool
     * @throws AppException
     */
    public function isChecked()
    {
        if (!isset($this->isChecked)) {

            if ($this->noBeChecked()) {
                // ????????????
                $this->isChecked = false;
            } else {
                // ????????????
                $this->isChecked = $this->memberCart->checked ? true : false;
            }
        }

        return $this->isChecked;
    }


    /**
     * todo ???????????????????????? isChecked ??? disable ??????????????????
     * ????????????
     * @return bool
     */
    protected function noBeChecked()
    {

       return false;
    }


    /**
     * ?????????????????????
     * ??????????????????????????????
     * @return array
     * @throws AppException
     */
    public function getExtraField()
    {
        $attributes = array(
            // 'cart_id' => $this->cart_id,
            // 'goods_id' => $this->goods_id,
            // 'total' => $this->total,
            // 'goods_option_id' => $this->goods_option_id,
            'is_alone' => $this->getShop()->isAlone(),
            'shop_id' => $this->getShop()->getShopId(), //????????????
            'unit' => $this->getUnit(), //??????
            'style_type' => $this->getStyleType(), //??????
            'goods_title' => $this->goods()->title,
            'vip_price' => $this->getVipPrice(),
            'goods_thumb' => yz_tomedia($this->goods()->thumb),
            'discount_activity' => $this->getDiscountActivity(),
            'goods_price' => sprintf('%.2f', $this->getGoodsPrice()),
            'price' => sprintf('%.2f', $this->getPrice()),
            'estimated_price' => sprintf('%.2f', $this->getEstimatedPrice()), //????????????
            'tags' => MarketingService::getGoodsAllTags($this->goods),
//            'is_gift' => $this->memberCart->is_gift
        );

        if ($this->goodsOption) {
            $attributes += [
                'goods_option_title' => $this->goodsOption->title,
            ];

            if ($this->goodsOption['thumb']) {
                $attributes['goods_thumb'] = yz_tomedia($this->goodsOption['thumb']);
            }
        }

        $attributes = array_merge($this->getAttributes(), $attributes);

        return $attributes;
    }

    public function getIsGiftAttribute()
    {
        return $this->memberCart->is_gift;
    }
    public function getGiftPriceAttribute()
    {
        return $this->getGiftPrice();
    }

    public function getGiftPrice()
    {
        return 0;
    }

    public function getUnit()
    {
        return '???';
    }

    public function getStyleType()
    {
        return 'shop';
    }


    /**
     * ????????????
     * @return int
     */
    public function getGoodsPrice()
    {
        return $this->getAdapter()->getPrice();
    }

    /**
     * ??????????????????
     * @return mixed
     */
    public function getPrice()
    {

        if (isset($this->price)) {
            return $this->price;
        }

        //????????????????????????
        if (!$this->isChecked()) {
            return 0;
        }

        //???????????? * ??????
        $this->price = $this->getGoodsPrice() * $this->total;

        return $this->price;
    }

    /**
     * ??????????????????
     * @return mixed
     * @throws AppException
     */
    public function getEstimatedPrice()
    {

        if (isset($this->estimated_price)) {
            return $this->estimated_price;
        }

//        //????????????????????????
        if (!$this->isChecked()) {
            return 0;
        }

        ///?????????????????? - ?????????????????? - ???????????? - ????????????
        $this->estimated_price = $this->getPriceAfter($this->getPriceNodes()->last()->getKey());
        //?????????

        return  $value = sprintf('%.2f', $this->estimated_price);
    }


    /**
     * ?????????????????????????????????
     * @return float
     * @throws AppException
     */
    public function getVipDiscountAmount()
    {
//        $amount = $this->getAdapter()->_getVipDiscountAmount();
//        $preCartGoodsDiscount = new PreCartGoodsDiscount([
//            'code' => 'memberLevel',
//            'amount' => $amount ?: 0,
//            'name' => '??????????????????',
//        ]);
//        $preCartGoodsDiscount->setCartGoods($this);
//
//        return $amount;
        return $this->getAdapter()->_getVipDiscountAmount() * $this->total;
    }


    /**
     * ??????????????????
     * @return mixed
     */
    public function getCartGoodsDiscounts()
    {
        if (!$this->getRelation('cartGoodsDiscounts')) {
            $this->setRelation('cartGoodsDiscounts', $this->newCollection());


        }
        return $this->cartGoodsDiscounts;
    }

    /**
     * ??????
     * @return mixed
     */
    public function getCartGoodsDeductions()
    {
        if (!$this->getRelation('cartGoodsDeductions')) {
            $this->setRelation('cartGoodsDeductions', $this->newCollection());


        }
        return $this->cartGoodsDeductions;
    }

    /**
     * ????????????
     * @return mixed
     */
    public function getCartGoodsExtraCharges()
    {
        if (!$this->getRelation('cartGoodsExtraCharges')) {
            $this->setRelation('cartGoodsExtraCharges', $this->newCollection());


        }
        return $this->cartGoodsExtraCharges;
    }


    protected $isCoinExchange;

    /**
     * ??????????????????????????????
     * @return bool
     */
    protected function isCoinExchange()
    {

        //??????????????????: ?????? ??????????????? ????????????????????????
        $shopSet = \Setting::get('shop.shop');

        if (!isset($this->isCoinExchange)) {

            if (!$this->goods()->hasOneSale->has_all_point_deduct) {
                $this->isCoinExchange = false;
            } else {
                $this->isCoinExchange = true;
                // ??????????????????

                $preModel = new PreCartGoodsDeduction([
                    'code' => 'pointAll',
                    'amount' => ($this->getGoodsPrice() * $this->total) ?: 0,
                    'name' => $shopSet['credit1'] ? $shopSet['credit1'] . '????????????' : '??????????????????',
                ]);
                $preModel->setCartGoods($this);

            }
        }
        return $this->isCoinExchange;
    }


    /**
     * @return array
     * @throws AppException
     */
    public function toArray()
    {
        $this->setRawAttributes($this->getExtraField());

        return parent::toArray();
    }

    //??????????????????????????????
    public function getDiscountActivity()
    {

        //todo ??????????????????????????????
        $data = [];

        $sale =  $this->goods()->hasOneSale;
        if ($sale->ed_num || $sale->ed_money) {

            $str = '';
            if ($sale->ed_money) {
                $str .= '???' . $sale->ed_money . '??????';
            }
            if ($sale->ed_num) {

                if (!empty($str)) {
                    $str .= ',';
                }

                $str .= '???' . $sale->ed_num . '?????????';
            }

            $data[] = [
                'name' => '??????',
                'code'=> 'freeSend',
                'type'=> 'string',
                'desc'=> $str,
            ];
        }

        if ((bccomp($sale->ed_full, 0.00, 2) == 1) && (bccomp($sale->ed_reduction, 0.00, 2) == 1)) {
            $data[] = [
                'name'=> '??????',
                'code'=> 'goodsReduce',
                'type'=> 'string',
                'desc'=>  '???'.$sale->ed_full.'???'.$sale->ed_reduction,
            ];
        } elseif ($this->shop->getMarketingService() != null && $this->shop->getMarketingService()->giftType() == Marketing::GIFT_TYPE_DISCOUNT) {
            $data[] = [
                'name'=> '?????????',
                'code'=> 'giftDiscount',
                'type'=> 'string',
                'desc'=>  '????????????'.($this->getGoodsPrice() - $this->getGiftPrice()).'???',
            ];
        }

        return $data;
    }

    /**
     * ?????????????????????
     */
    public function _getAdapter()
    {
        if ($this->isOption()) {
            $adapter = new GoodsOptionAdapter($this);
        } else {
            $adapter = new GoodsAdapter($this);
        }
        return $adapter;
    }

    /**
     * ?????????????????????
     */
    public function getAdapter()
    {
        if (!isset($this->goodsAdapter)) {
            $this->goodsAdapter = $this->_getAdapter();
        }
        return $this->goodsAdapter;
    }


    /**
     * ?????????????????????
     * @return bool
     */
    public function isOption()
    {
        return !empty($this->goods_option_id);
    }

    /**
     * ????????????
     * @return Goods
     */
    public function goods()
    {
        return $this->goods;
    }

    /**
     * ???????????????
     * @param \app\common\models\Goods $goods
     * @return bool
     */
    public function verify()
    {
        return false;
    }

    public function getVipPrice()
    {
        if($this->isOption()){
           return $this->goodsOption->vip_price;
        }else{
            return $this->goods()->vip_price;
        }
    }
}