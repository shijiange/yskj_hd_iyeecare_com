@extends('layouts.base')

@section('content')
    <link rel="stylesheet" type="text/css" href="{{static_url('yunshop/goods/vue-goods1.css')}}"/>
    <style>
        .main-panel{
            margin-top:50px;
        }
        .main-panel #re_content {
            padding: 10px;
        }
        .panel{
            margin-bottom:10px!important;

            padding-left: 20px;
            border-radius: 10px;
        }
        .panel .active a {
            background-color: #29ba9c!important;
            border-radius: 18px!important;
            color:#fff;
        }
        .panel a{
            border:none!important;
            background-color:#fff!important;
        }
        .content{
            background: #eff3f6;
            padding:10px!important;
        }

        .con{
            padding-bottom:40px;
            position:relative;
            border-radius: 8px;
            min-height:100vh;
        }
        .con .setting .block{
            padding:10px;
            background-color:#fff;
            border-radius: 8px;
        }
        .con .setting .block .title{
            font-size:18px;
            margin-bottom:15px;
            display:flex;
            align-items:center;
        }
        .confirm-btn{
            width: calc(100% - 266px);
            position:fixed;
            bottom:0;
            right:0;
            margin-right:10px;
            line-height:63px;
            background-color: #ffffff;
            box-shadow: 0px 8px 23px 1px
            rgba(51, 51, 51, 0.3);
            background-color:#fff;
            text-align:center;
        }
        b{
            font-size:14px;
        }
        .upload-boxed .el-icon-close {
            position: absolute;
            top: -5px;
            right: -5px;
            color: #fff;
            background: #333;
            border-radius: 50%;
            cursor: pointer;
        }
    </style>
    <div id='re_content' >
        @include('layouts.newTabs')
        <div class="con">
            <el-form ref="form" :model="form" label-width="15%">
            <div class="setting">

                    <div class="block">
                        <div class="title">
                            <span style="width: 4px;height: 18px;background-color: #29ba9c;margin-right:15px;display:inline-block;"></span>
                            <b>????????????
                            </b></div>
                        <el-form-item label="??????????????????">
                            <div class="upload-box" @click="openUpload('headimg',1,'one')" v-if="!form.headimg_url">
                                <i class="el-icon-plus" style="font-size:32px"></i>
                            </div>
                            <div @click="openUpload('headimg',1,'one')" class="upload-boxed" v-if="form.headimg_url" style="height:150px;">
                                <img :src="form.headimg_url" alt="" style="width:150px;height:150px;border-radius: 5px;cursor: pointer;">
                                <div class="upload-boxed-text">??????????????????</div>
                                <i class="el-icon-close" @click.stop="clearImg('headimg')" title="??????????????????"></i>
                            </div>
                            <div class="tip">??????????????????????????????????????????>????????????>?????????????????????</div>

                        </el-form-item>
                        <!-- <upload-img :upload-show="uploadShow" :name="chooseImgName" @replace="changeProp" @sure="sureImg"></upload-img> -->
                        <upload-multimedia-img :upload-show="uploadShow" :type="type" :name="chooseImgName" :sel-Num="selNum"  @replace="changeProp" @sure="sureImg"></upload-multimedia-img>
                        <el-form-item label="????????????">
                            <template>
                                <el-switch
                                        v-model="form.get_register"
                                        active-value="0"
                                        inactive-value="1"
                                >
                                </el-switch>
                            </template>
                        </el-form-item>
                        <el-form-item label="?????????????????????">
                            <template>
                                <el-switch
                                        v-model="form.mobile_login_code"

                                        active-value="1"
                                        inactive-value="0"
                                >
                                </el-switch>
                            </template>
                            <div>??????????????????????????????????????????????????????????????????????????????????????????</div>
                        </el-form-item>
                        <el-form-item label="?????????????????????">
                            <template>
                                <el-radio-group v-model="form.wechat_login_mode">
                                    <el-radio label="1">????????????</el-radio>
                                    <el-radio label="0">??????????????????</el-radio>
                                </el-radio-group>
                            </template>
                            <div>?????????????????????????????????????????????????????????????????????????????????????????????WAP??????????????????????????????????????????</div>
                        </el-form-item>
                        <el-form-item label="??????????????????" class="bind-phone">
                            <template>
                                <el-radio-group v-model="form.is_bind_mobile">
                                    <el-radio label="0">???</el-radio>
                                    <el-radio label="1">??????????????????</el-radio>
                                    <el-radio label="2">????????????????????????</el-radio>
                                    <el-radio label="3">????????????????????????</el-radio>
                                    <el-radio label="4">??????????????????????????????</el-radio>
                                </el-radio-group>
                            </template>
                            <div style="font-size:12px;">???????????????????????????????????????????????????????????????????????????</div>
                        </el-form-item>
                        <el-form-item label="???????????????">
                            <template>
                                <el-switch
                                        v-model="form.is_custom"

                                        active-value="1"
                                        inactive-value="0"
                                >
                                </el-switch>
                            </template>
                            <div style="font-size:12px;">????????????????????????????????????--???????????????????????????????????????????????????</div>
                        </el-form-item>
                        <el-form-item label="???????????????????????????"  >
                            <el-input v-model="form.custom_title" placeholder="????????????????????????????????????" style="width:70%;"></el-input>
                        </el-form-item>
                        <el-form-item label="???????????????" v-if="is_diyform == true">
                            <template>
                                <el-select v-model="form.form_id"  @change="getVal" name="form_id">
                                    <el-option

                                            v-for="item in  diyForm"
                                            :label="item.title"
                                            :value="item.id">
                                    </el-option>
                                </el-select>
                            </template>
                        </el-form-item>
                        <el-form-item label="????????????????????????">
                            <template>
                                <el-switch
                                        v-model="form.show_balance"

                                        active-value="0"
                                        inactive-value="1"
                                >
                                </el-switch>
                            </template>
                            <div style="font-size:12px;">???????????????????????????????????????????????????</div>
                        </el-form-item>
                        <el-form-item label="????????????????????????">
                            <template>
                                <el-switch
                                        v-model="form.show_point"

                                        active-value="0"
                                        inactive-value="1"
                                >
                                </el-switch>
                            </template>
                            <div style="font-size:12px;">????????????????????????????????????????????????</div>
                        </el-form-item>
                        <el-form-item label="????????????????????????ID">
                            <template>
                                <el-switch
                                        v-model="form.show_member_id"

                                        active-value="0"
                                        inactive-value="1"
                                >
                                </el-switch>
                            </template>
                            <div style="font-size:12px;">???????????????????????????????????????ID???</div>
                        </el-form-item>
                    </div>
                    <div style="background: #eff3f6;width:100%;height:15px;"></div>
                    <div class="block">
                        <div class="title"><span style="width: 4px;height: 18px;background-color: #29ba9c;margin-right:15px;display:inline-block;"></span><b>??????????????????</b><span style="margin-left:15px;color:#999;font-size:12px;">?????????????????????>??????????????????????????????????????????</span></div>

                        <el-form-item label="????????????????????????"  >
                            <el-input v-model="form.level_name" placeholder="???????????????????????????" style="width:70%;"></el-input>
                            <div style="font-size:12px;">????????????????????????????????????????????????????????????</div>
                        </el-form-item>
                        <el-form-item label="????????????????????????????????????" >
                            <template>
                                <el-switch
                                        v-model="form.display_page"

                                        active-value="1"
                                        inactive-value="0"
                                >
                                </el-switch>
                            </template>
                            <div style="font-size:12px;">????????? ???????????????????????????????????????????????????????????????????????????????????????????????????</div>
                        </el-form-item>
                        <el-form-item label="????????????????????????">
                            <template>
                                <el-radio-group v-model="form.level_type">
                                    <el-radio label="0">????????????</el-radio>
                                    <el-radio label="1">????????????</el-radio>
                                    <el-radio label="2">??????????????????</el-radio>
                                    <el-radio label="3">????????????(??????+??????+??????)</el-radio>
                                    <el-radio label="4">?????????????????????</el-radio>
                                </el-radio-group>
                            </template>
                        </el-form-item>
                        <el-form-item label=" ">
                            <template>
                                <el-radio-group v-model="form.level_after">
                                    <el-radio label="1">?????????</el-radio>
                                    <el-radio label="0">?????????</el-radio>

                                </el-radio-group>
                            </template>
                            <div style="font-size:12px;">?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</div>
                        </el-form-item>
                        <el-form-item label="????????????????????????" >
                            <template>
                                <el-switch
                                        v-model="form.term"

                                        active-value="1"
                                        inactive-value="0"
                                >
                                </el-switch>
                            </template>
                        </el-form-item>
                        <el-form-item label="?????????????????????????????? ">
                            <template>
                                <el-radio-group v-model="form.level_discount_calculation">
                                    <el-radio label="0">????????????</el-radio>
                                    <el-radio label="1">??????????????????</el-radio>

                                </el-radio-group>
                            </template>
                            <div style="font-size:12px;"> ????????????????????????????????????10??????????????????= ???????????? * (1 - ?????????/10 ) <br/>
                                ?????????????????????????????????????????????999%, ???????????? = ??????????????? * (??????/100) <br/></div>
                        </el-form-item>
                        <el-form-item label="????????????????????????" >
                            <template>
                                <el-switch
                                        v-model="form.discount"
                                        active-value="1"
                                        inactive-value="2"
                                >
                                </el-switch>
                            </template>
                        </el-form-item>
                        <el-form-item label="?????????" >
                            <template>
                                <el-switch
                                        v-model="form.vip_price"
                                        active-value="1"
                                        inactive-value="2"
                                >
                                </el-switch>
                            </template>
                            <div style="font-size:12px;">?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? <br/></div>
                        </el-form-item>
                        {{--<el-form-item label="???????????????????????????" >--}}
                            {{--<template>--}}
                                {{--<el-switch--}}
                                        {{--v-model="form.added"--}}
                                        {{--active-value="1"--}}
                                        {{--inactive-value="2"--}}
                                {{-->--}}
                                {{--</el-switch>--}}
                            {{--</template>--}}

                        {{--</el-form-item>--}}
                    </div>
                    <div style="background: #eff3f6;width:100%;height:15px;"></div>
                    <div class="block">
                        <div class="title"><span style="width: 4px;height: 18px;background-color: #29ba9c;margin-right:15px;display:inline-block;"></span><b>?????????</b></div>

                        <el-form-item label="?????????" >
                            <template>
                                <el-switch
                                        v-model="form.is_invite"

                                        active-value="1"
                                        inactive-value="0"
                                >
                                </el-switch>
                            </template>
                        </el-form-item>
                        <el-form-item label="?????????????????????" >
                            <template>
                                <el-switch
                                        v-model="form.required"

                                        active-value="1"
                                        inactive-value="0"
                                >
                                </el-switch>
                            </template>
                        </el-form-item>
                        <el-form-item label="???????????????"  >
                            <el-input v-model="form.default_invite" placeholder="???????????????" style="width:70%;"></el-input>
                        </el-form-item>
                        <el-form-item label="????????????" >
                            <template>
                                <el-switch
                                        v-model="form.invite_page"

                                        active-value="1"
                                        inactive-value="0"
                                >
                                </el-switch>
                            </template>
                            <div style="font-size:12px;">????????? ?????????????????????????????????????????????????????????</div>
                        </el-form-item>
                        <el-form-item label="??????????????????????????????" >
                            <template>
                                <el-switch
                                        v-model="form.is_bind_invite"

                                        active-value="1"
                                        inactive-value="0"
                                >
                                </el-switch>
                            </template>
                            <div style="font-size:12px;">????????? ??????????????????????????????????????????????????????</div>
                        </el-form-item>
                    </div>
            </div>
            <div class="confirm-btn">
                <el-button type="primary" @click="submit">??????</el-button>
            </div>
            </el-form>
        </div>

    </div>
    </div>
    @include('public.admin.uploadMultimediaImg')
    <script>
        var vm = new Vue({
            el: "#re_content",
            delimiters: ['[[', ']]'],
            data() {
                return {
                    uploadShow:false,
                    chooseImgName:'',
                    uploadListShow:false,
                    chooseImgListName:'',
                    activeName: 'one',
                    diyFormData : '',
                    is_diyform : false,
                    diyForm : [],
                    form:{
                        headimg:'',
                        mobile_login_code:'0',
                        wechat_login_mode:'0',
                        is_bind_mobile:'0',
                        is_custom:'0',
                        custom_title:'',
                        show_balance:'0',
                        show_point:'0',
                        show_member_id:'0',
                        is_invite:'0',
                        required:'0',
                        default_invite:'',
                        invite_page:'0',
                        is_bind_invite:'0',
                        term:'0',
                        discount:'1',
                        vip_price:'2',
                        // added:'1',
                        display_page:'0',
                        level_type:'0',
                        level_after:'0',
                        form_id:'',
                        get_register: 1,
                        level_name:'????????????',
                        level_discount_calculation:'0'
                    },
                    type:'',
                    selNum:'',
                }
            },
            mounted () {
                this.getData();
            },
            methods: {
                openUpload(str,type,sel) {
                    this.chooseImgName = str;
                    this.uploadShow = true;
                    this.type = type
                    this.selNum = sel
                },
                changeProp(val) {
                    if(val == true) {
                        this.uploadShow = false;
                    }
                    else {
                        this.uploadShow = true;
                    }
                },
                sureImg(name,uploadShow,fileList) {
                    
                    if(fileList.length <= 0) {
                        return 
                    }
                    console.log(name)
                    console.log(fileList)
                    this.form[name] =fileList[0].attachment;
                    this.form[name+'_url'] = fileList[0].url;
                    console.log(this.form[name],'aaaaa')
                    console.log( this.form[name+'_url'],'bbbbb')
                },
                getData(){
                    this.$http.post('{!! yzWebFullUrl('setting.shop.member') !!}').then(function (response){
                        if(response.data.data.set){
                            for(let i in response.data.data.set){
                                this.form[i]=response.data.data.set[i]
                            }

                        }
                        this.is_diyform=response.data.data.is_diyform
                        this.diyForm=response.data.data.diyForm
                        this.diyForm.unshift({id:'',title:'???????????????'})
                    },function (response) {
                        this.$message({message: response.data.msg,type: 'error'});
                    })
                },
                clearImg(str,type,index) {
                    if(!type) {
                        this.form[str] = "";
                        this.form[str+'_url'] = "";
                    }
                    else {
                        this.form[str].splice(index,1);
                        this.form[str+'_url'].splice(index,1);
                    }
                    this.$forceUpdate();
                },
                submit() {
                    this.getInfoSub()
                },
                getVal(val){
                    this.form.form_id=val
                    this.$forceUpdate()
                },
                getInfoSub(){
                    let that = this;
                    let loading = that.$loading({target:document.querySelector(".content"),background: 'rgba(0, 0, 0, 0)'});
                    that.$http.post('{!! yzWebFullUrl('setting.shop.checkInviteCode') !!}',{'invite_code':that.form.default_invite}).then(function (response){
                        if (response.data.result) {
                            // loading.close();
                            // location.reload();
                            that.$http.post('{!! yzWebFullUrl('setting.shop.member') !!}',{'member':that.form}).then(function (response){
                                if (response.data.result) {
                                    that.$message({message:  response.data.msg,type: 'success'});
                                    loading.close();
                                    location.reload();
                                }else {
                                    that.$message({message: response.data.msg,type: 'error'});
                                    loading.close();
                                }
                            },function (response) {
                                that.$message({message: response.data.msg,type: 'error'});
                            })
                        }else {
                            this.$message({message: response.data.msg,type: 'error'});
                            loading.close();
                        }
                    },function (response) {
                        this.$message({message: response.data.msg,type: 'error'});
                    })

                }

            },
        });
    </script>
@endsection('content')
