(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-d459"],{"32Mn":function(t,e,a){"use strict";var s=a("o59U");a.n(s).a},X238:function(t,e,a){"use strict";a.r(e);var s={data:function(){return{list:[],search_form:{user_name:"",employee_name:""},current_page:1,total:1,per_page:1}},components:{yun_service_side:a("2gMQ").a},created:function(){},mounted:function(){this.getData(1)},methods:{getData:function(t){var e=this,a={page:t,user_name:this.search_form.user_name,employee_name:this.search_form.employee_name};$http.pc_post("plugin/YunChat/chatGetHistoryList",a,"loading").then(function(t){t.result?(e.list=t.data.data,e.current_page=t.data.current_page,e.total=t.data.total,e.per_page=t.data.per_page):e.$message({message:t.msg,type:"error"})},function(t){e.$message({message:t.data.msg,type:"error"})})},goDetail:function(t){this.$router.push(this.fun.getUrl("serviceChatList",{},{id:t}))},search:function(t){this.getData(t)}}},i=(a("32Mn"),a("ZrdR")),n=Object(i.a)(s,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"all"},[a("yun_service_side",{attrs:{defaultActive:"serviceChatHistory-0"}}),t._v(" "),a("div",{attrs:{id:"app"}},[a("div",{staticClass:"vue-crumbs"},[t._v("\n      在线客服 > 会话管理\n    ")]),t._v(" "),a("div",{staticClass:"vue-head"},[t._m(0),t._v(" "),a("div",{staticClass:"vue-search"},[a("el-form",{staticClass:"demo-form-inline",attrs:{inline:!0,model:t.search_form}},[a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"会员昵称/手机号/id"},model:{value:t.search_form.user_name,callback:function(e){t.$set(t.search_form,"user_name",e)},expression:"search_form.user_name"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"客服昵称"},model:{value:t.search_form.employee_name,callback:function(e){t.$set(t.search_form,"employee_name",e)},expression:"search_form.employee_name"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-button",{attrs:{type:"primary"},on:{click:function(e){t.search(1)}}},[t._v("搜索")])],1)],1)],1)]),t._v(" "),a("div",{staticClass:"vue-main"},[a("div",{staticClass:"vue-main-form"},[a("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[a("div",{staticClass:"vue-main-title-left"}),t._v(" "),a("div",{staticClass:"vue-main-title-content",staticStyle:{flex:"0 0 130px"}},[t._v("会话列表")]),t._v(" "),a("div",{staticStyle:{"text-align":"left","font-size":"14px",color:"#999"}},[a("span",[t._v("会话数量："+t._s(t.total))]),t._v("   \n          ")]),t._v(" "),a("div",{staticClass:"vue-main-title-button"})]),t._v(" "),a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.list}},[a("el-table-column",{attrs:{label:"ID",align:"center",prop:"id",width:"100"}}),t._v(" "),a("el-table-column",{attrs:{label:"会员",align:"center",prop:"username"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("div",[a("div",[a("img",{staticStyle:{width:"30px",height:"30px",padding:"1px",border:"1px solid #ccc"},attrs:{src:e.row.member_avatar}})]),t._v(" "),a("div",[t._v("\n                  "+t._s(e.row.has_one_user.nickname)+"\n                ")])])]}}])}),t._v(" "),a("el-table-column",{attrs:{label:"客服",align:"center",prop:"display_order"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("div",[e.row.employee_avatar?a("div",[a("img",{staticStyle:{width:"40px",height:"40px","border-radius":"50%"},attrs:{src:e.row.employee_avatar,alt:""}})]):t._e(),t._v(" "),a("div",[t._v("\n                  "+t._s(e.row.has_one_employee.nickname)+"\n                ")])])]}}])}),t._v(" "),a("el-table-column",{attrs:{label:"最近会话结束时间",align:"center",prop:"updated_at"}}),t._v(" "),a("el-table-column",{attrs:{label:"操作",align:"center",width:"100"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("div",{staticClass:"table-option"},[a("el-link",{staticStyle:{"text-align":"center",width:"50px"},attrs:{title:"查看详情",underline:!1},on:{click:function(a){t.goDetail(e.row.id)}}},[a("a",[t._v("查看详情")])])],1)]}}])})],1)],1)]),t._v(" "),t.total>0?a("div",{staticClass:"vue-page"},[a("el-row",[a("el-col",{attrs:{align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:t.total,"page-size":t.per_page,"current-page":t.current_page,background:""},on:{"current-change":t.search}})],1)],1)],1):t._e()])],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[e("div",{staticClass:"vue-main-title-left"}),this._v(" "),e("div",{staticClass:"vue-main-title-content"},[this._v("会话管理")])])}],!1,null,"48f69ed3",null);n.options.__file="chat_historyList.vue";e.default=n.exports},o59U:function(t,e,a){}}]);