<?php
/**
 * Created by PhpStorm.
 * Author: 芸众商城 www.yunzshop.com
 * Date: 2017/3/2
 * Time: 下午8:40
 */

namespace app\frontend\modules\member\controllers;

use app\common\components\ApiController;
use app\common\models\member\Address;
use app\common\models\Street;
use app\frontend\repositories\MemberAddressRepository;

class MemberAddressController extends ApiController
{
    protected $publicAction = ['address', 'street'];
    private $memberAddressRepository;

    public function preAction()
    {
        parent::preAction();
        $this->memberAddressRepository = app(MemberAddressRepository::class);
    }

    /*
     * 会员收货地址列表
     *
     * */

    public function index()
    {


        $memberId = \YunShop::app()->getMemberId();
//        dd(get_class($this->memberAddressRepository->makeModel()));
//        exit;
        $addressList = $this->memberAddressRepository->getAddressList($memberId);
//        dd($addressList);
        //获取省市ID
        if ($addressList) {
            app('db')->cacheSelect = true;
            $address = Address::getAllAddress();
            app('db')->cacheSelect = false;
            $addressList = $this->addressServiceForIndex($addressList, $address);
        }
        $msg = "获取列表成功";
        return $this->successJson($msg, $addressList);
    }

    //获取下单页要编辑的地址信息 &route=member.member-address.get-one-address
    public function getOneAddress()
    {
        $id = \YunShop::request()->address_id;

        if (empty($id)) {
            return $this->errorJson('参数为空');
        }

        $address = $this->memberAddressRepository->getAddressById($id);

        if (empty($address)) {
            return $this->errorJson('地址不存在');
        }

        $address = $this->getAddressId($address);


        return $this->successJson('信息', $address);

    }

    //通过地址名换取id
    protected function getAddressId($member_address)
    {
        if (\Setting::get('shop.trade.is_street')) {
            $member_address->province_id = Address::where('areaname', $member_address->province)->value('id');
            $member_address->city_id = Address::where('areaname', $member_address->city)->where('parentid', $member_address->province_id)->value('id');
            $member_address->district_id = Address::where('areaname', $member_address->district)->where('parentid', $member_address->city_id)->value('id');
            $member_address->street_id = Street::where('areaname', $member_address->street)->where('parentid', $member_address->district_id)->value('id');

        } else {
            $member_address->province_id = Address::where('areaname', $member_address->province)->value('id');
            $member_address->city_id = Address::where('areaname', $member_address->city)->where('parentid', $member_address->province_id)->value('id');
            $member_address->district_id = Address::where('areaname', $member_address->district)->where('parentid', $member_address->city_id)->value('id');
        }

        return $member_address;
    }


    public function street(){
        app('db')->cacheSelect = true;

        $districtId = \YunShop::request()->get('district_id');

        $default_street[] = [
            'id'       => 0,
            'areaname' => "其他",
            'parentid' => -1,
            'level'    => 4
        ];
        if (\Setting::get('shop.trade.is_street')) {
            // 开启街道设置
            $street = Street::getStreetByParentId($districtId);

            $street = !empty($street->toArray()) ? $street : $default_street;
        } else {
            $street = [];
        }
        if ($street) {
            return $this->successJson('获取街道数据成功!', $street);
        }
        return $this->successJson('获取数据失败!', $street);

    }

    /*
     * 地址JSON数据接口
     *
     * */
    public function address()
    {
        app('db')->cacheSelect = true;
        $address = Address::getAllAddress();
        if (!$address) {
            return $this->errorJson('数据获取失败，请联系管理员！');
        }
        $msg = '数据获取成功';
        return $this->successJson($msg, $this->addressService($address));
    }

    /*
     * 修改默认收货地址
     *
     * */
    public function setDefault()
    {
        $memberId = \YunShop::app()->getMemberId();
        $addressModel = $this->memberAddressRepository->getAddressById(\YunShop::request()->address_id);

        if ($addressModel) {
            if ($addressModel->isdefault) {
                return $this->errorJson('默认地址不支持取消，请编辑或修改其他默认地址');
            }
            $addressModel->isdefault = 1;
            $this->memberAddressRepository->cancelDefaultAddress($memberId);
            if ($addressModel->save()) {
                return $this->successJson('修改默认地址成功');
            } else {
                return $this->errorJson('修改失败，请刷新重试！');
            }
        }
        return $this->errorJson('未找到数据或已删除，请重试！');
    }

    public function isRegion()
    {
        $is_region = \Setting::get('shop.trade.is_region');

        $is_region = $is_region?0:1;

        return $this->successJson('是否不填写区域', ['is_region' => $is_region]);
    }

    protected function needRegion()
    {
        $is_region = \Setting::get('shop.trade.is_region');

        return !$is_region;
    }

    /*
     * 添加会员收获地址
     *
     * */
    public function store()
    {
        $requestAddress = \YunShop::request();
        if (!\YunShop::request()->username) {
            return $this->errorJson('收件人不能为空');
        }

        $mobile = \YunShop::request()->mobile;
        if (!$mobile) {
            return $this->errorJson('手机号不能为空');
        }
        //if (!preg_match("/^1\d{10}$/",$mobile)) {
        // return $this->errorJson('手机号格式不正确');
        //}
        if (!preg_match("/^[0-9]*$/", $mobile)) {

            return $this->errorJson('请输入数字');
        }

        if ($this->needRegion()) {

            if (!\YunShop::request()->province) {
                return $this->errorJson('请选择省份');
            }

            if (!\YunShop::request()->city) {
                return $this->errorJson('请选择城市');
            }

            if (!\YunShop::request()->district) {
                return $this->errorJson('请选择区域');
            }
        }


        if (!\YunShop::request()->address) {
            return $this->errorJson('请输入详细地址');
        }

        // if (!\YunShop::request()->zipcode) {
        // return $this->errorJson('请输入地址邮编');
        // }

        if ($requestAddress) {
            $data = array(
                'username'  => \YunShop::request()->username,
                'mobile'    => \YunShop::request()->mobile,
                'zipcode'   => '',
                'isdefault' => \YunShop::request()->isdefault ?: 0,
                'province'  => \YunShop::request()->province,
                'city'      => \YunShop::request()->city,
                'district'  => \YunShop::request()->district,
                'address'   => \YunShop::request()->address,
                'latitude'  => \YunShop::request()->latitude ?: '',
                'longitude' => \YunShop::request()->longitude ?: ''
            );
            if (\Setting::get('shop.trade.is_street')) {
                $data['street'] = \YunShop::request()->street;
            }
            $addressModel = $this->memberAddressRepository->fill($data);


            $memberId = \YunShop::app()->getMemberId();

            if ($addressModel->isdefault) {
                //修改默认收货地址
                $this->memberAddressRepository->cancelDefaultAddress($memberId);
            }

            $addressModel->uid = $memberId;
            $addressModel->uniacid = \YunShop::app()->uniacid;
            $validator = $addressModel->validator($addressModel->getAttributes());
            if ($validator->fails()) {
                return $this->errorJson($this->returnMsg($validator->messages()->toArray()));
            }
            if ($addressModel->save()) {
                return $this->successJson('新增地址成功', $addressModel->toArray());
            } else {
                return $this->errorJson("数据写入出错，请重试！");
            }
        }
        return $this->errorJson("未获取到数据，请重试！");
    }

    //处理返回表单验证信息
    public function returnMsg($msgArr)
    {
        foreach ($msgArr as $item){
            foreach($item as $em){
                if($em){
                    return $em;
                }
            }
        }
    }

    /*
     * 修改会员收获地址
     *
     * */
    public function update()
    {
        $addressModel = $this->memberAddressRepository->getAddressAndUserById(\YunShop::request()->address_id, \YunShop::app()->getMemberId());
        if (!$addressModel) {
            return $this->errorJson("未找到数据或已删除");
        }
        if (!\YunShop::request()->username) {
            return $this->errorJson('收件人不能为空');
        }
        $mobile = \YunShop::request()->mobile;
        if (!$mobile) {
            return $this->errorJson('手机号不能为空');
        }
        if (!preg_match("/^[0-9]*$/", $mobile)) {

            return $this->errorJson('请输入数字');
        }

        if (!\YunShop::request()->province) {
            return $this->errorJson('请选择省份');
        }

        if ($this->needRegion()) {

            if (!\YunShop::request()->province) {
                return $this->errorJson('请选择省份');
            }

            if (!\YunShop::request()->city) {
                return $this->errorJson('请选择城市');
            }

            if (!\YunShop::request()->district) {
                return $this->errorJson('请选择区域');
            }
        }

        if (!\YunShop::request()->address) {
            return $this->errorJson('请输入详细地址');
        }


        $requestAddress = array(
            'username'  => \YunShop::request()->username,
            'mobile'    => \YunShop::request()->mobile,
            'zipcode'   => '',
            'province'  => \YunShop::request()->province,
            'city'      => \YunShop::request()->city,
            'district'  => \YunShop::request()->district,
            'address'   => \YunShop::request()->address,
            'latitude'  => \YunShop::request()->latitude ?: '',
            'longitude' => \YunShop::request()->longitude ?: ''
        );
        if (\Setting::get('shop.trade.is_street')) {
            $requestAddress['street'] = \YunShop::request()->street;

        }
        $addressModel->fill($requestAddress);

        $validator = $addressModel->validator($addressModel->getAttributes());
        if ($validator->fails()) {
            return $this->errorJson($this->returnMsg($validator->messages()->toArray()));
//            return $this->errorJson($validator->messages());
        }
        if (empty($addressModel->isdefault) && \YunShop::request()->isdefault) {
            $addressModel->isdefault = 1;
            //todo member_id 未附值
            $this->memberAddressRepository->cancelDefaultAddress(\YunShop::app()->getMemberId());
        }
        if ($addressModel->save()) {
            return $this->successJson('修改收货地址成功', $addressModel->toArray());
        } else {
            return $this->errorJson("写入数据出错，请重试！");
        }


    }

    /*
     * 移除会员收货地址
     *
     * */
    public function destroy()
    {
        $addressId = \YunShop::request()->address_id;
        $addressModel = $this->memberAddressRepository->getAddressById($addressId);
        if (!$addressModel || $addressModel->uid != \YunShop::app()->getMemberId()) {
            return $this->errorJson("未找到数据或已删除");
        }
        //todo 需要考虑删除默认地址选择其他地址改为默认
        $result = $this->memberAddressRepository->destroyAddress($addressId);
        if ($result) {
            return $this->successJson();
        } else {
            return $this->errorJson("数据写入出错，删除失败！");
        }
    }

    /*
     * 服务列表数据 index() 增加省市区ID值
     * */
    private function addressServiceForIndex($addressList = [], $address)
    {
        $i = 0;
        foreach ($addressList as $list) {
            foreach ($address as $key) {
                if ($list['province'] == $key['areaname'] && $key['level'] == 1) {
                    $addressList[$i]['province_id'] = $key['id'];
                }
                if ($list['city'] == $key['areaname'] && $addressList[$i]['province_id'] == $key['parentid']) {
                    $addressList[$i]['city_id'] = $key['id'];
                }
                if ($list['district'] == $key['areaname'] && $addressList[$i]['city_id'] == $key['parentid']) {
                    $addressList[$i]['district_id'] = $key['id'];
                }
            }
            $i++;
        }
        return $addressList;
    }

    /*
     * 服务地址接口数据重构
     * */
    private function addressService($address)
    {
        $province = [];
        $city = [];
        $district = [];
        foreach ($address as $key) {
            if ($key['parentid'] == 0 && $key['level'] == 1) {
                $province[] = $key;
            } elseif ($key['parentid'] != 0 && $key['level'] == 2) {
                $city[] = $key;
            } else {
                $district[] = $key;
            }
        }
        return array(
            'province' => $province,
            'city'     => $city,
            'district' => $district,
        );
    }

    public function getStreet()
    {
        //member.member-address.get-street
        $districtId = \YunShop::request()->get('district_id');
        if (\Setting::get('shop.trade.is_street')) {
            // 开启街道设置
            $street = Street::getStreetByParentId($districtId);
        } else {
            $street = [];
        }

        if ($street) {
            return $this->successJson('获取街道数据成功!', $street);
        }
        return $this->successJson('获取数据失败!', $street);

    }

    /**
     * 智能解析收件人信息
     */
    public function parseAddress(){
//        $string = '深圳市龙华区龙华街道1980科技文化产业园3栋317    张三    13800138000 518000 120113196808214821';
//        $string = '李连加，广东深圳市南山区南山大道1088号南园枫叶大厦，15888881999';
        $add_info = request('address_info');
        $r = \app\frontend\modules\member\services\address\Address::smart($add_info);
        if ($r['province']) {
            $province = Address::where('areaname', $r['province'])->where('level',1)->first();
            if ($province) {
                $r['province_id'] = $province->id;
            }else{
                $r['province'] = '';
                $r['province_id'] = 0;
            }
        }
        if ($r['city'] && $r['province_id']) {
            $city = Address::where('areaname', $r['city'])->where('parentid', $r['province_id'])->where('level',2)->first();
            if ($city) {
                $r['city_id'] = $city->id;
            }else{
                $r['city'] = '';
                $r['city_id'] = 0;
            }
        }
        if ($r['region'] && $r['city_id']) {
            $region = Address::where('areaname', $r['region'])->where('parentid', $r['city_id'])->where('level',3)->first();
            if ($region) {
                $r['region_id'] = $region->id;
            }else{
                $r['region'] = '';
                $r['region_id'] = 0;
            }
        }
        return $this->successJson('', $r);
    }

}
