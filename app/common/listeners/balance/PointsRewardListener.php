<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/11/10
 * Time: 15:25
 */

namespace app\common\listeners\balance;

use app\common\events\balance\RechargeSuccessEvent;
use app\common\facades\Setting;
use app\common\services\finance\PointService;
use Illuminate\Contracts\Events\Dispatcher;

class PointsRewardListener
{
    public function subscribe(Dispatcher $events)
    {
        $events->listen(RechargeSuccessEvent::class, self::class . '@handle');
    }

    public function handle($events)
    {
        $model = $events->getRechargeModel();
        \Log::info($model->id.'余额充值赠送积分',$model->money);
        $set = Setting::get('finance.balance');
        if($set['charge_reward_swich'] != 1 || $model->type == 0)
        {
            return;
        }
        if(!$set['charge_reward_rate'])
        {
            $points = $model->money;
        }else{
            $base = bcdiv($set['charge_reward_rate'],100,8);
            $points = bcmul($base,$model->money,2);
        }
        \Log::info($model->id.'余额充值赠送积分值',$points);
        if($points > 0)
        {
            $arr = [
                'point_mode' => PointService::POINT_MODE_BALANCE_RECHARGE_REWARD,
                'member_id' => $model->member_id,
                'point' => $points,
                'remark' => "余额充值赠送积分 ID:" . $model->id ,
                'point_income_type' => PointService::POINT_INCOME_GET
            ];

            (new PointService($arr))->changePoint();
        }
    }
}