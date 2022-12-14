<?php
/**
 * Created by PhpStorm.
 * User: Merlin
 * Date: 2021/1/26
 * Time: 11:07
 */

namespace app\common\facades;


use app\common\helpers\Url;
use app\common\models\AccountWechats;
use app\framework\EasyWechat\OfficialAccount\Material;
use app\framework\EasyWechat\Payment\Order;
use app\framework\EasyWechat\Work\Client;
use app\framework\EasyWechat\Work\ContactWayClient;
use EasyWeChat\MiniProgram\Application as MiniProgram;
use EasyWeChat\OfficialAccount\Application as OfficialAccount;
use EasyWeChat\OpenPlatform\Application as OpenPlatform;
use EasyWeChat\Payment\Application as Payment;
use EasyWeChat\Work\Application as Work;
use Illuminate\Support\Facades\Facade;

class EasyWeChat extends Facade
{
    /**
     * 默认为 Server.
     *
     * @return string
     */
    public static function getFacadeAccessor()
    {

        return new OfficialAccount();
    }

    /**
     * @return \EasyWeChat\OfficialAccount\Application
     */
    public static function officialAccount(array $config = [])
    {
        //独立版
        if (config('APP_Framework') == 'platform') {
            $default_config = [
                'app_id'  => \Setting::get('plugin.wechat')['app_id'],// AppID
                'secret'  => \Setting::get('plugin.wechat')['app_secret'],     // AppSecret
                'token'   => \Setting::get('plugin.wechat.token'),// Token
                'aes_key' => \Setting::get('plugin.wechat.aes_key'),// EncodingAESKey，安全模式与兼容模式下请一定要填写！！！
            ];
        }
        //微擎版
        else{
            $account = AccountWechats::getAccountByUniacid(\YunShop::app()->uniacid);
            $default_config = [
                'app_id'  => $account['key'],         // AppID
                'secret'  => $account['secret'],    // AppSecret
                'token'   => $account['token'],           // Token
                'aes_key' => $account['encodingaeskey'],  // EncodingAESKey，兼容与安全模式下请一定要填写！！！
            ];
        }
        $OfficialAccount = new OfficialAccount(array_merge($default_config,$config));
        $OfficialAccount->rebind('material',function ($app) {
            return new Material($app);
        });
        return $OfficialAccount;
    }

    /**
     * @return \EasyWeChat\Work\Application
     */
    public static function work(array $config = [])
    {
        $Work = new Work($config);
        $Work->rebind('external_contact',function ($app) {
            return new Client($app);
        });
        $Work->rebind('contact_way',function ($app) {
            return new ContactWayClient($app);
        });
        return $Work;
    }

    /**
     * @return \EasyWeChat\Payment\Application
     */
    public static function payment(array $config = [])
    {
        $pay = \Setting::get('shop.pay');
        $default_config = [
            'app_id'     => $pay['weixin_appid'],
            'mch_id'     => $pay['weixin_mchid'],
            'key'        => $pay['weixin_apisecret'],
            'cert_path'  => $pay['weixin_cert'],
            'key_path'   => $pay['weixin_key'],
            'notify_url' => Url::shopSchemeUrl('payment/wechat/notifyUrl.php'),
        ];
        $Payment = new Payment(array_merge($default_config,$config));
        $Payment->rebind('order',function ($app) {
            return new Order($app);
        });
        return $Payment;
    }

    /**
     * @return \EasyWeChat\MiniProgram\Application
     */
    public static function miniProgram(array $config = [])
    {
        return new MiniProgram($config);
    }

    /**
     * @return \EasyWeChat\OpenPlatform\Application
     */
    public static function openPlatform(array $config = [])
    {
        return new OpenPlatform($config);
    }
}