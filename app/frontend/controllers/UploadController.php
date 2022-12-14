<?php
/**
 * Created by PhpStorm.
 * User: weifeng
 * Date: 2019-07-19
 * Time: 13:57
 */

namespace app\frontend\controllers;


use app\common\components\BaseController;
use app\common\facades\Setting;
use app\common\services\ImageZip;
use app\common\services\MiniFileLimitService;
use app\common\services\upload\UploadService;
use app\platform\modules\system\models\SystemSetting;
use Illuminate\Support\Facades\DB;
use app\frontend\modules\member\models\MemberDouyinModel;
use app\frontend\modules\member\models\MemberFavorite;
use app\frontend\modules\member\models\MemberMiniAppModel;
use app\frontend\modules\member\models\MemberModel;
use app\frontend\modules\member\models\MemberUniqueModel;
use app\frontend\modules\member\models\MemberWechatModel;
use app\frontend\modules\member\models\SubMemberModel;
use app\frontend\modules\member\services\MemberCenterDataService;
use app\frontend\modules\member\services\MemberMiniAppService;
use app\frontend\modules\member\services\MemberReferralService;
use app\frontend\modules\member\services\MemberService;


class UploadController extends BaseController
{
    public function uploadPic()
    {
        $attach = request()->attach;
        $ingress = request()->ingress;
        $file = request()->file('file');
        $local_upload = request()->local_upload == 1 ? true : false;
        $upload_type = request()->upload_type;
        if (!$file) {
            return $this->errorJson('请传入正确参数.');
        }
        if (!$file->isValid()) {
            return $this->errorJson('上传失败.');
        }
        if ($ingress && $upload_type == 'image' && $this->isMiniCheckImage()) {
            if ($file->getClientSize() > 1024*1024) {
                return $this->errorJson('小程序图片安全验证图片不能大于1M');
            }
            $check_result = (new MiniFileLimitService())->checkImg($file);
            if ($check_result['errcode'] == 87014) {
                return $this->errorJson('内容含有违法违规信息');
            }
        }
        if ($local_upload) {
            $url_arr = (new UploadService())->upload($file, $upload_type, '', '',false);
        } else {
            $url_arr = (new UploadService())->upload($file, $upload_type);
        }
        return $this->successJson('上传成功', [
            'img' => $url_arr['relative_path'],
            'img_url' => $url_arr['absolute_path'],
            'attach' => $attach,
        ]);
    }

    public function uploadAvatar()
    {
        $attach = request()->attach;
        $ingress = request()->ingress;
        $file = request()->file('file');
        $local_upload = request()->local_upload == 1 ? true : false;
        $upload_type = request()->upload_type;
        if (!$file) {
            return $this->errorJson('请传入正确参数.');
        }
        if (!$file->isValid()) {
            return $this->errorJson('上传失败.');
        }
        if ($ingress && $upload_type == 'image' && $this->isMiniCheckImage()) {
            if ($file->getClientSize() > 1024*1024) {
                return $this->errorJson('小程序图片安全验证图片不能大于1M');
            }
            $check_result = (new MiniFileLimitService())->checkImg($file);
            if ($check_result['errcode'] == 87014) {
                return $this->errorJson('内容含有违法违规信息');
            }
        }
        if ($local_upload) {
            $url_arr = (new UploadService())->upload($file, $upload_type, '', '',false);
        } else {
            $url_arr = (new UploadService())->upload($file, $upload_type);
        }
        $uid = \YunShop::app()->getMemberId();
        $array_avatar['avatar'] = $url_arr['absolute_path'];
        $res = DB::table('mc_members')->where('uid', $uid)->update($array_avatar);
        return $this->successJson('上传成功', [
            'img' => $url_arr['relative_path'],
            'img_url' => $url_arr['absolute_path'],
            'attach' => $attach,
        ]);
    }

    protected function isMiniCheckImage()
    {
        if (!app('plugins')->isEnabled('min-app')) {
            return false;
        }
        $set = Setting::get('plugin.min_app');
        if ($set['switch'] != 1) {
            return false;
        }
        if ($set['image_check'] != 1) {
            return false;
        }
        return true;
    }
}