<?php


namespace app\backend\modules\setting\controllers;


use app\common\components\BaseController;
use app\common\facades\Setting;
use app\common\helpers\Url;
use app\platform\modules\application\models\CoreAttach;
use app\backend\modules\upload\models\CoreAttach as WQCoreAttach;
use app\platform\modules\application\models\CoreAttachTags;
use app\platform\modules\system\models\SystemSetting;
class MediaController extends BaseController
{
    private $coreAttchment;
    public function preAction()
    {
        parent::preAction(); // TODO: Change the autogenerated stub
        if (config('app.framework') == 'platform') {
            $this->coreAttchment = new CoreAttach();
        }else{
            $this->coreAttchment = new WQCoreAttach();
        }

    }

    public function index()
    {
        return view('setting.media.index')->render();
    }

    public function tags(){
        $sourceType = request()->source_type;
        if (!$sourceType) {
            return $this->successJson('获取失败');
        }
        $list = CoreAttachTags::uniacid()->with(['hasManySource' => function($query){
            $query->uniacid();
            if (\YunShop::app()->isfounder !== true)
            {
                $query->where('uid', \YunShop::app()->uid);
            }

        }])->where('source_type',$sourceType)->orderBy('sort', 'desc')->get()->toArray();

        $allCount = $this->coreAttchment->uniacid()->where('type',$sourceType);
        $unCount = $this->coreAttchment->uniacid()->where('type',$sourceType)->where(function($query){
            $query->where('tag_id', 0)->orWhere('tag_id', null);
        });
        if (\YunShop::app()->isfounder !== true)
        {
            $allCount = $allCount->where('uid', \YunShop::app()->uid);
            $unCount = $unCount->where('uid', \YunShop::app()->uid);
        }

        $allCount = $allCount->count();
        $unCount = $unCount->count();

        foreach ($list as &$item)
        {
            $item['source_count'] = count($item['has_many_source']);
            unset($item['has_many_source']);
        }
        array_unshift($list,
            ['id' => '', 'title' => '全部', 'source_type' => $sourceType, 'tag_type' => 1, 'source_count' => $allCount],
            ['id' => 0, 'title' => '未分组', 'source_type' => $sourceType, 'tag_type' => 1, 'source_count' => $unCount]
        );
        return $this->successJson('成功',$list);
    }

    public function source(){
        $sourceType = request()->source_type;
        $tagId = request()->tag_id;
        $pageSize = request()->pageSize;
        $date = request()->date;
        if (!$sourceType) {
            return $this->successJson('获取失败');
        }
        $list = $this->coreAttchment->uniacid()
            ->where('type', $sourceType)
            ->search($date);
        if (\YunShop::app()->isfounder !== true)
        {
            $list->where('uid', \YunShop::app()->uid);
        }
        if (is_numeric($tagId))
        {
            if ($tagId == 0)
            {
                $list = $list->where(function($query)use($tagId){
                    $query->where('tag_id', $tagId)->orWhere('tag_id', null);
                });
            }
            else
            {
                $list->where('tag_id', $tagId);
            }
        }
        if (config('app.framework') == 'platform') {
            $list = $list->orderBy('created_at', 'desc');
        }else{
            $list = $list->orderBy('createtime', 'desc');
        }

        $list = $list->paginate($pageSize);
        foreach($list as &$item){
            $item->attachment = yz_tomedia($item->attachment);
        }
        return $this->successJson('成功', $list);
    }

    public function addTag(){
        $title = request()->title;
        $sourceType = request()->source_type;
        $tagType = 2;

        $result = CoreAttachTags::create([
            'source_type' => $sourceType,
            'tag_type' => $tagType,
            'title' => $title,
            'uniacid' => \YunShop::app()->uniacid,
        ]);

        if ($result)
        {
            return $this->successJson('成功');
        }
        else
        {
            return $this->errorJson('失败');
        }
    }

    //批量删除 所有资源类型通用
    public function batchDelete(){
        $ids = request()->ids;
        $tags = request()->tags;
        $date = request()->date;
        $sourceType = request()->source_type;
        if(!$sourceType || (!$ids && !$tags && !$date)){
            return $this->errorJson('缺少参数');
        }
        $model = $this->coreAttchment->uniacid()->where('type', $sourceType);
        if (!empty($ids))
        {
            $model = $model->whereIn('id', $ids);
        }
        if (!empty($tags))
        {
            $model = $model->whereIn('tag_id', $tags);
        }
        if (!empty($date))
        {
            switch($date){
                case 'all':
                    break;
                case 'year':
                    $model = $model->whereBetween(
                        'created_at',
                        [
                            time(),
                            time()-86400*365
                        ]
                    );
                    break;
                case 'half_year':
                    $model = $model->whereBetween(
                        'created_at',
                        [
                            time(),
                            time()-86400*365/2
                        ]
                    );
                    break;
                case 'three_month':
                    $model = $model->whereBetween(
                        'created_at',
                        [
                            time(),
                            time()-86400*90
                        ]
                    );
                    break;
                case 'month':
                    $model = $model->whereBetween(
                        'created_at',
                        [
                            time(),
                            time()-86400*30
                        ]
                    );
                    break;
            }
        }
        $remote = SystemSetting::settingLoad('remote', 'system_remote');

        $core_attach = $model->get();

        foreach ($core_attach as $attach)
        {
            if ($attach['upload_type']) {
                if (config('app.framework') == 'platform')
                {
                    $status = file_remote_delete($attach['attachment'], $attach['upload_type'], $remote);
                }
                else
                {
                    $status = file_remote_delete($attach['attachment']);
                }
            } else {
                $status = file_delete($attach['attachment']);
            }
            if (is_error($status)) {
                return $this->errorJson($status['message']);
            }
            $attach->delete();
        }

        return $this->successJson('删除成功');

    }

    public function batchMove(){
        $ids = request()->ids;
        $tagId = request()->tag_id;
        if(!$ids || !is_numeric($tagId)){
            return $this->errorJson('缺少参数');
        }
        $result = $this->coreAttchment->uniacid()->whereIn('id', $ids)->update(['tag_id' => $tagId]);
        if ($result)
        {
            return $this->successJson('成功');
        }
        else
        {
            return $this->errorJson('失败');
        }
    }

    public function rename(){
        $id = request()->id;
        $filename = request()->filename;
        if(!$id || !$filename){
            return $this->errorJson('缺少参数');
        }
        $result = $this->coreAttchment->uniacid()->where('id', $id)->update(['filename' => $filename]);
        if ($result)
        {
            return $this->successJson('成功');
        }
        else
        {
            return $this->errorJson('失败');
        }
    }

    public function renameTag(){
        $id = request()->id;
        $title = request()->title;
        if(!$id || !$title){
            return $this->errorJson('缺少参数');
        }
        $result = CoreAttachTags::uniacid()->where('id', $id)->update(['title' => $title]);
        if ($result)
        {
            return $this->successJson('成功');
        }
        else
        {
            return $this->errorJson('失败');
        }
    }

    public function deleteTag(){
        $id = request()->id;
        $status = request()->moveOrDelete;
        if(!$id){
            return $this->errorJson('缺少参数');
        }
        $result = CoreAttachTags::uniacid()->where('id', $id)->delete();
        if ($status == 1)
        {
            $this->coreAttchment->uniacid()->where('tag_id', $id)->update(['tag_id' => 0]);
        }
        else if ($status == 2)
        {
            $this->coreAttchment->uniacid()->where('tag_id', $id)->delete();
        }
        if ($result)
        {
            return $this->successJson('成功');
        }
        else
        {
            return $this->errorJson('失败');
        }
    }

    public function sortTag(){
        $id = request()->id;
        $sort = request()->sort;
        if(!$id){
            return $this->errorJson('缺少参数');
        }
        $result = CoreAttachTags::uniacid()->where('id', $id)->update(['sort' => $sort]);

        if ($result)
        {
            return $this->successJson('成功');
        }
        else
        {
            return $this->errorJson('失败');
        }
    }

}