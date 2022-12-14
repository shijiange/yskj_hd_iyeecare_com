@extends('layouts.base')
@section('title', '商品评论管理')
@section('content')
<link rel="stylesheet" type="text/css" href="{{static_url('yunshop/goods/vue-goods1.css')}}" />
<style>
    .edit-i{display:none;}
    .el-table_1_column_2:hover .edit-i{font-weight:900;padding:0;margin:0;display:inline-block;}
    .el-tabs__item,.is-top{font-size:16px}
    .el-tabs__active-bar { height: 3px;}
    .description .el-form-item__label{line-height:24px}
</style>
<div class="all">
    <div id="app" v-cloak>
        <div class="vue-nav" style="margin-bottom:15px">
            <el-tabs v-model="activeName" @tab-click="handleClick">
                <el-tab-pane label="基础设置" name="1"></el-tab-pane>
                <el-tab-pane label="评价列表" name="2"></el-tab-pane>
                <el-tab-pane label="审核列表" name="3"></el-tab-pane>
            </el-tabs>
        </div>
        <div class="vue-head">
            <div class="vue-main-title" style="margin-bottom:20px">
                <div class="vue-main-title-left"></div>
                <div class="vue-main-title-content">商品评论列表（ [[total]] 条）</div>
                <div class="vue-main-title-button">
                    <el-button type="primary" plain icon="el-icon-plus" size="small" @click="addModal">新增评论</el-button>
                </div>
            </div>
            <div class="vue-search">
                <el-form :inline="true" :model="search_form" class="demo-form-inline">
                    <el-form-item label="">
                        <el-input v-model="search_form.keyword" placeholder="商品标题"></el-input>
                    </el-form-item>
                    <el-form-item label="审核时间">
                        <el-date-picker
                                v-model="search_form.audit_time_scope"
                                type="datetimerange"
                                range-separator="至"
                                start-placeholder="开始时间"
                                end-placeholder="结束时间"
                                :default-time="['00:00:00', '23:59:59']"
                                value-format="yyyy-MM-dd HH:mm:ss"
                                @change="onDateRangeChange"
                                align="right">
                        </el-date-picker>
                    </el-form-item>
                    <el-form-item label="">
                        <el-input v-model="search_form.audit_operator" placeholder="审核人"></el-input>
                    </el-form-item>
                    <el-form-item label="评论时间">
                        <el-date-picker
                                v-model="search_form.create_time_scope"
                                type="datetimerange"
                                range-separator="至"
                                start-placeholder="开始时间"
                                end-placeholder="结束时间"
                                :default-time="['00:00:00', '23:59:59']"
                                value-format="yyyy-MM-dd HH:mm:ss"
                                @change="onDateRangeChange"
                                align="right">
                        </el-date-picker>
                    </el-form-item>
                    <el-form-item label="">
                        <el-input v-model="search_form.content" placeholder="评论内容"></el-input>
                    </el-form-item>
                    <el-form-item label="">
                        <el-input v-model="search_form.uid" placeholder="会员编号"></el-input>
                    </el-form-item>

                    <el-form-item label="">
                        <el-select v-model="search_form.fade" clearable placeholder="全部评价类型">
                            <el-option
                                    v-for="(item,index) in options"
                                    :key="item.id"
                                    :label="item.name"
                                    :value="item.id">
                            </el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="是否助手评价">
                        <el-select v-model="search_form.is_helper" clearable  placeholder="全部">
                            <el-option
                                    v-for="(item,index) in {1:'是',0:'否'}"
                                    :key="index"
                                    :label="item"
                                    :value="index">
                            </el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="评论类型">
                        <el-select v-model="search_form.type" clearable placeholder="全部">
                            <el-option
                                    v-for="(item,index) in {1:'评论',2:'回复',3:'追评'}"
                                    :key="index"
                                    :label="item"
                                    :value="index">
                            </el-option>
                        </el-select>
                    </el-form-item>
                     <el-form-item label="">
                        <el-select v-model="search_form.defaultpraise" clearable placeholder="是否包含默认好评">
                            <el-option label="包含默认好评" value="1"></el-option>
                            <el-option label="不包含默认好评" value="2"></el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item label="">
                        <el-button type="primary" @click="search(1)">搜索</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </div>
        <div class="vue-main">
            <div class="vue-main-form">
                <el-table :data="list" style="width: 100%" stripe>
                    <el-table-column label="商品信息" width="200">
                        <template slot-scope="scope">
                            <div v-if="scope.row.goods" style="display:flex;align-items: center">
                                <img v-if="scope.row.goods.thumb" :src="scope.row.goods.thumb" onerror="this.src='{{static_url("resource/images/nopic.jpg")}}'; this.title='图片未找到.'" style="width:50px;height:50px"></img>
                                <div style="margin-left:10px">[[scope.row.goods.title]]</div>
                            </div>
                        </template>
                    </el-table-column>
                    <el-table-column label="评论类型" prop="type_name"></el-table-column>
                    <el-table-column label="评论内容" type="expand" width="100">
                        <template slot-scope="scope">
                            <el-form label-position="left">
                                <el-form-item label="评论图片" v-if="scope.row&&scope.row.images&&scope.row.images.length>0">
                                    <div v-for="(item1,index1) in scope.row.images" :key="index1" style="margin:5px 2px;display:inline-block">
                                        <el-image
                                                style="width:50px;height:50px"
                                                :src="item1"
                                                fit="contain"
                                                @click="openBig(scope.row.images,index1)"
                                        ></el-image>
                                    </div>
                                </el-form-item>
                                <el-form-item label="评论内容">
                                    [[ scope.row.content ]]
                                </el-form-item>
                            </el-form>
                        </template>
                    </el-table-column>
                    <el-table-column label="评论时间" align="center" prop="created_at" width="200"></el-table-column>
                    <el-table-column label="会员编号" prop="uid"></el-table-column>
                    <el-table-column label="评价者" width="200">
                        <template slot-scope="scope">
                            <div style="display:flex;align-items: center">
                                <img v-if="scope.row.head_img_url" :src="scope.row.head_img_url" onerror="this.src='{{static_url("resource/images/nopic.jpg")}}'; this.title='图片未找到.'" style="width:50px;height:50px"></img>
                                <div style="margin-left:10px">[[scope.row.nick_name]]</div>
                            </div>
                        </template>
                    </el-table-column>
                    <el-table-column label="评分等级" align="center" width="150">
                        <template slot-scope="scope">
                            <div>
                                <el-rate v-model="scope.row.level" disabled show-score></el-rate>
                            </div>
                        </template>
                    </el-table-column>

                    <el-table-column label="是否助手评价" align="center">
                        <template slot-scope="scope">
                            [[scope.row.is_helper == 0 ? '否' : '是']]
                        </template>
                    </el-table-column>
                    <el-table-column label="审核人" align="center" prop="audit_operator"></el-table-column>
                    <el-table-column label="审核时间" align="center" prop="audit_time" width="200"></el-table-column>

                    <el-table-column label="显示" align="center">
                        <template slot-scope="scope">
                            <el-switch
                                    v-model="scope.row.is_show"
                                    :active-value="1" :inactive-value="0"
                                    active-color="#13ce66"
                                    @change="Switch2(scope,'show')">
                            </el-switch>
                        </template>
                    </el-table-column>

                    <el-table-column label="置顶" align="center">
                        <template slot-scope="scope">
                            <el-switch
                                    v-model="scope.row.is_top"
                                    :active-value="1" :inactive-value="0"
                                    active-color="#13ce66"
                                    @change="Switch2(scope,'top')">
                            </el-switch>
                        </template>
                    </el-table-column>
                    
                    <el-table-column prop="refund_time" label="操作" align="center" width="180" fixed="right" >
                        <template slot-scope="scope">
                            <!-- <el-link v-if="scope.row.uid" type="warning" :underline="false" :href="'{{ yzWebUrl('goods.comment.reply-view', array('id' => '')) }}'+[[scope.row.id]]" class="el-link-edit el-link-edit-middle">
                                进行回复
                            </el-link>
                            <el-link v-else type="warning" :underline="false" :href="'{{ yzWebUrl('goods.comment.edit-view', array('id' => '')) }}'+[[scope.row.id]]" class="el-link-edit el-link-edit-middle">
                                修改评价
                            </el-link>

                            <el-link type="warning" :underline="false" :href="'{{ yzWebUrl('goods.comment.edit-view', array('goods_id' => '')) }}'+[[scope.row.goods_id]]" title="添加此商品评论" class="el-link-edit el-link-edit-middle">
                                添加评价
                            </el-link>
                            <el-link type="warning" :underline="false" @click="del(scope.row.id,scope.$index)" class="el-link-edit el-link-edit-end">
                                删除
                            </el-link> -->
                            <el-link v-if="scope.row.uid" title="进行回复" :underline="false" :href="'{{ yzWebUrl('goods.comment.reply-view', array('id' => '')) }}'+[[scope.row.id]]" style="width:50px;">
                                <i class="iconfont icon-supplier_release"></i>
                            </el-link>
                            <el-link v-else title="修改评价" :underline="false" :href="'{{ yzWebUrl('goods.comment.edit-view', array('id' => '')) }}'+[[scope.row.id]]" style="width:50px;">
                                <i class="iconfont icon-ht_operation_edit"></i>
                            </el-link>
                            <el-link title="添加评价" :underline="false" :href="'{{ yzWebUrl('goods.comment.edit-view', array('goods_id' => '')) }}'+[[scope.row.goods_id]]" style="width:50px;">
                                <i class="iconfont icon-ht_operation_add"></i>
                            </el-link>
                            <el-link title="删除评论" :underline="false" @click="del(scope.row.id,scope.$index)" style="width:50px;">
                                <i class="iconfont icon-ht_operation_delete"></i>
                            </el-link>
                        </template>
                    </el-table-column>
                </el-table>
            </div>
        </div>
        <!-- 分页 -->
        <div class="vue-page" v-if="total>0">
            <el-row>
                <el-col align="right">
                    <el-pagination layout="prev, pager, next,jumper" @current-change="search" :total="total"
                        :page-size="per_page" :current-page="current_page" background
                        ></el-pagination>
                </el-col>
            </el-row>
        </div>
        <el-dialog :visible.sync="big_img_show" width="800px" height="800px" center>
            <div>
                <el-carousel trigger="click" height="800px" :initial-index="big_img_index" :autoplay="false">
                    <el-carousel-item v-for="item,index in big_img_list" :key="index">
                        <div style="text-align:center;width:800px;height:800px;">
                            <el-image
                                    style="max-width: 100%;max-height:100%;"
                                    :src="item"
                                    fit="contain"
                            ></el-image>
                        </div>
                    </el-carousel-item>
                </el-carousel>
            </div>
        </el-dialog>
    </div>
</div>

<script>
    var app = new Vue({
        el: "#app",
        delimiters: ['[[', ']]'],
        name: 'test',
        data() {
            return {
                list:[],
                change_sort:'',
                times:[],
                options:[
                    {id:0,name:'全部评价类型'},
                    {id:1,name:'真实评价'},
                    {id:2,name:'模拟评价'},
                ],
                search_form:{

                },
                big_img_index : 0,
                big_img_list : [],
                big_img_show : false,
                rules: {},
                current_page:1,
                total:1,
                per_page:1,
                activeName:'2',
            }
        },
        created() {

        },
        mounted() {
            this.getData(1);
        },
        methods: {
            handleClick(val) {
                console.log(val.name)
                if(val.name == 1) {
                    window.location.href = `{!! yzWebFullUrl('goods.comment.index') !!}`;
                }
                else if(val.name == 2) {
                    window.location.href = `{!! yzWebFullUrl('goods.comment.list') !!}`;
                }
                else if(val.name == 3) {
                    window.location.href = `{!! yzWebFullUrl('goods.comment.audit') !!}`;
                }
            },
            Switch2(scope, type){
                let json={
                    comment_id:scope.row.id,
                    is_show:scope.row.is_show,
                    is_top:scope.row.is_top,
                    type:type,
                }
                this.$http.post('{!! yzWebFullUrl('goods.comment.changeCommentStatus') !!}',json).then(function (response){
                        if (response.data.result){
                            this.$message.success("修改状态成功");
                            this.searchRecharge(this.current_page)
                        }
                        else{
                            this.$message({message: response.data.msg,type: 'error'});
                        }
                    },function (response) {
                        console.log(response);
                        this.loading = false;
                    }
                );
            },
            getData(page) {
                // let json = this.;
                let json = {
                    keyword:this.search_form.keyword,
                    audit_time_scope:this.search_form.audit_time_scope,
                    audit_operator:this.search_form.audit_operator,
                    create_time_scope:this.search_form.create_time_scope,
                    content:this.search_form.content,
                    uid:this.search_form.uid,
                    fade:this.search_form.fade,
                    type:this.search_form.type,
                    is_helper: this.search_form.is_helper,
                    hasdefaultgoodreputation:this.search_form.defaultpraise
                };
                let loading = this.$loading({target:document.querySelector(".content"),background: 'rgba(0, 0, 0, 0)'});
                this.$http.post('{!! yzWebFullUrl('goods.comment.comment-data') !!}',{page:page,search:json}).then(function(response) {
                    if (response.data.result) {
                        this.list = response.data.data.list.data;
                        this.list.forEach((item,index) => {
                            if(item.goods) {
                                item.goods.title = this.escapeHTML(item.goods.title);
                            }
                        });
                        this.current_page=response.data.data.list.current_page;
                        this.total=response.data.data.list.total;
                        this.per_page=response.data.data.list.per_page;
                        loading.close();

                    } else {
                        this.$message({
                            message: response.data.msg,
                            type: 'error'
                        });
                    }
                    loading.close();

                }, function(response) {
                    this.$message({
                        message: response.data.msg,
                        type: 'error'
                    });
                    loading.close();
                });
            },
            
            search(val) {
                this.getData(val);
            },
            // 添加新品牌
            addModal() {
                let link = `{!! yzWebFullUrl('goods.comment.edit-view') !!}`;
                console.log(link);
                window.location.href = link;
            },
            del(id,index) {
                console.log(id,index)
                this.$confirm('确定删除吗', '提示', {confirmButtonText: '确定',cancelButtonText: '取消',type: 'warning'}).then(() => {
                    let loading = this.$loading({target:document.querySelector(".content"),background: 'rgba(0, 0, 0, 0)'});
                    this.$http.post('{!! yzWebFullUrl('goods.comment.deleted') !!}',{id:id}).then(function (response) {
                            if (response.data.result) {
                                this.list.splice(index,1);
                                this.$message({type: 'success',message: '删除成功!'});
                            }
                            else{
                                this.$message({type: 'error',message: response.data.msg});
                            }
                            loading.close();
                            this.search(this.current_page)
                        },function (response) {
                            this.$message({type: 'error',message: response.data.msg});
                            loading.close();
                        }
                    );
                }).catch(() => {
                    this.$message({type: 'info',message: '已取消删除'});
                });
            },

            // 编辑排序
            editTitle(index) {
                let that = this;
                that.change_sort = "";
                that.change_sort = that.list[index].display_order;
            },
            confirmChangeSort(id) {
                let that = this;
                if (!(/^\d+$/.test(that.change_sort))) {
                    that.$message.error('请输入正确数字');
                    return false;
                }
                let loading = this.$loading({target:document.querySelector(".content"),background: 'rgba(0, 0, 0, 0)'});
                let json = {id: id, sort: that.change_sort};
                that.$http.post("{!! yzWebFullUrl('goods.dispatch.sort-v2') !!}", json).then(response => {
                    console.log(response);
                    if (response.data.result == 1) {
                        that.$message.success('操作成功！');
                        // that.$refs.search_form.click();
                        if (document.all) {
                            document.getElementById('app').click();
                        } else {// 其它浏览器
                            var e = document.createEvent('MouseEvents')
                            e.initEvent('click', true, true)
                            document.getElementById('app').dispatchEvent(e)
                        }
                        that.search(this.current_page);
                    } else {
                        that.$message.error(response.data.msg);
                    }
                    loading.close();

                }), function (res) {
                    console.log(res);
                    loading.close();

                };
            },
            // 快速修改
            changeStatus(id,index,type,value) {
                let that = this;
                let json = {id: id, type: type, status: value};
                let loading = this.$loading({target:document.querySelector(".content"),background: 'rgba(0, 0, 0, 0.2)'});
                that.$http.post("{!! yzWebFullUrl('goods.dispatch.quick-edit') !!}", json).then(response => {
                    console.log(response);
                    if (response.data.result == 1) {
                        that.$message.success('操作成功！');
                    } else {
                        that.$message.error(response.data.msg);
                        that.list[index][type] == 1 ? 0 : 1;
                    }
                    that.search(this.current_page);
                    loading.close();
                }), function (res) {
                    console.log(res);
                    loading.close();

                };
            },
            // 字符转义
            escapeHTML(a) {
                a = "" + a;
                return a.replace(/&amp;/g, "&").replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&quot;/g, "\"").replace(/&apos;/g, "'");;
            },
            openBig(item,index) {
                this.big_img_index = index;
                console.log(index);
                this.big_img_list = item;
                this.big_img_show = true;
            },
        },
    })
</script>
@endsection