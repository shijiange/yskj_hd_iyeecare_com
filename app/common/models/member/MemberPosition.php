<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/5/19
 * Time: 下午1:48
 */

namespace app\common\models\member;


use app\common\models\BaseModel;

class MemberPosition extends BaseModel
{
    public $table = 'yz_member_position';

    public $guarded = [''];

    /*
     * 获取地址数据表全部数据
     *
     * @return array */
    public static function getMemberLocation($member_id)
    {
        $model = static::where('member_id', $member_id)->first();

        return $model;
    }
}