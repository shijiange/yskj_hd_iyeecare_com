(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-c3de"],{CqhM:function(e,t,a){},DNkW:function(e,t,a){var r=a("93I4"),i=Math.floor;e.exports=function(e){return!r(e)&&isFinite(e)&&i(e)===e}},PEGm:function(e,t,a){"use strict";var r=a("CqhM");a.n(r).a},UjMW:function(e,t,a){"use strict";var r=a("ql3t"),i=a.n(r),s={name:"AdminUserDetail",props:{isEdit:{type:Boolean,default:!1}},data:function(){var e=this;return{submit_loading:!1,ImgList:[],uploadImg:"",chooseImg:"",radio1:"不限",radio2:"不限",activeName2:"first",centerDialogVisible:!1,pageSize:0,current_page:0,total:0,role_name:"非操作员",is_unlimited:!1,form:{username:"",password:"",re_password:"",mobile:"",application_number:"",endtime:new Date,avatar:"",remark:""},rules:{username:[{required:!0,message:"请输入用户名"}],password:{required:!0,message:"请输入密码"},re_password:[{validator:function(t,a,r){""===a?r(new Error("请再次输入密码")):a!==e.form.password?r(new Error("两次输入密码不一致!")):r()},required:!0,trigger:"blur"}],mobile:{required:!0,message:"请输入手机"}},uid:""}},computed:{},created:function(){this.isEdit&&(this.uid=this.$route.params.id,this.getData()),this.currentChange(1)},methods:{getData:function(){var e=this;$http.post("/admin/user/edit",{uid:this.uid}," ").then(function(t){1===t.result?(e.form.username=t.data.username,e.form.mobile=t.data.has_one_profile.mobile,e.form.avatar=t.data.has_one_profile.avatar,e.form.application_number=t.data.application_number,e.form.remark=t.data.remark,t.data.has_one_app_user&&(e.role_name=t.data.has_one_app_user.role_name),t.data.endtime?e.form.endtime=1e3*t.data.endtime:(e.is_unlimited=!0,e.form.endtime=new Date)):t.msg&&""!=t.msg&&e.$message.error(t.msg)}).catch(function(e){console.error(e)})},currentChange:function(e){var t=this;$http.get("/admin/all/list",{page:e,year:this.radio1,month:this.radio2},"loading").then(function(e){1===e.result?(t.total=e.data.total,t.ImgList=e.data.data,t.current_page=e.data.current_page,t.pageSize=e.data.per_page):e.msg&&""!=e.msg&&t.$message.error(e.msg)}).catch(function(e){console.error(e)})},chooseTheImg:function(e){this.form[this.chooseImg]=e,this.centerDialogVisible=!1},chooseYear:function(e){this.currentChange(1)},chooseMonth:function(e){this.currentChange(1)},openUpload:function(e){this.chooseImg=e,this.uploadImg="",this.centerDialogVisible=!0},sureImg:function(){this.form[this.chooseImg]=this.uploadImg,this.centerDialogVisible=!1},clearImg:function(e){this.form[e]=""},deleteImg:function(e){var t=this;$http.get("/admin/all/delImg",{id:e}," ").then(function(e){1===e.result?(e.msg&&""!=e.msg&&t.$message.success("系统删除成功"),t.currentChange(1)):e.msg&&""!=e.msg&&t.$message.error(e.msg)}).catch(function(e){console.error(e)})},uploadSuccess:function(e,t){1===e.result?e.data.success?(this.uploadImg=e.data.success,this.$message.success("上传成功！")):this.$message.error(e.data.fail):e.msg&&""!=e.msg&&this.$message.error(e.msg),this.submit_loading=!1},beforeUpload:function(e){this.submit_loading=!0;var t=e.size/1024/1024<4;return t||(this.$message.error("上传图片大小不能超过 4MB!"),this.submit_loading=!1),t},submitForm:function(e){var t=this;this.is_unlimited?this.form.endtime=0:i()(this.form.endtime)?this.form.endtime=this.form.endtime/1e3:this.form.endtime=parseInt(this.form.endtime.getTime()/1e3);var a="",r={};this.isEdit?(a="/admin/user/edit",delete this.form.password,delete this.form.re_password,(r={user:this.form}).uid=this.uid):(a="/admin/user/create",r={user:this.form}),this.$refs[e].validate(function(i){if(!i)return console.log("error submit!!"),!1;$http.post(a,r,"保存中").then(function(a){if(1===a.result)a.msg&&""!=a.msg&&t.$message.success("添加成功！"),t.$router.push(t.fun.getUrl("Admin")),t.$refs[e].resetFields();else{if(a.msg instanceof Array){var r="";a.msg.forEach(function(e){r+=e+"   "}),r&&""!=r&&t.$message.error(r)}else t.$message.error(a.msg);t.form.endtime=new Date,t.is_unlimited=!1}}).catch(function(){})})}}},o=(a("PEGm"),a("KHd+")),l=Object(o.a)(s,function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"right"},[a("el-breadcrumb",{attrs:{"separator-class":"el-icon-arrow-right"}},[a("el-breadcrumb-item",[a("router-link",{attrs:{to:"/users/admin"}},[e._v("管理员用户")])],1),e._v(" "),a("el-breadcrumb-item",[e.isEdit?a("span",[e._v("编辑")]):a("span",[e._v("新增")]),e._v("用户\n    ")])],1),e._v(" "),a("el-form",{ref:"form",staticStyle:{"margin-top":"20px"},attrs:{model:e.form,rules:e.rules,"label-width":"15%"}},[a("el-form-item",{attrs:{label:"用户名",prop:"username"}},[a("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入用户名，用户名为3-30个字符，包括汉字、大小写字母、数字"},model:{value:e.form.username,callback:function(t){e.$set(e.form,"username",t)},expression:"form.username"}})],1),e._v(" "),e.isEdit?e._e():a("el-form-item",{attrs:{label:"密码",prop:"password"}},[a("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入密码，如开启密码校验，则密码长度至少为8位,要求包括数字，大小写字母和特殊字符",type:"password"},model:{value:e.form.password,callback:function(t){e.$set(e.form,"password",t)},expression:"form.password"}}),e._v(" "),a("div",{staticClass:"tip special"},[e._v("特殊符号包括(.!~@#$%^&*?()+_- )")])],1),e._v(" "),e.isEdit?e._e():a("el-form-item",{attrs:{label:"确认密码",prop:"re_password"}},[a("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入确认密码，如开启密码校验，则密码长度至少为8位,要求包括数字，大小写字母和特殊字符",type:"password"},model:{value:e.form.re_password,callback:function(t){e.$set(e.form,"re_password",t)},expression:"form.re_password"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"手机号",prop:"mobile"}},[a("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入手机号"},model:{value:e.form.mobile,callback:function(t){e.$set(e.form,"mobile",t)},expression:"form.mobile"}})],1),e._v(" "),"操作员"!=e.role_name?a("el-form-item",{attrs:{label:"建平台数量",prop:"application_number"}},[a("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入建平台数量"},model:{value:e.form.application_number,callback:function(t){e.$set(e.form,"application_number",e._n(t))},expression:"form.application_number"}}),e._v(" "),a("div",{staticClass:"tip"},[e._v("创建平台数量(为0或为空则不允许创建)")])],1):e._e(),e._v(" "),a("el-form-item",{attrs:{label:"有效期",prop:"endtime"}},[a("el-date-picker",{staticStyle:{width:"50%"},attrs:{disabled:e.is_unlimited,type:"date",placeholder:"请选择有效期"},model:{value:e.form.endtime,callback:function(t){e.$set(e.form,"endtime",t)},expression:"form.endtime"}}),e._v(" "),a("el-checkbox",{staticStyle:{width:"5%"},model:{value:e.is_unlimited,callback:function(t){e.is_unlimited=t},expression:"is_unlimited"}},[e._v("永久 ")])],1),e._v(" "),a("el-form-item",{attrs:{label:"头像",prop:"avatar"}},[a("el-input",{staticStyle:{width:"70%"},attrs:{disabled:"",placeholder:"请上传头像"},model:{value:e.form.avatar,callback:function(t){e.$set(e.form,"avatar",t)},expression:"form.avatar"}}),e._v(" "),a("el-button",{attrs:{size:"small",type:"primary"},on:{click:function(t){e.openUpload("avatar")}}},[e._v("点击上传\n      ")]),e._v(" "),a("div",{staticClass:"avatar-uploader-box"},[e.form.avatar?a("img",{staticClass:"avatar",attrs:{src:e.form.avatar}}):e._e(),e._v(" "),a("i",{directives:[{name:"show",rawName:"v-show",value:e.form.avatar,expression:"form.avatar"}],staticClass:"el-icon-circle-close",attrs:{title:"点击清除图片"},on:{click:function(t){e.clearImg("avatar")}}})])],1),e._v(" "),a("el-form-item",{attrs:{label:"备注",prop:"remark"}},[a("el-input",{staticStyle:{width:"70%"},attrs:{type:"textarea",rows:"7",placeholder:"可输入备注信息"},model:{value:e.form.remark,callback:function(t){e.$set(e.form,"remark",t)},expression:"form.remark"}})],1),e._v(" "),a("el-form-item",[a("el-button",{attrs:{type:"success"},on:{click:function(t){e.submitForm("form")}}},[e._v("\n        保存\n      ")])],1)],1),e._v(" "),a("el-dialog",{attrs:{visible:e.centerDialogVisible,width:"65%",center:""},on:{"update:visible":function(t){e.centerDialogVisible=t}}},[a("el-tabs",{attrs:{type:"card"},model:{value:e.activeName2,callback:function(t){e.activeName2=t},expression:"activeName2"}},[a("el-tab-pane",{attrs:{label:"上传图片",name:"first"}},[a("div",{directives:[{name:"loading",rawName:"v-loading",value:e.submit_loading,expression:"submit_loading"}],staticClass:"submit_Img",staticStyle:{"text-align":"center"}},[a("el-upload",{staticClass:"avatar-uploader",attrs:{action:"/admin/all/upload",accept:"image/*","show-file-list":!1,"on-success":e.uploadSuccess,"before-upload":e.beforeUpload}},[e.uploadImg?a("div",{staticClass:"avatar_box"},[a("img",{staticClass:"avatar",attrs:{src:e.uploadImg}})]):a("i",{staticClass:"el-icon-plus avatar-uploader-icon"})])],1)]),e._v(" "),a("el-tab-pane",{attrs:{label:"提取网络图片",name:"second"}},[a("el-input",{staticStyle:{width:"90%"},attrs:{placeholder:"请输入网络图片地址"},model:{value:e.uploadImg,callback:function(t){e.uploadImg=t},expression:"uploadImg"}})],1),e._v(" "),a("el-tab-pane",{attrs:{label:"浏览图片",name:"third"}},[a("div",[a("el-radio-group",{attrs:{size:"medium"},on:{change:e.chooseYear},model:{value:e.radio1,callback:function(t){e.radio1=t},expression:"radio1"}},[a("el-radio-button",{attrs:{label:"不限"}}),e._v(" "),a("el-radio-button",{attrs:{label:"2019"}},[e._v("2019年")]),e._v(" "),a("el-radio-button",{attrs:{label:"2018"}},[e._v("2018年")]),e._v(" "),a("el-radio-button",{attrs:{label:"2017"}},[e._v("2017年")]),e._v(" "),a("el-radio-button",{attrs:{label:"2016"}},[e._v("2016年")])],1)],1),e._v(" "),a("div",{staticStyle:{"margin-top":"10px"}},[a("el-radio-group",{attrs:{size:"small"},on:{change:e.chooseMonth},model:{value:e.radio2,callback:function(t){e.radio2=t},expression:"radio2"}},[a("el-radio-button",{attrs:{label:"不限"}}),e._v(" "),a("el-radio-button",{attrs:{label:"1"}},[e._v("1月")]),e._v(" "),a("el-radio-button",{attrs:{label:"2"}},[e._v("2月")]),e._v(" "),a("el-radio-button",{attrs:{label:"3"}},[e._v("3月")]),e._v(" "),a("el-radio-button",{attrs:{label:"4"}},[e._v("4月")]),e._v(" "),a("el-radio-button",{attrs:{label:"5"}},[e._v("5月")]),e._v(" "),a("el-radio-button",{attrs:{label:"6"}},[e._v("6月")]),e._v(" "),a("el-radio-button",{attrs:{label:"7"}},[e._v("7月")]),e._v(" "),a("el-radio-button",{attrs:{label:"8"}},[e._v("8月")]),e._v(" "),a("el-radio-button",{attrs:{label:"9"}},[e._v("9月")]),e._v(" "),a("el-radio-button",{attrs:{label:"10"}},[e._v("10月")]),e._v(" "),a("el-radio-button",{attrs:{label:"11"}},[e._v("11月")]),e._v(" "),a("el-radio-button",{attrs:{label:"12"}},[e._v("12月")])],1)],1),e._v(" "),a("div",{staticClass:"imgList",attrs:{id:"upload-img"}},e._l(e.ImgList,function(t,r){return a("div",{key:r,staticClass:"avatar-uploader-box"},[a("img",{staticClass:"avatar",attrs:{src:t.url},on:{click:function(a){e.chooseTheImg(t.url)}}}),e._v(" "),a("i",{staticClass:"el-icon-circle-close",attrs:{title:"点击清除图片"},on:{click:function(a){e.deleteImg(t.id)}}})])})),e._v(" "),a("el-pagination",{staticStyle:{"margin-top":"10px","text-align":"right"},attrs:{background:"","page-size":e.pageSize,"current-page":e.current_page,total:e.total,layout:"prev, pager, next"},on:{"current-change":e.currentChange,"update:currentPage":function(t){e.current_page=t}}})],1)],1),e._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(t){e.centerDialogVisible=!1}}},[e._v("取 消")]),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:e.sureImg}},[e._v("确 定 ")])],1)],1)],1)},[],!1,null,null,null);l.options.__file="admin_user_details.vue";t.a=l.exports},f3OQ:function(e,t,a){"use strict";a.r(t);var r={name:"AddUser",components:{AdminUserDetail:a("UjMW").a}},i=a("KHd+"),s=Object(i.a)(r,function(){var e=this.$createElement;return(this._self._c||e)("admin-user-detail",{attrs:{"is-edit":!0}})},[],!1,null,null,null);s.options.__file="edit.vue";t.default=s.exports},h5AQ:function(e,t,a){a("hRZT"),e.exports=a("WEpk").Number.isInteger},hRZT:function(e,t,a){var r=a("Y7ZC");r(r.S,"Number",{isInteger:a("DNkW")})},ql3t:function(e,t,a){e.exports={default:a("h5AQ"),__esModule:!0}}}]);