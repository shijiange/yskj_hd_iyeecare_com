<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/8/26
 * Time: 14:02
 */

namespace app\common\payment\setting\other;


use app\common\helpers\Client;
use app\common\payment\setting\BasePaymentSetting;

class JueQiSetting extends BasePaymentSetting
{
	public function canUse()
	{
		return request()->input('type') != 7
			&& app('plugins')->isEnabled('jueqi-pay')
			&& \Setting::get('plugin.jueqi_pay_set.switch') == 1
			&& Client::is_weixin() === true;
	}
}