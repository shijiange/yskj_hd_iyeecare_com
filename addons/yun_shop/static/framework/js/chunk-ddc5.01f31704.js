(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-ddc5"],{"2fyR":function(t,e,i){"use strict";var n=i("4IAR");i.n(n).a},"4IAR":function(t,e,i){},"93Qu":function(t,e,i){},OzGj:function(t,e,i){"use strict";var n=i("93Qu");i.n(n).a},SfHs:function(t,e,i){},eUB9:function(t,e,i){"use strict";i.r(e);var n={components:{Tinymce:i("glbJ").a},name:"ThemeBottom",data:function(){return{form:{bottom:""},rules:{}}},created:function(){this.getData()},destroyed:function(){},methods:{getData:function(){var t=this;$http.post("/admin/user/edit_theme",{id:this.$route.params.id,status:3},"加载中").then(function(e){1==e.result?t.form.bottom=e.data.bottom?e.data.bottom:"":e.msg&&""!=e.msg&&t.$message.error(e.msg)}).catch(function(){})},submitForm:function(t){var e=this;this.$refs[t].validate(function(t){if(!t)return console.log("error submit!!"),!1;$http.post("/admin/user/edit_theme",{id:e.$route.params.id,status:3,data:e.form},"保存中").then(function(t){1===t.result?(e.$message.success("保存成功！"),e.$router.push(e.fun.getUrl("ThemeIndex"))):t.msg&&""!=t.msg&&e.$message.error(t.msg)}).catch(function(){})})}}},s=(i("2fyR"),i("KHd+")),o=Object(s.a)(n,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"right"},[t._m(0),t._v(" "),i("el-form",{ref:"form",attrs:{model:t.form,rules:t.rules,"label-width":"15%"}},[i("div",[i("textarea",{directives:[{name:"model",rawName:"v-model",value:t.form.bottom,expression:"form.bottom"}],staticStyle:{width:"85%",height:"70vh"},domProps:{value:t.form.bottom},on:{input:function(e){e.target.composing||t.$set(t.form,"bottom",e.target.value)}}})]),t._v(" "),i("el-form-item",{staticStyle:{"margin-top":"30px"}},[i("el-button",{attrs:{type:"primary"},nativeOn:{click:function(e){e.preventDefault(),t.submitForm("form")}}},[t._v("提交")])],1)],1)],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"right-head1"},[e("div",{staticClass:"right-head-con"},[this._v("底部设置")])])}],!1,null,null,null);o.options.__file="bottom.vue";e.default=o.exports},glbJ:function(t,e,i){"use strict";var n=i("4d7F"),s=i.n(n),o=i("GQeE"),a=i.n(o),r={name:"EditorSlideUpload",props:{color:{type:String,default:"#1890ff"}},data:function(){return{dialogVisible:!1,listObj:{},fileList:[]}},methods:{checkAllSuccess:function(){var t=this;return a()(this.listObj).every(function(e){return t.listObj[e].hasSuccess})},handleSubmit:function(){var t=this,e=a()(this.listObj).map(function(e){return t.listObj[e]});this.checkAllSuccess()?(this.$emit("successCBK",e),this.listObj={},this.fileList=[],this.dialogVisible=!1):this.$message("请等待所有图片上传成功 或 出现了网络问题，请刷新页面重新上传！")},handleSuccess:function(t,e){for(var i=e.uid,n=a()(this.listObj),s=0,o=n.length;s<o;s++)if(this.listObj[n[s]].uid===i)return this.listObj[n[s]].url=t.data.success,void(this.listObj[n[s]].hasSuccess=!0)},handleRemove:function(t){for(var e=t.uid,i=a()(this.listObj),n=0,s=i.length;n<s;n++)if(this.listObj[i[n]].uid===e)return void delete this.listObj[i[n]]},beforeUpload:function(t){var e=this,i=window.URL||window.webkitURL,n=t.uid;return this.listObj[n]={},new s.a(function(s,o){var a=new Image;a.src=i.createObjectURL(t),a.onload=function(){e.listObj[n]={hasSuccess:!1,uid:t.uid,width:this.width,height:this.height}},s(!0)})}}},c=(i("lvT4"),i("KHd+")),l=Object(c.a)(r,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"upload-container"},[i("el-button",{style:{background:t.color,borderColor:t.color},attrs:{icon:"el-icon-upload",size:"mini",type:"primary"},on:{click:function(e){t.dialogVisible=!0}}},[t._v("上传图片\n  ")]),t._v(" "),i("el-dialog",{attrs:{visible:t.dialogVisible},on:{"update:visible":function(e){t.dialogVisible=e}}},[i("el-upload",{staticClass:"editor-slide-upload",attrs:{multiple:!0,"file-list":t.fileList,"show-file-list":!0,"on-remove":t.handleRemove,"on-success":t.handleSuccess,"before-upload":t.beforeUpload,action:"/admin/all/upload","list-type":"picture-card"}},[i("el-button",{attrs:{size:"small",type:"primary"}},[t._v("点击上传")])],1),t._v(" "),i("el-button",{on:{click:function(e){t.dialogVisible=!1}}},[t._v("取 消")]),t._v(" "),i("el-button",{attrs:{type:"primary"},on:{click:t.handleSubmit}},[t._v("确 定")])],1)],1)},[],!1,null,"56de81d2",null);l.options.__file="editorImage.vue";var u=["advlist anchor autolink autosave code codesample colorpicker colorpicker contextmenu directionality emoticons fullscreen hr image imagetools insertdatetime link lists media nonbreaking noneditable pagebreak paste preview print save searchreplace spellchecker tabfocus table template textcolor textpattern visualblocks visualchars wordcount"],d=["searchreplace bold italic underline strikethrough alignleft aligncenter alignright outdent indent  blockquote undo redo removeformat subscript superscript code codesample","hr bullist numlist link image charmap preview anchor pagebreak insertdatetime media table emoticons forecolor backcolor fullscreen"],m={name:"Tinymce",components:{editorImage:l.exports},props:{id:{type:String,default:function(){return"vue-tinymce-"+ +new Date+(1e3*Math.random()).toFixed(0)}},value:{type:String,default:""},toolbar:{type:Array,required:!1,default:function(){return[]}},menubar:{type:String,default:"file edit insert view format table"},height:{type:Number,required:!1,default:360}},data:function(){return{hasChange:!1,hasInit:!1,tinymceId:this.id,fullscreen:!1,languageTypeList:{en:"en",zh:"zh_CN"}}},computed:{language:function(){return this.languageTypeList[this.$store.getters.language]}},watch:{value:function(t){var e=this;!this.hasChange&&this.hasInit&&this.$nextTick(function(){return window.tinymce.get(e.tinymceId).setContent(t||"")})},language:function(){var t=this;this.destroyTinymce(),this.$nextTick(function(){return t.initTinymce()})}},mounted:function(){this.initTinymce()},activated:function(){this.initTinymce()},deactivated:function(){this.destroyTinymce()},destroyed:function(){this.destroyTinymce()},methods:{initTinymce:function(){var t=this,e=this;window.tinymce.init({language:this.language,selector:"#"+this.tinymceId,height:this.height,body_class:"panel-body ",object_resizing:!1,toolbar:this.toolbar.length>0?this.toolbar:d,menubar:this.menubar,plugins:u,end_container_on_empty_block:!0,powerpaste_word_import:"clean",code_dialog_height:450,code_dialog_width:1e3,advlist_bullet_styles:"square",advlist_number_styles:"default",imagetools_cors_hosts:["www.tinymce.com","codepen.io"],default_link_target:"_blank",link_title:!1,nonbreaking_force_tab:!0,init_instance_callback:function(i){e.value&&i.setContent(e.value),e.hasInit=!0,i.on("NodeChange Change KeyUp SetContent",function(){t.hasChange=!0,t.$emit("input",i.getContent())})},setup:function(t){t.on("FullscreenStateChanged",function(t){e.fullscreen=t.state})}})},destroyTinymce:function(){var t=window.tinymce.get(this.tinymceId);this.fullscreen&&t.execCommand("mceFullScreen"),t&&t.destroy()},setContent:function(t){window.tinymce.get(this.tinymceId).setContent(t)},getContent:function(){window.tinymce.get(this.tinymceId).getContent()},imageSuccessCBK:function(t){var e=this;t.forEach(function(t){window.tinymce.get(e.tinymceId).insertContent('<img class="wscnph" src="'+t.url+'" >')})}}},h=(i("OzGj"),Object(c.a)(m,function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"tinymce-container editor-container",class:{fullscreen:this.fullscreen}},[e("textarea",{staticClass:"tinymce-textarea",attrs:{id:this.tinymceId}}),this._v(" "),e("div",{staticClass:"editor-custom-btn-container"},[e("editorImage",{staticClass:"editor-upload-btn",attrs:{color:"#1890ff"},on:{successCBK:this.imageSuccessCBK}})],1)])},[],!1,null,"4b42c7ad",null));h.options.__file="index.vue";e.a=h.exports},lvT4:function(t,e,i){"use strict";var n=i("SfHs");i.n(n).a}}]);