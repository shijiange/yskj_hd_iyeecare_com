(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-e79c"],{JNhG:function(t,e,i){},OzGj:function(t,e,i){"use strict";var n=i("JNhG");i.n(n).a},WS4k:function(t,e,i){},glbJ:function(t,e,i){"use strict";var n=i("Asgo"),s=i.n(n),a=i("EPZ6"),o=i.n(a),l={name:"EditorSlideUpload",props:{color:{type:String,default:"#1890ff"}},data:function(){return{dialogVisible:!1,listObj:{},fileList:[]}},methods:{checkAllSuccess:function(){var t=this;return o()(this.listObj).every(function(e){return t.listObj[e].hasSuccess})},handleSubmit:function(){var t=this,e=o()(this.listObj).map(function(e){return t.listObj[e]});this.checkAllSuccess()?(this.$emit("successCBK",e),this.listObj={},this.fileList=[],this.dialogVisible=!1):this.$message("请等待所有图片上传成功 或 出现了网络问题，请刷新页面重新上传！")},handleSuccess:function(t,e){for(var i=e.uid,n=o()(this.listObj),s=0,a=n.length;s<a;s++)if(this.listObj[n[s]].uid===i)return this.listObj[n[s]].url=t.data.success,void(this.listObj[n[s]].hasSuccess=!0)},handleRemove:function(t){for(var e=t.uid,i=o()(this.listObj),n=0,s=i.length;n<s;n++)if(this.listObj[i[n]].uid===e)return void delete this.listObj[i[n]]},beforeUpload:function(t){var e=this,i=window.URL||window.webkitURL,n=t.uid;return this.listObj[n]={},new s.a(function(s,a){var o=new Image;o.src=i.createObjectURL(t),o.onload=function(){e.listObj[n]={hasSuccess:!1,uid:t.uid,width:this.width,height:this.height}},s(!0)})}}},c=(i("lvT4"),i("ZrdR")),r=Object(c.a)(l,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"upload-container"},[i("el-button",{style:{background:t.color,borderColor:t.color},attrs:{icon:"el-icon-upload",size:"mini",type:"primary"},on:{click:function(e){t.dialogVisible=!0}}},[t._v("上传图片\n  ")]),t._v(" "),i("el-dialog",{attrs:{visible:t.dialogVisible},on:{"update:visible":function(e){t.dialogVisible=e}}},[i("el-upload",{staticClass:"editor-slide-upload",attrs:{multiple:!0,"file-list":t.fileList,"show-file-list":!0,"on-remove":t.handleRemove,"on-success":t.handleSuccess,"before-upload":t.beforeUpload,action:"/admin/all/upload","list-type":"picture-card"}},[i("el-button",{attrs:{size:"small",type:"primary"}},[t._v("点击上传")])],1),t._v(" "),i("el-button",{on:{click:function(e){t.dialogVisible=!1}}},[t._v("取 消")]),t._v(" "),i("el-button",{attrs:{type:"primary"},on:{click:t.handleSubmit}},[t._v("确 定")])],1)],1)},[],!1,null,"56de81d2",null);r.options.__file="editorImage.vue";var u=["advlist anchor autolink autosave code codesample colorpicker colorpicker contextmenu directionality emoticons fullscreen hr image imagetools insertdatetime link lists media nonbreaking noneditable pagebreak paste preview print save searchreplace spellchecker tabfocus table template textcolor textpattern visualblocks visualchars wordcount"],d=["searchreplace bold italic underline strikethrough alignleft aligncenter alignright outdent indent  blockquote undo redo removeformat subscript superscript code codesample","hr bullist numlist link image charmap preview anchor pagebreak insertdatetime media table emoticons forecolor backcolor fullscreen"],v={name:"Tinymce",components:{editorImage:r.exports},props:{id:{type:String,default:function(){return"vue-tinymce-"+ +new Date+(1e3*Math.random()).toFixed(0)}},value:{type:String,default:""},toolbar:{type:Array,required:!1,default:function(){return[]}},menubar:{type:String,default:"file edit insert view format table"},height:{type:Number,required:!1,default:360}},data:function(){return{hasChange:!1,hasInit:!1,tinymceId:this.id,fullscreen:!1,languageTypeList:{en:"en",zh:"zh_CN"}}},computed:{language:function(){return this.languageTypeList[this.$store.getters.language]}},watch:{value:function(t){var e=this;!this.hasChange&&this.hasInit&&this.$nextTick(function(){return window.tinymce.get(e.tinymceId).setContent(t||"")})},language:function(){var t=this;this.destroyTinymce(),this.$nextTick(function(){return t.initTinymce()})}},mounted:function(){this.initTinymce()},activated:function(){this.initTinymce()},deactivated:function(){this.destroyTinymce()},destroyed:function(){this.destroyTinymce()},methods:{initTinymce:function(){var t=this,e=this;window.tinymce.init({language:this.language,selector:"#"+this.tinymceId,height:this.height,body_class:"panel-body ",object_resizing:!1,toolbar:this.toolbar.length>0?this.toolbar:d,menubar:this.menubar,plugins:u,end_container_on_empty_block:!0,powerpaste_word_import:"clean",code_dialog_height:450,code_dialog_width:1e3,advlist_bullet_styles:"square",advlist_number_styles:"default",imagetools_cors_hosts:["www.tinymce.com","codepen.io"],default_link_target:"_blank",link_title:!1,nonbreaking_force_tab:!0,init_instance_callback:function(i){e.value&&i.setContent(e.value),e.hasInit=!0,i.on("NodeChange Change KeyUp SetContent",function(){t.hasChange=!0,t.$emit("input",i.getContent())})},setup:function(t){t.on("FullscreenStateChanged",function(t){e.fullscreen=t.state})}})},destroyTinymce:function(){var t=window.tinymce.get(this.tinymceId);this.fullscreen&&t.execCommand("mceFullScreen"),t&&t.destroy()},setContent:function(t){window.tinymce.get(this.tinymceId).setContent(t)},getContent:function(){window.tinymce.get(this.tinymceId).getContent()},imageSuccessCBK:function(t){var e=this;t.forEach(function(t){window.tinymce.get(e.tinymceId).insertContent('<img class="wscnph" src="'+t.url+'" >')})}}},m=(i("OzGj"),Object(c.a)(v,function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"tinymce-container editor-container",class:{fullscreen:this.fullscreen}},[e("textarea",{staticClass:"tinymce-textarea",attrs:{id:this.tinymceId}}),this._v(" "),e("div",{staticClass:"editor-custom-btn-container"},[e("editorImage",{staticClass:"editor-upload-btn",attrs:{color:"#1890ff"},on:{successCBK:this.imageSuccessCBK}})],1)])},[],!1,null,"4b42c7ad",null));m.options.__file="index.vue";e.a=m.exports},lvT4:function(t,e,i){"use strict";var n=i("WS4k");i.n(n).a},un4T:function(t,e,i){"use strict";var n=i("z5hn");i.n(n).a},"wR+Y":function(t,e,i){"use strict";i.r(e);var n={name:"website-setting",components:{Tinymce:i("glbJ").a},data:function(){return{submit_loading:!1,form:{password_change:"0",password_verify:"0",pic_verify:"0",sms_verify:"0",login_limit_num:"",force_change_pwd:"0"},login_limit_num:"",is_out:!1,is_limit:!1,plugin_status:"",rules:{}}},created:function(){this.getData(),window.addEventListener("beforeunload",function(t){window.onbeforeunload=null})},destroyed:function(){},methods:{isNumber:function(){if(!/^[1-9]\d*$/.test(this.login_limit_num))return this.$message.error("请输入正确的数值"),!1;this.form.login_limit_num=this.login_limit_num,this.is_limit=!1},submitForm:function(t){var e=this;$http.post("/admin/system/login_set",{setdata:this.form},"保存中").then(function(t){1===t.result?(t.msg&&""!=t.msg&&e.$message.success("保存成功！"),window.location.reload()):t.msg&&""!=t.msg&&e.$message.error(t.msg)}).catch(function(){})},getData:function(){var t=this;$http.post("/admin/system/login_set",{},"加载中").then(function(e){1==e.result?(t.form=e.data,t.form.login_limit_num&&(t.login_limit_num=t.form.login_limit_num),console.log(t.form)):e.msg&&""!=e.msg&&t.$message.error(e.msg)}).catch(function(){})}}},s=(i("un4T"),i("ZrdR")),a=Object(s.a)(n,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"right"},[t._m(0),t._v(" "),i("div",{staticClass:"content"},[i("div",{staticClass:"content-row"},[i("div",{staticStyle:{flex:"1"}},[t._v("\n        修改密码\n      ")]),t._v(" "),i("div",{staticStyle:{flex:"5"}},[t._v("\n        开启后，首次登录的用户弹窗提示修改密码\n      ")]),t._v(" "),i("div",{staticStyle:{flex:"1"}},[i("el-switch",{attrs:{"active-value":"1","inactive-value":"0"},model:{value:t.form.password_change,callback:function(e){t.$set(t.form,"password_change",e)},expression:"form.password_change"}})],1)]),t._v(" "),i("div",{staticClass:"content-row"},[i("div",{staticStyle:{flex:"1"}},[t._v("\n        密码强度校验\n      ")]),t._v(" "),i("div",{staticStyle:{flex:"5"}},[t._v("\n        开启后，登录密码设置长度至少为8位，要求包括数字，字母，大小写和特殊符号(.!~@#$%^&*?()+_- )\n      ")]),t._v(" "),i("div",{staticStyle:{flex:"1"}},[i("el-switch",{attrs:{"active-value":"1","inactive-value":"0"},model:{value:t.form.password_verify,callback:function(e){t.$set(t.form,"password_verify",e)},expression:"form.password_verify"}})],1)]),t._v(" "),i("div",{staticClass:"content-row"},[i("div",{staticStyle:{flex:"1"}},[t._v("\n        图形验证码\n      ")]),t._v(" "),i("div",{staticStyle:{flex:"5"}},[t._v("\n        开启后，用户需要输入图形验证码\n      ")]),t._v(" "),i("div",{staticStyle:{flex:"1"}},[i("el-switch",{attrs:{"active-value":"1","inactive-value":"0"},model:{value:t.form.pic_verify,callback:function(e){t.$set(t.form,"pic_verify",e)},expression:"form.pic_verify"}})],1)]),t._v(" "),i("div",{staticClass:"content-row"},[i("div",{staticStyle:{flex:"1"}},[t._v("\n        短信验证码\n      ")]),t._v(" "),i("div",{staticStyle:{flex:"5"}},[t._v("\n        开启后，用户需要输入短信验证码\n      ")]),t._v(" "),i("div",{staticStyle:{flex:"1"}},[i("el-switch",{attrs:{"active-value":"1","inactive-value":"0"},model:{value:t.form.sms_verify,callback:function(e){t.$set(t.form,"sms_verify",e)},expression:"form.sms_verify"}})],1)]),t._v(" "),i("div",{staticClass:"content-row"},[i("div",{staticStyle:{flex:"1"}},[t._v("\n        登录限制\n      ")]),t._v(" "),i("div",{staticStyle:{flex:"5"}},[t._v("\n        设置登录失败超出限定次数\n      ")]),t._v(" "),i("div",{staticStyle:{flex:"1"}},[i("el-button",{attrs:{type:"text"},on:{click:function(e){t.is_limit=!0}}},[t._v("修改")])],1)]),t._v(" "),i("div",{staticClass:"content-row"},[i("div",{staticStyle:{flex:"1"}},[t._v("\n        强制修改密码\n      ")]),t._v(" "),i("div",{staticStyle:{flex:"5"}},[t._v("\n        三个月未修改密码的账号禁止使用\n      ")]),t._v(" "),i("div",{staticStyle:{flex:"1"}},[i("el-switch",{attrs:{"active-value":"1","inactive-value":"0"},model:{value:t.form.force_change_pwd,callback:function(e){t.$set(t.form,"force_change_pwd",e)},expression:"form.force_change_pwd"}})],1)])]),t._v(" "),i("div",{staticClass:"content-row",staticStyle:{"padding-top":"20px"}},[i("el-button",{attrs:{type:"primary"},on:{click:t.submitForm}},[t._v("保存")])],1),t._v(" "),i("el-dialog",{attrs:{title:"设置自动退出时间",visible:t.is_out},on:{"update:visible":function(e){t.is_out=e}}},[i("div",{staticStyle:{"text-align":"center"}},[i("el-tag",{staticStyle:{"margin-bottom":"30px"},attrs:{type:"danger"}},[i("i",{staticClass:"el-icon-warning"}),t._v("\n          登录状态下，若长时间无操作系统将自动退出！\n        ")]),t._v(" "),i("el-tag",{staticStyle:{"margin-bottom":"30px","font-size":"14px"},attrs:{type:"danger"}},[i("i",{staticClass:"el-icon-warning"}),t._v("\n          需要修改，请到商城config文件夹下，找到session.php的'lifetime'参数自行修改，单位默认为分钟\n        ")]),t._v(" "),i("div",[i("el-button",{attrs:{type:"primary"},on:{click:function(e){t.is_out=!1}}},[t._v("确定")]),t._v(" "),i("el-button",{on:{click:function(e){t.is_out=!1}}},[t._v("取消")])],1)],1),t._v(" "),i("span",{staticClass:"dialog-footer",staticStyle:{"text-align":"center"},attrs:{slot:"footer"},slot:"footer"})]),t._v(" "),i("el-dialog",{attrs:{title:"修改登录限制",visible:t.is_limit},on:{"update:visible":function(e){t.is_limit=e}}},[i("div",{staticStyle:{"text-align":"center"}},[i("div",{staticStyle:{padding:"40px 0"}},[i("el-input",{model:{value:t.login_limit_num,callback:function(e){t.login_limit_num=e},expression:"login_limit_num"}},[i("template",{slot:"prepend"},[t._v("登录限制次数")]),t._v(" "),i("template",{slot:"append"},[t._v("次")])],2)],1),t._v(" "),i("div",[i("el-button",{attrs:{type:"primary"},on:{click:function(e){t.isNumber()}}},[t._v("确定")]),t._v(" "),i("el-button",{on:{click:function(e){t.is_limit=!1}}},[t._v("取消")])],1)]),t._v(" "),i("span",{staticClass:"dialog-footer",staticStyle:{"text-align":"center"},attrs:{slot:"footer"},slot:"footer"})])],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"right-head"},[e("div",{staticClass:"right-head-con1"},[this._v("登录设置")]),this._v(" "),e("div",{staticClass:"tip",staticStyle:{color:"red"}},[this._v("\n      注意：设置以下选项之后，需点击下面的‘保存’按钮，设置才生效\n    ")])])}],!1,null,null,null);a.options.__file="index.vue";e.default=a.exports},z5hn:function(t,e,i){}}]);