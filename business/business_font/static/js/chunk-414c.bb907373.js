(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-414c"],{"+S1S":function(t,e,a){},"5HLW":function(t,e,a){"use strict";a.r(e);var i={data:function(){return{list:[],times:[],search_form:{title:"",group_id:"",employee_nickname:""},change_pwd_show:!1,change_pwd_form:{password:"",confirm_password:""},edit_obj:{},rules:{},current_page:1,total:1,per_page:1,group_list:[]}},created:function(){},components:{yun_service_side:a("2gMQ").a},mounted:function(){this.getGroup(),this.getData(1)},methods:{getGroup:function(){var t=this;$http.pc_post("plugin/YunChat/groupQuery",{},"loading").then(function(e){e.result?(e.data.unshift({id:0,name:"通用"}),t.group_list=e.data):t.$message({message:e.msg,type:"error"})},function(e){t.$message({message:e.msg,type:"error"})})},getData:function(t){var e=this,a={page:t,title:this.search_form.title,group_id:""===this.search_form.group_id?-1:this.search_form.group_id,employee_nickname:this.search_form.employee_nickname};$http.pc_post("plugin/YunChat/commonReplyGetList",a,"loading").then(function(t){t.result?(e.list=t.data.data,e.current_page=t.data.current_page,e.total=t.data.total,e.per_page=t.data.per_page):e.$message({message:t.msg,type:"error"})},function(t){e.$message({message:t.msg,type:"error"})})},edit:function(t){this.$router.push(this.fun.getUrl("serviceCommonReplyDetail",{},{id:t.id}))},search:function(t){this.getData(t)},addModal:function(){this.$router.push(this.fun.getUrl("serviceCommonReplyDetail"))},del:function(t,e){var a=this;console.log(t,e),this.$confirm("确定删除吗","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){$http.pc_post("plugin/YunChat/commonReplyDelete",{id:t},"loading").then(function(t){t.result?(a.$message({type:"success",message:"删除成功!"}),a.getData(a.current_page)):a.$message({type:"error",message:t.msg}),a.search(a.current_page)},function(t){a.$message({type:"error",message:t.msg})})}).catch(function(){a.$message({type:"info",message:"已取消删除"})})}}},s=(a("6NJK"),a("ZrdR")),n=Object(s.a)(i,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"all"},[a("yun_service_side",{attrs:{defaultActive:"serviceCommonReplyList"}}),t._v(" "),a("div",{attrs:{id:"app"}},[a("div",{staticClass:"vue-crumbs"},[t._v("\n      在线客服 > 快捷回复管理\n    ")]),t._v(" "),a("div",{staticClass:"vue-head"},[a("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[a("div",{staticClass:"vue-main-title-left"}),t._v(" "),a("div",{staticClass:"vue-main-title-content"},[t._v("快捷回复管理")]),t._v(" "),a("div",{staticClass:"vue-main-title-button"},[a("el-button",{attrs:{type:"primary",plain:"",icon:"el-icon-plus",size:"small"},on:{click:t.addModal}},[t._v("添加")])],1)]),t._v(" "),a("div",{staticClass:"vue-search"},[a("el-form",{staticClass:"demo-form-inline",attrs:{inline:!0,model:t.search_form}},[a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"标题"},model:{value:t.search_form.title,callback:function(e){t.$set(t.search_form,"title",e)},expression:"search_form.title"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"所属客服昵称关键词"},model:{value:t.search_form.employee_nickname,callback:function(e){t.$set(t.search_form,"employee_nickname",e)},expression:"search_form.employee_nickname"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-select",{attrs:{clearable:"",placeholder:"请选择客服组"},model:{value:t.search_form.group_id,callback:function(e){t.$set(t.search_form,"group_id",e)},expression:"search_form.group_id"}},t._l(t.group_list,function(t){return a("el-option",{key:t.id,attrs:{label:t.name,value:t.id}})}))],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-button",{attrs:{type:"primary"},on:{click:function(e){t.search(1)}}},[t._v("搜索")])],1)],1)],1),t._v(" "),t._m(0)]),t._v(" "),a("div",{staticClass:"vue-main"},[a("div",{staticClass:"vue-main-form"},[a("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[a("div",{staticClass:"vue-main-title-left"}),t._v(" "),a("div",{staticClass:"vue-main-title-content",staticStyle:{flex:"0 0 130px"}},[t._v("快捷回复列表")]),t._v(" "),a("div",{staticStyle:{"text-align":"left","font-size":"14px",color:"#999"}},[a("span",[t._v("数量："+t._s(t.total))]),t._v("   \n          ")]),t._v(" "),a("div",{staticClass:"vue-main-title-button"})]),t._v(" "),a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.list}},[a("el-table-column",{attrs:{label:"ID",align:"center",prop:"id",width:"100"}}),t._v(" "),a("el-table-column",{attrs:{label:"标题",align:"center",prop:"title",width:"300"}}),t._v(" "),a("el-table-column",{attrs:{label:"所属客服组",align:"center",prop:"group_name",width:"100"}}),t._v(" "),a("el-table-column",{attrs:{label:"类型",align:"center",prop:"type_desc"}}),t._v(" "),a("el-table-column",{attrs:{label:"内容",align:"center",prop:"content"}}),t._v(" "),a("el-table-column",{attrs:{prop:"refund_time",label:"操作",align:"center",width:"150"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("div",{staticClass:"table-option"},[a("el-link",{staticStyle:{"text-align":"center",width:"30px"},attrs:{title:"编辑",underline:!1},on:{click:function(a){t.edit(e.row)}}},[a("a",[t._v("编辑")])]),t._v(" "),a("el-link",{staticStyle:{"text-align":"center",width:"30px"},attrs:{title:"删除",underline:!1},on:{click:function(a){t.del(e.row.id)}}},[a("a",[t._v("删除")])])],1)]}}])})],1)],1)]),t._v(" "),t.total>0?a("div",{staticClass:"vue-page"},[a("el-row",[a("el-col",{attrs:{align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:t.total,"page-size":t.per_page,"current-page":t.current_page,background:""},on:{"current-change":t.search}})],1)],1)],1):t._e()])],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",[e("p",[this._v("快捷回复使用规则：")]),this._v(" "),e("p",[this._v("1、没有所属客服组，类型是公共的，所有的客服都可以搜索使用")]),this._v(" "),e("p",[this._v("2、有所属客服组，类型是公共的，该客服组下的客服可以搜索使用")]),this._v(" "),e("p",[this._v("3、类型是个人的，只有该客服可以使用")])])}],!1,null,"6052834a",null);n.options.__file="commonReply_list.vue";e.default=n.exports},"6NJK":function(t,e,a){"use strict";var i=a("+S1S");a.n(i).a}}]);