<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/23
 * Time: 14:13
 */

namespace app\common\models\refund;


use app\common\models\BaseModel;
use app\common\models\OrderGoods;
use app\framework\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Collection;
use Yunshop\Marketing\models\MarketingOrderGoods;

class RefundGoodsLog extends BaseModel
{
    use SoftDeletes;

    public $table = 'yz_order_refund_goods_log';
    protected $guarded = ['id'];

    protected $appends = ['goods_title','goods_option_title','goods_thumb'];

    protected $hidden = [ 'created_at','updated_at','deleted_at'];


    /**
     * @param RefundApply $refund
     * @param array $orderGoods
     * @return bool
     */
    public static function saveData(RefundApply $refund, $orderGoods)
    {
//        $log = self::where('order_goods_id', $orderGoods['id'])->first();
//
//        $log = is_null($log) ? new self() : $log;

        $log = new self();

        $log->fill([
            'refund_id' => $refund->id,
            'order_id' => $refund->order->id,
            'order_goods_id' => $orderGoods['id'],
            'refund_type' => $orderGoods['refund_type'],
            'send_num' => $orderGoods['total'],
            'refund_total' => $orderGoods['total'],
            'refund_price' => $orderGoods['refund_price'],
        ]);

        return $log->save();
    }

    /**
     * 过滤掉换货的记录
     * @param Collection $collection
     * @return Collection
     */
    public static function filterExchangeType(Collection $collection){
        return $collection->filter(function (RefundGoodsLog $refundGoodsLog) {
            $refundApply = \app\common\models\refund\RefundApply::find($refundGoodsLog->refund_id);
            return $refundApply->refund_type != \app\common\models\refund\RefundApply::REFUND_TYPE_EXCHANGE_GOODS;
        });
    }


    public function getGoodsTitleAttribute()
    {
        return $this->orderGoods->goods?$this->orderGoods->goods->title : $this->orderGoods->title;
    }

    public function getGoodsOptionTitleAttribute()
    {
        return $this->orderGoods->goods_option_title;
    }
    public function getGoodsThumbAttribute()
    {
        return $this->orderGoods->thumb;
    }

    public function scopePluginId(Builder $query, $pluginId = 0)
    {
        return parent::scopePluginId($query, $pluginId); // TODO: Change the autogenerated stub
    }

    public function scopeByOrderId(Builder $query, $order_id)
    {
        return $query->where('order_id', $order_id);
    }

    public function scopeByOrderGoodsId(Builder $query, $order_goods_id)
    {
        return $query->where('order_goods_id', $order_goods_id);
    }

    public function orderGoods()
    {
        return $this->hasOne(OrderGoods::class, 'id', 'order_goods_id');
    }

    public function marketingOrderGoods(){
        return $this->hasOne(MarketingOrderGoods::class, 'order_goods_id', 'order_goods_id');
    }
}
