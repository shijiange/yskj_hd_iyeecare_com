(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-ead1"],{K2yE:function(t,e,a){},VMlQ:function(t,e,a){"use strict";a.r(e);var n={data:function(){return{search:{user_name:""},list:[],pageSize:0,current_page:0,total:0}},created:function(){this.$store.dispatch("GetUserInfo"),this.currentChange(1)},destroyed:function(){},methods:{currentChange:function(t){var e=this;$http.post("plugin.yun-chat.frontend.chat.history-list",{page:t,user_name:this.search.user_name},"loading").then(function(t){1===t.result?(e.total=t.data.total,e.pageSize=t.data.per_page,e.list=t.data.data,e.current_page=t.data.current_page):(e.list=[],-1===t.data.status&&e.currentChange(1),e.$message.error(t.msg))}).catch(function(t){console.error(t)})},toChat:function(t){var e=this;$http.post("plugin.yun-chat.frontend.chat.before-go-chat",{id:t.id},"loading").then(function(a){1===a.result?e.$router.push(e.fun.getUrl("chatIndex",{},{user_id:t.uid})):e.$message.error(a.msg)}).catch(function(t){console.error(t)})}}},r=(a("pRdT"),a("ZrdR")),s=Object(r.a)(n,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"right"},[a("el-form",{ref:"search",attrs:{inline:!0,model:t.search}},[a("el-row",[a("el-col",{attrs:{span:18}},[a("el-form-item",[a("el-input",{staticStyle:{width:"300px"},attrs:{placeholder:"请输入用户昵称/手机号码"},model:{value:t.search.user_name,callback:function(e){t.$set(t.search,"user_name",e)},expression:"search.user_name"}})],1)],1),t._v(" "),a("el-col",{attrs:{span:6,align:"right"}},[a("el-form-item",[a("el-button",{attrs:{type:"primary",icon:"el-icon-search"},on:{click:function(e){t.currentChange(1)}}},[t._v("查询\n          ")])],1)],1)],1)],1),t._v(" "),a("div",{staticClass:"content"},[a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.list,"empty-text":"暂无信息"}},[a("el-table-column",{attrs:{prop:"id",label:"id",width:"110"}}),t._v(" "),a("el-table-column",{attrs:{prop:"user_nickname",label:"会员昵称"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("div",[t._v(t._s(e.row.has_one_user.nickname))])]}}])}),t._v(" "),a("el-table-column",{attrs:{prop:"user_mobile",label:"会员手机号码"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("div",[t._v(t._s(e.row.has_one_user.mobile))])]}}])}),t._v(" "),a("el-table-column",{attrs:{prop:"last_updated_at",label:"最近会话时间"}}),t._v(" "),a("el-table-column",{attrs:{label:"操作",width:"110"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-button",{attrs:{size:"mini",type:"primary"},on:{click:function(a){t.toChat(e.row)}}},[t._v("发起会话")])]}}])})],1)],1),t._v(" "),a("el-col",{staticStyle:{padding:"15px 5% 15px 0"},attrs:{span:24,align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next","current-page":t.current_page,"page-size":t.pageSize,total:t.total,background:""},on:{"current-change":t.currentChange,"update:currentPage":function(e){t.current_page=e}}})],1)],1)},[],!1,null,"12286dc7",null);s.options.__file="list.vue";e.default=s.exports},pRdT:function(t,e,a){"use strict";var n=a("K2yE");a.n(n).a}}]);