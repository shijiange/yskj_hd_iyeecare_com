(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-df8e"],{"+3Z4":function(t,s,e){"use strict";e.r(s);e("XJYT");var a={components:{},data:function(){return{company:{},person:{}}},watch:{},created:function(){this.getData()},destroyed:function(){},methods:{toCreateSeal:function(){this.$router.push(this.fun.getUrl("createPersonSeal"))},deleteIt:function(t){var s=this;$http.post("plugin.yun-sign.frontend.person-seal.delete-seal",{id:t},"loading").then(function(t){1===t.result?(s.$message.success("删除成功"),s.getData()):t.msg&&s.$message.error(t.msg)}).catch(function(t){console.log(t)})},setDefault:function(t){var s=this;$http.post("plugin.yun-sign.frontend.person-seal.set-default",{id:t},"loading").then(function(t){1===t.result?(s.$message.success("设置成功"),s.getData()):t.msg&&s.$message.error(t.msg)}).catch(function(t){console.log(t)})},getData:function(){var t=this;$http.post("plugin.yun-sign.frontend.person-seal.get-list",{},"loading").then(function(s){1===s.result?(t.company=s.data.company_seals,t.person=s.data.person_seals):s.msg&&t.$message.error(s.msg)}).catch(function(t){console.log(t)})}}},i=(e("TkHO"),e("KHd+")),n=Object(i.a)(a,function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",{attrs:{id:"sign"}},[e("div",{staticClass:"box"},[e("div",{staticClass:"right-head"},[t._m(0),t._v(" "),e("div",{staticStyle:{flex:"0  0 150px"}},[e("el-button",{staticStyle:{width:"150px"},attrs:{type:"primary",icon:"el-icon-plus"},on:{click:t.toCreateSeal}},[t._v("新建个人印章")])],1)]),t._v(" "),e("div",{staticClass:"template-box"},t._l(t.person,function(s){return e("div",{key:s.id,staticClass:"seal-item seal-item-hover"},[e("div",{staticClass:"seal-box"},[1==s.is_default?e("div",{staticClass:"seal-tips"},[t._v("默认印章")]):t._e(),t._v(" "),e("div",{staticClass:"img-box"},[e("img",{attrs:{src:s.seal_url,alt:""}})]),t._v(" "),e("div",{staticClass:"seal-doc"},[e("div",{staticClass:"seal-name"},[t._v(t._s(s.name))])])]),t._v(" "),e("div",{staticClass:"seal-btn-box"},[e("span",{staticClass:"seal-btn-item",on:{click:function(e){e.stopPropagation(),t.setDefault(s.id)}}},[t._v(t._s(1==s.is_default?"取消默认":"设置默认"))]),e("span",{staticClass:"seal-btn-item",on:{click:function(e){e.stopPropagation(),t.deleteIt(s.id)}}},[t._v("删除")])])])}))]),t._v(" "),t.company&&t.company.length>0?e("div",{staticClass:"box"},[t._m(1),t._v(" "),e("div",{staticClass:"template-box"},t._l(t.company,function(s){return e("div",{key:s.id,staticClass:"seal-item"},[e("div",{staticClass:"seal-box"},[e("div",{staticClass:"img-box"},[e("img",{attrs:{src:s.has_one_seal.seal_url,alt:""}})]),t._v(" "),e("div",{staticClass:"seal-doc"})])])}))]):t._e()])},[function(){var t=this.$createElement,s=this._self._c||t;return s("div",{staticClass:"right-head-con",staticStyle:{flex:"1"}},[s("span",{staticClass:"green-title-line"}),this._v("个人印章")])},function(){var t=this.$createElement,s=this._self._c||t;return s("div",{staticClass:"right-head"},[s("div",{staticClass:"right-head-con"},[s("span",{staticClass:"green-title-line"}),this._v("授权印章")])])}],!1,null,"733877d2",null);n.options.__file="person_seal.vue";s.default=n.exports},TkHO:function(t,s,e){"use strict";var a=e("o0MG");e.n(a).a},o0MG:function(t,s,e){}}]);