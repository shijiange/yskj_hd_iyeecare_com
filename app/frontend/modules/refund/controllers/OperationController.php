<?php
/**
 * Created by PhpStorm.
 * Author: 芸众商城 www.yunzshop.com
 * Date: 2017/4/13
 * Time: 下午2:17
 */

namespace app\frontend\modules\refund\controllers;


use app\common\components\ApiController;
use app\common\exceptions\AdminException;
use app\common\exceptions\AppException;
use app\common\modules\refund\services\RefundService;
use app\frontend\modules\refund\models\RefundApply;
use app\frontend\modules\refund\services\RefundMessageService;
use app\frontend\modules\refund\services\RefundOperationService;

/**
 * 统一售后操作接口
 * Class OperationController
 * @package app\frontend\modules\refund\controllers
 */
class OperationController extends ApiController
{
    public $transactionActions = ['*'];


    public function preAction()
    {
        parent::preAction(); // TODO: Change the autogenerated stub

        $this->validate([
            'refund_id' => 'required|filled|integer',
        ]);
        $this->refundApply = RefundApply::find(request()->input('refund_id'));
        if (!isset($this->refundApply)) {
            throw new AppException('售后申请记录不存在');
        }

        if ($this->refundApply->uid != \YunShop::app()->getMemberId()) {
            throw new AppException('无效申请,该订单属于其他用户');
        }
    }

    /**
     * @return \Illuminate\Http\JsonResponse
     * @throws \app\common\exceptions\AppException
     * @throws \app\common\exceptions\ShopException
     */
    public function send()
    {
        $this->validate([
            'express_company_code' => 'required|string',
            'express_company_name' => 'required|string',
            'express_sn' => 'required|filled|string',
        ]);
        RefundOperationService::refundSendBack(['refund_id'=> request()->input('refund_id')]);
        return $this->successJson('操作成功');
    }

    /**
     * @return \Illuminate\Http\JsonResponse
     * @throws \app\common\exceptions\AppException
     * @throws \app\common\exceptions\ShopException
     */
    public function complete()
    {
        RefundOperationService::refundExchangeComplete(['refund_id'=> request()->input('refund_id')]);

        return $this->successJson('操作成功');

    }

    /**
     * @return \Illuminate\Http\JsonResponse
     * @throws \app\common\exceptions\AppException
     * @throws \app\common\exceptions\ShopException
     */
    public function cancel()
    {

        RefundOperationService::refundCancel(['refund_id'=> request()->input('refund_id')]);
        return $this->successJson('操作成功');

    }

}