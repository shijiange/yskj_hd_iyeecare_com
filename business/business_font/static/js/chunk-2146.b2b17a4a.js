(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-2146"],{EAX0:function(e,t,a){},"v+jy":function(e,t,a){"use strict";var r=a("EAX0");a.n(r).a},wqNF:function(e,t,a){"use strict";a.r(t);var r={components:{wechat_customers_label_side:a("dE/r").a},data:function(){return{group_arr:[],form:{label_name:"",group_id:""},label_id:0,rules:{label_name:[{required:!0,message:"请项为必填项",trigger:"blur"}],group_id:[{required:!0,message:"请项为必填项",trigger:"blur"}]}}},created:function(){console.log(this.$route.query),this.getLabelList(),this.$route.query&&this.$route.query.label_id&&(this.label_id=this.$route.query.label_id,this.getLabelDetails())},methods:{handSend:function(){if(""==this.form.label_name)return this.$message.error("请填写标签名称");this.label_id?this.editLabel():this.addLabel()},addLabel:function(){var e=this;if(""==this.form.group_id)return this.$message.error("请选择标签组");$http.pc_post("plugin/WorkWechatTag/addTag",{group_id:this.form.group_id,name_arr:[this.form.label_name]},"loading").then(function(t){1===t.result?t.msg&&e.$message.success(t.msg):t.msg&&e.$message.error(t.msg)}).catch(function(e){console.error(e)})},editLabel:function(){var e=this;$http.pc_get("plugin/WorkWechatTag/editTag",{id:this.label_id,name:this.form.label_name},"loading").then(function(t){1===t.result?t.msg&&e.$message.success(t.msg):t.msg&&e.$message.error(t.msg)}).catch(function(e){console.error(e)})},getLabelDetails:function(){var e=this;$http.pc_get("plugin/WorkWechatTag/tagDetail",{id:this.$route.query.label_id},"loading").then(function(t){1===t.result?(e.form.label_name=t.data.name,e.form.group_id=t.data.group_id):t.msg&&e.$message.error(t.msg)}).catch(function(e){console.error(e)})},getLabelList:function(){var e=this;$http.pc_get("plugin/WorkWechatTag/groupChooseList",{},"loading").then(function(t){1===t.result?e.group_arr=t.data:t.msg&&e.$message.error(t.msg)}).catch(function(e){console.error(e)})},btnBack:function(){this.$router.go(-1)}}},i=(a("v+jy"),a("KHd+")),s=Object(i.a)(r,function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"all"},[a("wechat_customers_label_side",{attrs:{defaultActive:"2"}}),e._v(" "),a("div",{attrs:{id:"app"}},[a("div",{staticClass:"list_container"},[a("div",{staticClass:"vue-main-title"},[a("div",{staticClass:"vue-main-title-left"}),e._v(" "),a("div",{staticClass:"vue-main-title-content customers_name title"},[e._v("\n          标签"+e._s(0==e.label_id?"添加":"编辑")+"\n        ")])]),e._v(" "),a("div",{staticClass:"form"},[a("el-form",{ref:"add_department_form",attrs:{model:e.form,"label-width":"100px",rules:e.rules}},[a("el-form-item",{attrs:{label:"标签名称",prop:"label_name"}},[a("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:""},model:{value:e.form.label_name,callback:function(t){e.$set(e.form,"label_name",t)},expression:"form.label_name"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"选择标签组",prop:"group_id"}},[a("el-select",{staticStyle:{width:"70%"},attrs:{disabled:e.label_id>0,clearable:""},model:{value:e.form.group_id,callback:function(t){e.$set(e.form,"group_id",t)},expression:"form.group_id"}},e._l(e.group_arr,function(e){return a("el-option",{key:e.group_id,attrs:{label:e.group_name,value:e.group_id}})}))],1)],1)],1)])]),e._v(" "),a("div",{staticClass:"vue-page"},[a("el-row",[a("el-col",{attrs:{align:"center"}},[a("el-button",{attrs:{type:"primary"},on:{click:e.handSend}},[e._v("确定")]),e._v(" "),a("el-button",{on:{click:e.btnBack}},[e._v("返回")])],1)],1)],1)],1)},[],!1,null,"81c00f40",null);s.options.__file="edit.vue";t.default=s.exports}}]);