<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/30
 * Time: 17:24
 */

namespace app\frontend\modules\refund\controllers;


use app\common\models\refund\ResendExpress;
use Illuminate\Support\Facades\Redis;
use app\common\components\ApiController;
use app\common\exceptions\AppException;
use app\frontend\modules\refund\models\RefundApply;

class ExpressController extends ApiController
{
    public function userReturn()
    {
        $refundApply = RefundApply::find(request()->input('refund_id'));
        if(!$refundApply){
            throw new AppException('未找到该售后信息');
        }

        if(!$refundApply->returnExpress) {
            throw new AppException('未找到该售后快递单号');
        }

        $cacheKey = 'refundExpressId_'.$refundApply->id.'_' . $refundApply->returnExpress->express_sn;


        $result = Redis::get($cacheKey);

        if ($result) {
            $result = json_decode($result, true);
            return $this->successJson('用户发货物流信息Cache', $result);
        }

        switch ($refundApply->returnExpress->way_id) {
            case 1:
                if(app('plugins')->isEnabled('jd-take-parts')) {
                    $dispatch = \Yunshop\JdTakeParts\services\RefundService::receiveTraceGet($refundApply);
                    break;
                }
            default:
                $dispatch = $this->getLogistics($refundApply->returnExpress);
        }
        $dispatch['thumb'] = $refundApply->returnExpress->images;

        $result = $dispatch;
        Redis::setex($cacheKey, 120, json_encode($result));

        return $this->successJson('用户发货物流信息',$result);

    }

    public function resendList()
    {
        $refundApply = RefundApply::find(request()->input('refund_id'));
        if(!$refundApply){
            throw new AppException('未找到该售后信息');
        }

        if($refundApply->hasManyResendExpress->isEmpty()) {
            throw new AppException('未找到该售后快递');
        }

        $dispatch = [];
        foreach ($refundApply->hasManyResendExpress as $expressModel) {


            $express = $this->getLogistics($expressModel);
            if(!empty($express['data'])){
                $express['last_express_context'] = $express['data'][count($express['data'])-1]['context'];
            }else{
                $express['last_express_context'] = '';
            }
            $express['express_id'] = $expressModel->id;
            $express['goods'] = $expressModel->pack_goods;
            $express['thumb'] = $expressModel->pack_goods?$expressModel->pack_goods[0]['thumb'] : '';
            $express['count'] = count($expressModel->pack_goods);
            $dispatch[] = $express;
        }

        $result = [
            'count' => $refundApply->hasManyResendExpress->count(),
            'data' => $dispatch,
        ];

        return $this->successJson('list', $result);
    }

    public function resend()
    {
        $refundApply = RefundApply::find(request()->input('refund_id'));
        if(!$refundApply){
            throw new AppException('未找到该售后信息');
        }

        /**
         * @var ResendExpress $resendExpress
         */
        $resendExpress = ResendExpress::find(request()->input('express_id'));

        if(!$resendExpress) {
            throw new AppException('未找到该售后快递');
        }


        $cacheKey = 'refundExpressId_'.$refundApply->id.'_' . $resendExpress->id;

        $result = Redis::get($cacheKey);
        if ($result) {
            $result = json_decode($result, true);
            return $this->successJson('商户发货物流信息Cache', $result);
        }

        $dispatch = $this->getLogistics($resendExpress);
        $dispatch['goods'] = $resendExpress->pack_goods?: [];
        $dispatch['thumb'] = $resendExpress->pack_goods?$resendExpress->pack_goods[0]['thumb'] : '';

//        foreach ($refundApply->hasManyResendExpress as $resendExpress) {
//            $dispatch = $this->getLogistics($resendExpress);
//            $dispatch['goods'] = $resendExpress->pack_goods?: [];
//            $dispatch['thumb'] = $resendExpress->pack_goods?$resendExpress->pack_goods[0]['goods_thumb'] : '';
//            $result[] = $dispatch;
//        }

        Redis::setex($cacheKey, 120, json_encode($dispatch));

        return $this->successJson('商户发货物流信息', $dispatch);
    }

    protected function getLogistics($expressModel)
    {
        //测试
//        return $this->testData($expressModel);

        $express = (new \app\common\models\order\Express())->getExpress($expressModel->express_code, $expressModel->express_sn);

        $dispatch['express_sn'] = $expressModel->express_sn;
        $dispatch['company_name'] = $expressModel->express_company_name;
        $dispatch['data'] = $express['data'];
        $dispatch['thumb'] = '';
        $dispatch['tel'] = $express['tel'];
        $dispatch['status_name'] = $express['status_name'];

        return $dispatch;
    }


    protected function testData($expressModel)
    {
        $dispatch['express_sn'] = $expressModel->express_sn;
        $dispatch['company_name'] = $expressModel->express_company_name;

        $data = [];
        for ($i = rand(8,20);$i > 1; $i--) {

            $data[] = [
                'context' => '物流信息到达:'.$i,
                'ftime'   => '202111231+'.$i,
            ];
        }
        $dispatch['data'] = $data;

        $dispatch['thumb'] = '';
        $dispatch['tel'] = '95533';
        $dispatch['status_name'] = '测试状态：'.rand(0,100);


        return $dispatch;
    }

}