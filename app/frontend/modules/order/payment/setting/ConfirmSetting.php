<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/8
 * Time: 10:15
 */

namespace app\frontend\modules\order\payment\setting;


class ConfirmSetting extends \app\common\payment\setting\other\ConfirmSetting
{
    public function canUse()
    {

        if ($this->paymentTypes->getOrderPay()) {

            return bccomp($this->paymentTypes->getOrderPay()->amount, 0,2) === 0;
        }

        return parent::canUse(); // TODO: Change the autogenerated stub
    }
}