(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-0413"],{AGzx:function(t,e,a){"use strict";var i=a("y0AX");a.n(i).a},hPhl:function(t,e,a){"use strict";a.r(e);var i={data:function(){return{formLabelAlign:{name:"",logo_img:"",member:{}},arrSp:[{category_id:"1",category_title:"企业信息",routers:[]},{category_id:"2",category_title:"企业微信配置",routers:[]}],ImgList:[],submit_loading:!1,uploadImg:"",chooseImg:"",radio1:"不限",radio2:"不限",activeName2:"first",centerDialogVisible:!1,pageSize:0,current_page:0,total:0,rules:{}}},created:function(){this.getBusinessSurvey()},methods:{submit:function(){},openUpload:function(t){console.log(t),this.chooseImg=t,this.uploadImg="",this.centerDialogVisible=!0},sureImg:function(){this.formLabelAlign.logo_img=this.uploadImg,this.centerDialogVisible=!1},currentChange:function(t){var e=this;$http.get("/admin/all/list",{page:t,year:this.radio1,month:this.radio2},"加载中").then(function(t){1===t.result?(e.total=t.data.total,e.ImgList=t.data.data,e.current_page=t.data.current_page,e.pageSize=t.data.per_page):(e.list=t.data,e.$message.error("接口请求错误"))}).catch(function(t){console.error(t)})},beforeUpload:function(t){this.submit_loading=!0;var e=t.size/1024/1024<4;return e||(this.$message.error("上传图片大小不能超过 4MB!"),this.submit_loading=!1),e},chooseYear:function(t){this.currentChange(1)},chooseMonth:function(t){this.currentChange(1)},uploadSuccess:function(t,e){console.log(t,"----------------"),1===t.result?t.data.img_url?(this.uploadImg=t.data.img_url,this.$message.success("上传成功！")):this.$message.error(t.data.fail):this.$message.error(t.msg),this.submit_loading=!1},getBusinessSurvey:function(){var t=this,e=this.formLabelAlign,a=e.logo_img,i=e.id,s=e.name;$http.pc_get("admin/getBusinessSurvey",{logo_img:a,id:i,name:s},"loading").then(function(e){1===e.result?t.formLabelAlign=e.data:e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)})},setBusinessSurvey:function(){var t=this,e=this.formLabelAlign,a=e.logo_img,i=e.id,s=e.name;$http.pc_get("admin/editBussiness",{logo_img:a,id:i,name:s},"loading").then(function(e){1===e.result?t.$message.success(e.msg):e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)})}},components:{sign_side:a("2kDQ").a}},s=(a("AGzx"),a("KHd+")),l=Object(s.a)(i,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"information"},[a("sign_side",{attrs:{defaultActive:"setting",router_list:t.arrSp}}),t._v(" "),a("div",{staticClass:"rightBox"},[t._m(0),t._v(" "),a("div",{staticClass:"line"},[a("el-form",{staticClass:"elwidth",attrs:{"label-position":"right","label-width":"120px",model:t.formLabelAlign}},[a("el-form-item",{attrs:{label:"企业名称"}},[a("el-input",{attrs:{disabled:""},model:{value:t.formLabelAlign.name,callback:function(e){t.$set(t.formLabelAlign,"name",e)},expression:"formLabelAlign.name"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"绑定平台会员"}},[a("div",{staticClass:"labelUser"},[t.formLabelAlign.member?a("div",{staticClass:"labelUser_left"},[a("img",{attrs:{src:t.formLabelAlign.member.avatar,alt:""}})]):t._e(),t._v(" "),a("div",{staticClass:"labelUser_right"},[a("span",[t._v("ID:"+t._s(t.formLabelAlign.member.uid))]),t._v(" "),a("span",[t._v("昵称:"+t._s(t.formLabelAlign.member.nickname))]),t._v(" "),a("span",[t._v("姓名:"+t._s(t.formLabelAlign.member.realname))]),t._v(" "),a("span",[t._v("手机号:"+t._s(t.formLabelAlign.member.mobile))])])])]),t._v(" "),a("el-form-item",{attrs:{label:"企业logo"}},[a("div",{staticClass:"imagebox",on:{click:function(e){t.openUpload("logo_img")}}},[a("img",{attrs:{src:t.formLabelAlign.logo_img,alt:""}}),t._v(" "),a("span",[t._v("点击重新上传")])]),t._v(" "),a("div",{staticClass:"imageTxt"},[t._v("提示:100*100px正方形图片")])])],1)],1),t._v(" "),a("div",{staticClass:"buttonLis"},[a("el-button",{attrs:{type:"primary"},on:{click:t.setBusinessSurvey}},[t._v("提交")]),t._v(" "),a("el-button",[t._v("返回")])],1)]),t._v(" "),a("el-dialog",{attrs:{visible:t.centerDialogVisible,width:"65%",center:""},on:{"update:visible":function(e){t.centerDialogVisible=e}}},[a("el-tabs",{attrs:{type:"card"},model:{value:t.activeName2,callback:function(e){t.activeName2=e},expression:"activeName2"}},[a("el-tab-pane",{attrs:{label:"上传图片",name:"first"}},[a("div",{directives:[{name:"loading",rawName:"v-loading",value:t.submit_loading,expression:"submit_loading"}],staticClass:"submit_Img",staticStyle:{"text-align":"center"}},[a("el-upload",{staticClass:"avatar-uploader",attrs:{action:"/addons/yun_shop/api.php?route=upload.uploadPic",accept:"image/*","show-file-list":!1,"on-success":t.uploadSuccess,"before-upload":t.beforeUpload}},[t.uploadImg?a("div",{staticClass:"avatar_box"},[a("img",{staticClass:"avatar",attrs:{src:t.uploadImg}})]):a("i",{staticClass:"el-icon-plus avatar-uploader-icon"})])],1)]),t._v(" "),a("el-tab-pane",{attrs:{label:"提取网络图片",name:"second"}},[a("el-input",{staticStyle:{width:"90%"},attrs:{placeholder:"请输入网络图片地址"},model:{value:t.uploadImg,callback:function(e){t.uploadImg=e},expression:"uploadImg"}})],1),t._v(" "),t._e()],1),t._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(e){t.centerDialogVisible=!1}}},[t._v("取 消")]),t._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:t.sureImg}},[t._v("确 定 ")])],1)],1)],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticStyle:{display:"flex",height:"17px","margin-bottom":"40px"}},[e("div",{staticClass:"message-top-title"}),this._v("\n      企业信息\n    ")])}],!1,null,"21f75ba8",null);l.options.__file="information.vue";e.default=l.exports},y0AX:function(t,e,a){}}]);