(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-7281"],{"3iQU":function(e,t,a){"use strict";var r=a("XCZM");a.n(r).a},XCZM:function(e,t,a){},wp3t:function(e,t,a){"use strict";a.r(t);var r=a("EJiy"),s=a.n(r),i=a("QbLZ"),l=a.n(i),o=a("14Xm"),n=a.n(o),c=a("D3Ub"),_=a.n(c),u={data:function(){return{search_form:{name:"",display_order:"",status:"",tool_bar_type:0,key_word_id:"",mini_app_link:"",h5_url:""},keyword:"",options_type:[{value:0,label:"关键词回复"},{value:1,label:"跳转链接"}],dialogVisible:!1,kwd:"",id:"",submit_info:!1,tableData:[]}},watch:{upKeyWordData:function(e,t){""===e&&(this.search_form.key_word_id="")}},computed:{upKeyWordData:function(){return this.keyword}},mounted:function(){this.id=this.$route.query.id,this.$route.query.id&&this.chatDataShow(this.$route.query.id)},components:{yun_service_side:a("2gMQ").a},methods:{handleClose:function(){this.dialogVisible=!1},choice:function(e,t){this.keyword=e,this.search_form.key_word_id=t,this.dialogVisible=!1},chatDataShow:function(e){var t=this;return _()(n.a.mark(function a(){var r;return n.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/YunChat/toolbarGetDetail",{id:e});case 2:(r=a.sent).result?(t.search_form.name=r.data.name,t.search_form.display_order=r.data.display_order,t.search_form.status=r.data.status,t.search_form.tool_bar_type=r.data.type,t.search_form.key_word_id=r.data.key_word_id,t.keyword=r.data.key_word,t.search_form.mini_app_link=r.data.mini_app_link,t.search_form.h5_url=r.data.h5_url):t.$message.error(r.msg);case 4:case"end":return a.stop()}},a,t)}))()},submit:function(){var e=this;return _()(n.a.mark(function t(){var a,r,i;return n.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:if(!e.submit_info){t.next=2;break}return t.abrupt("return");case 2:if(e.submit_info=!0,""!==e.search_form.tool_bar_type){t.next=6;break}return e.$message.warning("请选择类型"),t.abrupt("return");case 6:return t.next=8,$http.pc_post("plugin/YunChat/toolbarSave",l()({},e.search_form,{id:e.id}));case 8:if((a=t.sent).result)e.$message.success(a.msg),e.$router.push(e.fun.getUrl("serviceChatToolsList")),e.submit_info=!1;else{if("object"==s()(a.msg)){for(i in r="",a.msg)r+=a.msg[i][0];e.$message.error(r)}else e.$message.error(a.msg);e.submit_info=!1}case 10:case"end":return t.stop()}},t,e)}))()},changeType:function(e){e?(this.keyword="",this.search_form.key_word_id=""):(this.search_form.mini_app_link="",this.search_form.h5_url="")},keywordSearch:function(){var e=this;return _()(n.a.mark(function t(){var a;return n.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,$http.pc_post("plugin/YunChat/wordsReplyQueryKeyWords",{kwd:e.kwd});case 2:(a=t.sent).result?e.tableData=a.data:e.$message.error(a.msg);case 4:case"end":return t.stop()}},t,e)}))()}}},d=(a("3iQU"),a("KHd+")),m=Object(d.a)(u,function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"all"},[a("yun_service_side",{attrs:{defaultActive:"serviceChatToolsList"}}),e._v(" "),a("div",{staticStyle:{width:"calc(100% - 150px)"},attrs:{id:"app"}},[a("div",{staticClass:"vue-crumbs"},[e._v("\n      在线客服 > 编辑聊天工具栏\n    ")]),e._v(" "),a("div",{staticClass:"vue-head"},[e._m(0),e._v(" "),a("div",{staticClass:"vue-search"},[a("el-form",{staticClass:"demo-form-inline",attrs:{model:e.search_form,"label-width":"140px"}},[a("el-form-item",{attrs:{label:"名称",required:""}},[a("el-input",{staticStyle:{width:"40%"},model:{value:e.search_form.name,callback:function(t){e.$set(e.search_form,"name",t)},expression:"search_form.name"}}),e._v(" "),a("div",{staticClass:"tip"},[e._v("工具栏上显示的文字")])],1),e._v(" "),a("el-form-item",{attrs:{label:"排序"}},[a("el-input",{staticStyle:{width:"40%"},model:{value:e.search_form.display_order,callback:function(t){e.$set(e.search_form,"display_order",t)},expression:"search_form.display_order"}}),e._v(" "),a("div",{staticClass:"tip"},[e._v("为了保证页面性能和用户体验，前端最多显示30条数据。可以通过排序控制显示顺序，排序越大，显示越靠前")])],1),e._v(" "),a("el-form-item",{attrs:{label:"状态"}},[a("el-switch",{attrs:{"active-value":1,"inactive-value":0},model:{value:e.search_form.status,callback:function(t){e.$set(e.search_form,"status",t)},expression:"search_form.status"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"类型",required:""}},[a("el-select",{attrs:{clearable:"",filterable:"",placeholder:"请选择类型"},on:{change:e.changeType},model:{value:e.search_form.tool_bar_type,callback:function(t){e.$set(e.search_form,"tool_bar_type",t)},expression:"search_form.tool_bar_type"}},e._l(e.options_type,function(e){return a("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})}))],1),e._v(" "),e.search_form.tool_bar_type?e._e():a("el-form-item",{attrs:{label:"关键词"}},[a("div",{staticStyle:{display:"flex"}},[a("el-input",{staticStyle:{width:"35%"},attrs:{placeholder:"请选择关键词"},model:{value:e.keyword,callback:function(t){e.keyword=t},expression:"keyword"}}),e._v(" "),a("span",{staticClass:"keyword-item",on:{click:function(t){e.dialogVisible=!0}}},[e._v("选择关键词")])],1)]),e._v(" "),e.search_form.tool_bar_type?a("el-form-item",{attrs:{label:"页面链接"}},[a("el-input",{staticStyle:{width:"40%"},model:{value:e.search_form.h5_url,callback:function(t){e.$set(e.search_form,"h5_url",t)},expression:"search_form.h5_url"}})],1):e._e(),e._v(" "),e.search_form.tool_bar_type?a("el-form-item",{attrs:{label:"小程序链接"}},[a("el-input",{staticStyle:{width:"40%"},model:{value:e.search_form.mini_app_link,callback:function(t){e.$set(e.search_form,"mini_app_link",t)},expression:"search_form.mini_app_link"}})],1):e._e()],1)],1)]),e._v(" "),a("div",{staticClass:"vue-page"},[a("div",{staticClass:"vue-center"},[a("el-button",{attrs:{type:"primary"},on:{click:e.submit}},[e._v("提交")])],1)])]),e._v(" "),a("el-dialog",{attrs:{title:"选择关键词",visible:e.dialogVisible,width:"50%","show-close":!1,center:""},on:{"update:visible":function(t){e.dialogVisible=t}}},[a("div",{staticStyle:{display:"flex",width:"95%"}},[a("el-input",{staticStyle:{"margin-right":"10px"},attrs:{placeholder:"关键词"},model:{value:e.kwd,callback:function(t){e.kwd=t},expression:"kwd"}}),e._v(" "),a("el-button",{attrs:{plain:""},on:{click:e.keywordSearch}},[e._v("搜索")])],1),e._v(" "),a("el-table",{staticStyle:{width:"100%"},attrs:{data:e.tableData}},[a("el-table-column",{attrs:{prop:"key_word",align:"center",label:"关键词"}}),e._v(" "),a("el-table-column",{attrs:{prop:"reply_contents_txt",align:"center",label:"内容"}}),e._v(" "),a("el-table-column",{attrs:{prop:"reply_type_desc",align:"center",label:"回复方式"}}),e._v(" "),a("el-table-column",{attrs:{align:"center",label:"操作"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-button",{attrs:{plain:""},on:{click:function(a){e.choice(t.row.key_word,t.row.id)}}},[e._v("选择")])]}}])})],1),e._v(" "),a("span",{staticClass:"dialog-close"},[a("el-button",{on:{click:function(t){e.dialogVisible=!1}}},[e._v("取 消")])],1)],1)],1)},[function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[t("div",{staticClass:"vue-main-title-left"}),this._v(" "),t("div",{staticClass:"vue-main-title-content"},[this._v("编辑聊天工具栏")])])}],!1,null,"6c546376",null);m.options.__file="chat_toolsEdit.vue";t.default=m.exports}}]);