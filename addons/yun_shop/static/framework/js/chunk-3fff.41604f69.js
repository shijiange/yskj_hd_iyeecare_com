(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-3fff"],{IXnl:function(e,t,l){},JNhG:function(e,t,l){},OzGj:function(e,t,l){"use strict";var a=l("JNhG");l.n(a).a},WS4k:function(e,t,l){},glbJ:function(e,t,l){"use strict";var a=l("Asgo"),r=l.n(a),o=l("EPZ6"),i=l.n(o),s={name:"EditorSlideUpload",props:{color:{type:String,default:"#1890ff"}},data:function(){return{dialogVisible:!1,listObj:{},fileList:[]}},methods:{checkAllSuccess:function(){var e=this;return i()(this.listObj).every(function(t){return e.listObj[t].hasSuccess})},handleSubmit:function(){var e=this,t=i()(this.listObj).map(function(t){return e.listObj[t]});this.checkAllSuccess()?(this.$emit("successCBK",t),this.listObj={},this.fileList=[],this.dialogVisible=!1):this.$message("请等待所有图片上传成功 或 出现了网络问题，请刷新页面重新上传！")},handleSuccess:function(e,t){for(var l=t.uid,a=i()(this.listObj),r=0,o=a.length;r<o;r++)if(this.listObj[a[r]].uid===l)return this.listObj[a[r]].url=e.data.success,void(this.listObj[a[r]].hasSuccess=!0)},handleRemove:function(e){for(var t=e.uid,l=i()(this.listObj),a=0,r=l.length;a<r;a++)if(this.listObj[l[a]].uid===t)return void delete this.listObj[l[a]]},beforeUpload:function(e){var t=this,l=window.URL||window.webkitURL,a=e.uid;return this.listObj[a]={},new r.a(function(r,o){var i=new Image;i.src=l.createObjectURL(e),i.onload=function(){t.listObj[a]={hasSuccess:!1,uid:e.uid,width:this.width,height:this.height}},r(!0)})}}},n=(l("lvT4"),l("ZrdR")),c=Object(n.a)(s,function(){var e=this,t=e.$createElement,l=e._self._c||t;return l("div",{staticClass:"upload-container"},[l("el-button",{style:{background:e.color,borderColor:e.color},attrs:{icon:"el-icon-upload",size:"mini",type:"primary"},on:{click:function(t){e.dialogVisible=!0}}},[e._v("上传图片\n  ")]),e._v(" "),l("el-dialog",{attrs:{visible:e.dialogVisible},on:{"update:visible":function(t){e.dialogVisible=t}}},[l("el-upload",{staticClass:"editor-slide-upload",attrs:{multiple:!0,"file-list":e.fileList,"show-file-list":!0,"on-remove":e.handleRemove,"on-success":e.handleSuccess,"before-upload":e.beforeUpload,action:"/admin/all/upload","list-type":"picture-card"}},[l("el-button",{attrs:{size:"small",type:"primary"}},[e._v("点击上传")])],1),e._v(" "),l("el-button",{on:{click:function(t){e.dialogVisible=!1}}},[e._v("取 消")]),e._v(" "),l("el-button",{attrs:{type:"primary"},on:{click:e.handleSubmit}},[e._v("确 定")])],1)],1)},[],!1,null,"56de81d2",null);c.options.__file="editorImage.vue";var m=["advlist anchor autolink autosave code codesample colorpicker colorpicker contextmenu directionality emoticons fullscreen hr image imagetools insertdatetime link lists media nonbreaking noneditable pagebreak paste preview print save searchreplace spellchecker tabfocus table template textcolor textpattern visualblocks visualchars wordcount"],p=["searchreplace bold italic underline strikethrough alignleft aligncenter alignright outdent indent  blockquote undo redo removeformat subscript superscript code codesample","hr bullist numlist link image charmap preview anchor pagebreak insertdatetime media table emoticons forecolor backcolor fullscreen"],d={name:"Tinymce",components:{editorImage:c.exports},props:{id:{type:String,default:function(){return"vue-tinymce-"+ +new Date+(1e3*Math.random()).toFixed(0)}},value:{type:String,default:""},toolbar:{type:Array,required:!1,default:function(){return[]}},menubar:{type:String,default:"file edit insert view format table"},height:{type:Number,required:!1,default:360}},data:function(){return{hasChange:!1,hasInit:!1,tinymceId:this.id,fullscreen:!1,languageTypeList:{en:"en",zh:"zh_CN"}}},computed:{language:function(){return this.languageTypeList[this.$store.getters.language]}},watch:{value:function(e){var t=this;!this.hasChange&&this.hasInit&&this.$nextTick(function(){return window.tinymce.get(t.tinymceId).setContent(e||"")})},language:function(){var e=this;this.destroyTinymce(),this.$nextTick(function(){return e.initTinymce()})}},mounted:function(){this.initTinymce()},activated:function(){this.initTinymce()},deactivated:function(){this.destroyTinymce()},destroyed:function(){this.destroyTinymce()},methods:{initTinymce:function(){var e=this,t=this;window.tinymce.init({language:this.language,selector:"#"+this.tinymceId,height:this.height,body_class:"panel-body ",object_resizing:!1,toolbar:this.toolbar.length>0?this.toolbar:p,menubar:this.menubar,plugins:m,end_container_on_empty_block:!0,powerpaste_word_import:"clean",code_dialog_height:450,code_dialog_width:1e3,advlist_bullet_styles:"square",advlist_number_styles:"default",imagetools_cors_hosts:["www.tinymce.com","codepen.io"],default_link_target:"_blank",link_title:!1,nonbreaking_force_tab:!0,init_instance_callback:function(l){t.value&&l.setContent(t.value),t.hasInit=!0,l.on("NodeChange Change KeyUp SetContent",function(){e.hasChange=!0,e.$emit("input",l.getContent())})},setup:function(e){e.on("FullscreenStateChanged",function(e){t.fullscreen=e.state})}})},destroyTinymce:function(){var e=window.tinymce.get(this.tinymceId);this.fullscreen&&e.execCommand("mceFullScreen"),e&&e.destroy()},setContent:function(e){window.tinymce.get(this.tinymceId).setContent(e)},getContent:function(){window.tinymce.get(this.tinymceId).getContent()},imageSuccessCBK:function(e){var t=this;e.forEach(function(e){window.tinymce.get(t.tinymceId).insertContent('<img class="wscnph" src="'+e.url+'" >')})}}},u=(l("OzGj"),Object(n.a)(d,function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"tinymce-container editor-container",class:{fullscreen:this.fullscreen}},[t("textarea",{staticClass:"tinymce-textarea",attrs:{id:this.tinymceId}}),this._v(" "),t("div",{staticClass:"editor-custom-btn-container"},[t("editorImage",{staticClass:"editor-upload-btn",attrs:{color:"#1890ff"},on:{successCBK:this.imageSuccessCBK}})],1)])},[],!1,null,"4b42c7ad",null));u.options.__file="index.vue";t.a=u.exports},l9dh:function(e,t,l){"use strict";var a=l("IXnl");l.n(a).a},lvT4:function(e,t,l){"use strict";var a=l("WS4k");l.n(a).a},xou2:function(e,t,l){"use strict";l.r(t);var a={name:"website-setting",components:{Tinymce:l("glbJ").a},data:function(){return{activeName:"all",all_form:{type:1,account:"",password:"",account2:"",password2:"",appkey:"",secret:"",signname:"",templateCode:"",product:"",templateCodeForget:"",forget:"",templateCodeLogin:"",login:"",aly_appkey:"",aly_secret:"",aly_signname:"",aly_templateCode:"",aly_templateCodeForget:"",aly_templateCodeLogin:"",tx_sdkappid:"",tx_appkey:"",tx_signname:"",tx_templateCode:"",tx_templateCodeForget:"",tx_templateCodeLogin:""},rules:{account:[{required:!0,message:"请输入国内短信账号",trigger:"blur"}],password:[{required:!0,message:"请输入国内短信密码",trigger:"blur"}],appkey:[{required:!0,message:"请输入AppKey",trigger:"blur"}],secret:[{required:!0,message:"请输入secret",trigger:"blur"}],signname:[{required:!0,message:"请输入短信签名",trigger:"blur"}],templateCode:[{required:!0,message:"请输入注册短信模板ID",trigger:"blur"}],product:[{required:!0,message:"请输入注册模板变量",trigger:"blur"}],templateCodeForget:[{required:!0,message:"请输入找回密码短信模板ID",trigger:"blur"}],forget:[{required:!0,message:"请输入找回密码变量",trigger:"blur"}],templateCodeLogin:[{required:!0,message:"请输入登录短信模板ID",trigger:"blur"}],login:[{required:!0,message:"请输入登录变量",trigger:"blur"}],aly_appkey:[{required:!0,message:"请输入AccessKeyId",trigger:"blur"}],aly_secret:[{required:!0,message:"请输入AccessKeySecret",trigger:"blur"}],aly_signname:[{required:!0,message:"请输入短信签名",trigger:"blur"}],aly_templateCode:[{required:!0,message:"请输入注册模板编号",trigger:"blur"}],aly_templateCodeForget:[{required:!0,message:"请输入找回密码模板编号",trigger:"blur"}],aly_templateCodeLogin:[{required:!0,message:"请输入登录模板编号",trigger:"blur"}],tx_sdkappid:[{required:!0,message:"请输入SDKAppID",trigger:"blur"}],tx_appkey:[{required:!0,message:"请输入AppKey",trigger:"blur"}],tx_signname:[{required:!0,message:"请输入短信签名",trigger:"blur"}],tx_templateCode:[{required:!0,message:"请输入注册模板编号",trigger:"blur"}],tx_templateCodeForget:[{required:!0,message:"请输入找回密码模板编号",trigger:"blur"}],tx_templateCodeLogin:[{required:!0,message:"请输入登录模板编号",trigger:"blur"}]}}},created:function(){this.getData()},destroyed:function(){},methods:{getData:function(){var e=this;$http.post("/admin/detail/",{},"加载中").then(function(t){1===t.result?e.all_form=t.data:t.msg&&""!=t.msg&&e.$message.error(t.msg)}).catch(function(e){console.error(e)})},submitForm:function(e){var t=this;this.$refs[e].validate(function(l){if(!l)return!1;$http.post("/admin/system/sms",t.all_form,"提交中").then(function(l){1===l.result?(l.msg&&""!=l.msg&&t.$message.success("提交成功！"),t.$refs[e].resetFields(),t.getData()):l.msg&&""!=l.msg&&t.$message.error(l.msg)}).catch(function(e){console.error(e)})})}}},r=(l("l9dh"),l("ZrdR")),o=Object(r.a)(a,function(){var e=this,t=e.$createElement,l=e._self._c||t;return l("div",{staticClass:"right"},[l("el-form",{ref:"all_form",staticStyle:{"margin-top":"20px"},attrs:{model:e.all_form,rules:e.rules,"label-width":"15%"}},[l("el-form-item",{attrs:{label:"",prop:"type"}},[l("el-radio",{attrs:{label:1},model:{value:e.all_form.type,callback:function(t){e.$set(e.all_form,"type",t)},expression:"all_form.type"}},[e._v("互亿无限")]),e._v(" "),l("el-radio",{attrs:{label:2},model:{value:e.all_form.type,callback:function(t){e.$set(e.all_form,"type",t)},expression:"all_form.type"}},[e._v("阿里大鱼")]),e._v(" "),l("el-radio",{attrs:{label:3},model:{value:e.all_form.type,callback:function(t){e.$set(e.all_form,"type",t)},expression:"all_form.type"}},[e._v("阿里云")]),e._v(" "),l("el-radio",{attrs:{label:4},model:{value:e.all_form.type,callback:function(t){e.$set(e.all_form,"type",t)},expression:"all_form.type"}},[e._v("腾讯云")])],1),e._v(" "),1==e.all_form.type?l("div",[l("el-form-item",{attrs:{label:"国内短信账号",prop:"account"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入国内短信账号"},model:{value:e.all_form.account,callback:function(t){e.$set(e.all_form,"account",t)},expression:"all_form.account"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"国内短信密码",prop:"password"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入国内短信密码"},model:{value:e.all_form.password,callback:function(t){e.$set(e.all_form,"password",t)},expression:"all_form.password"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"国际短信账号",prop:"account2"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入国际短信账号"},model:{value:e.all_form.account2,callback:function(t){e.$set(e.all_form,"account2",t)},expression:"all_form.account2"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"国际短信密码",prop:"password2"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入国际短信密码"},model:{value:e.all_form.password2,callback:function(t){e.$set(e.all_form,"password2",t)},expression:"all_form.password2"}})],1)],1):e._e(),e._v(" "),2==e.all_form.type?l("div",[l("div",{staticStyle:{width:"70%",margin:"0 auto"}},[l("el-tag",{staticClass:"tag_tips"},[l("i",{staticClass:"el-icon-info"}),e._v("请到 阿里大鱼\n          去申请开通,短信模板中必须包含code和product,请参考默认用户注册验证码设置。\n        ")])],1),e._v(" "),l("el-form-item",{attrs:{label:"AppKey",prop:"appkey"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入AppKey"},model:{value:e.all_form.appkey,callback:function(t){e.$set(e.all_form,"appkey",t)},expression:"all_form.appkey"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"secret",prop:"secret"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入secret"},model:{value:e.all_form.secret,callback:function(t){e.$set(e.all_form,"secret",t)},expression:"all_form.secret"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"短信签名",prop:"signname"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入短信签名"},model:{value:e.all_form.signname,callback:function(t){e.$set(e.all_form,"signname",t)},expression:"all_form.signname"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"注册短信模板ID",prop:"templateCode"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入注册短信模板ID"},model:{value:e.all_form.templateCode,callback:function(t){e.$set(e.all_form,"templateCode",t)},expression:"all_form.templateCode"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"注册模板变量",prop:"product"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入注册模板变量"},model:{value:e.all_form.product,callback:function(t){e.$set(e.all_form,"product",t)},expression:"all_form.product"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"找回密码短信模板ID",prop:"templateCodeForget"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入找回密码短信模板ID"},model:{value:e.all_form.templateCodeForget,callback:function(t){e.$set(e.all_form,"templateCodeForget",t)},expression:"all_form.templateCodeForget"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"找回密码变量",prop:"forget"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入找回密码变量"},model:{value:e.all_form.forget,callback:function(t){e.$set(e.all_form,"forget",t)},expression:"all_form.forget"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"登录短信模板ID",prop:"templateCodeLogin"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入登录短信模板ID"},model:{value:e.all_form.templateCodeLogin,callback:function(t){e.$set(e.all_form,"templateCodeLogin",t)},expression:"all_form.templateCodeLogin"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"登录变量",prop:"login"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入登录变量"},model:{value:e.all_form.login,callback:function(t){e.$set(e.all_form,"login",t)},expression:"all_form.login"}})],1)],1):e._e(),e._v(" "),3==e.all_form.type?l("div",[l("div",{staticStyle:{width:"70%",margin:"0 auto"}},[l("el-tag",{staticClass:"tag_tips"},[l("i",{staticClass:"el-icon-info"}),e._v(" "),e._v("\n          阿里云申请开通短信模板需将阿里云默认模板中的code改为number，请参考默认用户注册验证码设置。\n        ")])],1),e._v(" "),l("el-form-item",{attrs:{label:"AccessKeyId",prop:"aly_appkey"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入AccessKeyId"},model:{value:e.all_form.aly_appkey,callback:function(t){e.$set(e.all_form,"aly_appkey",t)},expression:"all_form.aly_appkey"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"AccessKeySecret",prop:"aly_secret"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入AccessKeySecret"},model:{value:e.all_form.aly_secret,callback:function(t){e.$set(e.all_form,"aly_secret",t)},expression:"all_form.aly_secret"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"短信签名",prop:"aly_signname"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入短信签名"},model:{value:e.all_form.aly_signname,callback:function(t){e.$set(e.all_form,"aly_signname",t)},expression:"all_form.aly_signname"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"注册模板编号",prop:"aly_templateCode"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入注册模板编号"},model:{value:e.all_form.aly_templateCode,callback:function(t){e.$set(e.all_form,"aly_templateCode",t)},expression:"all_form.aly_templateCode"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"找回密码模板编号",prop:"aly_templateCodeForget"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入找回密码模板编号"},model:{value:e.all_form.aly_templateCodeForget,callback:function(t){e.$set(e.all_form,"aly_templateCodeForget",t)},expression:"all_form.aly_templateCodeForget"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"登录模板编号",prop:"aly_templateCodeLogin"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入登录模板编号"},model:{value:e.all_form.aly_templateCodeLogin,callback:function(t){e.$set(e.all_form,"aly_templateCodeLogin",t)},expression:"all_form.aly_templateCodeLogin"}})],1)],1):e._e(),e._v(" "),4==e.all_form.type?l("div",[l("el-form-item",{attrs:{label:"SDKAppID",prop:"tx_sdkappid"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入SDKAppID"},model:{value:e.all_form.tx_sdkappid,callback:function(t){e.$set(e.all_form,"tx_sdkappid",t)},expression:"all_form.tx_sdkappid"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"AppKey",prop:"tx_appkey"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入AppKey"},model:{value:e.all_form.tx_appkey,callback:function(t){e.$set(e.all_form,"tx_appkey",t)},expression:"all_form.tx_appkey"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"短信签名",prop:"tx_signname"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入短信签名"},model:{value:e.all_form.tx_signname,callback:function(t){e.$set(e.all_form,"tx_signname",t)},expression:"all_form.tx_signname"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"注册模板编号",prop:"tx_templateCode"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入注册模板编号"},model:{value:e.all_form.tx_templateCode,callback:function(t){e.$set(e.all_form,"tx_templateCode",t)},expression:"all_form.tx_templateCode"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"找回密码模板编号",prop:"tx_templateCodeForget"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入找回密码模板编号"},model:{value:e.all_form.tx_templateCodeForget,callback:function(t){e.$set(e.all_form,"tx_templateCodeForget",t)},expression:"all_form.tx_templateCodeForget"}})],1),e._v(" "),l("el-form-item",{attrs:{label:"登录模板编号",prop:"tx_templateCodeLogin"}},[l("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入登录模板编号"},model:{value:e.all_form.tx_templateCodeLogin,callback:function(t){e.$set(e.all_form,"tx_templateCodeLogin",t)},expression:"all_form.tx_templateCodeLogin"}})],1)],1):e._e(),e._v(" "),l("el-form-item",[l("el-button",{attrs:{type:"success"},on:{click:function(t){t.stopPropagation(),t.preventDefault(),e.submitForm("all_form")}}},[e._v("\n        提交\n      ")])],1)],1)],1)},[],!1,null,null,null);o.options.__file="index.vue";t.default=o.exports}}]);