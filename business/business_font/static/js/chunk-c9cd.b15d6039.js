(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-c9cd"],{P5dg:function(t,e,i){},jlJ3:function(t,e,i){"use strict";var s=i("P5dg");i.n(s).a},phjf:function(t,e,i){"use strict";i.r(e);var s={data:function(){return{list:[],detail_form:{id:0,name:""},detail_show:!1,areaLoading:!1,total:0,saving:!1}},created:function(){},mounted:function(){this.getData()},components:{yun_service_side:i("2gMQ").a},methods:{getData:function(){var t=this;$http.pc_post("plugin/YunChat/groupGetList").then(function(e){e.result?(t.list=e.data,t.total=t.list?t.list.length:0):t.$message({message:e.msg,type:"error"})},function(e){t.$message({message:e.msg,type:"error"})})},deleteItem:function(t){var e=this,i={id:t};this.$confirm("确定删除这条数据？").then(function(){$http.pc_post("plugin/YunChat/groupDelete",i,"loading").then(function(t){t.result?e.$message({type:"success",message:"操作成功！"}):e.$message({type:"error",message:t.msg}),e.getData()},function(t){e.$message({type:"error",message:t.msg})})})},addShow:function(){this.detail_show=!0},editShow:function(t){this.detail_show=!0,this.detail_form=t},save:function(){var t=this;if(!this.saving){var e={name:this.detail_form.name};this.detail_form.name?(this.saving=!0,this.detail_form.id&&(e.id=this.detail_form.id),$http.pc_post("plugin/YunChat/groupSave",e,"loading").then(function(e){e.result?(t.getData(),t.$message({type:"success",message:e.msg})):t.$message({type:"error",message:e.msg}),t.detail_show=!1,t.detail_form={id:0,name:""},setTimeout(function(){t.saving=!1},500)},function(e){t.$message({type:"error",message:e.msg}),t.detail_show=!1,t.detail_form={id:0,name:""},t.saving=!1})):this.$message.error("请输入名称1111")}},copyLink:function(t){this.$refs[t].select(),document.execCommand("Copy"),this.$message.success("复制成功!")}}},a=(i("jlJ3"),i("ZrdR")),n=Object(a.a)(s,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"all"},[i("yun_service_side",{attrs:{defaultActive:"service"}}),t._v(" "),i("div",{attrs:{id:"app"}},[i("div",{staticClass:"vue-crumbs"},[t._v("\n      在线客服 > 客服组管理\n    ")]),t._v(" "),i("div",{staticClass:"vue-head"},[i("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[i("div",{staticClass:"vue-main-title-left"}),t._v(" "),i("div",{staticClass:"vue-main-title-content"},[t._v("客服组管理")]),t._v(" "),i("div",{staticClass:"vue-main-title-button"},[i("el-button",{attrs:{type:"primary",plain:"",icon:"el-icon-plus",size:"small"},on:{click:t.addShow}},[t._v("添加客服组")])],1)]),t._v(" "),t._m(0)]),t._v(" "),i("div",{staticClass:"vue-main"},[i("div",{staticClass:"vue-main-form"},[i("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[i("div",{staticClass:"vue-main-title-left"}),t._v(" "),i("div",{staticClass:"vue-main-title-content",staticStyle:{flex:"0 0 90px"}},[t._v("\n            客服组列表\n          ")]),t._v(" "),i("div",{staticStyle:{"text-align":"left","font-size":"12px",color:"#999"}},[i("span",[t._v("客服组总数："+t._s(t.total))]),t._v("   \n          ")]),t._v(" "),i("div",{staticClass:"vue-main-title-button"})]),t._v(" "),i("el-table",{staticStyle:{width:"100%"},attrs:{data:t.list}},[i("el-table-column",{attrs:{label:"ID",align:"center",prop:"id",width:"70"}}),t._v(" "),i("el-table-column",{attrs:{label:"客服组名称",align:"center",prop:"display_order",width:"300"},scopedSlots:t._u([{key:"default",fn:function(e){return[i("div",[i("div",{staticClass:"vue-ellipsis",staticStyle:{"line-height":"32px"}},[t._v("\n                  "+t._s(e.row.name)+"\n                ")])])]}}])}),t._v(" "),i("el-table-column",{attrs:{label:"客服组页面链接",align:"center",prop:"display_order"},scopedSlots:t._u([{key:"default",fn:function(e){return[i("div",[i("el-input",{ref:"groupUrl_"+e.row.id,staticStyle:{width:"70%"},attrs:{readonly:""},model:{value:e.row.h5_page_url,callback:function(i){t.$set(e.row,"h5_page_url",i)},expression:"scope.row.h5_page_url"}}),t._v(" "),i("el-button",{attrs:{type:"primary",size:"small"},on:{click:function(i){t.copyLink("groupUrl_"+e.row.id)}}},[t._v("复制")])],1)]}}])}),t._v(" "),i("el-table-column",{attrs:{label:"客服组小程序页面链接",align:"center",prop:"display_order"},scopedSlots:t._u([{key:"default",fn:function(e){return[i("div",[i("el-input",{ref:"groupMiniUrl_"+e.row.id,staticStyle:{width:"70%"},attrs:{readonly:""},model:{value:e.row.mini_url,callback:function(i){t.$set(e.row,"mini_url",i)},expression:"scope.row.mini_url"}}),t._v(" "),i("el-button",{attrs:{type:"primary",size:"small"},on:{click:function(i){t.copyLink("groupMiniUrl_"+e.row.id)}}},[t._v("复制")])],1)]}}])}),t._v(" "),i("el-table-column",{attrs:{prop:"refund_time",label:"操作",align:"center",width:"80"},scopedSlots:t._u([{key:"default",fn:function(e){return[i("el-dropdown",{attrs:{trigger:"click"}},[i("span",{staticClass:"el-dropdown-link"},[i("el-button",{attrs:{size:"small"}},[t._v("操作")])],1),t._v(" "),i("el-dropdown-menu",{attrs:{slot:"dropdown"},slot:"dropdown"},[i("el-dropdown-item",{nativeOn:{click:function(i){t.editShow(e.row)}}},[t._v("编辑")]),t._v(" "),i("el-dropdown-item",{nativeOn:{click:function(i){t.deleteItem(e.row.id)}}},[t._v("删除")])],1)],1)]}}])})],1),t._v(" "),i("el-dialog",{attrs:{visible:t.detail_show,width:"750px",title:"客服组信息"},on:{"update:visible":function(e){t.detail_show=e}}},[i("div",{staticStyle:{height:"300px",overflow:"auto"},attrs:{id:"cancel-send"}},[i("el-form",{ref:"add_form",attrs:{model:t.detail_form,"label-width":"15%"}},[i("el-form-item",{attrs:{label:"客服组名称",prop:""}},[i("el-input",{staticStyle:{width:"70%"},model:{value:t.detail_form.name,callback:function(e){t.$set(t.detail_form,"name",e)},expression:"detail_form.name"}})],1)],1)],1),t._v(" "),i("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{on:{click:function(e){t.detail_show=!1}}},[t._v("取 消")]),t._v(" "),i("el-button",{attrs:{type:"primary",disabled:t.saving},on:{click:function(e){t.save()}}},[t._v("保存\n            ")])],1)])],1)])])],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",[e("p",[this._v("从客服组页面链接访问的用户分配客服规则：")]),this._v(" "),e("p",[this._v("\n          1、该客服组内之前聊过客服，并且客服是正常状态，分配给之前聊过的客服\n        ")]),this._v(" "),e("p",[this._v("2、该客服组内之前聊过客服，客服是禁用状态，随机分配新的客服")]),this._v(" "),e("p",[this._v("3、该客服组内之前没有聊过客服，随机分配新的客服")])])}],!1,null,"15c9a7cc",null);n.options.__file="group_list.vue";e.default=n.exports}}]);