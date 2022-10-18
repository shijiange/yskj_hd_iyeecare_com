<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/4/27
 * Time: 14:09
 */

namespace app\common\events\member;


use app\common\events\Event;

class MemberBalanceChangeEvent extends Event
{
    protected $member;
    protected $new_value;
    protected $change_value;
    protected $source;

    protected $recordData;

    public function __construct($member,$new_value,$change_value,$source, $recordData)
    {
        $this->member = $member;
        $this->new_value = $new_value;
        $this->change_value = $change_value;
        $this->source = $source;

        $this->recordData = $recordData;
    }

    public function getRecordData()
    {
        return $this->recordData;
    }

    public function getMember()
    {
        return $this->member;
    }

    public function getNewValue()
    {
        return $this->new_value;
    }

    public function getChangeValue()
    {
        return $this->change_value;
    }

    public function getSource()
    {
        return $this->source;
    }
}