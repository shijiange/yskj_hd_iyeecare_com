<?php
/**
 * Created by PhpStorm.
 * Author: 芸众商城 www.yunzshop.com
 * Date: 2017/5/2
 * Time: 上午11:51
 */

namespace app\backend\modules\goods\services;

use app\backend\modules\goods\models\GoodsParam;
use app\backend\modules\goods\models\Goods;
use app\backend\modules\goods\models\Brand;
use app\backend\modules\goods\models\GoodsSpec;
use app\backend\modules\goods\models\GoodsOption;
use app\backend\modules\goods\models\GoodsVideo;
use Setting;

class CreateGoodsService
{
    public $params;
    public $brands;
    public $request;
    public $error = null;
    public $catetory_menus;


    /**
     * @var \app\common\models\Goods
     */
    public $goods_model;
    public $type;

    public function __construct($request, $type = 0)
    {
        $this->type = $type;
        $this->request = $request;
    }

    public function create()
    {
        $goods_data = $this->request->goods;

        $this->goods_model = $this->getGoodsModel();

        if ($goods_data) {
            //正则匹配富文本更改图片标签
            if ($goods_data['content']) {
                $goods_data['content'] = changeUmImgPath($goods_data['content']);
            }

            // 正则匹配富文本更改视频标签样式
            //$goods_data['content'] = preg_replace(htmlspecialchars('/<p[^>]*/'), htmlspecialchars('<p style="display: inline-block;"'), $goods_data['content']);
            $goods_data['content'] = preg_replace('/class="[^=]*/', 'class="edui-upload-video" controls', htmlspecialchars_decode($goods_data['content']));

            preg_match('/<video[^>]*/',  $goods_data['content'], $matches);

//            $matches[0] .= ' x5-playsinline="true" webkit-playsinline="true" playsinline="true"';
//
//            $goods_data['content'] = preg_replace('/<video[^>]*/', $matches[0], $goods_data['content']);

            $video_matche= '<video x5-playsinline="true" webkit-playsinline="true" playsinline="true" ';

            $goods_data['content'] = str_replace('<video', $video_matche, $goods_data['content']);
            $goods_data['content'] = htmlspecialchars($goods_data['content']);

            if ($this->type == 1) {
                $goods_data['status'] = 0;
            }

//            //商品视频地址
//            $goods_data['goods_video'] = yz_tomedia($goods_data['goods_video']);

            if (isset($goods_data['thumb_url'])) {
                $goods_data['thumb_url'] = serialize($goods_data['thumb_url']);
            }

            if (!$goods_data['virtual_sales']) {
                $goods_data['virtual_sales'] = 0;
            }

            if (!empty($this->request->widgets['sale']['max_point_deduct'])
                && !empty($goods_data['price'])
                && $this->request->widgets['sale']['max_point_deduct'] > $goods_data['price']) {
                return ['status' => -1, 'msg' => '积分最大抵扣金额大于商品现价'];
            }
            if (!empty($this->request->widgets['sale']['min_point_deduct'])
                && !empty($goods_data['price'])
                && $this->request->widgets['sale']['min_point_deduct'] > $goods_data['price']) {
                return ['status' => -1, 'msg' => '积分最少抵扣金额大于商品现价'];
            }
            if(empty($goods_data['price'])){
                $goods_data['price'] = 0;
            }
            if(empty($goods_data['cost_price'])){
                $goods_data['cost_price'] = 0;
            }


            $goods_data['has_option'] = $this->request->widgets['option']['has_option'] ?: 0;

            $save_data = array_except($goods_data,['category','withhold_stock','video_image','goods_video','category_to_option']);

            $this->goods_model->fill($save_data);

            $this->goods_model->widgets = $this->request->widgets;

            $this->setAfterHandle();
            $this->goods_model->uniacid = \YunShop::app()->uniacid;
            $this->goods_model->weight = $this->goods_model->weight ? $this->goods_model->weight : 0;

            $validator = $this->goods_model->validator($this->goods_model->getAttributes());
            if ($validator->fails()) {
                return ['status' => -1, 'msg' => $validator->messages()];
            } else {
                if ($this->goods_model->save()) {
                    (new \app\common\services\operation\GoodsLog($this->goods_model, 'create'));
                    //商品视频保存
                    GoodsVideo::store($this->goods_model->id, array_only($goods_data,['video_image','goods_video']));
                    //商品分类保存
                    GoodsService::store($this->goods_model->id, $goods_data['category'], \Setting::get('shop.category')['cat_level'],$goods_data['category_to_option']);

                    //商品属性保存
                    GoodsParam::store($this->goods_model->id,$this->request->widgets['param']);

                    //规格项和规格组合保存
                    SpecOptionService::store($this->goods_model->id,$this->request->widgets['option'],\YunShop::app()->uniacid);

//                    GoodsSpec::saveSpec($this->request, $this->goods_model->id, \YunShop::app()->uniacid);
//                    GoodsOption::saveOption($this->request, $this->goods_model->id, GoodsSpec::$spec_items, \YunShop::app()->uniacid);

                    //商品保存之后
                    $this->afterSaving();

                    return ['status' => 1];
                } else {
                    return ['status' => -1,'msg'=> '保存失败'];
                }
            }
        }

        return ['status' => -1,'msg'=>'商品保存失败'];
    }

    public function oldcreate()
    {
        $goods_data = $this->request->goods;


        $this->params = new GoodsParam();
        $this->goods_model = $this->getGoodsModel();

        $this->brands = Brand::getBrands()->getQuery()->select(['id','name'])->get();

        if ($goods_data) {
            //正则匹配富文本更改图片标签
            if ($goods_data['content']) {
                $goods_data['content'] = changeUmImgPath($goods_data['content']);
            }

            // 正则匹配富文本更改视频标签样式
            //$goods_data['content'] = preg_replace(htmlspecialchars('/<p[^>]*/'), htmlspecialchars('<p style="display: inline-block;"'), $goods_data['content']);
            $goods_data['content'] = preg_replace('/class="[^=]*/', 'class="edui-upload-video" controls', htmlspecialchars_decode($goods_data['content']));

            preg_match('/<video[^>]*/',  $goods_data['content'], $matches);

//            $matches[0] .= ' x5-playsinline="true" webkit-playsinline="true" playsinline="true"';
//
//            $goods_data['content'] = preg_replace('/<video[^>]*/', $matches[0], $goods_data['content']);

            $video_matche= '<video x5-playsinline="true" webkit-playsinline="true" playsinline="true" ';

            $goods_data['content'] = str_replace('<video', $video_matche, $goods_data['content']);
            $goods_data['content'] = htmlspecialchars($goods_data['content']);

            if ($this->type == 1) {
                $goods_data['status'] = 0;
            }

//            //商品视频地址
//            $goods_data['goods_video'] = yz_tomedia($goods_data['goods_video']);

            if (isset($goods_data['thumb_url'])) {
                $goods_data['thumb_url'] = serialize($goods_data['thumb_url']);
            }
            
            if (!$goods_data['virtual_sales']) {
                $goods_data['virtual_sales'] = 0;
            }

            if (!empty($this->request->widgets['sale']['max_point_deduct'])
                && !empty($goods_data['price'])
                && $this->request->widgets['sale']['max_point_deduct'] > $goods_data['price']) {
                return ['status' => -1, 'msg' => '积分最大抵扣金额大于商品现价'];
            }
            if (!empty($this->request->widgets['sale']['min_point_deduct'])
                && !empty($goods_data['price'])
                && $this->request->widgets['sale']['min_point_deduct'] > $goods_data['price']) {
                return ['status' => -1, 'msg' => '积分最少抵扣金额大于商品现价'];
            }
            if(empty($goods_data['price'])){
                $goods_data['price'] = 0;
            }
            if(empty($goods_data['cost_price'])){
                $goods_data['cost_price'] = 0;
            }
            if (mb_strlen($this->request['widgets']['advertising']['copywriting']) > 100) {
                return ['status' => -1, 'msg' => '广告宣传语文案输入超过100，请重新输入'];
            }
            $this->goods_model->fill($goods_data);
            $this->goods_model->widgets = $this->request->widgets;
            $this->goods_model->uniacid = \YunShop::app()->uniacid;
            $this->goods_model->weight = $this->goods_model->weight ? $this->goods_model->weight : 0;
            $validator = $this->goods_model->validator($this->goods_model->getAttributes());
            if ($validator->fails()) {
                $this->error = $validator->messages();
            } else {
                if ($this->goods_model->save()) {
                    (new \app\common\services\operation\GoodsLog($this->goods_model, 'create'));
                    GoodsService::saveGoodsMultiCategory($this->goods_model, $this->request->category, Setting::get('shop.category'));
                    GoodsParam::saveParam($this->request, $this->goods_model->id, \YunShop::app()->uniacid);
                    GoodsSpec::saveSpec($this->request, $this->goods_model->id, \YunShop::app()->uniacid);
                    GoodsOption::saveOption($this->request, $this->goods_model->id, GoodsSpec::$spec_items, \YunShop::app()->uniacid);
                    return ['status' => 1];
                } else {
                    return ['status' => -1];
                }
            }
        }
        $this->catetory_menus = CategoryService::getCategoryMultiMenu(['catlevel' => Setting::get('shop.category')['cat_level']]);
    }

    //商品模型保存后
    public function afterSaving()
    {
    }

    public function setAfterHandle()
    {

    }


    public function setGoodsModel($model)
    {
        $this->goods_model = $model;
    }

    protected function getGoodsModel()
    {
        if (isset($this->goods_model)) {
            return $this->goods_model;
        }

        return new Goods();
    }
}