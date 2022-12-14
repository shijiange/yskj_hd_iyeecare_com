<?php

namespace app\common\providers;



use app\backend\modules\charts\listeners\OrderStatistics;
use app\backend\modules\charts\modules\member\listeners\MemberLowerListener;
use app\backend\modules\charts\modules\phone\listeners\PhoneAttribution;
use app\backend\modules\goods\listeners\LimitBuy;
use app\common\events\member\MemberChangeRelationEvent;
use app\common\events\member\MemberCreateRelationEvent;
use app\common\events\order\AfterOrderCreatedEvent;
use app\common\events\order\AfterOrderCreatedImmediatelyEvent;
use app\common\events\PayLog;
use app\common\events\UserActionEvent;
use app\common\events\WechatProcessor;
use app\common\listeners\charts\OrderBonusListeners;
use app\common\listeners\CollectHostListener;
use app\common\listeners\income\WithdrawPayedListener;
use app\common\listeners\member\MemberChangeRelationEventListener;
use app\common\listeners\member\MemberCreateRelationEventListener;
use app\common\listeners\MemberCartListener;
use app\common\listeners\order\LocationListener;
use app\common\listeners\PayLogListener;
use app\common\listeners\PluginCollectListener;
use app\common\listeners\point\PointListener;
use app\common\listeners\UpdateCache;
use app\common\listeners\UserActionListener;
use app\common\listeners\WechatProcessorListener;
use app\common\listeners\withdraw\WithdrawAuditListener;
use app\common\listeners\withdraw\WithdrawPayListener;
use app\common\listeners\withdraw\WithdrawSuccessListener;
use app\common\modules\coupon\events\AfterMemberReceivedCoupon;
use app\common\modules\coupon\listeners\AfterMemberReceivedCouponListener;
use app\common\modules\payType\events\AfterOrderPayTypeChangedEvent;
use app\common\modules\payType\remittance\listeners\AfterOrderPayTypeChangedListener;
use app\common\modules\process\events\AfterProcessStateChangedEvent;
use app\common\modules\process\events\AfterProcessStatusChangedEvent;
use app\common\modules\process\StateContainer;
use app\common\modules\status\StatusContainer;
use app\frontend\modules\coupon\listeners\CouponExpired;
use app\frontend\modules\coupon\listeners\CouponExpireNotice;
use app\frontend\modules\coupon\listeners\CouponSend;
use app\frontend\modules\coupon\listeners\MonthCouponSend;
use app\frontend\modules\coupon\listeners\OrderCouponSend;
use app\frontend\modules\coupon\listeners\ShoppingShareCouponListener;
use app\frontend\modules\finance\listeners\BalanceRechargeCompletedListener;
use app\frontend\modules\finance\listeners\IncomeWithdraw;
use app\frontend\modules\goods\listeners\GoodsStock;
use app\frontend\modules\member\listeners\MemberLevelValidity;
use app\frontend\modules\order\listeners\orderListener;
use app\frontend\modules\withdraw\listeners\WithdrawApplyListener;
use app\frontend\modules\withdraw\listeners\WithdrawBalanceApplyListener;
use app\platform\modules\user\listeners\DisableUserAccount;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use app\common\events\WechatMessage;
use app\common\listeners\WechatMessageListener;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        \app\common\events\dispatch\OrderDispatchWasCalculated::class => [
            //??????????????????
            \app\frontend\modules\dispatch\listeners\prices\UnifyOrderDispatchPrice::class, //????????????
            \app\frontend\modules\dispatch\listeners\prices\TemplateOrderDispatchPrice::class, //????????????

        ],

        PayLog::class => [ //??????????????????
            PayLogListener::class //??????????????????
        ],
        \app\common\events\member\BecomeAgent::class => [ //??????????????????
            \app\common\listeners\member\BecomeAgentListener::class
        ],
        AfterOrderCreatedEvent::class => [ //?????????????????????????????????????????????
            \app\common\listeners\member\AfterOrderCreatedListener::class,
            \app\common\listeners\order\OrderCreateCertified::class, //???????????????????????????id
        ],

        AfterOrderCreatedImmediatelyEvent::class => [
            \app\frontend\modules\member\listeners\Order::class, //???????????????

        ],
        /*AfterOrderReceivedEvent::class => [ //????????????
            \app\common\listeners\member\AfterOrderReceivedListener::class
        ],*/
//        AfterOrderPaidEvent::class => [ //????????????
//            \app\common\listeners\member\AfterOrderPaidListener::class,
//        ],
        //????????????????????????????????????
        WechatProcessor::class => [
            WechatProcessorListener::class//???????????????
        ],

        WechatMessage::class => [
            WechatMessageListener::class//???????????????
        ],

        AfterProcessStatusChangedEvent::class => [
            StatusContainer::class,
        ],
        AfterProcessStateChangedEvent::class => [
            StateContainer::class,
        ],
        AfterOrderPayTypeChangedEvent::class=>[
            AfterOrderPayTypeChangedListener::class
        ],
        MemberCreateRelationEvent::class=>[
            MemberCreateRelationEventListener::class
        ],
        AfterMemberReceivedCoupon::class=>[
            AfterMemberReceivedCouponListener::class
        ],
        UserActionEvent::class => [
            UserActionListener::class,
        ],
        MemberChangeRelationEvent::class=>[
            MemberChangeRelationEventListener::class
        ],
        \app\common\events\ProfitEvent::class => [
            \app\common\listeners\ProfitEventListener::class
        ],

    ];
    /**
     * ??????????????????
     * @var array
     */
    protected $subscribe = [

        BalanceRechargeCompletedListener::class,
        /**
         * ????????????????????????
         */
        WithdrawApplyListener::class,
        WithdrawAuditListener::class,
        WithdrawPayListener::class,
        WithdrawSuccessListener::class,
        /**
         * ?????????????????????????????????
         */
        WithdrawPayedListener::class,

        /**
         * ????????????????????????
         */
        WithdrawBalanceApplyListener::class,

        \app\common\listeners\MessageListener::class,
        MemberCartListener::class,
        //??????????????????
        \app\common\listeners\member\level\LevelListener::class,
        \app\common\listeners\balance\BalanceListener::class,

        //?????????????????????????????????????????????
        ShoppingShareCouponListener::class,

        //???????????????????????????
        \app\frontend\modules\coupon\listeners\CouponDiscount::class,


        //??????????????????
        PointListener::class,
        \app\frontend\modules\finance\listeners\OrderDeductionRollback::class,
        \app\common\listeners\point\PointChangeCreatingListener::class, // ??????????????????????????????????????????

        //??????????????????
        GoodsStock::class,
		

        orderListener::class,
        IncomeWithdraw::class,
        CouponExpireNotice::class,
        CouponSend::class,
        CouponExpired::class,
        MemberLevelValidity::class,
        LimitBuy::class,
        OrderStatistics::class,
        PhoneAttribution::class,
        UpdateCache::class, //???????????????????????????
        OrderBonusListeners::class,
        MemberLowerListener::class,
        DisableUserAccount::class,
//        PluginCollectListener::class,
        CollectHostListener::class,
        MonthCouponSend::class,//?????????????????????????????????
        OrderCouponSend::class,//???????????????????????????????????????
        //?????????????????????
        \app\backend\modules\goods\listeners\GoodsServiceListener::class,

        //?????????????????????????????????
        \app\backend\modules\survey\listeners\HeartbeatStatusLogListener::class,


        //??????????????????????????????
        \app\common\listeners\SmsBalanceListener::class,

        // ??????????????????????????????
        \app\backend\modules\coupon\listeners\OrderClosedListener::class,

        //?????????????????????????????????????????????
        \app\common\listeners\goods\GoodsChangeListener::class,

        //????????????????????????
        \app\common\listeners\balance\PointsRewardListener::class,

        //??????????????????
        \app\backend\modules\goods\listeners\CommentServiceListener::class,
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        if (strpos(request()->path(), 'install')) {
            return;
        }

        parent::boot();

        //
    }
}
