(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-6260"],{"8Sq1":function(t,e,a){"use strict";a.r(e);var s=a("14Xm"),i=a.n(s),r=a("QbLZ"),n=a.n(r),l=a("D3Ub"),o=a.n(l),c=a("0VAP"),u=a("TXmZ"),d={components:{script_library_side:c.a,content_card:u.a},data:function(){return{search:{material_name:"",is_enable:"",group_id:""},menu_item_list:[],dataShowList:[],testSlogan:"感谢您的关注，我们将竭诚为您服务!",nicknameList:[{name:"客户昵称",value:"{{客户昵称}}"}],styleContext:{position:"absolute",right:0,top:0,height:"500px"},avatar:"",info_show:!0,submitInfo:!0}},mounted:function(){this.getGroupList(),this.$route.query.id&&this.getMaterialInfo()},methods:{submit:function(){var t=this;return o()(i.a.mark(function e(){var a,s;return i.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:if(a=n()({content_list:t.$refs.content_card.submitData},t.search),t.submitInfo){e.next=3;break}return e.abrupt("return");case 3:return t.submitInfo=!1,e.next=6,$http.pc_post("plugin/SpeechcraftLibrary/saveMaterial",{material_id:t.$route.query.id?t.$route.query.id:"",form:n()({},a)},"loading");case 6:(s=e.sent).result?(t.$message.success(s.msg),t.$router.push(t.fun.getUrl("scriptLibraryMaterial",{},{})),t.submitInfo=!0):(t.$message.error(s.msg),t.submitInfo=!0);case 8:case"end":return e.stop()}},e,t)}))()},getGroupList:function(){var t=this;return o()(i.a.mark(function e(){var a;return i.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,$http.pc_post("plugin/SpeechcraftLibrary/getGroupList",{},"loading");case 2:(a=e.sent).result?t.menu_item_list=a.data:t.$message.error(a.msg);case 4:case"end":return e.stop()}},e,t)}))()},getMaterialInfo:function(){var t=this;return o()(i.a.mark(function e(){var a;return i.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return t.info_show=!1,e.next=3,$http.pc_post("plugin/SpeechcraftLibrary/getMaterialInfo",{material_id:t.$route.query.id},"loading");case 3:(a=e.sent).result?(t.search.material_name=a.data.material_name,t.search.is_enable=a.data.is_enable,t.search.group_id=a.data.group_id,t.dataShowList=a.data.content_list,t.info_show=!0):(t.$message.error(a.msg),t.info_show=!0);case 5:case"end":return e.stop()}},e,t)}))()}}},m=(a("ssaS"),a("KHd+")),f=Object(m.a)(d,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"all"},[a("script_library_side",{attrs:{defaultActive:"scriptLibraryMaterial"}}),t._v(" "),a("div",{staticStyle:{width:"calc(100% - 150px)"},attrs:{id:"app"}},[a("div",{staticClass:"news-sop"},[t._m(0),t._v(" "),a("div",{staticClass:"vue-search"},[a("el-form",{staticClass:"demo-form-inline",attrs:{"label-width":"140px"}},[a("el-form-item",{attrs:{label:"素材名称"}},[a("el-input",{staticStyle:{width:"30%"},attrs:{placeholder:""},model:{value:t.search.material_name,callback:function(e){t.$set(t.search,"material_name",e)},expression:"search.material_name"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"是否开启"}},[a("el-switch",{attrs:{"active-value":1,"inactive-value":0},model:{value:t.search.is_enable,callback:function(e){t.$set(t.search,"is_enable",e)},expression:"search.is_enable"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"素材分类"}},[a("el-select",{attrs:{clearable:"",filterable:"",placeholder:"选择分类"},model:{value:t.search.group_id,callback:function(e){t.$set(t.search,"group_id",e)},expression:"search.group_id"}},t._l(t.menu_item_list,function(t){return a("el-option",{key:t.id,attrs:{label:t.group_name,value:t.id}})}))],1)],1)],1)]),t._v(" "),a("div",{staticClass:"news-sop"},[t._m(1),t._v(" "),a("el-form",{staticClass:"demo-form-inline",attrs:{"label-width":"140px"}},[a("el-form-item",{attrs:{label:" ","label-width":"45px"}},[t.info_show?a("content_card",{ref:"content_card",attrs:{textState:"more",testSlogan:t.testSlogan,nicknameList:t.nicknameList,dataShowList:t.dataShowList,styleContext:t.styleContext}}):t._e()],1)],1)],1),t._v(" "),a("div",{staticClass:"send-buttons"},[a("el-button",{staticStyle:{background:"#5ab79c","border-color":"#5ab79c"},attrs:{type:"primary"},on:{click:t.submit}},[t._v("提交")])],1)])],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"vue-main-title"},[e("div",{staticClass:"vue-main-title-left"}),this._v(" "),e("div",{staticClass:"vue-main-title-content"},[this._v("基础设置")])])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"vue-main-title"},[e("div",{staticClass:"vue-main-title-left"}),this._v(" "),e("div",{staticClass:"vue-main-title-content"},[this._v("素材设置")])])}],!1,null,"5c0b8622",null);f.options.__file="material_editor.vue";e.default=f.exports},"RU/L":function(t,e,a){a("Rqdy");var s=a("WEpk").Object;t.exports=function(t,e,a){return s.defineProperty(t,e,a)}},Rqdy:function(t,e,a){var s=a("Y7ZC");s(s.S+s.F*!a("jmDH"),"Object",{defineProperty:a("2faE").f})},SEkw:function(t,e,a){t.exports={default:a("RU/L"),__esModule:!0}},WXgP:function(t,e,a){},YEIV:function(t,e,a){"use strict";e.__esModule=!0;var s=function(t){return t&&t.__esModule?t:{default:t}}(a("SEkw"));e.default=function(t,e,a){return e in t?(0,s.default)(t,e,{value:a,enumerable:!0,configurable:!0,writable:!0}):t[e]=a,t}},bZdz:function(t,e,a){t.exports=a.p+"static/img/welcome_top.d6767fe.png"},ssaS:function(t,e,a){"use strict";var s=a("WXgP");a.n(s).a}}]);