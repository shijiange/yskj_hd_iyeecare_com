(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-014a"],{iRbY:function(t,e,a){"use strict";a.r(e);var s=a("QbLZ"),i=a.n(s),n=a("14Xm"),r=a.n(n),l=a("D3Ub"),c=a.n(l),o={components:{script_library_side:a("0VAP").a},data:function(){return{form:{is_enable:""},tableData:[]}},mounted:function(){this.getListData()},methods:{getListData:function(){var t=this;return c()(r.a.mark(function e(){var a;return r.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,$http.pc_post("plugin/SpeechcraftLibrary/getSet",{},"loading");case 2:(a=e.sent).result?(t.tableData.push({url_name:"话术库",url:a.data.url}),t.form.is_enable=a.data.is_enable):t.$message.error(a.msg);case 4:case"end":return e.stop()}},e,t)}))()},changeSetState:function(){var t=this;return c()(r.a.mark(function e(){var a;return r.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,$http.pc_post("plugin/SpeechcraftLibrary/editSet",{form:i()({},t.form)},"loading");case 2:a=e.sent,console.log(a,"res"),a.result?t.$message.success(a.msg):t.$message.error(a.msg);case 5:case"end":return e.stop()}},e,t)}))()},copyLink:function(t){this.$refs[t].select(),document.execCommand("Copy"),this.$message.success("复制成功!")}}},u=(a("jJwj"),a("KHd+")),p=Object(u.a)(o,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"all"},[a("script_library_side",{attrs:{defaultActive:"scriptLibrarySet"}}),t._v(" "),a("div",{staticStyle:{width:"calc(100% - 150px)"},attrs:{id:"app"}},[a("div",{staticClass:"news-sop"},[t._m(0),t._v(" "),a("div",{staticClass:"vue-search"},[a("el-form",{staticClass:"demo-form-inline",attrs:{"label-width":"140px"}},[a("el-form-item",{attrs:{label:"插件开启"}},[a("el-switch",{attrs:{"active-value":1,"inactive-value":0},on:{change:t.changeSetState},model:{value:t.form.is_enable,callback:function(e){t.$set(t.form,"is_enable",e)},expression:"form.is_enable"}})],1)],1)],1)]),t._v(" "),a("div",{staticClass:"news-sop"},[t._m(1),t._v(" "),a("el-form",{staticClass:"demo-form-inline",attrs:{"label-width":"140px"}},[a("el-form-item",{attrs:{label:" ","label-width":"45px"}},[a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.tableData,"row-key":"id"}},[a("el-table-column",{attrs:{prop:"url_name",label:"名称",width:"200"}}),t._v(" "),a("el-table-column",{attrs:{prop:"link",label:"页面地址"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("span",[t._v(t._s(e.row.url))]),t._v(" "),a("input",{ref:"link_"+e.row.url_name,staticStyle:{position:"relative",opacity:"0"},attrs:{type:"value"},domProps:{value:e.row.url}})]}}])}),t._v(" "),a("el-table-column",{attrs:{label:"操作",width:"120"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("div",{staticClass:"operation"},[a("i",{staticClass:"iconfont icon-ht_operation_copyline",on:{click:function(a){t.copyLink("link_"+e.row.url_name)}}})])]}}])})],1)],1)],1)],1)])],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"vue-main-title"},[e("div",{staticClass:"vue-main-title-left"}),this._v(" "),e("div",{staticClass:"vue-main-title-content"},[this._v("基础设置")])])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"vue-main-title"},[e("div",{staticClass:"vue-main-title-left"}),this._v(" "),e("div",{staticClass:"vue-main-title-content"},[this._v("页面链接")])])}],!1,null,"d04c1994",null);p.options.__file="set.vue";e.default=p.exports},jJwj:function(t,e,a){"use strict";var s=a("w3nI");a.n(s).a},w3nI:function(t,e,a){}}]);