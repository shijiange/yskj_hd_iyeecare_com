<?php
/**
 * Created by PhpStorm.
 * Author: 芸众商城 www.yunzshop.com
 * Date: 2017/3/6
 * Time: 上午11:45
 */

namespace app\backend\modules\goods\models;

use Illuminate\Support\Facades\DB;

class Sale extends \app\common\models\Sale
{
    public $timestamps = false;
    static protected $needLog = true;

    /**
     * Author:blank
     * UpdateTime:2017/12/13
     * @param  [int] $goodsId 商品id
     * @return object $saleData 商品营销对象
     */
    public static function getList($goodsId)
    {
        $saleData = self::where('goods_id', $goodsId)
            ->first();
        if ($saleData->is_push == 1) {
            $arr = explode('-', $saleData->push_goods_ids);
            if ($arr) {
                $goods = \app\common\models\Goods::getPushGoods($arr);
                foreach ($goods as $k=>$good) {
                    $goods[$k]['thumb_url'] = yz_tomedia($good['thumb']);
                }
                $saleData->push_goods_ids = $goods;
            } else {
                $saleData->push_goods_ids = [];
            }
            // Goods::select('id','title')->whereIn('id', $arr)->where('status', 1)->get()->toArray();
        }
        return $saleData;
    }


    public static function relationSave($goodsId, $data, $operate)
    {
        if (!$goodsId) {
            return false;
        }
        if (!$data) {
            return false;
        }
        $saleModel = self::getModel($goodsId, $operate);
        //判断deleted
        if ($operate == 'deleted') {
            return $saleModel->delete();
        }
        $data['goods_id'] = $goodsId;
        if (isset($data['ed_full'])) {
			$data['ed_full'] = empty($data['ed_full']) ? 0 : $data['ed_full'];
		}
        if (isset($data['ed_reduction'])) {
			$data['ed_reduction'] = empty($data['ed_reduction']) ? 0 : $data['ed_reduction'];
		}
        if (isset($data['point'])) {
			$data['point'] = trim($data['point']);
		}
        if (isset($data['award_balance'])) {
			$data['award_balance'] = trim($data['award_balance']);
		}
        if (isset($data['pay_reward_balance'])) {
            $data['pay_reward_balance'] = trim($data['pay_reward_balance']);
        }

        /**
         * Author:blank
         * UpdateTime:2017/12/13
         */
        if (isset($data['is_push'])) {
			if ($data['is_push'] == 1 && $data['push_goods_ids']) {
                $push_goods_ids = array_column($data['push_goods_ids'],'id');
				$data['push_goods_ids'] = implode('-', $push_goods_ids);
			} else {
				$data['push_goods_ids'] = '';
			}
		}

		//为了保存不报错添加过滤,0和空字符串不能过滤掉
        $data = array_map(function ($item) {
            if ($item === null || $item === "null") {
                return '';
            }
            return $item;
        },$data);


        $saleModel->fill($data);

        return $saleModel->save();
    }

    public static function getModel($goodsId, $operate)
    {
        $model = false;
        if ($operate != 'created') {
            $model = static::where(['goods_id' => $goodsId])->first();
        }
        !$model && $model = new static;

        return $model;
    }
}