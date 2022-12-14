<?php

namespace app\frontend\modules\dispatch\controllers;

use app\common\components\ApiController;
use app\common\exceptions\AppException;
use app\common\models\Order;
use app\common\models\order\Express;
use Illuminate\Support\Facades\Redis;
use Yunshop\JdSupply\services\JdOrderService;

/**
 * Created by PhpStorm.
 * Author: 芸众商城 www.yunzshop.com
 * Date: 2017/4/6
 * Time: 下午4:03
 */
class ExpressController extends ApiController
{
    protected $order;


    /**
     * @return \Illuminate\Http\JsonResponse
     * @throws AppException
     */
    public function index()
    {
        $order_id = request('order_id');
//        $order_id = 516;
        $order_express_id = request('order_express_id');
//        $order_express_id = 127;
        if(empty($order_express_id)){
            $order_express_id = 0;
        }

        $cacheKey = 'orderExpressId_'.$order_express_id.'_' . $order_id;

        $result = Redis::get($cacheKey);

        if (!$result) {
            // 过期或未命中
            $result = $this->__index();
            Redis::setex($cacheKey, 120, json_encode($result));
        } else {
            $result = json_decode($result, true);
            \Log::info('---发货2express---', $result);
        }

        return $this->successJson('成功', $result);
    }

    /**
     * 获取订单包裹（多包裹发货）
     * order_id
     *
     */
    public function getOrderMultiplePackages(){
        $order_id = request('order_id');
//        $order_id = 516;
        $order = $this->getOrder();
        if (!isset($order)) {
            throw new AppException('未找到订单');
        }
        if (!isset($order->express)) {
            throw new AppException('未找到配送信息');
        }

        if(empty($order_id)){
            throw new AppException('缺少订单id');
        }
        $express = new Express();
        $express_data = $express->where('order_id',$order_id)->with(['ordergoods'=>function($query){
            $query->select('order_express_id','title','thumb','goods_id');
        }])->get();


        $data = [
            'logistics_api' => 'dispatch.express',
            'count' => count($express_data),
        ];

        foreach ($express_data as $k=>$v){
            $express = $v->getExpress($v->express_code, $v->express_sn);

            if (json_decode($express)->result == 'error') {
                throw new AppException(json_decode($express)->resp);
            }

            $logistics['order_express_id'] = $v['id']; //包裹id
            $logistics['express_sn'] = $v->express_sn; //
            $logistics['company_name'] = $v->express_company_name;
            if(!empty($express['data'])){
                $logistics['last_express_context'] = $express['data'][count($express['data'])-1]['context'];
            }else{
                $logistics['last_express_context'] = '';
            }

            // 不清楚为什么表没关联到yz_order_package 在 yz_order_package表里有数据 先做兼容.
            if ($v->ordergoods->isEmpty()) {
                $logistics['thumb'] = $v->hasManyOrderPackage[0]? $v->hasManyOrderPackage[0]->orderGoods->thumb: '';//封面图
                $logistics['goods'] = $v->hasManyOrderPackage->map(function ($orderPackage) {
                    return $orderPackage->orderGoods;
                });//封面图
                $logistics['count'] = $v->hasManyOrderPackage->sum('total');
                $logistics['tel'] = $express['tel'];
                $logistics['status_name'] = $express['status_name'];

            } else {
                $logistics['thumb'] = $v->ordergoods[0]->thumb;//封面图
                $logistics['goods'] = $v->ordergoods;//封面图
                $logistics['count'] = count($v->ordergoods);
                $logistics['tel'] = $express['tel'];
                $logistics['status_name'] = $express['status_name'];
            }

            $data['data'][] = $logistics;

        }
        return $this->successJson('成功', $data);
    }

    public function __index()
    {
        $order = $this->getOrder();
        if (!isset($order)) {
            throw new AppException('未找到订单');
        }
        if (!isset($order->express)) {
            throw new AppException('未找到配送信息');
        }
        $order_express_id = request('order_express_id');
//        $order_express_id = 127;

        if(empty($order_express_id)){
            $express_code  = $order->express->express_code;
            $express_sn  = $order->express->express_sn;
            $express_company_name =  $order->express->express_company_name;
            $thumb = $order->hasManyOrderGoods[0]->thumb;
        }else{
            $express_data = Express::where('id',$order_express_id)->where('order_id',$order->id)->with('ordergoods')->first();
            $express_code  = $express_data->express_code;
            $express_sn  = $express_data->express_sn;
            $express_company_name = $express_data->express_company_name;
            $thumb = $express_data->hasOneOrderPackage->orderGoods->thumb?:'';
        }
        //$data
        $express = $order->express->getExpress($express_code, $express_sn);
        \Log::info('---发货1express---', ['express' => $express, 'express_code' => $express_code, 'express_sn' =>$express_sn]);
        $data['express_sn'] =$express_sn;
        $data['company_name'] = $express_company_name;
        $data['data'] = array_reverse($express['data']);//$express['data'];
//        $data['goods'] = $goods;
        $data['thumb'] = $thumb;
        $data['tel'] = $express['tel'];
        $data['status_name'] = $express['status_name'];
        \Log::info('---发货2express---', $data);

        return $data;
    }

    /**
     * @return \Illuminate\Http\JsonResponse
     * @throws AppException
     */
//    public function index()
//    {
//
//        $order = $this->getOrder();
//        if (!isset($order)) {
//            throw new AppException('未找到订单');
//        }
//        if (!isset($order->express)) {
//            throw new AppException('未找到配送信息');
//        }
//        //$data
//        $express = $order->express->getExpress($order->express->express_code, $order->express->express_sn);
//        \Log::info('---发货1express---', ['express' => $express, 'express_code' => $order->express->express_code, 'express_sn' => $order->express->express_sn]);
//        $data['express_sn'] = $order->express->express_sn;
//        $data['company_name'] = $order->express->express_company_name;
//        $data['data'] = $express['data'];
//        $data['thumb'] = $order->hasManyOrderGoods[0]->thumb;
//        $data['tel'] = $express['tel'];
//        $data['status_name'] = $express['status_name'];
//        \Log::info('---发货2express---', $data);
//
//        return $this->successJson('成功', $data);
//    }

    protected function _getOrder($order_id){
        return Order::find($order_id);

    }
    private function getOrder()
    {
        if (!isset($this->order)) {
            $order_id = request('order_id');
//            $order_id = 516;
            $this->order = $this->_getOrder($order_id);

        }
        return $this->order;
    }

}