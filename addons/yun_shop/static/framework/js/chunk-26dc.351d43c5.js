(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-26dc"],{"79y5":function(e,l,c){},Qo4n:function(e,l,c){"use strict";var a={name:"RoleDetail",props:{isEdit:{type:Boolean,default:!1}},data:function(){return{form:{checked1:0,checked2:0,checked3:0,checked4:0,checked5:0,checked6:0,checked7:0,checked8:0,checked9:0,checked10:0,checked11:0,checked12:0,checked13:0,checked14:0},rules:{}}},computed:{},created:function(){0==this.isEdit&&console.log("this is add !"),1==this.isEdit&&(console.log(this.$route.params.id),console.log("this is edit !"))},methods:{submitForm:function(e){console.log(this.form)}}},o=(c("Umgy"),c("KHd+")),t=Object(o.a)(a,function(){var e=this,l=e.$createElement,c=e._self._c||l;return c("div",{staticClass:"right"},[c("el-breadcrumb",{attrs:{"separator-class":"el-icon-arrow-right"}},[c("el-breadcrumb-item",[c("router-link",{attrs:{to:"/users/role"}},[e._v("角色管理")])],1),e._v(" "),c("el-breadcrumb-item",[0==e.isEdit?c("span",[e._v("新增")]):c("span",[e._v("编辑")]),e._v("角色\n    ")])],1),e._v(" "),c("el-form",{ref:"form",attrs:{model:e.form,rules:e.rules,"label-width":"15%"}},[c("el-form-item",{attrs:{label:"角色名称",prop:"name"}},[c("el-input",{staticStyle:{width:"70%"},model:{value:e.form.name,callback:function(l){e.$set(e.form,"name",l)},expression:"form.name"}})],1),e._v(" "),c("el-form-item",{attrs:{label:"角色概述",prop:"content"}},[c("el-input",{staticStyle:{width:"70%"},attrs:{type:"textarea",rows:"5"},model:{value:e.form.content,callback:function(l){e.$set(e.form,"content",l)},expression:"form.content"}})],1),e._v(" "),c("el-form-item",{attrs:{label:"权限列表"}}),e._v(" "),c("el-form-item",{attrs:{label:"权限管理",prop:""}},[c("div",{staticStyle:{width:"70%"}},[c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked1,callback:function(l){e.$set(e.form,"checked1",e._n(l))},expression:"form.checked1"}},[e._v("权限列表")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked2,callback:function(l){e.$set(e.form,"checked2",e._n(l))},expression:"form.checked2"}},[e._v("权限添加")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked3,callback:function(l){e.$set(e.form,"checked3",e._n(l))},expression:"form.checked3"}},[e._v("权限修改")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked4,callback:function(l){e.$set(e.form,"checked4",e._n(l))},expression:"form.checked4"}},[e._v("权限删除")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked5,callback:function(l){e.$set(e.form,"checked5",e._n(l))},expression:"form.checked5"}},[e._v("角色列表")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked6,callback:function(l){e.$set(e.form,"checked6",e._n(l))},expression:"form.checked6"}},[e._v("角色添加")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked7,callback:function(l){e.$set(e.form,"checked7",e._n(l))},expression:"form.checked7"}},[e._v("角色修改")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked8,callback:function(l){e.$set(e.form,"checked8",e._n(l))},expression:"form.checked8"}},[e._v("角色删除")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked9,callback:function(l){e.$set(e.form,"checked9",e._n(l))},expression:"form.checked9"}},[e._v("用户管理")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked10,callback:function(l){e.$set(e.form,"checked10",e._n(l))},expression:"form.checked10"}},[e._v("用户添加")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked11,callback:function(l){e.$set(e.form,"checked11",e._n(l))},expression:"form.checked11"}},[e._v("用户编辑")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked12,callback:function(l){e.$set(e.form,"checked12",e._n(l))},expression:"form.checked12"}},[e._v("用户删除")])],1)]),e._v(" "),c("el-form-item",{attrs:{label:"授权管理",prop:""}},[c("div",{staticStyle:{width:"70%"}},[c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked13,callback:function(l){e.$set(e.form,"checked13",e._n(l))},expression:"form.checked13"}},[e._v("插件列表")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked14,callback:function(l){e.$set(e.form,"checked14",e._n(l))},expression:"form.checked14"}},[e._v("客户列表")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked3,callback:function(l){e.$set(e.form,"checked3",e._n(l))},expression:"form.checked3"}},[e._v("应用列表")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked4,callback:function(l){e.$set(e.form,"checked4",e._n(l))},expression:"form.checked4"}},[e._v("产品列表")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked5,callback:function(l){e.$set(e.form,"checked5",e._n(l))},expression:"form.checked5"}},[e._v("订单列表")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked6,callback:function(l){e.$set(e.form,"checked6",e._n(l))},expression:"form.checked6"}},[e._v("会员列表")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked7,callback:function(l){e.$set(e.form,"checked7",e._n(l))},expression:"form.checked7"}},[e._v("客户应用列表")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked8,callback:function(l){e.$set(e.form,"checked8",e._n(l))},expression:"form.checked8"}},[e._v("客户插件列表")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked9,callback:function(l){e.$set(e.form,"checked9",e._n(l))},expression:"form.checked9"}},[e._v("灰度测试")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked10,callback:function(l){e.$set(e.form,"checked10",e._n(l))},expression:"form.checked10"}},[e._v("黑名单")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked11,callback:function(l){e.$set(e.form,"checked11",e._n(l))},expression:"form.checked11"}},[e._v("插件列表编辑")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked12,callback:function(l){e.$set(e.form,"checked12",e._n(l))},expression:"form.checked12"}},[e._v("客户列表编辑")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked7,callback:function(l){e.$set(e.form,"checked7",e._n(l))},expression:"form.checked7"}},[e._v("灰度测试编辑")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked8,callback:function(l){e.$set(e.form,"checked8",e._n(l))},expression:"form.checked8"}},[e._v("黑名单编辑")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked9,callback:function(l){e.$set(e.form,"checked9",e._n(l))},expression:"form.checked9"}},[e._v("添加用户")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked10,callback:function(l){e.$set(e.form,"checked10",e._n(l))},expression:"form.checked10"}},[e._v("添加订单")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked11,callback:function(l){e.$set(e.form,"checked11",e._n(l))},expression:"form.checked11"}},[e._v("添加产品")]),e._v(" "),c("el-checkbox",{attrs:{"true-label":1,"false-label":0,label:1},model:{value:e.form.checked12,callback:function(l){e.$set(e.form,"checked12",e._n(l))},expression:"form.checked12"}},[e._v("免费客服列表")])],1)]),e._v(" "),c("el-form-item",[c("el-button",{attrs:{type:"success"},on:{click:function(l){e.submitForm("form")}}},[e._v("\n        保存\n      ")])],1)],1)],1)},[],!1,null,"65bed736",null);t.options.__file="role_details.vue";l.a=t.exports},Umgy:function(e,l,c){"use strict";var a=c("79y5");c.n(a).a},jWRj:function(e,l,c){"use strict";c.r(l);var a={name:"AddUser",components:{RoleDetail:c("Qo4n").a}},o=c("KHd+"),t=Object(o.a)(a,function(){var e=this.$createElement;return(this._self._c||e)("role-detail",{attrs:{"is-edit":!0}})},[],!1,null,null,null);t.options.__file="edit_role.vue";l.default=t.exports}}]);