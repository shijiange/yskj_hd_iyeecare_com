<?php

namespace app\platform\modules\application\controllers;

use app\platform\controllers\BaseController;
use app\platform\modules\application\models\UniacidApp;
use app\common\helpers\Cache;
use app\platform\modules\user\models\AdminUser;
use app\platform\modules\application\models\AppUser;
use Illuminate\Support\Facades\DB;
use app\backend\modules\member\models\Member;
use app\backend\modules\member\models\McMappingFans;
use app\common\models\MemberMiniAppModel;
use app\common\models\MemberWechatModel;
use app\backend\modules\member\models\MemberShopInfo;
use app\backend\modules\member\models\MemberUnique;
use app\backend\modules\goods\models\Goods;
use app\backend\modules\order\models\Order;
use Yunshop\Wechat\common\model\Menu;
use app\common\modules\wechat\models\Rule;
use app\common\modules\wechat\models\RuleKeyword;
use Illuminate\Foundation\Bus\DispatchesJobs;
use app\Jobs\deleteUniacidColumnsJob;


class ApplicationController extends BaseController
{
    protected $key = 'application';

    use DispatchesJobs;

    public function index()
    {
        $search = request()->search;
        $app = new UniacidApp();
        $ids = self::checkRole();
        if (\Auth::guard('admin')->user()->uid != 1) {
            if (!is_array($ids)) {
                return $this->errorJson($ids);
            }
            $list = $app->select('id', 'name', 'img', 'validity_time', 'status', 'is_top')
                ->whereIn('id', $ids)->where('status', 1)
                ->search($search)
                ->orderBy('is_top', 'desc')
                ->orderBy('topped_at', 'desc')
                ->orderBy('id', 'desc')
                ->paginate()
                ->toArray();
        } else {
            $list = $app->select('id', 'name', 'img', 'validity_time', 'status', 'admin_is_top as is_top')
                ->where('status', 1)
                ->search($search)
                ->orderBy('admin_is_top', 'desc')
                ->orderBy('admin_topped_at', 'desc')
                ->orderBy('id', 'desc')
                ->paginate()
                ->toArray();
        }
        foreach ($list['data'] as $key => &$value) {
            $value['img'] = yz_tomedia($value['img']);
            if ($value['validity_time'] == 0) {
                $list['data'][$key]['validity_time'] = intval($value['validity_time']);
            } else {
                //????????????????????????  ??????+1 ?????? +7 ???????????? $value['validity_time']
                $week = date('W');
                $nowstamp = mktime(0, 0, 0, date('m'), date('d'), date('Y'));
                $time_week = date('W', $value['validity_time']);
                if ((date('W', strtotime('+1 week')) == $time_week) || (date('W') == $time_week && $value['validity_time'] >= $nowstamp)) {
                    $list['data'][$key]['is_expire'] = 1;  //???????????????
                }
                if ($value['validity_time'] != 0 && $value['validity_time'] < $nowstamp) {
                    $list['data'][$key]['is_expire'] = 2;  //????????????
                }
                if ($value['validity_time'] === 0 || (date('W', strtotime('+1 week') - $time_week > 1) && $value['validity_time'] > $nowstamp)) {
                    $list['data'][$key]['is_expire'] = 0;
                }
                $list['data'][$key]['validity_time'] = date('Y-m-d', $value['validity_time']);
            }
        }
        return $this->successJson('????????????', $list);
    }

    public static function checkRole()
    {
        $uid = \Auth::guard('admin')->user()->uid;

        $user = AdminUser::find($uid);

        $appUser = AppUser::where('uid', $uid)->get();

        if (!$user || !$appUser || $user->type == 3) {
            return '??????????????????????????????';
        }

        if ($user->endtime != 0 && $user->endtime < time()) {
            return '?????????????????????';
        }

        foreach ($appUser->toArray() as $k => $v) {
            $ids[] = $v['uniacid'];
        }

        $app = UniacidApp::where('creator', $uid)->get();

        if ($app) {

            foreach ($app as $key => $value) {

                $ids[] = $value['id'];
            }
        }
        return $ids;
    }

    public function checkAddRole()
    {
        //???????????????????????????????????????
        $uid = \Auth::guard('admin')->user()->uid;

        $num = UniacidApp::withTrashed()->where('creator', $uid)->count();

        $realnum = AdminUser::find($uid)->application_number;

        if ($uid != 1 && $num >= $realnum) {
            return $this->errorJson('????????????????????????');
        }
        return $this->successJson('??????????????????');
    }

    public function add()
    {
        $app = new UniacidApp();

        //???????????????????????????????????????
        $uid = \Auth::guard('admin')->user()->uid;

        $num = UniacidApp::withTrashed()->where('creator', $uid)->count();

        $realnum = AdminUser::find($uid)->application_number;

        if ($uid != 1 && $num >= $realnum) {
            return $this->errorJson('????????????????????????');
        }

        if (!request()->input()) {
            return $this->errorJson('???????????????');
        }

        $data = $this->fillData(request()->input());

        $id = $app->insertGetId($data);

        if ($id) {
            if ($uid != 1) {
                // ??????????????????????????????
                AppUser::create([
                    'role' => 'manager',
                    'uid' => $uid,
                    'uniacid' => $id
                ]);
            }

            $up = UniacidApp::where('id', $id)->update(['uniacid' => $id]);

            if (!$up) {
                \Log::info('??????????????????uniacid????????????, id???', $id);
            }
            //????????????

            return $this->successJson('????????????');

        } else {

            return $this->errorJson('????????????');
        }
    }

    public function update()
    {

        $id = request()->id;

        $app = new UniacidApp();

        $info = $app->find($id);

        if (!$id || !$info) {
            return $this->errorJson('???????????????');
        }

        if (request()->input()) {

            $data = $this->fillData(request()->input());
            $data['id'] = $id;
            $data['uniacid'] = $id;

            $app->fill($data);

            $validator = $app->validator($data);

            if ($validator->fails()) {

                return $this->errorJson($validator->messages());

            } else {

                if ($app->where('id', $id)->update($data)) {
                    //????????????
                    // Cache::put($this->key . ':' . $id, $app->find($id), $data['validity_time']);

                    return $this->successJson('????????????');
                } else {

                    return $this->errorJson('????????????');
                }
            }
        }
    }

    public function getApp()
    {
        $id = request()->id;

        $app = new UniacidApp();

        $info = $app->find($id);

        $info['isfounder'] = intval(\YunShop::app()->isfounder);

        if (!$id || !$info) {
            return $this->errorJson('????????????');
        }
        return $this->successJson('????????????', $info);
    }

    //??????????????? ??????
    public function delete()
    {
        $id = request()->id;

        $info = UniacidApp::withTrashed()->find($id);

        if (!$id || !$info) {
            return $this->errorJson('???????????????????????????');
        }
        if ($info->deleted_at) {
            //??????????????????????????????
            $this->forceDel($info);
            // Cache::forget($this->key . ':' . $id);
        } else {

            if (!$info->delete()) {
                return $this->errorJson('????????????');
            }
            UniacidApp::withTrashed()->where('id', $id)->update(['status' => 0]);

            // Cache::put($this->key . ':' . $id, UniacidApp::find($id));
        }

        return $this->successJson('????????????');
    }

    //??????????????????????????????
    public function forceDel($info)
    {
        $uniacid = $info->uniacid;
        $delmember = DB::transaction(function () use ($uniacid) {
            if (!empty($uniacid)) {
                //??????yz_uniacid_app
                UniacidApp::where('uniacid',$uniacid)->forceDelete();
                //???????????? mc_member
                Member::where('uniacid',$uniacid)->forceDelete();
                //??????????????????  yz_member_mini_app
                MemberMiniAppModel::where('uniacid',$uniacid)->forceDelete();
                //app????????? yz_member_wechat
                MemberWechatModel::where('uniacid',$uniacid)->forceDelete();
                //????????????mc_mapping_fans ?????????
                McMappingFans::where('uniacid',$uniacid)->forceDelete();
                //?????? yz_member ??????
                MemberShopInfo::where('uniacid',$uniacid)->forceDelete();
                //???????????? yz_member_unique
                MemberUnique::where('uniacid',$uniacid)->forceDelete();
                //????????????yz_goods
                Goods::where('uniacid',$uniacid)->forceDelete();
                //????????????yz_order
                Order::where('uniacid',$uniacid)->forceDelete();
                //???????????? yz_wechat_rule
                Rule::where('uniacid',$uniacid)->forceDelete();
                //???????????? ims_yz_wechat_rule
                RuleKeyword::where('uniacid',$uniacid)->forceDelete();
                //??????yz_wechat_menu
                if(app('plugins')->isEnabled('wechat')){
                    Menu::where('uniacid',$uniacid)->forceDelete();
                }

                $tables = DB::select("SELECT DISTINCT TABLE_NAME FROM information_schema.COLUMNS WHERE COLUMN_NAME = 'uniacid'");
                $tables = array_column($tables, 'TABLE_NAME');
                foreach ($tables as $v) {
                    $this->dispatch(new deleteUniacidColumnsJob($v, $uniacid));
                }
            }
        });
        if ($delmember) {
            \Log::info('------??????????????????????????????------', $uniacid);
        } else {
            return $this->errorJson('????????????');
        }
    }

    //???????????????????????????
    public function switchStatus()
    {

        $id = request()->id;

        $info = UniacidApp::withTrashed()->find($id);

        if (!$id || !$info) {
            return $this->errorJson('???????????????????????????');
        }

        if (request()->status) {
            //????????????
            $res = UniacidApp::where('id', $id)->update(['status' => $info->status == 1 ? 0 : 1]);
        }

        if (request()->url) {
            //????????????????????????
            $res = UniacidApp::where('id', $id)->update(['url' => filter_var(trim(request()->url), FILTER_VALIDATE_URL)]);
        }

        if ($info->deleted_at) {

            //???????????????????????????
            $res = UniacidApp::withTrashed()->where('id', $id)->restore();
            $info->update(['status' => 1]);
        }

        if ($res) {

            return $this->successJson('????????????');
        } else {
            return $this->errorJson('????????????');
        }
    }

    //????????? ??????
    public function recycle()
    {
        $search = request()->search;

        $app = new UniacidApp();

        if (\Auth::guard('admin')->user()->uid != 1) {

            $list = $app->onlyTrashed()->where('creator', \Auth::guard('admin')->user()->uid)->search($search)->orderBy('id', 'desc')->paginate()->toArray();

        } else {

            $list = $app
                ->onlyTrashed()
                ->search($search)
                ->orderBy('id', 'desc')
                ->paginate()
                ->toArray();
        }


        foreach ($list['data'] as $key => $value) {

            if ($value['validity_time'] == 0) {

                $list['data'][$key]['validity_time'] = intval($value['validity_time']);

            } else {

                $list['data'][$key]['validity_time'] = date('Y-m-d', $value['validity_time']);
            }
        }

        if ($list) {
            return $this->successJson('????????????', $list);
        } else {
            return $this->errorJson('????????????,????????????');
        }
    }

    private function fillData($data)
    {
        return [
            'img' => $data['img'] ?: 'http://www.baidu.com',
            'url' => $data['url'],
            'name' => $data['name'] ?: 'test',
            'kind' => $data['kind'] ?: '',
            'type' => $data['type'] ?: 2,
            'title' => $data['title'] ?: '',
            'description' => $data['description'] ?: '',
            'status' => $data['status'] ?: 1,
            'creator' => \Auth::guard('admin')->user()->uid,
            'version' => $data['version'] ?: 0.00,
            'validity_time' => $data['validity_time'] ?: 0,
        ];
    }

    public function setTop()
    {
        $id = request()->id;
        $info = UniacidApp::withTrashed()->find($id);
        if (!$id || !$info) {
            return $this->errorJson('???????????????????????????');
        }
        if (\Auth::guard('admin')->user()->uid != 1) {
            if ($info->is_top) {
                //??????????????????
                $res = UniacidApp::where('id', $id)->update(['is_top' => 0]);
            } else {
                //???????????????--??????????????????--?????????
                $ids = self::checkRole();
                UniacidApp::whereIn('id', $ids)->where('is_top', 1)->update(['is_top' => 0]);
                $res = UniacidApp::where('id', $id)->update(['is_top' => 1, 'topped_at' => time()]);
            }
        } else {
            //??????????????????
            if ($info->admin_is_top) {
                $res = UniacidApp::where('id', $id)->update(['admin_is_top' => 0, 'admin_topped_at' => '']);
            } else {
                UniacidApp::where('admin_is_top', 1)->update(['admin_is_top' => 0]);
                $res = UniacidApp::where('id', $id)->update(['admin_is_top' => 1, 'admin_topped_at' => time()]);
            }
        }

        if ($res) {
            return $this->successJson('????????????');
        } else {
            return $this->errorJson('????????????');
        }
    }
}
