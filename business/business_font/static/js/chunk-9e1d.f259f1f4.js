(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-9e1d"],{"5MBP":function(e,t,i){"use strict";var s=i("yx7q");i.n(s).a},WP0D:function(e,t,i){"use strict";i.r(t);var s={data:function(){return{chooseImg:"",centerDialogVisible:!1,ruleForm:{name:"",logo_img:""},rules:{name:[{required:!0,trigger:"blur",message:"请输入企业名称"}],logo_img:[{required:!0,trigger:"blur",message:"请上传企业logo"}]}}},components:{upload_images:i("ErL5").a},methods:{submit:function(){var e=this;this.$refs.ruleForm.validate(function(t){if(!t)return console.log("error submit!!"),!1;var i=e.ruleForm;$http.pc_post("admin/addBussiness",i,"提交中").then(function(t){1===t.result?(e.$message.success(t.msg),e.$refs.ruleForm.resetFields(),e.$router.push(e.fun.getUrl("homeIndex"))):e.$message.error(t.msg)})})},openUpload:function(e){this.chooseImg=e,this.centerDialogVisible=!0},changeVisible:function(e){this.centerDialogVisible=e},clearImg:function(e){this.ruleForm[e]="",this.$forceUpdate()},sureImg:function(e){this.ruleForm[this.chooseImg]=e,this.centerDialogVisible=!1},toUrl:function(e){this.$router.push(this.fun.getUrl(e))}}},o=(i("5MBP"),i("KHd+")),r=Object(o.a)(s,function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",{staticClass:"businessCreate"},[e._m(0),e._v(" "),i("el-main",[i("div",{staticClass:"formBox"},[i("el-form",{ref:"ruleForm",staticClass:"demo-ruleForm",attrs:{model:e.ruleForm,rules:e.rules,"label-width":"100px"}},[i("el-form-item",{attrs:{label:"企业名称",prop:"name"}},[i("el-input",{attrs:{placeholder:"请输入企业名称"},model:{value:e.ruleForm.name,callback:function(t){e.$set(e.ruleForm,"name",t)},expression:"ruleForm.name"}})],1),e._v(" "),i("el-form-item",{attrs:{label:"企业logo",prop:"logo_img"}},[i("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请上传平台LOGO",disabled:""},model:{value:e.ruleForm.logo_img,callback:function(t){e.$set(e.ruleForm,"logo_img",t)},expression:"ruleForm.logo_img"}}),e._v(" "),i("el-button",{attrs:{size:"small",type:"primary"},on:{click:function(t){e.openUpload("logo_img")}}},[e._v("点击上传\n          ")]),e._v(" "),i("div",{staticClass:"avatar-uploader-box"},[e.ruleForm.logo_img?i("img",{staticClass:"avatar",attrs:{src:e.ruleForm.logo_img}}):e._e(),e._v(" "),i("i",{directives:[{name:"show",rawName:"v-show",value:e.ruleForm.logo_img,expression:"ruleForm.logo_img"}],staticClass:"el-icon-circle-close",attrs:{title:"点击清除图片"},on:{click:function(t){e.clearImg("logo_img")}}})])],1)],1)],1),e._v(" "),i("div",{staticClass:"buttonLis"},[i("el-button",{staticStyle:{width:"200px"},attrs:{type:"primary"},on:{click:e.submit}},[e._v("提交")]),e._v(" "),i("el-button",{staticStyle:{width:"200px","margin-left":"50px"},on:{click:function(t){e.toUrl("homeIndex")}}},[e._v("返回")])],1)]),e._v(" "),i("upload_images",{attrs:{centerDialogVisible:e.centerDialogVisible},on:{changeVisible:e.changeVisible,sureImg:e.sureImg}})],1)},[function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"centerHead"},[t("div",{staticStyle:{display:"flex",height:"17px"}},[t("div",{staticClass:"message-top-title"}),this._v("\n      企业管理->创建企业\n    ")])])}],!1,null,"34ccda98",null);r.options.__file="create_business.vue";t.default=r.exports},yx7q:function(e,t,i){}}]);