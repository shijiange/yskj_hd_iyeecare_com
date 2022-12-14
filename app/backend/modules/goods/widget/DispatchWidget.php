<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/9
 * Time: 17:47
 */

namespace app\backend\modules\goods\widget;

use app\backend\modules\goods\models\GoodsDispatch;
use app\backend\modules\goods\models\Dispatch;

class DispatchWidget extends BaseGoodsWidget
{
    public $group = 'tool';

    public $widget_key = 'dispatch';

    public $code = 'dispatch';

    public function pluginFileName()
    {
        return 'goods';
    }

    public function getData()
    {

        if (!is_null($this->goods) && GoodsDispatch::getInfo($this->goods->id)) {
            $dispatch = GoodsDispatch::getInfo($this->goods->id);

        } else {
            $dispatch = new Goodsdispatch();
        }
        $dispatch_templates = Dispatch::select('id','dispatch_name')
            ->uniacid()
            ->where(['enabled' => 1 , 'plugin_id' => 0])
            ->where('is_plugin', 0)
            ->get()->toArray();

        // edit 2018-06-01 by Yy
        if ($dispatch->dispatch_id) {
            $verify_dispatch = Dispatch::select('id','dispatch_name','is_plugin')->find($dispatch->dispatch_id);
            if ($verify_dispatch->is_plugin == 1) {
                $dispatch_templates = [
                    $verify_dispatch
                ];
            }
        }

        $dispatch->dispatch_type_ids = explode(',',$dispatch->dispatch_type_ids);
        $dispatchTypesSetting = $dispatch->dispatchTypesSettingV2();

        if (is_null($this->goods)) {
            $bool = array_search('8', array_column($dispatchTypesSetting, 'id'));
            if ($bool !== false && !array_intersect($dispatch->dispatch_type_ids,[8])) {
                $dispatch->dispatch_type_ids = array_merge($dispatch->dispatch_type_ids,[8]);
            }
        }

        $data = [
            'dispatchTypesSetting' =>  $dispatch->dispatchTypesSettingV2(),
            'dispatch' => $dispatch,
            'dispatch_templates' => $dispatch_templates,

        ];
        return $data;
    }

    public function pagePath()
    {
        return  $this->getPath('resources/views/goods/assets/js/components/');
    }
}