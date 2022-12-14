@extends('layouts.base')
@section('title', '多媒体素材管理')
@section('content')
<!-- <script src="{{resource_get('resources/views/setting/media/js/jszip.js')}}"></script>
<script src="{{resource_get('resources/views/setting/media/js/jquery.min.js')}}"></script>
<script src="{{resource_get('resources/views/setting/media/js/FileSaver.min.js')}}"></script> -->



<style>
    .panel {
        margin-bottom: 10px !important;
        border-radius: 10px;
        padding-left: 20px;
    }
    .panel .active a {
        background-color: #29ba9c !important;
        border-radius: 18px !important;
        color: #fff;
    }
    .clearfix::after {
        content: '';
        display: block;
        clear: both;
    }
    .panel a {
        border: none !important;
        background-color: #fff !important;
    }
    .content {
        background: #eff3f6;
        padding: 10px !important;
    }
    .multimedia-con {
        padding-bottom: 20px;
        position: relative;
        border-radius: 8px;
        min-height: 100vh;
        background: #fff;
    }
    .multimedia-con .setting .block {
        /* padding: 10px; */
        padding: 10px 10px 10px 20px;
        background-color: #fff;
        border-radius: 8px;
    }
    .multimedia-con .setting .block .title {
        font-size: 18px;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .add {
        width: 154px;
        height: 36px;
        border-radius: 4px;
        border: solid 1px #29ba9c;
        color: #29ba9c;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .el-table--fit {
        margin-top: -10px;
    }
    b {
        font-size: 14px;
    }
    .vue-crumbs a {
        color: #333;
    }
    .vue-crumbs a:hover {
        color: #29ba9c;
    }
    .vue-crumbs {
        margin: 0 20px;
        font-size: 14px;
        color: #333;
        font-weight: 400;
        padding-bottom: 10px;
        line-height: 32px;
    }
    .el-table--border::after,
    .el-table--group::after,
    .el-table::before {
        background-color: #fff;
    }
    #multimedia-material .el-button--danger {
        margin-left: 20px;
        background-color: #EE3939;
        font-size: 14px;
        line-height: 10px;
        border-radius: 10px;
    }
    .fr {
        float: right;
    }

    /* .fl {
        float: left;
    } */
    .right-icon {
        /* position: absolute; */
    }

    .add-icon {
        cursor: pointer;
    }
    .set-icon {
        cursor: pointer;
    }
    .right-icon span {
        margin-right: 10px;
        font-size: 14px;
    }
    .right-icon i {
        padding-right: 5px;
        font-size: 16px;
        vertical-align: middle;
    }
    .grouping {
        margin: 15px 0;
    }
    .grouping b {
        display: inline-block;
        padding-top: 5px;
    }
    .grouping ul {
        overflow: hidden;
        height: 40px;
    }
    .gro-box {
        margin-left: 30px;
        min-width: 800px;
        height: 40px;
        overflow: hidden;
    }
    .gro-item {
        margin-right: 15px;
        margin-bottom: 15px;
        cursor: pointer;
    }
    .gro-item span {
        display: inline-block;
        padding: 3px 8px;
        color: #666;
        border-radius: 10px;
        border: 1px solid #c8cede;
    }
    .gro-item .gro-activity {
        color: #fff;
        background-color: #54c8b0;
    }
    .gro-pull-down {
        display: inline-block;
        width: 25px;
        height: 25px;
        line-height: 25px;
        text-align: center;
        font-size: 20px;
        border-radius: 3px;
        border: 1px solid #c8cede;
        cursor: pointer;
    }
    .gro-left-title {

        font-size: 14px;
        font-weight: 700;
        color: #3C4858;
        padding-top: 5px
    }
    /* .bg-purple-light {
        margin-left:50px;
        min-width:800px;
    } */

    /* .bg-purple-light ul {
        max-width:1600px;
        width:auto;

    } */

    #multimedia-material .has-gutter th {
        width: 500px;
        font-size: 14px;

    }
    #multimedia-material /deep/.el-table th>.cell {
        /* text-align: center; */

    }
    #multimedia-material /deep/.el-table .cell {
        text-align: center;
        color: #666;
        font-size: 14px;
    }
    #multimedia-material /deep/.el-table th:hover {
        background-color: #fff;
    }
    #multimedia-material .el-table__row:hover>td {
        background-color: #ffffff !important;

    }
    #multimedia-material .el-table__row--striped:hover>td {
        background-color: #fafafa !important;

    }
    #multimedia-material .right-icon .el-input {
        display: block;
        margin: 15px 0;
    }
    #multimedia-material .gro-inp {
        margin-bottom: 15px;
    }
    .video {
        position: relative;
        /* margin-left: 60px; */
        width: 190px;
        height: 110px;
    }
    .map3 {
        width: 50px;
        height: 50px;
    }
    .map3 img{
        width:50px;
        height:50px;
    }
    .video video {
        width: 190px;
        height: 110px;
        /* vertical-align: bottom; */
        object-fit: cover;
    }
    .video-title {
        margin-left: 15px;
        width: 130px;
        text-align: left;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap
    }
    #multimedia-material .cell {
        /* display: flex; */
        flex-direction: row;
        justify-content: center;
        align-items: center;
    }
    #multimedia-material .right-icon .el-input {
        margin-bottom: 15px !important;

    }
    .el-popover .el-button--success {
        background: #29b69a;
        margin-left: 35px;
    }
    .el-popover .el-button--info {
        margin-right: 35px;
    }
    .el-table__row .el-icon-edit {
        padding-left: 15px;
        font-size: 16px;
        /* vertical-align: middle; */
    }
    .el-table__row .el-icon-delete {
        font-size: 16px;
    }
    .img-box {
        padding: 15px;
        width: 100%;
    }
    .img-box .img-item {
        position: relative;
        margin: 20px 15px 15px 0;
        width: 150px;
        height: 200px;
        cursor: pointer;
    }
    .img-box .img-item .el-input {
        margin-top: 10px;
    }
    .img-box .img-item img {
        /* padding-top: 30px; */
        width: 100%;
        height: 150px;
    }
    .img-box .img-item .goods-name {
        width: 100%;
        padding: 15px 10px;
        font-size: 14px;
        overflow: hidden;
        color: #333;
        text-overflow: ellipsis;
        white-space: nowrap;
        text-align:center;
    }
    .img-box .img-item .mark {
        position: absolute;
        display: none;
        padding: 8px;
        left: 0;
        top: 0px;
        width: 100%;
        height: 150px;
        background: rgba(41, 186, 156, 0.3);
    }
    .img-box .img-item:hover .mark {
        display: block;
    }
    .full-screen {
        display: inline-block;
        margin-left: 60px;
        padding: 2px;
        background: #fff;
        border-radius: 50%;
        font-size: 16px;
        color: #666;
        cursor: pointer;
    }
    .mark .el-icon-more {
        margin-left: 10px;
        padding: 3px;
        display: inline-block;
        border-radius: 50%;
        font-size: 16px;
        color: #666;
        background: #fff;
        cursor: pointer;
    }
    .mark .el-popover {
        width: 100px !important;
    }
    .mark .el-checkbox__input {
        /* position: absolute;
        top: 5px; */
    }
    .mark .el-checkbox__input .el-checkbox__inner {}

    .mark .el-checkbox__input .el-checkbox__inner .el-checkbox__original {}

    .more-operation {
        display: inline-block;
        width: 100%;
        margin-bottom: 6px;
    }
    .more-operation:hover {

        cursor: pointer;
        color: #000;
    }
    .img-item .operations {
        position: absolute;
        padding-top: 8px;
        display: none;
        top: 35px;
        right: 13px;
        width: 65px;
        height: 90px;
        background: #fff;
        text-align: center;
        border-radius: 5px;

    }
    .img-item .operations::before {
        position: absolute;
        top: -6px;
        right: 0;
        content: '';
        border-right: 8px solid transparent;
        border-left: 8px solid transparent;
        border-bottom: 8px solid #fff;
    }
    .operation-win {
        position: absolute;
        top: 40px;
        right: 0;
        width: 80px;
        height: 100px;
        background: #fff;
        border-radius: 5px;
    }
    #multimedia-material .el-popover {
        width: 50px !important;
    }
    .gro-del {
        width: 100%;
        margin-bottom: 30px;
    }
    .del-item,
    .sel-item {
        width: 80%;
    }
    .dialog-footer-del .el-button {
        float: right;
        width: 100px;
    }
    .dialog-footer-del .el-button--default {
        margin-right: 20px;
    }
    .gro-sure,
    .gro-cancel {
        width: 80px;
        height: 40px;
    }
    .gro-sure {
        margin-left: 30px !important;
    }
    .gro-cancel {
        margin-left: 50px !important;
    }
    .system {
        color: #000;
    }
    .system,
    .custom {
        height: 40px;
        line-height: 40px;
        border-bottom: 1px solid #c8cede;
    }
    .custom i {
        padding-left: 10px;
        cursor: pointer;
    }
    .custom .el-input  {
        width: 150px;
        float: left;
    }
    .select {
        padding: 0 15px;
        height: 40px;
        line-height: 40px;
    }
    .already-sel {
        padding: 0 10px;
    }
    .cancel-sel {
        color: #95a0b8;
        cursor: pointer;
    }
    .switch-hover {
        margin-left: 10px;
        display: inline-block;
        transform: rotate(90deg);
    }
    .switch-hover:hover,
    .sel-del:hover {
        cursor: pointer;
    }
    .sel-del .switch-hover {
        font-size: 20px;
    }
    .video-audio {
        margin-top: 10px;
    }
    .rename-inp {
        width: 100px;
    }
    .move-gro {
        margin: 20px 0;
    }
    .move-gro span {
        margin: 5px 15px 5px 0;
        display: inline-block;
        padding: 3px;
        color: #666;
        border-radius: 10px;
        border: 1px solid #c8cede;
        cursor: pointer;
    }
    .move-type {
        margin: 15px 0;
    }
    .move-type span {
        margin-right: 10px;
        display: inline-block;
        padding: 3px 5px;
        color: #54c8b0;
        border: 1px solid #54c8b0;
        border-radius: 10px;
    }
    .sty-gro {
        color: #333;
        font-weight: 500;
    }
    .select-win {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        background: pink;
    }
    .dP {
        display: block !important;
    }
    .dn {
        display: none  !important;
    }
    .el-popover  {
     min-width: 70px
    }
    .more-operation {

    }
    .more-operation p {
        cursor: pointer;
    }
    .moveActivity {
        color: #fff!important;
        background-color: #54c8b0;
    }
    .gro-del .el-checkbox {
        margin-right: 0;
        width: 120px;
    }
    .gro-width {
        width: 125px;
        text-align:center
    }
    .move-width {
        width: 110px;
        text-align: center;

    }
    .video-time {
        position:absolute;
        padding-right:8px;
        bottom:10px;
        left:10px;
        color:#fff;
        width:50px;
        height:20px;
        font-size:12px;
        line-height:20px;
        border-radius:5px;
        text-align:right;
        background:rgba(0,0,0,0.5)
    }
    .play-triangle {
        /* vertical-align: middle; */
        position:absolute;
        top:3px;
        left:6px;
        /* padding-left:5px; */
        height:0;
        width:0;
        overflow: hidden; /* 这里设置overflow, font-size, line-height */
        font-size: 0;     /*是因为, 虽然宽高度为0, 但在IE6下会具有默认的 */
        line-height: 0;  /* 字体大小和行高, 导致盒子呈现被撑开的长矩形 */
        border-color:transparent transparent transparent #fff;
        border-style:solid;
        border-width:7px;
    }
    #multimedia-material .el-col-24 {
        padding-right:0 !important;
    }
    .header {
        /* padding:3px;
        background:red */
    }
    .main-panel .header {
        margin-bottom:0;
    }

    [v-cloak] {
        display: none;
    }
    .indicate{
        cursor:pointer
    }
    /* 上传组件 样式 */
    .titleWire::before{
        content: '';
        width: 6px;
        height: 16px;
        display: inline-block;
        background-color: #29BA9C;
        vertical-align: middle;
    }
    .textInterval{
        margin-left: 6px;
    }
    .upload-img input{
        display: none;
    }
    .upload-img  .el-upload-list  {
        display:none
    }
    .content-box{
        height: 400px;
        display: flex;
        /* justify-content: space-between; */
    }
    .content-box-left{
        /* width: 330px; */
        width: 120px;
        /* background-color: brown; */
        height: 380px;
        border-right: 1px solid #ccc;
    }
    body .el-scrollbar__wrap {
    overflow-x: hidden;
    }
    .content-box-left p {
        color: #101010;
    }
    .conten-box-right{
        margin-left: 10px;
        width: 100%;
        height: 400px;
        /* background-color: red; */
    }
    /* 上传图片 样式 */
    .conten-box-right-img{
        /* padding-right: 10px;
        padding-right: 10px; */
        display: flex;
        flex-wrap: wrap;
        margin: 10px;
        width: 7.3vw;
        height: 7.3vw;

    }
    li{
        list-style: none;
    }
    /* .fl{
        float: left;
    } */
    .conten-box-right-img img{
        width: 100%;
        height: 100%;
        object-fit: contain;
        /* margin-right: 5px;
        margin-bottom: 5px; */
    }
    /* 上传视频 音频 */
    .conten-box-right-video{
        overflow: hidden;
    }
    .video-top{
        margin-bottom: 20px;
    }
    .video-top-init{
        margin: 0 auto;
        margin-top: 50px;
        width: 260px;
        height: 150px;
        border-radius: 10px;
        text-align: center;
        border: 1px dashed rgba(187, 187, 187, 100);
    }
    .video-top-init-text{
        margin-top: 55px;
    }
    .video-top-init video{
        width: 100%;
        height: 100%;
    }
    .video-top-init input{
        display: none;
    }
    /* .video-bottom{
        margin: 0 auto;
    } */
    .video-bottom-init{
        margin: 0 auto;
        margin-top: 30px;
        text-align: center;
        width: 260px;
        height: 150px;
    }
    /* 上传成功 样式 */
    .top-win-text{
        font-size: 68px;
        margin-bottom: 20px;
    }
    .video-top-win{
        margin: 0 auto;
        margin-top: 30px;
        text-align: center;
    }
    .top-win-copy{
        margin-top: 45px;
    }
    .video-bottom-win{
        /* margin:  0 auto; */
        text-align: center;
        margin-top: 40px;
    }
    /* 上传 打开 按钮 颜色 */
    .uploadi-text{
        width: 86px;
        height: 27px;
        line-height: 27px;
        border-radius: 8px;
        color: rgba(16, 16, 16, 100);
        font-size: 12px;
        text-align: center;
        border: 1px solid rgba(187, 187, 187, 100);
        margin-left: 6px;
        cursor: pointer;
    }
    .uploadi-text  span{
        color: #101010;
    }
    .groupings{
        color: #fff !important;
        background-color: #29BA9C;
        cursor: pointer;
    }
    .video-top-init  .el-upload-list{
        display: none;
    }
    .head-dialog{
        display: flex;
        justify-content: space-between;
    }
    .divider .el-divider--horizontal{
        margin-bottom: 0px;
    }
    .content-box-left-text:first-child{
        display: none;
    }
    .video-top-audioName{
        margin-top: 65px;
        display: block;
        overflow: hidden;/*超出部分隐藏*/
        white-space: nowrap;/*不换行*/
        text-overflow:ellipsis;/*超出部分文字以...显示*/
    }
</style>
<div id='multimedia-material' v-cloak v-if="loadingData">
    <div class="panel panel-info">
        <ul class="add-shopnav">
            <li @click="tabClick(1)" :class="defaultIndex == 1?'active':''"><a href="javascript:void(0)">
                    图片
                </a></li>
            <li @click="tabClick(3)" :class="defaultIndex == 3?'active':''"><a href="javascript:void(0)">
                    视频
                </a></li>
            <li @click="tabClick(2)" :class="defaultIndex == 2?'active':''"><a href="javascript:void(0)">
                    音频
                </a></li>
        </ul>
    </div>

    <div class="multimedia-con" >


        <div class="setting">


            <div class="block">
                <div class="title">
                    <div style="display:flex;align-items:center;">
                        <b v-if="defaultIndex == 1">图片&nbsp;共([[resourceTotal]])</b>
                        <b v-if="defaultIndex == 3">视频&nbsp;共([[resourceTotal]])</b>
                        <b v-if="defaultIndex == 2">音频&nbsp;共([[resourceTotal]])</b>
                        <el-button type="danger" round @click="detelDialogVisible = true" style="background:#f37474;border:none">批量删除素材</el-button>
                        <div class="uploadi-text" v-if="defaultIndex == 1" @click="openDialog('1')">
                            <span>上传图片</span>
                        </div>
                        <div class="uploadi-text" v-if="defaultIndex == 3" @click="openDialog('3')">
                            <span>上传视频</span>
                        </div>
                        <div class="uploadi-text" v-if="defaultIndex == 2" @click="openDialog('2')">
                            <span>上传音频</span>
                        </div>
                    </div>

                    <!-- 批量删除素材弹窗 -->
                    <el-dialog title="选择你要删除的素材范围" :center="true" width="35%" :visible.sync="detelDialogVisible" width="30%" :before-close="handleClose" >
                        <div class="gro-del clearfix">
                            <span class="fl">按分组删除:</span>
                            <div class="del-item fr">
                                    <el-checkbox-group v-model="checkList" @change="moreSelectGro($event)">
                                        <el-checkbox  v-for="(item,index) in groupList"  :label="item.id" >[[item.title]]</el-checkbox>
                                    </el-checkbox-group>
                            </div>
                        </div>
                        <div class="scope-sel clearfix">
                            <span class="fl">选择时间范围：</span>
                            <div class="sel-item fr">
                                <el-radio-group v-model="radioList" @change="rangeChange($event)">
                                    <el-radio  label="all">全部删除</el-radio>
                                    <el-radio  label="month">一个月前</el-radio>
                                    <el-radio  label="three_month">三个月前</el-radio>
                                    <el-radio  label="half_year">半年前</el-radio>
                                    <el-radio label="year">一年前</el-radio>
                                </el-radio-group>
                            </div>
                        </div>
                        <span slot="footer" class="dialog-footer-del clearfix">
                            <el-button type="primary" @click="startDetel()">开始删除</el-button>
                            <el-button @click="detelDialogVisible = false">取 消</el-button>
                        </span>
                    </el-dialog>


                    <div class="right-icon">
                                <!-- <span v-if="defaultIndex == 1" class="indicate" @click="openUpload('slide_pic','1')">上传图片</span>
                                <span v-if="defaultIndex == 3" class="indicate" @click="openUpload('slide_pic','3')">上传视频</span>
                                <span v-if="defaultIndex == 2" class="indicate" @click="openUpload('slide_pic','2')">上传音频</span> -->
                            <el-popover placement="bottom" width="300" trigger="click">
                                <span slot="reference" class="add-icon">
                                    <i class="el-icon-circle-plus-outline "></i>新建
                                </span>
                                <p class="gro-inp">请输入分组名称</p>
                                <el-input v-model="newGroupName" placeholder="" style="margin-bottom:15px" maxlength="6"show-word-limit></el-input>
                                <el-button type="primary" class="gro-sure" @click="handAddGroup()">确定</el-button>
                                <el-button class="gro-cancel"  @click="handCancelGroup()">取消</el-button>
                            </el-popover>
                        <span class="set-icon" @click="adminClick()">
                            <i class="el-icon-setting"></i>管理
                        </span>
                    </div>

                    <!-- 管理弹窗 -->
                    <el-dialog title="管理分组" :visible.sync="adminDialogVisible" width="30%" :before-close="handleClose" >
                        <!-- 暂时注释 -->
                        <!-- <span class="drag">拖拽分组进行排序</span> -->
                        <draggable v-model="groupList" :disabled="disabled" chosen-class="chosen"  handle=".header" force-fallback="true" group="people" animation="1000" @start="onStart" @end="onEnd" :move="onMove">
                            <transition-group>
                                <div class="custom" v-for="(item,index) in groupList" :key="index">
                                    <span class="fl" v-if="groId != item.id" :class="item.tag_type == 1?'sty-gro':''">[[item.title]]</span>
                                    <el-input class = "edit-inp" v-model ="adminRnameGroup" v-if="groId == item.id" @change="changeGroupName($event)" @input = "inpName($event)" @blur="inputBlur()"  ref="input" ></el-input>
                                    <el-button type="success" v-if="groId == item.id" style="background: #29BA9C;" @click="sureName(item.id)">确定</el-button>
                                    <span class="fr" v-if="item.tag_type == 1" :class="item.tag_type == 1?'sty-gro':''">系统分组</span>
                                    <div class="fr" v-if="item.tag_type == 2">
                                        <i class="el-icon-edit" @click.stop.prevent="EditGroup(item.id,item.title)"></i>
                                        <el-popover
                                            placement="bottom"
                                            width="300"
                                            trigger="click"
                                        >
                                            <i class="el-icon-delete" slot="reference" @click.stop.prevent="getGroId(item.id)"></i>
                                            <p style="margin: 10px 0;">
                                                <el-radio v-model="radio" @change = "slectRadio($event)" label="1">删除分组，组内所有<span v-if="defaultIndex == 1">图片</span><span v-if="defaultIndex == 2">音频</span><span v-if="defaultIndex == 3">视频</span>移到未分组</el-radio>
                                            </p>
                                            <p style="margin: 10px 0 20px 0;">
                                                <el-radio v-model="radio" @change = "slectRadio($event)" label="2">删除分组，同时删除组内所有<span v-if="defaultIndex == 1">图片</span><span v-if="defaultIndex == 2">音频</span><span v-if="defaultIndex == 3">视频</span></el-radio>
                                            </p>
                                            <el-button type="primary" class="gro-sure" @click="ManageSureDetel()">确定</el-button>
                                            <el-button  @click="cancel(item.id)">取消</el-button>
                                        </el-popover>
                                            <!-- 暂时注释掉 -->
                                            <!-- <i class="el-icon-s-fold header"></i> -->
                                    </div>
                                </div>
                            </transition-group>
                        </draggable>

                        <span slot="footer" class="dialog-footer">
                            <el-button type="primary" @click="adminDialogVisible = false">确 定</el-button>
                            <el-button @click="cancel()">取 消</el-button>
                        </span>
                    </el-dialog>
                </div>


                <div class="grouping clearfix">
                    <el-row>
                        <el-col :span="1">
                            <div class="grid-content bg-purple gro-left-title ">分组</div>
                        </el-col>
                        <el-col :span="22">
                            <div class="grid-content bg-purple-light">
                                <ul class="clearfix">
                                    <li class="gro-item fl" v-for="(item,index) in groupList"><span @click="groupingClick(item.id,item.title)"  :class="(groupId == item.id && gname == item.title)?'gro-activity':''">[[item.title]]([[(item.source_count)]])</span></li>
                                </ul>
                            </div>
                        </el-col>
                        <el-col :span="1">
                            <div class="grid-content bg-purple fr" style="margin-right: 10px;"><i class="el-icon-arrow-down gro-pull-down" @click="pullDownClick()"></i></div>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="2">
                            <div class="grid-content bg-purple gro-left-title ">日期筛选：</div>
                        </el-col>
                        <el-col :span="4">
                                <el-date-picker
                                size="mini"
                                v-model="filterTime"
                                type="month"
                                placeholder="选择时间"
                                @change="getResourList(defaultIndex,groupId,defaultIndex==1?15:videoAudioSize,1)"
                                >
                              </el-date-picker>
                        </el-col>
                    </el-row>

                </div>
                <!-- 分组下拉弹窗 -->
                <el-dialog title="所有分组" :visible.sync="groDialogVisible" width="40%" :before-close="handleClose">
                    <ul class="clearfix">
                        <li class="gro-item fl" v-for="(item,index) in groupList">
                            <span @click="groupingClick(item.id,item.title)"  :class="(groupId == item.id && gname == item.title)?'gro-activity':''">[[item.title]]([[(item.source_count)]])</span></li>
                    </ul>
                </el-dialog>

            </div>
            <div style="background: #eff3f6;width:100%;height:15px;"></div>

            <!-- 全选按钮 -->
            <div class="select" v-if="defaultIndex == 1 && idArr.length != 0">
                <el-checkbox label="全选" v-model.number="is_all_choose" @change="allChoose($event)"></el-checkbox>
                <span class="already-sel">已选择[[idArr.length]]项内容</span>
                <span class="cancel-sel" @click = "cancelSelect()">取消选择</span>
                <span class="fr">
                 <span style="display: none;">
                         <i class="el-icon-download" style="margin-right: 10px; cursor: pointer;" id="packageImages"></i>
                 </span>
                <el-popover placement="bottom" title="" width="200" trigger="click" >
                    <p style="margin:15px 0;">确定要删除选中的素材吗</p> 
                    <el-button type="primary" style="height: 30px; line-height:5px" @click="sureSelectDetel()">确定</el-button>
                    <el-button style="height: 30px; line-height:5px" @click="cancel()" >取消</el-button>
                    <i class="el-icon-delete sel-del" slot="reference"></i>
                </el-popover>

                <!-- 批量移动 -->
                <el-popover placement="left-end" title="" width="300" trigger="click">
                    <div class="move-gro" style="width: 280px; " >
                        <span class="gro-width" v-for="(item,index) in groupList" @click="moveGroupClick(item.id,item.title)" :class="groupName == item.title && moveGroupId == item.id?'moveActivity':''">[[item.title]]</span>
                    </div>
                    <el-button type="primary" style="height: 30px; line-height:5px; margin-left:30px" @click="removeSure()">确定</el-button>
                    <el-button style="height: 30px; line-height:5px;margin-left:70px" @click="cancel()">取消</el-button>
                    <i class="el-icon-sort switch-hover" slot="reference" @click="batchMove()"></i>
                </el-popover>
                </span>
            </div>
            <!-- 图片 -->
            <div v-if="defaultIndex == 1 && listLoading">
                <ul class="img-box clearfix">
                    <li class="fl img-item"  v-for="(item,index) in resourceList" @mouseenter="into(item.id)" @mouseleave="out(item.id)" id="refImg">
                        <div>
                            <img :src="item.attachment"  alt="">
                        </div>
                        <p class="goods-name" v-if=" renameId != item.id">[[item.filename]]</p>
                        <el-input class = "edit-inp" v-model = "item.filename" v-if=" renameId == item.id" @blur="blurInput($event,item.id)" @input = "inpNewName($event)"  ref="renameInput" @keyup.enter.native = "enter($event,item.id)"></el-input>
                        <div class="mark"  :style="{ display: item.is_choose ? 'block' : '' }">
                            <!-- {{item.is_choose}} -->
                            <el-checkbox v-model="item.is_choose"  @change="handChecked($event,index,item.attachment)"></el-checkbox>
                            <span class="el-icon-rank full-screen"  @click="screenViewClick(item.attachment)" :class="item.is_choose?'dn':'dp'"></span>
                            <i class="el-icon-more" slot="reference"  @click="moreDot= true" :class="item.is_choose?'dn':'dp'"></i>
                            <div class="operations" :style="{ display:  moreDot? 'block' : 'none' }">
                                <span class="more-operation" @click="renameClick(item.id)">重命名</span>
                                <!-- 移动分组弹窗 -->
                                <el-popover placement="bottom" title="" width="260" trigger="click">
                                    <span class="more-operation" slot="reference" @click="removeClick(item.id)">移动分组</span>
                                        <div class="move-gro" style="width: 260px;" >
                                            <span class="move-width" v-for="(item,index) in groupList" @click="moveGroupClick(item.id,item.title)" :class="groupName == item.title && moveGroupId == item.id?'moveActivity':''">[[item.title]]</span>
                                        </div>
                                    <el-button type="primary" style="height: 30px; line-height:5px;margin-left:20px" @click="removeSure()">确定</el-button>
                                    <el-button style="height: 30px; line-height:5px;margin-left:40px " @click="cancel()">取消</el-button>
                                </el-popover>

                                <!-- 删除弹窗 -->
                                <el-popover placement="bottom" title="" width="200" trigger="click">
                                    <p style="margin:15px 0;">确定要删除此素材吗</p>
                                    <el-button type="primary" style="height: 30px; line-height:5px" @click="sureDetel(item.id, item)">确定</el-button>
                                    <el-button style="height: 30px; line-height:5px" @click="cancel()" >取消</el-button>
                                    <span slot="reference" class="more-operation" @click="detelClick(item.id)">删除</span>
                                </el-popover>
                            </div>
                        </div>
                    </li>
                </ul>

                <!-- 没有数据 -->
            <div v-if="resourceList <= 0" style="text-align:center">暂无数据~</div>
            </div>

            <!-- 模拟点击按钮 -->
            <!-- <el-button @click="openUploadImg(defaultIndex)">模拟的上传按钮(到时候会去掉)</el-button> -->
            <!-- 上传组件 -->
            <!-- <upload-multimedia-img  ref="uploadImg" :upload-show="uploadShow" :type="type" :name="chooseImgName" @replace="changeProp" @sure="sureImg" @videoclik="handleVideo"></upload-multimedia-img> -->

            <!-- <el-button @click="openUploadImg(defaultIndex)">原生组件的上传按钮(到时候会去掉)</el-button> -->

            <!-- <custom-img></custom-img> -->


            <!-- 图片全屏查看弹窗 -->
            <el-dialog title="" :visible.sync="fullImg" width="500px" height="500px;">
                 <img :src="fullImgUrl" alt="" style="width:100%;height: 100%;">
            </el-dialog>

            <!-- 视频和音频 -->
            <div v-if="(defaultIndex == 2 || defaultIndex == 3) && listLoading" class="video-audio">
                <template>
                    <el-table :data="resourceList" style="width: 100%" size="medium">
                        <el-table-column prop="created_at" label="创建时间"  align="center">
                        </el-table-column>

                        <el-table-column label="名称" align="center" width="190">
                            <template slot-scope="scope">
                                <!--视频 -->
                                <div class="video fl" v-if="defaultIndex == 3">
                                    <video  :src="scope.row.attachment" @click="dialogPlay(scope.row.attachment)"></video>
                                    <span class="video-time">播放<i class="play-triangle"></i>
                                    <!-- [[Math.floor(scope.row.timeline / 60)]]:[[Math.floor(scope.row.timeline % 60) >= 10?Math.floor(scope.row.timeline % 60):'0' + Math.floor(scope.row.timeline % 60)]] -->
                                    </span>
                                </div>

                                <!-- 弹窗播放 -->
                                <el-dialog title="" :visible.sync="VideoDialogPlay" width="50%"   :before-close="handleClose">
                                    <div style="min-width:500px;min-height:400px;min-height:500px; height: 500px;">
                                        <video style="width:100%; height:100%"  :src="DialogViedoUrl" autoplay controls></video>
                                    </div>

                                </el-dialog>

                                <span class=" video-title fl" v-if="defaultIndex == 3" v-if="defaultIndex == 3">[[scope.row.filename]]</span>

                                <!-- 音频 -->
                                <div class="map3" v-if="defaultIndex == 2" style="position: relative;margin: 0 auto;">
                                    <img  src="{!! resource_get('static/images/play.png') !!}" alt="" v-if="scope.row.is_choose == 0" @click="aduioClick(scope.row,scope.row.id,scope.$index,scope.row.is_choose)">
                                    <img src="{!! resource_get('static/images/puse.png') !!}" alt=""  v-if="scope.row.is_choose == 1" @click="aduioClick(scope.row,scope.row.id,scope.$index,scope.row.is_choose)">
                                    <!-- <span style="position: absolute; bottom: 0; right: -38px;">[[Math.floor(scope.row.timeline / 60)]]:[[Math.floor(scope.row.timeline % 60) >= 10?Math.floor(scope.row.timeline % 60):'0' + Math.floor(scope.row.timeline % 60)]]</span> -->
                                </div>
                                <audio class="myAudio" v-if="defaultIndex==2">
                                        <source :src="scope.row.attachment"  type="audio/mpeg">
                                </audio>
                                <!-- <audio class="myAudio" v-if="defaultIndex==2" controls>
                                        <source src="../../../../static/1.mp3"  type="audio/mpeg">
                                </audio> -->
                                <div style="text-align:center;padding-top:10px" v-if="defaultIndex == 2">
                                    <p style="width: 150px;overflow: hidden;text-overflow: ellipsis; white-space: nowrap">[[scope.row.filename]]</p>

                                </div>
                            </template>
                        </el-table-column>
                        <el-table-column label="分组" align="center">
                            <template slot-scope="scope">
                                <span v-if="scope.row.id != noneGroup" style="display:inline-block;">[[scope.row.tag_name]]</span>

                                <el-popover placement="bottom" title="" width="260" trigger="click">
                                    <i class="el-icon-edit" slot="reference" size="" @click="removeClick(scope.row.id)"></i>
                                        <div class="move-gro" style="width: 260px;" >
                                            <span  class="move-width" v-for="(item,index) in groupList" @click="moveGroupClick(item.id,item.title)" :class="groupName == item.title && moveGroupId == item.id?'moveActivity':''">[[item.title]]</span>
                                        </div>
                                    <el-button type="primary" style="height: 30px; line-height:5px;margin-left:20px" @click="removeSure()">确定</el-button>
                                    <el-button style="height: 30px; line-height:5px;margin-left:40px " @click="cancel()">取消</el-button>
                                </el-popover>
                            </template>
                        </el-table-column>
                        <!-- defaultIndex == 3 ? '视频链接' : defaultIndex == 3 ? '音频链接'：'' -->
                            <el-table-column :label="defaultIndex == 3 ? '视频链接' : '音频链接'" align="center">
                                    <template slot-scope="scope">
                                            <i class="el-icon-link"  @click="clickCopyUrl(scope.row.attachment)" ></i>
                                    </template>
                            </el-table-column>
                        <el-table-column label="操作" align="center">
                            <template slot-scope="scope">
                            <el-popover
                                placement="bottom"
                                title="标题"
                                width="200"
                                trigger="click"
                              >
                              <p style="margin:15px 0;">确定要删除此素材吗</p>
                                    <el-button type="primary" style="height: 30px; line-height:5px" @click="sureDetel(scope.row.id)">确定</el-button>
                                    <el-button style="height: 30px; line-height:5px" @click="cancel()" >取消</el-button>
                             </p>
                                <i class="el-icon-delete" slot="reference" @click="TableDetel(scope.row.id)" ></i>
                            </el-popover>

                            </template>
                        </el-table-column>
                        <!-- <el-table-column label="文件格式">
                                <template slot-scope="scope">
                                    <span>[[scope.row.filename.substr(scope.row.filename.length-3)]]</span>
                                </template>
                        </el-table-column> -->
                    </el-table>
                </template>
            </div>
            <!-- 分页 -->
            <el-row style="background-color:#fff;">
                    <el-col :span="24" align="center" migra style="padding:15px 5% 15px 0" v-loading="loading">
                        <el-pagination
                            background
                            @current-change="currentChange"
                            layout="prev, pager, next, jumper"
                            :current-page="current_page"
                            :page-size.sync="Number(page_size)"
                            :total="page_total">
                        </el-pagination>
                    </el-col>
            </el-row>
        </div>
    </div>
    <!-- <upload-multimedia-img
        :upload-show="uploadShow" 
        :type="type" 
        :name="chooseImgName" 
        :sel-Num="selNum"
        @replace="changeProp" 
        @sure="sureImg"
    ></upload-multimedia-img> -->
    <!-- 上传组件 -->
    <div>
         <el-dialog  :visible.sync="dialogTableVisible" @close='closeDialog'>
            <template slot="title" >
                <div class="head-dialog">
                    <div class="titleWire">
                        <span v-if="uploadtype == 1" class="textInterval">上传图片</span>
                        <span v-if="uploadtype == 3" class="textInterval">上传视频</span>
                        <span v-if="uploadtype == 2" class="textInterval">上传音频</span>
                    </div>
                    <!-- 图片上传 -->
                    <div class="upload-img"  v-if="uploadtype == 1">
                        <el-upload
                            class="upload-demo"
                            :action="uploadLink"
                            ref="upload"
                            multiple
                            accept="image/*"
                            :on-success="handleSucesss"
                            :on-progress="handlePreview"
                            >
                                <el-button size="small" type="primary" style="margin-right: 24px;">点击上传</el-button>
                        </el-upload>
                    </div>

                </div>
                <div class="divider">
                      <el-divider></el-divider>
                </div>
                    <!-- 内容部分  -->
                <div class="content-box">
                    <!-- 左 -->
                    <div class="content-box-left" style=" cursor: pointer" >
                            <el-scrollbar style="height:100%">
                                <p class="content-box-left-text" v-for="(item,index) in groupList"  @click="groupingClick(item.id, item.title, $event,'scrollbar')"
                                :class="(pop_groupId == item.id && pop_gname == item.title)?'groupings':''">[[ item.title == '全部' ? '' : item.title]]
                                <span >([[item.title == '全部' ? '' : item.source_count]])</span></p>
                        </el-scrollbar>
                    </div>
                    <!-- <div style="height: 100%;">
                    <hr>
                        <el-divider direction="vertical"></el-divider>
                    </div> -->
                    <div class="conten-box-right">
                        <el-scrollbar style="height:100%">

                            <!-- 图片 -->
                            <div v-if="uploadtype == 1">
                                <div v-loading="videoloading" style="margin-top: 25px;">
                                    <div class="conten-box-right-img fl" v-for="(item,index) in dataList" v-if="defaultIndex == 1 && listLoading" >
                                                <li style="width: 7.3vw;height: 7.3vw;">
                                                    <img :src="item"  alt="">
                                                </li>
                                    </div>
                                    <div v-if="dataList <= 0" style=" line-height: 400px; text-align:center; ">暂无数据~请上传图片</div>
                                </div>
                            </div>
                            <!-- 视频音频 -->
                            <div class="conten-box-right-video" v-if="uploadtype == 2 || uploadtype == 3">
                                <div class="video-top"  >
                                    <!-- 默认上传显示 -->
                                    <div class="video-top-init" v-loading="videoloading"  v-if="uploadInitShow">
                                        <el-upload
                                            ref="upload"
                                            class="avatar-uploader"
                                            :accept="uploadtype == 3 ? 'video/*' : 'audio/*'"
                                            :action="uploadvideo"
                                            :on-success="onSuccess"
                                            :on-progress="onProgress"
                                            >
                                            <!-- v-if="imageUrl" -->
                                            <div v-if="videoimg == null" class="video-top-init-text">
                                                    <i  class="el-icon-plus avatar-uploader-icon"></i>
                                                    <div class="el-upload__text"><em>点击上传</em></div>
                                            </div>
                                            <div style="width: 260px; height: 150px;" v-else-if="videoimg !== null && uploadtype == 3">
                                                <video :src="videoimg" class="avatar">
                                            </div>
                                            <div v-else style="width: 260px; height: 150px;">
                                                <span class="video-top-audioName">[[audioName]]</span>
                                                <!-- <audio :src="audioName">
                                                     <source src="videoimg"  >
                                                </audio> -->
                                            </div>


                                        </el-upload>
                                </div>


                                    <!-- 上传成功 -->
                                    <div class="video-top-win"  v-show="uploadWinShow">
                                        <!-- <img src="" alt=""> -->
                                        <div class="top-win-text">
                                              <i class="el-icon-success" style="color: #29BA9C;"></i>
                                        </div>
                                            <p style="color: #101010;">生成视频链接成功</p>
                                    </div>
                                    <!-- 复制链接 -->
                                    <div class="top-win-copy" v-show="copyLinkShow">
                                                <el-row :gutter="20">
                                                    <el-col :span="15" :offset="3">
                                                       <el-input v-model="copyTextLink" disabled></el-input>
                                                    </el-col>
                                                    <el-col :span="3">
                                                      <el-button type="primary" style="background-color: #29BA9C;" @click="clickCopyUrl(copyTextLink)">复制</el-button>
                                                    </el-col>
                                                </el-row>
                                    </div>
                                    <!-- 成功上传 返回 -->
                                    <div class="video-bottom-win" v-show="putbackInitShow">
                                         <el-button size="medium" @click="cilckShow"> 返  回 </el-button>
                                    </div>
                                   <!-- 上传默认显示 -->
                                   <div class="video-bottom-init" v-if="uploadtype == 2 || uploadtype == 3">
                                                    <p v-show="iploadTetxshow" style="color: red;">请上传<span  v-if="uploadtype == 2 "></span>音频<span v-if="uploadtype == 3">视频</span>文件！</p>
                                                    <el-button type="primary" v-show="iploadShow" style="background-color: #29BA9C;" @click="submitUpload">生成链接</el-button>
                                                </div>
                                            </div>
                                <!-- 生成链接 -->
                                <div class="video-bottom" >
                                </div>
                            </div>
                         </el-scrollbar>
                    </div>

                </div>

                <!-- 分组 -->
                <div class="">
                    <el-popover placement="top" width="300" trigger="click">
                        <span style="color:#229980;cursor: pointer;" class="fl" slot="reference" >
                        <i class="el-icon-plus"></i>
                        新建分组</span>
                        <p class="gro-inp">请输入分组名称</p>
                        <el-input v-model="newGroupName"  placeholder="" style="margin-bottom:15px" maxlength="6"show-word-limit></el-input>
                        <el-button type="primary" class="gro-sure"  style="margin-left:30px" @click="handAddGroup()">确定</el-button>
                        <el-button @click="handCancelGroup()" style="margin-left:50px">取消</el-button>
                    </el-popover>
                </div>
            </template>

        </el-dialog>
    </div>
</div>

<script>
     // 全局注册拖拽组件
    // Vue.component('vuedraggable', window.vuedraggable)
    var vm = new Vue({
        el: "#multimedia-material",
        delimiters: ['[[', ']]'],

        data() {
            return {
                type:'',
                uploadShow:false,// 上传
                chooseImgName:'',
                selNum:'',
                dataList:[], //选中的img

                loadingShow:true,
                videoloading:false,
                groupIndex:'',
                // switchover:'', //切换颜色
                tagid: 0,  //默认是0
                videoimg:null,
                // 上传参数
                uploadLink:'',
                uploadvideo:'',
                audioName:'',
                uploadWinShow:false, //上传成功模板
                uploadInitShow:true, // 默认上传模板
                copyLinkShow:false, // 复制链接
                putbackInitShow:false, //返回模板按钮
                iploadTetxshow:false, //生成链接文本
                copyTextLink:'', // 复制链接  input框 文本
                iploadShow:true, // 生成链接按钮 切换
                uploadtype:null,
                dialogTableVisible: false, //上传组件 开关

                loadingData:false,
                moreDot: false,
                visible: false,
                GroVisible:false,
                checked:null,
                groId:null, // 分组id
                inpStatus:null,
                newGroupName: '',// 新建分组名字
                // 批量删除
                curIndex: 0,
                detelDialogVisible: false,
                groDialogVisible: false,
                adminDialogVisible: false,
                imgChecked: false,
                markFlag: false,
                radio: '',
                checkList: [],
                radioList: [],
                defaultIndex: 1,
                loading: false,
                groupId: 1,
                pop_groupId: 0,
                groupList: [],
                input: '',
                renameStatus: false,
                renameGroupStatus: false,
                name: '',
                rName:'',
                imgList:[],
                resourceList:[],
                resourceTotal:'',
                intoId:null,
                screenAndDot:null,
                moreOperation:false,
                moreStatus:null,
                renameId:'',
                moveGroupId:'',
                VideoDialogPlay:false,
                DialogViedoUrl:'',
                page_total:0,// 分页
                page_size:15,
                videoAudioSize:3,
                current_page:0,
                page:1,//默认第一页
                labelStatus:'',
                manageId:'',
                is_all_choose: 0,//是否全选
                idArr:[],//选中的id,
                selectIndexArr:[],
                removeResourcesIdArr:[],
                batchMoveStatus:false,//判断是否是批量移动
                timeSelect:'',//删除的时间范围
                groupName:'',
                fullImg:false,
                fullImgUrl:'',
                gjson:{},
                gname:0,
                pop_gname: '全部',
                source_count:'',
                noneGroup:'',
                playOrPuse:'',
                audioStatus:false,
                audioImg:'',
                aduioDialogVisible:true,
                activeName:'first',
                aduioChecked:'',
                videoChecked:'',
                currentPage3:0,
                imgChecked:'',
                netUrl:'',
                valPage:null,
                
                fileList:[],
                disabled:false,
                dragId:[],
                adminRnameGroup:'',
                allSelectStatus:false,
                listLoading:false,
                palyingTag:false,
                pusedingTag:true,
                filterTime:null, //* 素材筛选日期
            }
        },

        components: {
            // vuedraggable: window.vuedraggable,//当前页面注册拖拽组件
        },
        mounted() {
            window.onload = function() {
                if (!window.sessionStorage['tempFlag']) {
                    console.log('关闭~~')
                    localStorage.clear()
                    // sessionStorage.clear()
                } else {
                        this.groupId = window.sessionStorage.getItem('groupTag')?window.sessionStorage.getItem('groupTag'):''
                        window.sessionStorage.removeItem('tempFlag')
                    }
            }
            window.onunload = function () {
            window.sessionStorage['tempFlag'] = false
            }
            window.onbeforeunload = function () {
            window.sessionStorage['tempFlag'] = true
            }

            this.defaultIndex = window.sessionStorage.getItem('typeId')?window.sessionStorage.getItem('typeId'):'1'
            this.gjson =JSON.parse(window.sessionStorage.getItem('groupTag')?window.sessionStorage.getItem('groupTag'):'{}')
            this.groupId = this.gjson.id
            this.pop_groupId = this.gjson.id
            this.gname = this.gjson.gname
            this.pop_gname = this.gjson.gname

            if(this.defaultIndex == 1) {
                this.page_size = 15
                this.getResourList(this.defaultIndex, this.groupId,this.page_size,this.page)
            }

            if(this.defaultIndex == 3 || this.defaultIndex == 2) {
                this.page_size = this.videoAudioSize
                this.getResourList(this.defaultIndex, this.groupId,this.videoAudioSize,this.page)
            }
            this.getResourceGroup()

        },

        methods: {
            // 打开 模态框
            openDialog(e){
                if(!this.pop_groupId) {
                    this.pop_groupId = 0;
                    this.pop_gname = '未分组'
                }

                if(e == 1){
                    this.uploadLink = "{!! yzWebFullUrl('upload.uploadV3.upload') !!}"+'&upload_type='+'image'+'&tag_id='+ this.pop_groupId
                    this.uploadtype = 1
                    this.dialogTableVisible = true
                }else if(e == 2){
                    this.uploadvideo = "{!! yzWebFullUrl('upload.uploadV3.upload') !!}"+'&upload_type='+'audio'+'&tag_id='+ this.pop_groupId
                    this.uploadtype = 2
                    this.dialogTableVisible = true
                }else{
                    // 3 视频
                    this.uploadvideo = "{!! yzWebFullUrl('upload.uploadV3.upload') !!}"+'&upload_type='+'video'+'&tag_id='+ this.pop_groupId
                    this.uploadtype = 3
                    this.dialogTableVisible = true
                }

            },
            // 上传组件
            submitUpload(){  // 切换生成链接
              if(this.videoimg == null){
                  this.iploadTetxshow = true
              }else{
                setTimeout(()=>{
                        this.uploadInitShow = false
                        this.uploadWinShow = true
                        this.iploadTetxshow = false
                        this.copyLinkShow = true
                        this.iploadShow = false
                        this.putbackInitShow = true
                    },1000)

              }
            },
            // 初始化 上传视频 音频模板
            initList(){
                this.dataList = [];
                this.uploadInitShow = true
                this.uploadWinShow = false
                this.iploadTetxshow = true
                this.copyLinkShow = false
                this.iploadShow = true
                this.putbackInitShow = false
                this.videoimg = null
                this.iploadTetxshow = false
            },
            // 点击返回按钮
            cilckShow(){
               this.initList()
            },
            // 点击复制
            clickCopyUrl(data){
                let url = data;
                let oInput = document.createElement('input');
                oInput.value = url;
                document.body.appendChild(oInput);
                oInput.select(); // 选择对象;
                console.log(oInput.value)
                document.execCommand("Copy"); // 执行浏览器复制命令
                this.$message({
                    message: '已成功复制',
                    type: 'success'
                });
                oInput.remove()
            },
            closeDialog(){   // 关闭dialog回掉
                // this.iploadTetxshow = false
                this.initList()
                this.dataList = []  //清空数组

                if(this.defaultIndex == 1) {
                    this.page_size = 15
                    this.getResourList(this.defaultIndex, this.groupId,this.page_size,this.page)
                }

                if(this.defaultIndex == 3 || this.defaultIndex == 2) {
                    this.page_size = this.videoAudioSize
                    this.getResourList(this.defaultIndex, this.groupId,this.videoAudioSize,this.page)
                }
                this.getResourceGroup()
            },
             // 上传成成功回调   图片
            handleSucesss(response, file, fileLis){
                if(response.result == 1) {
                    // this.getResourceGroup()
                    // let newdataList = []
                    this.videoloading = false;
                    if(response.data.url !== undefined){
                        this.dataList.push(response.data.url)
                        this.dataList.reverse();
                    }
                    this.getResourceGroup();
                    // this.groupingClick(this.groupId, this.gname, )
                    // console.log( '成功', this.dataList)
                }else {
                    this.$message({
                        message: response.msg,
                        type: 'error'
                    });
                }
            },
            //  上传成功回调  视频 音频
            onSuccess(response){
                if(response.result == 1) {
                    this.audioName = response.data.name
                    // console.log(  this.audioName,'onSuccess')
                    this.videoloading = false
                    this.videoimg = response.data.url

                    this.copyTextLink = response.data.url
                    this.getResourceGroup()
                    this.$message({
                        message: '上传成功',
                        type: 'success'
                    });
                }else {
                    this.$message({
                        message: response.msg,
                        type: 'error'
                    });
                }
            },
            //  文件上传时 钩子
            onProgress(event, file, fileList){
                this.videoloading = true
            },

            handlePreview(file){
                this.videoloading = true
                console.log('handlePreview',file)
            },
            // 获取分组列表
            getResourceGroup() {
                // console.log('getResourceGroup',1)
                let that = this
                this.$http.post("{!! yzWebFullUrl('setting.media.tags') !!}", {
                        source_type: this.defaultIndex
                    }).then(response => {
                    if (response.data.result) {
                        that.groupList  = response.data.data
                        // console.log( that.groupList,'getResourceGroup')
                        this.resourceTotal = this.groupList[0].source_count
                        this.loadingData = true
                    } else {
                        this.$message({
                            message: response.data.msg,
                            type: 'error'
                        });
                    }
                }, response => {
                    this.$message({
                        message: response.data.msg,
                        type: 'error'
                    });
                });
            },


            // 获取资源列表
            getResourList(sourceType, tagId,page_size,page, scrollbar) {
                // console.log(tagId, 'getResourList全部',)
                if(tagId === undefined){
                    tagId = ''
                }
               
                let arr = []
                let filterDate={
                    year:null,
                    month:null
                }
                if(this.filterTime){
                    let d=new Date(this.filterTime);
                    filterDate.year=d.getFullYear();
                    filterDate.month=d.getMonth()+1;
                }
                this.$http.post("{!! yzWebFullUrl('setting.media.source') !!}", {
                        source_type: Number(sourceType),
                        tag_id: tagId,
                        pageSize:page_size,
                        page:page,
                        date:filterDate
                    }).then(response => {
                    if (response.data.result) {
                        this.resourceList = response.data.data.data
                        // console.log(response.data,'测试')
                        //   跨域测试
                        // https://img.alicdn.com/imgextra/i2/54199406/O1CN012JLzreAxzn1xhNP_!!54199406.jpg
                        // this.resourceList[0].attachment = 'http://shop-yunzshop-com.oss-cn-hangzhou.aliyuncs.com/image/1032968d4848e9614ef96a7420d90622.png'
                        // console.log(this.resourceList,'this.resourceList')
                        this.page_total= response.data.data.total
                        // this.page_size = response.data.per_page;
                        this.current_page = response.data.current_page;
                        this.resourceList.forEach((item, index) => {
                            item['is_choose'] = 0
                        });
                        this.listLoading = true
                    } else {
                        this.$message({
                            message: response.data.msg,
                            type: 'error'
                        });
                    }
                }, response => {
                    this.$message({
                        message: response.data.msg,
                        type: 'error'
                    });
                });
            },

            // 添加分组
            addGroup(sourceType, groupName) {
                this.$http.post("{!! yzWebFullUrl('setting.media.addTag') !!}", {
                        source_type: this.defaultIndex,
                        title: groupName
                    }).then(response => {
                    if (response.data.result) {
                        this.closePopover()
                        this.$message({
                            message: '添加分组成功',
                            type: 'success'
                        });
                    } else {
                        this.$message({
                            message: response.data.msg,
                            type: 'error'
                        });
                    }
                }, response => {
                    this.$message({
                        message: response.data.msg,
                        type: 'error'
                    });
                });
            },

            // 分组重新命名
            renameGroup(title,id) {
                this.$http.post("{!! yzWebFullUrl('setting.media.renameTag') !!}", {
                        title: title,
                        id:id
                    }).then(response => {
                    if (response.data.result) {
                        this.closePopover()
                        this.$message({
                            message: '分组重新命名成功',
                            type: 'success'
                        });
                    } else {
                        this.$message({
                            message: response.data.msg,
                            type: 'error'
                        });
                    }

                }, response => {
                    this.$message({
                        message: response.data.msg,
                        type: 'error'
                    });
                });
            },

            // 资源重命名
            resourceRename(newName,id) {
                this.$http.post("{!! yzWebFullUrl('setting.media.rename') !!}", {
                        filename: newName,
                        id:id
                    }).then(response => {
                    if (response.data.result) {
                        this.closePopover()
                        this.$message({
                            message: '资源重新命名成功',
                            type: 'success'
                        });
                    } else {
                        this.$message({
                            message: response.data.msg,
                            type: 'error'
                        });
                    }

                }, response => {
                    this.$message({
                        message: response.data.msg,
                        type: 'error'
                    });
                });
            },


            // 分组移动
            moveGroup() {
                this.$http.post("{!! yzWebFullUrl('setting.media.batchMove') !!}", {
                        tag_id: newName,
                        ids:id
                    }).then(response => {
                    if (response.data.result) {
                        this.closePopover()
                        this.$message({
                            message: '资源重新命名成功',
                            type: 'success'
                        });
                    } else {
                        this.$message({
                            message: response.data.msg,
                            type: 'error'
                        });
                    }

                }, response => {
                    this.$message({
                        message: response.data.msg,
                        type: 'error'
                    });
                });
            },

            // resourceIdArr资源id数组
            // groIdArr 分组id数组
            // date时间字符串 all year half_year three_month month
            // sourceType 资源类型，必选
            detel(resourceIdArr,groIdArr,date,sourceType) {
                this.$http.post("{!! yzWebFullUrl('setting.media.batchDelete') !!}", {
                        ids:resourceIdArr,
                        tags:groIdArr,
                        date:date,
                        source_type:sourceType
                    }).then(response => {
                    if (response.data.result) {
                        // this.closePopover()
                        this.$message({
                            message: '删除成功',
                            type: 'success'
                        });
                    } else {
                        this.$message({
                            message: response.data.msg,
                            type: 'error'
                        });
                    }

                }, response => {
                    this.$message({
                        message: response.data.msg,
                        type: 'error'
                    });
                });
            },

            // 批量移动分组
            // tag_id：分组id
            // ids 资源id arrry类型
            removeGroup(groId,id) {
                this.$http.post("{!! yzWebFullUrl('setting.media.batchMove') !!}", {
                      tag_id:groId,
                      ids:id
                    }).then(response => {
                    if (response.data.result) {
                        this.$message({
                            message: response.data.msg,
                            type: 'success'
                        });
                        this.closePopover()
                    } else {
                        this.$message({
                            message: response.data.msg,
                            type: 'error'
                        });
                    }

                }, response => {
                    this.$message({
                        message: response.data.msg,
                        type: 'error'
                    });
                });
            },


            // 删除分组
            // id  分组id 必选
            // moveOrDelete  1移动 2删除  必选
            detelGroup(ids,val) {
                this.$http.post("{!! yzWebFullUrl('setting.media.deleteTag') !!}", {
                      id:ids,
                      moveOrDelete:val
                    }).then(response => {
                    if (response.data.result) {
                        this.closePopover()
                        this.$message({
                            message: '删除成功',
                            type: 'success'
                        });
                    } else {
                        this.$message({
                            message: response.data.msg,
                            type: 'error'
                        });
                    }

                }, response => {
                    this.$message({
                        message: response.data.msg,
                        type: 'error'
                    });
                });
            },

            // 拖拽分组进行排序
            // dragGroup(sort,id) {
            //     this.$http.post('{!! yzWebFullUrl('setting.media.sortTag') !!}', {
            //           id:ids,
            //           moveOrDelete:val
            //         }).then(response => {
            //         if (response.data.result) {

            //         } else {
            //             this.$message({
            //                 message: response.data.msg,
            //                 type: 'error'
            //             });
            //         }

            //     }, response => {
            //         this.$message({
            //             message: response.data.msg,
            //             type: 'error'
            //         });
            //     });
            // },


            // 顶部选项卡的切换事件
            tabClick(typeId) {
                this.filterTime=null; //* 清除选择的筛选日期
                this.defaultIndex = typeId
                window.sessionStorage.setItem('typeId', typeId)
                if(this.defaultIndex == 1) {
                    this.page_size = 15
                    this.getResourList(this.defaultIndex, '',this.page_size,this.page)
                }
                if(this.defaultIndex == 3 || this.defaultIndex == 2) {
                    this.page_size = this.videoAudioSize
                    this.getResourList(this.defaultIndex, '',this.videoAudioSize,this.page)
                }
                this.getResourceGroup()
                window.sessionStorage.removeItem('groupTag')
                this.groupId = ''
                this.gname = ''
                this.pop_groupId = 0;
                this.pop_gname = '未分组'
            },

            groupingClick(id, title, index, scrollbar) {
                if(scrollbar == 'scrollbar'){
                    this.initList();
                    this.pop_groupId = id
                    this.pop_gname = title
                    console.log(id,'tagId',this.defaultIndex)
                    this.uploadLink = "{!! yzWebFullUrl('upload.uploadV3.upload') !!}"+'&upload_type='+'image'+'&tag_id='+ id
                    if(this.defaultIndex == 2){
                        this.uploadvideo = "{!! yzWebFullUrl('upload.uploadV3.upload') !!}"+'&upload_type='+'audio'+'&tag_id='+ id
                        // console.log(this.uploadvideo,'adasd')
                    }else if(this.defaultIndex == 3){
                        this.uploadvideo = "{!! yzWebFullUrl('upload.uploadV3.upload') !!}"+'&upload_type='+'video'+'&tag_id='+ id
                    }
                    return;
                }else {
                    this.groupId = id
                    this.gname = title
                }
                
                

                let groJson  = {id:id,gname:title}
                window.sessionStorage.setItem('groupTag', JSON.stringify(groJson))

                if(this.defaultIndex == 1) {
                    this.page_size = 15

                    this.getResourList(this.defaultIndex, id,this.page_size,this.page, scrollbar)
                }
                if(this.defaultIndex == 3 || this.defaultIndex == 2) {
                    this.page_size = this.videoAudioSize
                    this.getResourList(this.defaultIndex, id,this.page_size,this.page, scrollbar)
                }
                this.groDialogVisible = false
            },

            renameClick(id) {
                this.renameStatus = !this.renameStatus
                this.moreDot = false
                this.renameId = id
                this.$nextTick(() => {
                this.$refs.renameInput[0].focus()
                this.$refs.renameInput[0].select()
                });
            },

            inpNewName(e) {
                this.rName = e
            },

            blurInput(e,id){
                console.log(e,'12345678')

                if(e.target.value == '') {
                    this.$message({
                        message: '分组名不能为空',
                        type: 'error'
                    });
                    return
                }
                this.renameId = ''
                this.resourceRename(e.target.value,id)

            },

            handleClose(done) {
                this.DialogViedoUrl = ''
                this.groId = null
                done()

            },

            adminClick() {
                this.adminDialogVisible = true
            },
            screenViewClick(url) {
                this.fullImgUrl = url,
                this.fullImg = true
            },
            // 分组下拉
            pullDownClick() {
                this.groDialogVisible = true
            },
            handClickImg(val,id) {
                this.moreDot = false
            },

            into(id) {
                this.intoId = id
            },
            out(id) {
                this.moreDot = false
            },

            // 多个选择
            handChecked($event,ind,attachment){
                this.selectIndexArr.push(ind)
                this.checked =$event
                if(this.checked) {
                    this.screenAndDot = true
                } else {
                    this.screenAndDot = false
                }
                let is_all = 0;
                this.resourceList.some((item, index) => {
                        if (item.is_choose == 1) {
                            is_all = true;
                        } else {
                            is_all = false;
                            return true;
                        }
                })
                this.is_all_choose = is_all  //全选
                this.$forceUpdate()
                this.getPitchData()
            },


            //全选
            allChoose($event){
                if($event) {
                    this.resourceList.forEach((item, index) => {
                    item.is_choose = true;
                     })
                } else {
                    this.resourceList.forEach((item, index) => {
                    item.is_choose = false;
                     })
                }
                this.$forceUpdate()
                this.getPitchData()
            },

            // 取消选择
            cancelSelect(){
                this.resourceList.forEach((item, index) => {
                    item.is_choose = false;
                    this.is_all_choose = false
                })
                this.idArr = []
                this.$forceUpdate()
            },

            // 获取选中的数据 权武
            getPitchData() {
                let idArr = []
                // let dataList = []
                this.resourceList.forEach(item => {
                    
                    if(item.is_choose == true) {
                        idArr.push(item.id)
                        // dataList.push(item)
                        // console.log(dataList)
                    }
                })

                this.idArr = idArr
                // this.dataList = dataList
            },

            dialogPlay(url) {
                this.DialogViedoUrl = url
                this.VideoDialogPlay = true;
            },

            changeName() {
                this.renameStatus = false
            },
            renameGroupEdit(id) {
                this.noneGroup = id
                this.renameGroupStatus = true
            },
            detelClick(id) {
            },

            removeClick(id) {
                // let arr = []
                // arr.push(id)
                this.groupName = ''
                this.removeResourcesIdArr = [id]
            },

            // 新建分组
            handAddGroup() {
                if (this.newGroupName == '') {
                    this.$message({
                        message: '分组名不能为空',
                        type: 'error'
                    });
                    return
                }
                this.addGroup(this.defaultIndex, this.newGroupName)
                this.newGroupName = ''
                setTimeout(() => {
                    this.getResourceGroup()
                }, 800);
            },

            handCancelGroup() {
                this.closePopover()
                this.newGroupName = ''
            },

            // 分组重新命名
            EditGroup(id,title) {
                this.adminRnameGroup = title;
                this.groId = id
                this.$nextTick(() => {
                    this.$refs.input[0].focus()
                    this.$refs.input[0].select()
                });
            },

            handBlur(e) {
                this.groId = null
            },
            closePopover() {
                if (document.all) {
                    document.getElementById('multimedia-material').click();
                } else {// 其它浏览器
                    var e = document.createEvent('MouseEvents')
                    e.initEvent('click', true, true)
                    document.getElementById('multimedia-material').dispatchEvent(e)
                }
            },

            getGroId(id) {
                this.manageId = id
            },

            sure() {
               this.detel(this.manageId,this.labelStatus)
               this.closePopover()
            },

            cancel() {
                this.groId = null
                this.adminDialogVisible = false
                this.closePopover()
            },

            inpName($event) {
                console.log($event)
                this.adminRnameGroup = $event;
                if($event == '') {

                }
                this.rName = $event
            },

            changeGroupName(value) {
                this.adminRnameGroup = value;
            },
            inputBlur() {
                // this.groId = null
            },
            sureName(id) {
                this.groId  = id;
                let title = this.adminRnameGroup
                console.log(this.groId,title);

                if(title == '' ) {
                    this.$message({
                        message: '分组名不能为空',
                        type: 'error'
                    });

                } else {
                    this.renameGroup(title,id)
                    setTimeout(() => {
                    this.getResourceGroup()
                    this.groId = null
                }, 100);
                }
                this.groId = null
            },
            popoverSureClick() {
                this.closePopover()
                this.moreOperation = null
            },

            popoverCancelClick() {
                this.closePopover()
                this.moreOperation = null
            },
            handOperation(status) {
                this.moreOperation = true
                this.moreStatus = status

            },
            enter(e,id) {
                this.resourceRename(e.target.value,id)
                this.renameId = ''
            },

            moveGroupClick(id,title) {
                this.moveGroupId = id
                this.groupName = title

            },

            batchMove() {
                this.groupName = ''
                this.batchMoveStatus = true
            },

            // 移动分组的确定
            removeSure(){
                if(this.moveGroupId === '') {
                    this.$message({
                        message: '请选择其他分组',

                    })
                    this.closePopover()
                    return
                }
                if(this.batchMoveStatus) {//批量移动
                    this.removeGroup(this.moveGroupId,this.idArr)
                    setTimeout(() => {
                        this.getResourceGroup()
                        this.getAgain()
                        this.resourceList.forEach((item, index) => {
                            item.is_choose = 0
                        });
                        this.$forceUpdate()
                        this.allSelectStatus = false
                        this.idArr = []
                    }, 800);
                    this.closePopover()
                    return
                }
                // console.log(this.removeResourcesIdArr)
                this.removeGroup(this.moveGroupId,this.removeResourcesIdArr)
                setTimeout(() => {
                    this.getResourceGroup()
                    this.getAgain()
                },800)

            },

            slectRadio($event) {
                this.labelStatus = $event
            },

            // 分页
            currentChange(val) {
                this.valPage = val
                if(this.defaultIndex == 1) {
                    this.page_size = 15
                    // this.groupId = this.groupId?this.groupId:''
                    this.getResourList(this.defaultIndex, this.groupId,this.page_size,val)
                }
                if(this.defaultIndex == 3 || this.defaultIndex == 2) {
                    this.page_size = this.videoAudioSize
                    this.groupId = this.groupId?this.groupId:''
                    this.getResourList(this.defaultIndex, this.groupId,this.videoAudioSize,val)
                }
                this.is_all_choose = false
            },
            // 单选删除
            sureDetel(id,item) {
                let arr = []
                arr.push(id)
                this.detel(arr,'','',this.defaultIndex)
                this.closePopover()
                // setTimeout(() => {
                //     this.resourceList = this.resourceList.filter(item => item.id != id)
                // }, 800);
            },

            // 批量删除选中的资源  权武
            sureSelectDetel() {
                // console.log(this.idArr,'sureSelectDetel' ,this.defaultIndex)
                this.detel(this.idArr,'','',this.defaultIndex)
                this.getAgain()
                this.idArr = []
                this.getResourceGroup()
                this.closePopover()

            },
            // 批量下载功能
            packageImages(){
                
            },
            rangeChange(val){
                this.timeSelect= val
            },

            // 批量删除的选择分组
            moreSelectGro(arr) {
                // console.log(arr,'141234134566');
                this.checkList = arr
            },
            // 批量开始删除
            startDetel() {
                if(this.checkList.length <= 0) {
                    this.$message({
                    message: '请选择分组',
                    type: 'error'
                    })
                    return
                }
                if(this.timeSelect == '') {
                    this.$message({
                    message: '请选择时间范围',
                    type: 'error'
                    })
                return

                }
                this.detel('',this.checkList,this.timeSelect,this.defaultIndex)
                this.detelDialogVisible = false
                setTimeout(() => {
                    this.getAgain()
                    this.getResourceGroup()

                },800)
                // location.reload(true)
            },
            ManageSureDetel() {
                if(this.labelStatus == '') {
                    this.$message({
                        message: '请选择删除类型',
                        type: 'error'
                    })
                    return
                }
                this.detelGroup(this.manageId,this.labelStatus)
                setTimeout(() => {
                    this.getResourceGroup()
                }, 800);
                this.groId = null
            },

            // 重新获取资源
            getAgain() {
                if(this.defaultIndex == 1) {
                this.page_size = 15
                this.groupId = this.groupId?this.groupId:''
                this.getResourList(this.defaultIndex, this.groupId,this.page_size,this.valPage)
                }
                if(this.defaultIndex == 3 || this.defaultIndex == 2) {
                    this.page_size = this.videoAudioSize
                    this.groupId = this.groupId?this.groupId:''
                    this.getResourList(this.defaultIndex, this.groupId,this.videoAudioSize,this.valPage)
                }
            },

            TableDetel(id) {

            },

            tableDetel(id) {
                let arr = []
                arr.push(id)
                this.detel(arr,'','',this.defaultIndex)
            },

            aduioClick(scope,id,ind,is_choose) {
                // console.log(scope,'1234134543514')
                this.playOrPuse = ind
                var myAudio = document.querySelectorAll(".myAudio")
                if(is_choose == 0) {
                    let  arr = this.resourceList.map(item => {
                        if(item.id == id) {
                            item.is_choose = 1
                        }
                             return item
                        })
                        this.resourceList = arr
                        myAudio[ind].load()
                        let playPromise = myAudio[ind].play()
                        if (playPromise !== undefined) {
                            playPromise.then(() => {
                                myAudio[ind].play()
                                // console.log(myAudio[ind].paused,'000000000000000000')
                            }).catch(()=> {

                            })
                        }
                } else {
                    let  arr = this.resourceList.map(item => {
                       if(item.id == id) {
                           item.is_choose = 0
                       }
                       return item
                   })
                   this.resourceList = arr
                   setTimeout(() => {
                        myAudio[ind].pause()
                        // console.log(myAudio[ind].paused,'1231413413432432')
                    }, 500);

                }
            },
            //设置禁止拖拽
            setJY() {
                this.disabled = true;
            },
            //设置启用拖拽
            setQY() {
                this.disabled = false;
            },
            onStart() {
                this.drag = true;
            },
            //开始拖拽事件
            onStart() {
                this.drag = true;
            },
            //拖拽结束事件
            onEnd() {
                this.drag = false;
                // console.log(this.groupList);
                this.dragId = []
                this.groupList.map(item => {
                    this.dragId.push(item.id)
                })

            },

            //move回调方法
            onMove(e) {
                //不允许停靠
                if (e.relatedContext.element.id == '' || e.relatedContext.element.id == 0) return false;
                //不允许拖拽
                if (e.draggedContext.element.id == '' || e.draggedContext.element.id == 0  ) return false;
                return true;
            },

            // 转换音视频的时间
            convertTime() {

            },

            //  上传组件 方法 参数
            // changeProp(val) {
            //     if(val == true) {
            //             this.uploadShow = false;
            //         }
            //         else {
            //             this.uploadShow = true;
            //         } 
            // },
            // sureImg(name, image, imageUrl){
            //     // 数据上传成功 刷新数据
            //     this.getAgain()
             
            //     this.$message({
            //         message: '添加成功',
            //         type: 'success'
            //     });
           
                
            //     console.log(name, image, imageUrl,'sureImg')
            // },
            // openUpload(str,type,sel){
            //     // console.log('openUpload')
            //     this.chooseImgName = str;
            //     this.uploadShow = true;
            //     this.type = type;
            //     // this.selNum = sel;
            // }
            // //模拟上传
            // changeProp(val,file) {
            //     if(val == true) {
            //         this.uploadShow = false;
            //     }
            //     else {
            //         this.uploadShow = true;
            //     }
            // },

            // // 接受子组件传送过来的视频地址
            // handleVideo(url) {
            //     console.log(url);
            // },

            // sureImg(val,file) {
            //     console.log(file)
            //     if(val == true) {
            //         this.uploadShow = false;
            //     }
            //     else {
            //         this.uploadShow = true;
            //     }
            // },
            // openUploadImg(type){
            //     // 把值传到子组件
            //     this.uploadShow = true
            //     this.type = type;
            // },

        },

    });

/** 
    require.config({
        paths: {
            jszip    : "/addons/yun_shop/resources/views/setting/media/js/jszip",
            FileSaver: "/addons/yun_shop/resources/views/setting/media/js/FileSaver",
        },
    });
        //  微擎版多了 /addons/yun_shop

    require(['jszip', 'FileSaver',], function (JSZip, FileSaver){

        function packageImages(newImgs) {

            var imgs = newImgs
            var imgsSrc = [];
            var imgBase64 = [];
            var imageSuffix = [];//图片后缀
            var zip = new JSZip();
            var img = zip.folder("images");  // 文件存放名字
            for (var i = 0; i < imgs.length; i++) {  //遍历所有图片
                var src = imgs[i]
                var suffix = src.substring(src.lastIndexOf("."));  // 后缀名
                imageSuffix.push(suffix);   // 存放数字

                getBase64(imgs[i])
                    .then(function (base64) {
                        imgBase64.push(base64.substring(22));
                    }, function (err) {
                        console.log(err,'err');//打印异常信息
                    });


            }
            function tt() {

                setTimeout(function () {


                        if (imgs.length == imgBase64.length) {
                        for (var i = 0; i < imgs.length; i++) {
                            img.file(i + imageSuffix[i], imgBase64[i], { base64: true });
                        }
                        zip.generateAsync(
                            { type: 'blob',}
                            ).then(function (content) {
                            saveAs(content, "images.zip");
                            }).catch(function(err){
                                 console.log(err,'报错了嘛')
                            })
                    } else {
                        tt();
                    }
                }, 100);


            }

            //传入图片路径，返回base64
            function getBase64(img) {
                function getBase64Image(img, width, height) {//width、height调用时传入具体像素值，控制大小 ,不传则默认图像大小

                    var canvas = document.createElement("canvas");

                    canvas.width = width ? width : img.width;
                    canvas.height = height ? height : img.height;

                    var ctx = canvas.getContext("2d");

                    ctx.drawImage(img, 0, 0, canvas.width, canvas.height);

                    var dataURL = canvas.toDataURL();
                    return dataURL;
                }
                    var image = new Image();
                    image.crossOrigin = 'Anonymous';
                    image.src = img;
                    var deferred = $.Deferred();
                        if (img) {
                        image.onload = function () {
                            deferred.resolve(getBase64Image(image));//将base64传给done上传处理
                        }
                        return deferred.promise();  //问题要让onload完成后再return sessionStorage['imgTest']
                    }
            }
            tt();
            newImgList = []

        }


                $("body").on('click', '#packageImages',function(){
                    var newImgList = []
                            vm.$confirm('确定要下载选中的素材吗', '提示', {
                            confirmButtonText: '确定',
                            cancelButtonText: '取消',
                            }).then(() => {
                                vm.$message({
                                    type: 'success',
                                    message: '正在下载请稍等!'
                                });
                                $.each(vm.$data.resourceList,function(index,item){
                                        if(item.is_choose == true){
                                            newImgList.push(item.attachment)
                                            packageImages(newImgList)
                                        }
                                })
                                }).catch(() => {
                                    vm.$message({
                                        type: 'info',
                                        message: '已取消下载'
                                    });
                                });
                })

    });
*/

</script>
@include('public.admin.uploadMultimediaImg')
@endsection