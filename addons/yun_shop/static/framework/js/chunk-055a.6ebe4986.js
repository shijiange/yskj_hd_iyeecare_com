(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-055a"],{CpeY:function(t,e,i){"use strict";var a=i("YZNr");i.n(a).a},I0Nu:function(t,e,i){"use strict";i.r(e);var a={name:"website-setting",components:{Tinymce:i("glbJ").a},data:function(){return{list:[],ImgList:[],submit_loading:!1,uploadImg:"",chooseImg:"",radio1:"不限",radio2:"不限",activeName2:"first",centerDialogVisible:!1,form:{cus_url:"",cus_link:"",cus_mobile:"",cus_uniacid:""},identification:"",uniAccount:[],pageSize:0,current_page:0,total:0,rules:{}}},created:function(){this.getData(),this.currentChange(1),window.addEventListener("beforeunload",function(t){window.onbeforeunload=null})},destroyed:function(){},methods:{chooseTheImg:function(t){this.form[this.chooseImg]=t,this.centerDialogVisible=!1},chooseYear:function(t){this.currentChange(1)},chooseMonth:function(t){this.currentChange(1)},openUpload:function(t){this.chooseImg=t,this.uploadImg="",this.centerDialogVisible=!0},sureImg:function(){this.form[this.chooseImg]=this.uploadImg,this.centerDialogVisible=!1},currentChange:function(t){var e=this;$http.get("/admin/all/list",{page:t,year:this.radio1,month:this.radio2},"加载中").then(function(t){1===t.result?(e.total=t.data.total,e.ImgList=t.data.data,e.current_page=t.data.current_page,e.pageSize=t.data.per_page):t.msg&&""!=t.msg&&e.$message.error(t.msg)}).catch(function(t){console.error(t)})},uploadSuccess:function(t,e){1===t.result?t.data.success?(this.uploadImg=t.data.success,this.$message.success("上传成功！")):this.$message.error(t.data.fail):t.msg&&""!=t.msg&&this.$message.error(t.msg),this.submit_loading=!1},beforeUpload:function(t){this.submit_loading=!0;var e=t.size/1024/1024<4;return e||(this.$message.error("上传图片大小不能超过 4MB!"),this.submit_loading=!1),e},clearImg:function(t){this.form[t]="",this.$forceUpdate()},deleteImg:function(t){var e=this;$http.get("/admin/all/delImg",{id:t}," ").then(function(t){1===t.result?(t.msg&&""!=t.msg&&e.$message.success("系统删除成功"),e.currentChange(1)):t.msg&&""!=t.msg&&e.$message.error(t.msg)}).catch(function(t){console.error(t)})},submitForm:function(t){var e=this;this.$refs[t].validate(function(t){if(!t)return console.log("error submit!!"),!1;$http.post("/admin/user/edit_theme",{id:e.$route.params.id,status:1,data:e.form},"保存中").then(function(t){1===t.result?(e.$message.success("保存成功！"),e.$router.push(e.fun.getUrl("ThemeIndex"))):t.msg&&""!=t.msg&&e.$message.error(t.msg)}).catch(function(){})})},getData:function(){var t=this;$http.post("/admin/user/edit_theme",{id:this.$route.params.id,status:1},"加载中").then(function(e){1==e.result?(t.uniAccount=e.data.uniAccount,t.form.cus_url=e.data.cus_url?e.data.cus_url:"",t.form.cus_link=e.data.cus_link?e.data.cus_link:"",t.form.cus_mobile=e.data.cus_mobile?e.data.cus_mobile:"",t.form.cus_uniacid=e.data.cus_uniacid?e.data.cus_uniacid:"",t.identification=e.data.identification):e.msg&&""!=e.msg&&t.$message.error(e.msg)}).catch(function(){})}}},s=(i("CpeY"),i("ZrdR")),n=Object(s.a)(a,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"right"},[t._m(0),t._v(" "),"uniacid_theme"!=t.identification?i("h5",{staticClass:"rightlist-head"},[t._v("\n    客服设置\n  ")]):t._e(),t._v(" "),i("el-form",{ref:"form",attrs:{model:t.form,rules:t.rules,"label-width":"15%"}},["uniacid_theme"!=t.identification?i("div",[i("el-form-item",{attrs:{label:"客服链接"}},[i("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入客服链接"},model:{value:t.form.cus_link,callback:function(e){t.$set(t.form,"cus_link",e)},expression:"form.cus_link"}})],1),t._v(" "),i("el-form-item",{attrs:{label:"客服电话"}},[i("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请输入客服电话"},model:{value:t.form.cus_mobile,callback:function(e){t.$set(t.form,"cus_mobile",e)},expression:"form.cus_mobile"}})],1),t._v(" "),i("el-form-item",{attrs:{label:"客服二维码"}},[i("el-input",{staticStyle:{width:"70%"},attrs:{placeholder:"请上传客服二维码",disabled:""},model:{value:t.form.cus_url,callback:function(e){t.$set(t.form,"cus_url",e)},expression:"form.cus_url"}}),t._v(" "),i("el-button",{attrs:{size:"small",type:"primary"},on:{click:function(e){t.openUpload("cus_url")}}},[t._v("点击上传\n        ")]),t._v(" "),i("div",{staticClass:"avatar-uploader-box"},[t.form.cus_url?i("img",{staticClass:"avatar",attrs:{src:t.form.cus_url}}):t._e(),t._v(" "),i("i",{directives:[{name:"show",rawName:"v-show",value:t.form.cus_url,expression:"form.cus_url"}],staticClass:"el-icon-circle-close",attrs:{title:"点击清除图片"},on:{click:function(e){t.clearImg("cus_url")}}})])],1)],1):t._e(),t._v(" "),i("h5",{staticClass:"rightlist-head"},[t._v("\n      文章/帮助中心数据设置\n    ")]),t._v(" "),i("el-form-item",{attrs:{label:"文章/帮助中心数据",prop:"cus_uniacid"}},[i("el-select",{staticStyle:{width:"70%"},attrs:{placeholder:"请选文章数据"},model:{value:t.form.cus_uniacid,callback:function(e){t.$set(t.form,"cus_uniacid",e)},expression:"form.cus_uniacid"}},t._l(t.uniAccount,function(t){return i("el-option",{key:t.uniacid,attrs:{label:t.name,value:t.uniacid}})}))],1),t._v(" "),i("el-form-item",[i("el-button",{attrs:{type:"primary"},nativeOn:{click:function(e){e.preventDefault(),t.submitForm("form")}}},[t._v("提交")])],1)],1),t._v(" "),i("el-dialog",{attrs:{visible:t.centerDialogVisible,width:"65%",center:""},on:{"update:visible":function(e){t.centerDialogVisible=e}}},[i("el-tabs",{attrs:{type:"card"},model:{value:t.activeName2,callback:function(e){t.activeName2=e},expression:"activeName2"}},[i("el-tab-pane",{attrs:{label:"上传图片",name:"first"}},[i("div",{directives:[{name:"loading",rawName:"v-loading",value:t.submit_loading,expression:"submit_loading"}],staticClass:"submit_Img",staticStyle:{"text-align":"center"}},[i("el-upload",{staticClass:"avatar-uploader",attrs:{action:"/admin/all/upload",accept:"image/*","show-file-list":!1,"on-success":t.uploadSuccess,"before-upload":t.beforeUpload}},[t.uploadImg?i("div",{staticClass:"avatar_box"},[i("img",{staticClass:"avatar",attrs:{src:t.uploadImg}})]):i("i",{staticClass:"el-icon-plus avatar-uploader-icon"})])],1)]),t._v(" "),i("el-tab-pane",{attrs:{label:"提取网络图片",name:"second"}},[i("el-input",{staticStyle:{width:"90%"},attrs:{placeholder:"请输入网络图片地址"},model:{value:t.uploadImg,callback:function(e){t.uploadImg=e},expression:"uploadImg"}})],1),t._v(" "),i("el-tab-pane",{attrs:{label:"浏览图片",name:"third"}},[i("div",[i("el-radio-group",{attrs:{size:"medium"},on:{change:t.chooseYear},model:{value:t.radio1,callback:function(e){t.radio1=e},expression:"radio1"}},[i("el-radio-button",{attrs:{label:"不限"}}),t._v(" "),i("el-radio-button",{attrs:{label:"2019"}},[t._v("2019年")]),t._v(" "),i("el-radio-button",{attrs:{label:"2018"}},[t._v("2018年")]),t._v(" "),i("el-radio-button",{attrs:{label:"2017"}},[t._v("2017年")]),t._v(" "),i("el-radio-button",{attrs:{label:"2016"}},[t._v("2016年")])],1)],1),t._v(" "),i("div",{staticStyle:{"margin-top":"10px"}},[i("el-radio-group",{attrs:{size:"small"},on:{change:t.chooseMonth},model:{value:t.radio2,callback:function(e){t.radio2=e},expression:"radio2"}},[i("el-radio-button",{attrs:{label:"不限"}}),t._v(" "),i("el-radio-button",{attrs:{label:"1"}},[t._v("1月")]),t._v(" "),i("el-radio-button",{attrs:{label:"2"}},[t._v("2月")]),t._v(" "),i("el-radio-button",{attrs:{label:"3"}},[t._v("3月")]),t._v(" "),i("el-radio-button",{attrs:{label:"4"}},[t._v("4月")]),t._v(" "),i("el-radio-button",{attrs:{label:"5"}},[t._v("5月")]),t._v(" "),i("el-radio-button",{attrs:{label:"6"}},[t._v("6月")]),t._v(" "),i("el-radio-button",{attrs:{label:"7"}},[t._v("7月")]),t._v(" "),i("el-radio-button",{attrs:{label:"8"}},[t._v("8月")]),t._v(" "),i("el-radio-button",{attrs:{label:"9"}},[t._v("9月")]),t._v(" "),i("el-radio-button",{attrs:{label:"10"}},[t._v("10月")]),t._v(" "),i("el-radio-button",{attrs:{label:"11"}},[t._v("11月")]),t._v(" "),i("el-radio-button",{attrs:{label:"12"}},[t._v("12月")])],1)],1),t._v(" "),i("div",{staticClass:"imgList",attrs:{id:"upload-img"}},t._l(t.ImgList,function(e,a){return i("div",{key:a,staticClass:"avatar-uploader-box"},[i("img",{staticClass:"avatar",attrs:{src:e.url},on:{click:function(i){t.chooseTheImg(e.url)}}}),t._v(" "),i("i",{staticClass:"el-icon-circle-close",attrs:{title:"点击清除图片"},on:{click:function(i){t.deleteImg(e.id)}}})])})),t._v(" "),i("el-pagination",{staticStyle:{"margin-top":"10px","text-align":"right"},attrs:{background:"","page-size":t.pageSize,"current-page":t.current_page,total:t.total,layout:"prev, pager, next"},on:{"current-change":t.currentChange,"update:currentPage":function(e){t.current_page=e}}})],1)],1),t._v(" "),i("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{on:{click:function(e){t.centerDialogVisible=!1}}},[t._v("取 消")]),t._v(" "),i("el-button",{attrs:{type:"primary"},on:{click:t.sureImg}},[t._v("确 定 ")])],1)],1)],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"right-head"},[e("div",{staticClass:"right-head-con1"},[this._v("基础设置")])])}],!1,null,null,null);n.options.__file="basic.vue";e.default=n.exports},JNhG:function(t,e,i){},OzGj:function(t,e,i){"use strict";var a=i("JNhG");i.n(a).a},WS4k:function(t,e,i){},YZNr:function(t,e,i){},glbJ:function(t,e,i){"use strict";var a=i("Asgo"),s=i.n(a),n=i("EPZ6"),o=i.n(n),l={name:"EditorSlideUpload",props:{color:{type:String,default:"#1890ff"}},data:function(){return{dialogVisible:!1,listObj:{},fileList:[]}},methods:{checkAllSuccess:function(){var t=this;return o()(this.listObj).every(function(e){return t.listObj[e].hasSuccess})},handleSubmit:function(){var t=this,e=o()(this.listObj).map(function(e){return t.listObj[e]});this.checkAllSuccess()?(this.$emit("successCBK",e),this.listObj={},this.fileList=[],this.dialogVisible=!1):this.$message("请等待所有图片上传成功 或 出现了网络问题，请刷新页面重新上传！")},handleSuccess:function(t,e){for(var i=e.uid,a=o()(this.listObj),s=0,n=a.length;s<n;s++)if(this.listObj[a[s]].uid===i)return this.listObj[a[s]].url=t.data.success,void(this.listObj[a[s]].hasSuccess=!0)},handleRemove:function(t){for(var e=t.uid,i=o()(this.listObj),a=0,s=i.length;a<s;a++)if(this.listObj[i[a]].uid===e)return void delete this.listObj[i[a]]},beforeUpload:function(t){var e=this,i=window.URL||window.webkitURL,a=t.uid;return this.listObj[a]={},new s.a(function(s,n){var o=new Image;o.src=i.createObjectURL(t),o.onload=function(){e.listObj[a]={hasSuccess:!1,uid:t.uid,width:this.width,height:this.height}},s(!0)})}}},r=(i("lvT4"),i("ZrdR")),c=Object(r.a)(l,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"upload-container"},[i("el-button",{style:{background:t.color,borderColor:t.color},attrs:{icon:"el-icon-upload",size:"mini",type:"primary"},on:{click:function(e){t.dialogVisible=!0}}},[t._v("上传图片\n  ")]),t._v(" "),i("el-dialog",{attrs:{visible:t.dialogVisible},on:{"update:visible":function(e){t.dialogVisible=e}}},[i("el-upload",{staticClass:"editor-slide-upload",attrs:{multiple:!0,"file-list":t.fileList,"show-file-list":!0,"on-remove":t.handleRemove,"on-success":t.handleSuccess,"before-upload":t.beforeUpload,action:"/admin/all/upload","list-type":"picture-card"}},[i("el-button",{attrs:{size:"small",type:"primary"}},[t._v("点击上传")])],1),t._v(" "),i("el-button",{on:{click:function(e){t.dialogVisible=!1}}},[t._v("取 消")]),t._v(" "),i("el-button",{attrs:{type:"primary"},on:{click:t.handleSubmit}},[t._v("确 定")])],1)],1)},[],!1,null,"56de81d2",null);c.options.__file="editorImage.vue";var u=["advlist anchor autolink autosave code codesample colorpicker colorpicker contextmenu directionality emoticons fullscreen hr image imagetools insertdatetime link lists media nonbreaking noneditable pagebreak paste preview print save searchreplace spellchecker tabfocus table template textcolor textpattern visualblocks visualchars wordcount"],d=["searchreplace bold italic underline strikethrough alignleft aligncenter alignright outdent indent  blockquote undo redo removeformat subscript superscript code codesample","hr bullist numlist link image charmap preview anchor pagebreak insertdatetime media table emoticons forecolor backcolor fullscreen"],m={name:"Tinymce",components:{editorImage:c.exports},props:{id:{type:String,default:function(){return"vue-tinymce-"+ +new Date+(1e3*Math.random()).toFixed(0)}},value:{type:String,default:""},toolbar:{type:Array,required:!1,default:function(){return[]}},menubar:{type:String,default:"file edit insert view format table"},height:{type:Number,required:!1,default:360}},data:function(){return{hasChange:!1,hasInit:!1,tinymceId:this.id,fullscreen:!1,languageTypeList:{en:"en",zh:"zh_CN"}}},computed:{language:function(){return this.languageTypeList[this.$store.getters.language]}},watch:{value:function(t){var e=this;!this.hasChange&&this.hasInit&&this.$nextTick(function(){return window.tinymce.get(e.tinymceId).setContent(t||"")})},language:function(){var t=this;this.destroyTinymce(),this.$nextTick(function(){return t.initTinymce()})}},mounted:function(){this.initTinymce()},activated:function(){this.initTinymce()},deactivated:function(){this.destroyTinymce()},destroyed:function(){this.destroyTinymce()},methods:{initTinymce:function(){var t=this,e=this;window.tinymce.init({language:this.language,selector:"#"+this.tinymceId,height:this.height,body_class:"panel-body ",object_resizing:!1,toolbar:this.toolbar.length>0?this.toolbar:d,menubar:this.menubar,plugins:u,end_container_on_empty_block:!0,powerpaste_word_import:"clean",code_dialog_height:450,code_dialog_width:1e3,advlist_bullet_styles:"square",advlist_number_styles:"default",imagetools_cors_hosts:["www.tinymce.com","codepen.io"],default_link_target:"_blank",link_title:!1,nonbreaking_force_tab:!0,init_instance_callback:function(i){e.value&&i.setContent(e.value),e.hasInit=!0,i.on("NodeChange Change KeyUp SetContent",function(){t.hasChange=!0,t.$emit("input",i.getContent())})},setup:function(t){t.on("FullscreenStateChanged",function(t){e.fullscreen=t.state})}})},destroyTinymce:function(){var t=window.tinymce.get(this.tinymceId);this.fullscreen&&t.execCommand("mceFullScreen"),t&&t.destroy()},setContent:function(t){window.tinymce.get(this.tinymceId).setContent(t)},getContent:function(){window.tinymce.get(this.tinymceId).getContent()},imageSuccessCBK:function(t){var e=this;t.forEach(function(t){window.tinymce.get(e.tinymceId).insertContent('<img class="wscnph" src="'+t.url+'" >')})}}},h=(i("OzGj"),Object(r.a)(m,function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"tinymce-container editor-container",class:{fullscreen:this.fullscreen}},[e("textarea",{staticClass:"tinymce-textarea",attrs:{id:this.tinymceId}}),this._v(" "),e("div",{staticClass:"editor-custom-btn-container"},[e("editorImage",{staticClass:"editor-upload-btn",attrs:{color:"#1890ff"},on:{successCBK:this.imageSuccessCBK}})],1)])},[],!1,null,"4b42c7ad",null));h.options.__file="index.vue";e.a=h.exports},lvT4:function(t,e,i){"use strict";var a=i("WS4k");i.n(a).a}}]);