(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-5245"],{QzWE:function(e,s,t){"use strict";t.r(s);var n=t("JiwJ"),a=t("pZTO"),i={components:{work_session_side:n.a,message_wrapper:a.a},data:function(){return{openValue:0}},created:function(){this.getBasicInfo()},methods:{getBasicInfo:function(){var e=this;$http.pc_get("plugin/WorkSession/basicInfo",{},"loading").then(function(s){1===s.result&&(e.openValue=s.data.set.is_open,console.log(s.data.set.is_open))})},saveBasic:function(){var e=this;$http.pc_get("plugin/WorkSession/basicSave",{"set[is_open]":this.openValue},"loading").then(function(s){1===s.result?e.$message.success(s.msg):e.$message.error(s.msg)})}}},o=(t("Rweu"),t("KHd+")),c=Object(o.a)(i,function(){var e=this,s=e.$createElement,t=e._self._c||s;return t("div",{staticClass:"workSession"},[t("work_session_side",{attrs:{defaultActive:"1"}}),e._v(" "),t("div",{staticClass:"workSession-wrapper"},[t("div",{staticClass:"switch"},[t("div",{staticClass:"text"},[e._v("是否开启：")]),e._v(" "),t("el-switch",{attrs:{"active-value":1,"inactive-value":0},on:{change:e.saveBasic},model:{value:e.openValue,callback:function(s){e.openValue=s},expression:"openValue"}})],1)])],1)},[],!1,null,"fd28d7c0",null);c.options.__file="setting.vue";s.default=c.exports},Rweu:function(e,s,t){"use strict";var n=t("bvv1");t.n(n).a},bvv1:function(e,s,t){}}]);