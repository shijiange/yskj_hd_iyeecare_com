(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-fb98"],{O8gU:function(t,e,n){},YhA1:function(t,e,n){"use strict";var r=n("O8gU");n.n(r).a},fFGZ:function(t,e,n){"use strict";n.r(e);var r={data:function(){return{form:{greeting:"",unline_reply:""}}},components:{Tinymce:n("glbJ").a},created:function(){this.$store.dispatch("GetUserInfo"),this.getData()},destroyed:function(){},methods:{getData:function(){var t=this;$http.post("plugin.yun-chat.frontend.employee-settings.get-settings",{},"loading").then(function(e){1===e.result?e.data&&e.data.reply&&(t.form=e.data.reply):t.$message.error(e.msg)}).catch(function(t){console.error(t)})},submitForm:function(){var t=this,e={greeting:this.form.greeting,unline_reply:this.form.unline_reply};$http.post("plugin.yun-chat.frontend.employee-settings.save-reply",e).then(function(e){1===e.result?t.$message.success(e.msg):t.$message.error(e.msg)}).catch(function(t){console.error(t)})}}},i=(n("YhA1"),n("ZrdR")),o=Object(i.a)(r,function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"right"},[n("div",{staticClass:"box"},[n("div",[n("el-form",{ref:"form",staticClass:"demo-ruleForm",attrs:{model:t.form,"label-width":"140px"},nativeOn:{submit:function(t){t.preventDefault()}}},[n("el-form-item",{attrs:{label:"欢迎语消息",prop:"greeting"}},[n("tinymce",{attrs:{height:200},model:{value:t.form.greeting,callback:function(e){t.$set(t.form,"greeting",e)},expression:"form.greeting"}})],1),t._v(" "),n("el-form-item",{attrs:{label:"不在线时回复消息",prop:"unline_reply"}},[n("tinymce",{attrs:{height:200},model:{value:t.form.unline_reply,callback:function(e){t.$set(t.form,"unline_reply",e)},expression:"form.unline_reply"}})],1)],1),t._v(" "),n("div",{staticStyle:{"text-align":"center"}},[n("el-button",{staticStyle:{width:"200px"},attrs:{type:"primary"},on:{click:function(e){t.submitForm()}}},[t._v("保存")])],1)],1)])])},[],!1,null,"7b832fc6",null);o.options.__file="reply.vue";e.default=o.exports}}]);