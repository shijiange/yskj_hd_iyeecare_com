<?php
/**
 * Created by PhpStorm.
 * User: yunzhong
 * Date: 2018/10/4
 * Time: 11:07
 */

namespace app\backend\modules\charts\modules\order\controllers;


use app\backend\modules\charts\controllers\ChartsController;
use app\backend\modules\charts\models\OrderIncomeCount;
use app\common\helpers\PaginationHelper;
use app\backend\modules\charts\models\Order;
use app\common\services\ExportService;

class OrderDividendController extends ChartsController
{
    const PAGE_SIZE = 10;

    /**
     * @return string
     * @throws \Throwable
     */
    public function index()
    {
        $pageSize = 20;
        $search = \YunShop::request()->get('search');
        $list = OrderIncomeCount::uniacid()->search($search)->orderBy('id','desc')->paginate($pageSize);
        $pager = PaginationHelper::show($list->total(), $list->currentPage(), $list->perPage());

        if ($search['statistics']) {
            $total = OrderIncomeCount::uniacid()->search($search)
                ->selectRaw('sum(price) as price, sum(cost_price) as cost_price')
                ->selectRaw('sum(commission) as commission, sum(dispatch_price) as dispatch_price')
                ->selectRaw('sum(team_dividend) as team_dividend, sum(area_dividend) as area_dividend')
                ->selectRaw('sum(micro_shop) as micro_shop, sum(merchant) as merchant')
                ->selectRaw('sum(merchant_center) as merchant_center, sum(love) as love')
                ->selectRaw('sum(point) as point')->first()->toArray();
            $total['count'] = $list->total();
        }

        if(!$search['time']){
            $search['time']['start'] = date("Y-m-d H:i:s",time());
            $search['time']['end'] = date("Y-m-d H:i:s",time());
        }
        return view('charts.order.order_dividend', [
            'list' => $list,
            'pager' => $pager,
            'search' => $search,
            'total' => $total,
        ])->render();
    }

    public function export()
    {

        $search = \YunShop::request()->get('search');
        $list = OrderIncomeCount::uniacid()->search($search)->orderBy('id','desc');

        $file_name = date('YmdHis', time()).'??????????????????';
        $export_data[0] = ['??????', '?????????', '????????????', '?????????', '?????????' , '??????', '????????????', '????????????', '????????????' , '???????????????', '????????????', '????????????', '???????????????' , '??????????????????', '????????????', '???????????????', '????????????', '??????'];
        //--------------------------------
        $export_page = request()->export_page ? request()->export_page : 1;
        $export_model = new ExportService($list, $export_page);
        foreach ($export_model->builder_model->toArray() as $key => $item) {
            if ($item['plugin_id'] == 32) {
                $merchant = '??????:'.$item['shop_name'];
            } elseif ($item->plugin_id == 31) {
                $merchant = '?????????:'.$item['shop_name'];
            } elseif ($item->plugin_id == 1) {
                $merchant = '?????????:'.$item['shop_name'];
            } else {
                $merchant = $item['shop_name'];
            }

            if($item['status'] == '3') {
                $status = '?????????';
            } elseif ( $item['status'] == -1) {
                $status = '?????????';
            } elseif ( $item['status'] == -2) {
                $status = '?????????';
            } else {
                $status = '?????????';
            }
            $export_data[$key + 1] = [
                $item['created_at'],
                $item['order_sn'],
                $item['address'],
                $item['buy_name'],
                $item['parent_name'],
                $merchant,
                $item['price'],
                sprintf("%.2f",$item['cost_price'] + $item['dispatch_price'] ),
                $item['commission']  ?: '0.00',
                $item['team_dividend']  ?: '0.00',
                $item['area_dividend']  ?: '0.00',
                $item['micro_shop']  ?: '0.00',
                $item['merchant']  ?: '0.00',
                $item['merchant_center']  ?: '0.00',
                $item['point']  ?: '0.00',
                $item['love']  ?: '0.00',
                sprintf("%.2f",$item['price'] - ($item['cost_price'] + $item['dispatch_price'] + $item['commission'] + $item['team_dividend'] + $item['area_dividend'] + $item['micro_shop'] + $item['merchant'] + $item['merchant_center'])),
                $status
            ];
        }
        $export_model->export($file_name, $export_data, \Request::query('route'));
        //--------------------------------

//        foreach ($list->get() as $key => $item) {
//            if ($item->plugin_id == 32) {
//                $merchant = '??????:'.$item->shop_name;
//            } elseif ($item->plugin_id == 31) {
//                $merchant = '?????????:'.$item->shop_name;
//            } elseif ($item->plugin_id == 1) {
//                $merchant = '?????????:'.$item->shop_name;
//            } else {
//                $merchant = $item->shop_name;
//            }
//
//            if($item->status == '3') {
//                $status = '?????????';
//            } elseif ( $item->status == -1) {
//                $status = '?????????';
//            } elseif ( $item->status == -2) {
//                $status = '?????????';
//            } else {
//                $status = '?????????';
//            }
//
//            $export_data[$key + 1] = [
//                $item->created_at->toDateTimeString(),
//                $item->order_sn,
//                $item->address,
//                $item->buy_name,
//                $item->parent_name,
//                $merchant,
//                $item->price,
//                sprintf("%.2f",$item->cost_price + $item->dispatch_price ),
//                $item->commission  ?: '0.00',
//                $item->team_dividend  ?: '0.00',
//                $item->area_dividend  ?: '0.00',
//                $item->micro_shop  ?: '0.00',
//                $item->merchant  ?: '0.00',
//                $item->merchant_center  ?: '0.00',
//                $item->point  ?: '0.00',
//                $item->love  ?: '0.00',
//                sprintf("%.2f",$item->price - ($item->cost_price + $item->dispatch_price + $item->commission + $item->team_dividend + $item->area_dividend + $item->micro_shop + $item->merchant + $item->merchant_center)),
//                $status
//            ];
//        }
//        \Excel::create($file_name, function ($excel) use ($export_data) {
//            // Set the title
//            $excel->setTitle('Office 2005 XLSX Document');
//
//            // Chain the setters
//            $excel->setCreator('????????????')
//                ->setLastModifiedBy("????????????")
//                ->setSubject("Office 2005 XLSX Test Document")
//                ->setDescription("Test document for Office 2005 XLSX, generated using PHP classes.")
//                ->setKeywords("office 2005 openxml php")
//                ->setCategory("report file");
//
//            $excel->sheet('info', function ($sheet) use ($export_data) {
//                $sheet->rows($export_data);
//            });
//        })->export('xls');
//
////        $export_model->export($file_name, $export_data, 'charts.order.order-dividend.count');
//        return true;
    }

}