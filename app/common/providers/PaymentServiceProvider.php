<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/8/26
 * Time: 16:20
 */

namespace app\common\providers;



use app\common\payment\PaymentConfig;
use app\common\payment\PaymentDirector;
use Illuminate\Support\ServiceProvider;

class PaymentServiceProvider extends ServiceProvider
{

	protected $defer = true;

	public function register()
	{
		$this->app->bind('Payment',PaymentDirector::class);
		$paymentMethod = PaymentConfig::get();
		$this->app->tag($paymentMethod,'paymentMethod');
	}

	public function provides()
	{
		return ['Payment'];
	}

}