(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-commons"],{"2gMQ":function(t,e,i){"use strict";var n=i("EPZ6"),s=i.n(n),a=i("bS4n"),r=i.n(a),o=i("RCcY"),c=i("8t5x"),l={props:{defaultActive:{type:String,default:"1"}},data:function(){return{router_list:[{category_id:"serviceIndex",category_title:"客服组",routers:[]},{category_id:"serviceEmployeeList",category_title:"客服管理",routers:[]},{category_id:"serviceChatHistory",category_title:"会话",routers:[]},{category_id:"serviceCommonReplyList",category_title:"快捷回复管理",routers:[]},{category_id:"serviceBasic",category_title:"设置",routers:[]}]}},components:{sideItem:o.a},computed:r()({},Object(c.b)(["permission_routers","userInfo","globalData"])),watch:{permission_routers:function(t,e){this.signRouters(t)}},mounted:function(){this.signRouters()},methods:{signRouters:function(t){var e=[];this.globalData.tab&&(e=this.globalData.tab.filter(function(t){return"service"===t.route}));var i=(t||this.permission_routers).filter(function(t){return"service"===t.name});if(i[0]&&this.router_list.map(function(t){i[0].children.map(function(e){e.class_id==t.category_id&&t.routers.push(e)})}),e[0]){var n={};e[0].child.map(function(t){n[t.route]=t.child.map(function(t){return t.route})}),this.router_list.map(function(t){s()(n).indexOf(t.category_id)<0&&(t.hidden=!0),t.routers.map(function(e){n[t.category_id]&&n[t.category_id].indexOf(e.name)<0&&(e.notShow=!0)})})}}}},u=(i("n/tN"),i("ZrdR")),d=Object(u.a)(l,function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"second-side-box"},[e("div",{staticStyle:{width:"150px"}}),this._v(" "),e("div",{staticClass:"second-side-box-fixed"},[e("el-menu",{staticClass:"el-menu-vertical-demo",attrs:{"default-active":this.defaultActive,"default-openeds":["serviceChatHistory"]}},this._l(this.router_list,function(t){return e("side-item",{key:t.category_id,attrs:{item:t}})}))],1)])},[],!1,null,"59ce0741",null);d.options.__file="yun_service_side.vue";e.a=d.exports},"2kDQ":function(t,e,i){"use strict";var n=i("EPZ6"),s=i.n(n),a=i("bS4n"),r=i.n(a),o=i("RCcY"),c=i("8t5x"),l={props:{defaultActive:{type:String,default:"1"},selectName:{type:String,default:"setting"},other_list:{type:null},sideStyle:{type:String,default:"route"}},data:function(){return{router_list:[{category_id:"setting",category_title:"企业信息",routers:[]},{category_id:"settingConfig",category_title:"企业微信配置",routers:[]}]}},components:{sideItem:o.a},computed:r()({},Object(c.b)(["permission_routers","userInfo","globalData"])),watch:{permission_routers:function(t,e){this.signRouters(t)}},mounted:function(){this.signRouters()},methods:{signRouters:function(t){var e=this,i=[];this.globalData.tab&&(i=this.globalData.tab.filter(function(t){return t.route===e.selectName}));var n=(t||this.permission_routers).filter(function(t){return t.name===e.selectName});if(n[0]&&this.router_list.map(function(t){n[0].children.map(function(e){e.class_id==t.category_id&&t.routers.push(e)})}),i[0]){var a={};i[0].child.map(function(t){a[t.route]=t.child.map(function(t){return t.route})}),this.router_list.map(function(t){s()(a).indexOf(t.category_id)<0&&(t.hidden=!0),t.routers.map(function(e){a[t.category_id]&&a[t.category_id].indexOf(e.name)<0&&(e.notShow=!0)})})}},getterJump:function(t){this.$emit("getterSet",t.jump_id)}}},u=(i("9dz0"),i("ZrdR")),d=Object(u.a)(l,function(){var t=this,e=t.$createElement,i=t._self._c||e;return"route"==t.sideStyle?i("div",{staticClass:"second-side-box"},[i("div",{staticStyle:{width:"150px"}}),t._v(" "),i("div",{staticClass:"second-side-box-fixed"},[i("el-menu",{staticClass:"el-menu-vertical-demo",attrs:{"default-active":t.defaultActive}},t._l(t.router_list,function(t){return i("side-item",{key:t.category_id,attrs:{item:t}})}))],1)]):i("div",{staticClass:"second-side-box"},[i("div",{staticStyle:{width:"150px"}}),t._v(" "),i("div",{staticClass:"second-side-box-fixed"},[i("el-menu",{staticClass:"el-menu-vertical-demo",attrs:{"default-active":t.defaultActive}},t._l(t.other_list,function(e,n){return i("el-menu-item",{key:n,attrs:{index:e.category_id},on:{click:function(i){t.getterJump(e)}}},[i("span",{attrs:{slot:"title"},slot:"title"},[t._v(t._s(e.category_title))])])}))],1)])},[],!1,null,"5ecc1984",null);d.options.__file="sign_side_setting.vue";e.a=d.exports},"3vhb":function(t,e,i){"use strict";var n=i("bS4n"),s=i.n(n),a=i("RCcY"),r=i("8t5x"),o={data:function(){return{router_list:[{category_id:"1",category_title:"员工管理",routers:[]}]}},components:{sideItem:a.a},computed:s()({},Object(r.b)(["permission_routers","userInfo"]),{allChecked:function(){return this.todos.every(function(t){return t.done})}}),watch:{permission_routers:function(t,e){this.signRouters(t)}},mounted:function(){this.signRouters()},methods:{signRouters:function(t){var e=(t||this.permission_routers).filter(function(t){return"staff"===t.name});e[0]&&this.router_list.map(function(t){e[0].children.map(function(e){e.class_id==t.category_id&&t.routers.push(e)})})}}},c=(i("qLsU"),i("ZrdR")),l=Object(c.a)(o,function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"second-side-box"},[e("div",{staticStyle:{width:"150px"}}),this._v(" "),e("div",{staticClass:"second-side-box-fixed"},[e("el-menu",{staticClass:"el-menu-vertical-demo",attrs:{"default-active":"1"}},this._l(this.router_list,function(t){return e("side-item",{key:t.category_id,attrs:{item:t}})}))],1)])},[],!1,null,"c83e20a2",null);l.options.__file="staff_side.vue";e.a=l.exports},"3xbQ":function(t,e,i){"use strict";var n=i("84KG");i.n(n).a},"6ZzC":function(t,e,i){},"84KG":function(t,e,i){},"91kd":function(t,e,i){},"9CxU":function(t,e,i){"use strict";var n=i("7Qib");e.a={data:function(){return{sidebarElm:null}},mounted:function(){var t=this;this.__resizeHandler=Object(n.a)(function(){t.chart&&t.chart.resize()},100),window.addEventListener("resize",this.__resizeHandler),this.sidebarElm=document.getElementsByClassName("sidebar-container")[0],this.sidebarElm&&this.sidebarElm.addEventListener("transitionend",this.sidebarResizeHandler)},beforeDestroy:function(){window.removeEventListener("resize",this.__resizeHandler),this.sidebarElm&&this.sidebarElm.removeEventListener("transitionend",this.sidebarResizeHandler)},methods:{sidebarResizeHandler:function(t){"width"===t.propertyName&&this.__resizeHandler()}}}},"9dz0":function(t,e,i){"use strict";var n=i("cQXL");i.n(n).a},AKfa:function(t,e,i){"use strict";var n=i("q0wm");i.n(n).a},BBuk:function(t,e,i){},BVF2:function(t,e,i){},ErL5:function(t,e,i){"use strict";var n={props:["centerDialogVisible"],data:function(){return{ImgList:[],submit_loading:!1,uploadImg:"",uploadImgUrl:"",chooseImg:"",radio1:"不限",radio2:"不限",activeName:"first",pageSize:0,current_page:0,total:0}},methods:{closeVisible:function(){this.$emit("changeVisible",!1)},sureImg:function(){this.$emit("sureImg",this.uploadImg,this.uploadImgUrl),this.uploadImg="",this.uploadImgUrl="",this.closeVisible()},currentChange:function(t){var e=this;$http.get("/admin/all/list",{page:t,year:this.radio1,month:this.radio2},"加载中").then(function(t){1===t.result?(e.total=t.data.total,e.ImgList=t.data.data,e.current_page=t.data.current_page,e.pageSize=t.data.per_page):(e.list=t.data,e.$message.error("接口请求错误"))}).catch(function(t){console.error(t)})},beforeUpload:function(t){this.submit_loading=!0;var e=t.size/1024/1024<4;return e||(this.$message.error("上传图片大小不能超过 4MB!"),this.submit_loading=!1),e},chooseYear:function(t){this.currentChange(1)},chooseMonth:function(t){this.currentChange(1)},uploadSuccess:function(t,e){console.log(t),1===t.result?(this.uploadImg=t.data.img_url,this.uploadImgUrl=t.data.img,this.$message.success("上传成功！")):this.$message.error(t.msg),this.submit_loading=!1}}},s=(i("3xbQ"),i("ZrdR")),a=Object(s.a)(n,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",[i("el-dialog",{attrs:{visible:t.centerDialogVisible,width:"65%",center:""},on:{"update:visible":function(e){t.centerDialogVisible=e}}},[i("el-tabs",{attrs:{type:"card"},model:{value:t.activeName,callback:function(e){t.activeName=e},expression:"activeName"}},[i("el-tab-pane",{attrs:{label:"上传图片",name:"first"}},[i("div",{directives:[{name:"loading",rawName:"v-loading",value:t.submit_loading,expression:"submit_loading"}],staticClass:"submit_Img",staticStyle:{"text-align":"center"}},[i("el-upload",{staticClass:"avatar-uploader",attrs:{action:t.fun.getRealUrl("upload.uploadPic"),accept:"image/*","show-file-list":!1,"on-success":t.uploadSuccess,"before-upload":t.beforeUpload}},[t.uploadImg?i("div",{staticClass:"avatar_box"},[i("img",{staticClass:"avatar",attrs:{src:t.uploadImg}})]):i("i",{staticClass:"el-icon-plus avatar-uploader-icon"})])],1)]),t._v(" "),i("el-tab-pane",{attrs:{label:"提取网络图片",name:"second"}},[i("el-input",{staticStyle:{width:"90%"},attrs:{placeholder:"请输入网络图片地址"},model:{value:t.uploadImg,callback:function(e){t.uploadImg=e},expression:"uploadImg"}})],1),t._v(" "),t._e()],1),t._v(" "),i("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{on:{click:t.closeVisible}},[t._v("取 消")]),t._v(" "),i("el-button",{attrs:{type:"primary"},on:{click:t.sureImg}},[t._v("确 定 ")])],1)],1)],1)},[],!1,null,"30106400",null);a.options.__file="images.vue";e.a=a.exports},"Gx7+":function(t,e,i){"use strict";var n=i("BVF2");i.n(n).a},"JGE+":function(t,e,i){},NUmi:function(t,e,i){"use strict";var n=i("bS4n"),s=i.n(n),a=i("RCcY"),r=i("8t5x"),o={data:function(){return{router_list:[{category_id:"1",category_title:"群管理",routers:[]}]}},components:{sideItem:a.a},computed:s()({},Object(r.b)(["permission_routers","userInfo"]),{allChecked:function(){return this.todos.every(function(t){return t.done})}}),watch:{permission_routers:function(t,e){this.signRouters(t)}},mounted:function(){this.signRouters()},methods:{signRouters:function(t){var e=(t||this.permission_routers).filter(function(t){return"groupChat"===t.name});e[0]&&this.router_list.map(function(t){e[0].children.map(function(e){e.class_id==t.category_id&&t.routers.push(e)})})}}},c=(i("WmBq"),i("ZrdR")),l=Object(c.a)(o,function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"second-side-box"},[e("div",{staticStyle:{width:"150px"}}),this._v(" "),e("div",{staticClass:"second-side-box-fixed"},[e("el-menu",{staticClass:"el-menu-vertical-demo",attrs:{"default-active":"1"}},this._l(this.router_list,function(t){return e("side-item",{key:t.category_id,attrs:{item:t}})}))],1)])},[],!1,null,"6e2b60c1",null);l.options.__file="group_chat_side.vue";e.a=l.exports},Nig1:function(t,e,i){"use strict";var n=i("JGE+");i.n(n).a},PdEq:function(t,e,i){"use strict";var n={name:"staff_item",props:["root","paddingLeft","checkboxIds","multiple","checkId"],data:function(){return{}},computed:{computed_checkId:function(){var t="id";return this.checkId&&(t=this.checkId),t}},methods:{choiceDepartment:function(){this.$emit("choiceDepartment",this.root)}}},s=(i("e0BF"),i("ZrdR")),a=Object(s.a)(n,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"staff_item",class:[t.checkboxIds.hasOwnProperty(t.root[t.computed_checkId])?"checkbox":""],style:{paddingLeft:t.paddingLeft+"px"},on:{click:t.choiceDepartment}},[i("i",{staticClass:"iconfont icon-fontclass-daili"}),t._v(" "),i("div",{staticClass:"text"},[t._v(t._s(t.root.name))]),t._v(" "),t.multiple?i("i",{staticClass:"iconfont icon-all_xuanze"}):t._e()])},[],!1,null,"5bae4816",null);a.options.__file="staff_item.vue";e.a=a.exports},WmBq:function(t,e,i){"use strict";var n=i("6ZzC");i.n(n).a},ZQDA:function(t,e,i){},Zs95:function(t,e,i){},aS6R:function(t,e,i){"use strict";var n=i("EPZ6"),s=i.n(n),a=i("bS4n"),r=i.n(a),o=i("RCcY"),c=i("8t5x"),l={props:{defaultActive:{type:String,default:"friendFusionStatistics"}},data:function(){return{router_list:[{category_id:"friendFusionStatistics",category_title:"统计概况",routers:[]},{category_id:"friendFusionActivity",category_title:"活动管理",routers:[]},{category_id:"friendFusionPoster",category_title:"海报生成记录",routers:[]},{category_id:"friendFusionMember",category_title:"会员参与记录",routers:[]},{category_id:"friendFusionReward",category_title:"奖励记录",routers:[]}]}},components:{sideItem:o.a},computed:r()({},Object(c.b)(["permission_routers","userInfo","globalData"])),watch:{permission_routers:function(t,e){this.signRouters(t)}},mounted:function(){this.signRouters()},methods:{signRouters:function(t){var e=[];this.globalData.tab&&(e=this.globalData.tab.filter(function(t){return"friendFusion"===t.route}));var i=(t||this.permission_routers).filter(function(t){return"friendFusion"===t.name});if(i[0]&&this.router_list.map(function(t){i[0].children.map(function(e){e.class_id==t.category_id&&t.routers.push(e)})}),e[0]){var n={};e[0].child.map(function(t){n[t.route]=t.child.map(function(t){return t.route})}),this.router_list.map(function(t){s()(n).indexOf(t.category_id)<0&&(t.hidden=!0),t.routers.map(function(e){n[t.category_id]&&n[t.category_id].indexOf(e.name)<0&&(e.notShow=!0)})})}}}},u=(i("cdh+"),i("ZrdR")),d=Object(u.a)(l,function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"second-side-box"},[e("div",{staticStyle:{width:"150px"}}),this._v(" "),e("div",{staticClass:"second-side-box-fixed"},[e("el-menu",{staticClass:"el-menu-vertical-demo",attrs:{"default-active":this.defaultActive}},this._l(this.router_list,function(t){return e("side-item",{key:t.category_id,attrs:{item:t}})}))],1)])},[],!1,null,"daa392b4",null);d.options.__file="friend_fusion_side.vue";e.a=d.exports},bIWO:function(t,e,i){"use strict";var n=i("Zs95");i.n(n).a},cQXL:function(t,e,i){},"cdh+":function(t,e,i){"use strict";var n=i("91kd");i.n(n).a},"dE/r":function(t,e,i){"use strict";var n=i("bS4n"),s=i.n(n),a=i("RCcY"),r=i("8t5x"),o={props:{defaultActive:{type:String,default:"1"}},data:function(){return{router_list:[{category_id:"1",category_title:"企业微信客户标签",routers:[]},{category_id:"2",category_title:"标签管理",routers:[]},{category_id:"3",category_title:"标签组管理",routers:[]}]}},components:{sideItem:a.a},computed:s()({},Object(r.b)(["permission_routers","userInfo"]),{allChecked:function(){return this.todos.every(function(t){return t.done})}}),watch:{permission_routers:function(t,e){this.signRouters(t)}},mounted:function(){this.signRouters()},methods:{signRouters:function(t){var e=(t||this.permission_routers).filter(function(t){return"wechatCustomersLabel"===t.name});e[0]&&this.router_list.map(function(t){e[0].children.map(function(e){e.class_id==t.category_id&&t.routers.push(e)})})}}},c=(i("AKfa"),i("ZrdR")),l=Object(c.a)(o,function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"second-side-box"},[e("div",{staticStyle:{width:"150px"}}),this._v(" "),e("div",{staticClass:"second-side-box-fixed"},[e("el-menu",{staticClass:"el-menu-vertical-demo",attrs:{"default-active":this.defaultActive}},this._l(this.router_list,function(t){return e("side-item",{key:t.category_id,attrs:{item:t}})}))],1)])},[],!1,null,"04fceb6c",null);l.options.__file="wechat_customers_label_side.vue";e.a=l.exports},e0BF:function(t,e,i){"use strict";var n=i("kb30");i.n(n).a},glbJ:function(t,e,i){"use strict";var n=i("Asgo"),s=i.n(n),a=i("EPZ6"),r=i.n(a),o={name:"EditorSlideUpload",props:{color:{type:String,default:"#1890ff"}},data:function(){return{dialogVisible:!1,listObj:{},fileList:[]}},methods:{checkAllSuccess:function(){var t=this;return r()(this.listObj).every(function(e){return t.listObj[e].hasSuccess})},handleSubmit:function(){var t=this,e=r()(this.listObj).map(function(e){return t.listObj[e]});this.checkAllSuccess()?(this.$emit("successCBK",e),this.listObj={},this.fileList=[],this.dialogVisible=!1):this.$message("请等待所有图片上传成功 或 出现了网络问题，请刷新页面重新上传！")},handleSuccess:function(t,e){for(var i=e.uid,n=r()(this.listObj),s=0,a=n.length;s<a;s++)if(this.listObj[n[s]].uid===i)return this.listObj[n[s]].url=t.files.file,void(this.listObj[n[s]].hasSuccess=!0)},handleRemove:function(t){for(var e=t.uid,i=r()(this.listObj),n=0,s=i.length;n<s;n++)if(this.listObj[i[n]].uid===e)return void delete this.listObj[i[n]]},beforeUpload:function(t){var e=this,i=window.URL||window.webkitURL,n=t.uid;return this.listObj[n]={},new s.a(function(s,a){var r=new Image;r.src=i.createObjectURL(t),r.onload=function(){e.listObj[n]={hasSuccess:!1,uid:t.uid,width:this.width,height:this.height}},s(!0)})}}},c=(i("wn0B"),i("ZrdR")),l=Object(c.a)(o,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"upload-container"},[i("el-button",{style:{background:t.color,borderColor:t.color},attrs:{icon:"el-icon-upload",size:"mini",type:"primary"},on:{click:function(e){t.dialogVisible=!0}}},[t._v("上传图片\n  ")]),t._v(" "),i("el-dialog",{attrs:{visible:t.dialogVisible},on:{"update:visible":function(e){t.dialogVisible=e}}},[i("el-upload",{staticClass:"editor-slide-upload",attrs:{multiple:!0,"file-list":t.fileList,"show-file-list":!0,"on-remove":t.handleRemove,"on-success":t.handleSuccess,"before-upload":t.beforeUpload,action:"https://httpbin.org/post","list-type":"picture-card"}},[i("el-button",{attrs:{size:"small",type:"primary"}},[t._v("点击上传")])],1),t._v(" "),i("el-button",{on:{click:function(e){t.dialogVisible=!1}}},[t._v("取 消")]),t._v(" "),i("el-button",{attrs:{type:"primary"},on:{click:t.handleSubmit}},[t._v("确 定")])],1)],1)},[],!1,null,"39480e6e",null);l.options.__file="editorImage.vue";var u=["advlist anchor autolink autosave code codesample colorpicker colorpicker contextmenu directionality emoticons fullscreen hr image imagetools insertdatetime link lists media nonbreaking noneditable pagebreak paste preview print save searchreplace spellchecker tabfocus table template textcolor textpattern visualblocks visualchars wordcount"],d=["searchreplace bold italic underline strikethrough alignleft aligncenter alignright outdent indent  blockquote undo redo removeformat subscript superscript code codesample","hr bullist numlist link image charmap preview anchor pagebreak insertdatetime media table emoticons forecolor backcolor fullscreen"],h={name:"Tinymce",components:{editorImage:l.exports},props:{id:{type:String,default:function(){return"vue-tinymce-"+ +new Date+(1e3*Math.random()).toFixed(0)}},value:{type:String,default:""},toolbar:{type:Array,required:!1,default:function(){return[]}},menubar:{type:String,default:"file edit insert view format table"},height:{type:Number,required:!1,default:360}},data:function(){return{hasChange:!1,hasInit:!1,tinymceId:this.id,fullscreen:!1,languageTypeList:{en:"en",zh:"zh_CN"}}},computed:{language:function(){return"zh_CN"}},watch:{value:function(t){var e=this;!this.hasChange&&this.hasInit&&this.$nextTick(function(){return window.tinymce.get(e.tinymceId).setContent(t||"")})}},mounted:function(){this.initTinymce()},activated:function(){this.initTinymce()},deactivated:function(){},destroyed:function(){},methods:{initTinymce:function(){var t=this,e=this;window.tinymce.init({language:this.language,selector:"#"+this.tinymceId,height:this.height,body_class:"panel-body ",object_resizing:!1,toolbar:this.toolbar.length>0?this.toolbar:d,menubar:this.menubar,plugins:u,end_container_on_empty_block:!0,powerpaste_word_import:"clean",code_dialog_height:450,code_dialog_width:1e3,advlist_bullet_styles:"square",advlist_number_styles:"default",imagetools_cors_hosts:["www.tinymce.com","codepen.io"],default_link_target:"_blank",link_title:!1,nonbreaking_force_tab:!0,init_instance_callback:function(i){e.value&&i.setContent(e.value),e.hasInit=!0,i.on("NodeChange Change KeyUp SetContent",function(){t.hasChange=!0,t.$emit("input",i.getContent())})},setup:function(t){t.on("FullscreenStateChanged",function(t){e.fullscreen=t.state})}})},destroyTinymce:function(){var t=window.tinymce.get(this.tinymceId);this.fullscreen&&t.execCommand("mceFullScreen"),t&&t.destroy()},setContent:function(t){window.tinymce.get(this.tinymceId).setContent(t)},getContent:function(){window.tinymce.get(this.tinymceId).getContent()},imageSuccessCBK:function(t){var e=this;t.forEach(function(t){window.tinymce.get(e.tinymceId).insertContent('<img class="wscnph" src="'+t.url+'" >')})}}},f=(i("Nig1"),Object(c.a)(h,function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"tinymce-container editor-container",class:{fullscreen:this.fullscreen}},[e("textarea",{staticClass:"tinymce-textarea",attrs:{id:this.tinymceId}}),this._v(" "),e("div",{staticClass:"editor-custom-btn-container"},[e("editorImage",{staticClass:"editor-upload-btn",attrs:{color:"#29ba9c"},on:{successCBK:this.imageSuccessCBK}})],1)])},[],!1,null,"8c9c87ec",null));f.options.__file="index.vue";e.a=f.exports},ivmR:function(t,e,i){},kb30:function(t,e,i){},"n/tN":function(t,e,i){"use strict";var n=i("rXrh");i.n(n).a},q0wm:function(t,e,i){},qLsU:function(t,e,i){"use strict";var n=i("BBuk");i.n(n).a},rXrh:function(t,e,i){},uBcZ:function(t,e,i){"use strict";var n=i("ivmR");i.n(n).a},wn0B:function(t,e,i){"use strict";var n=i("ZQDA");i.n(n).a},x8Yw:function(t,e,i){"use strict";var n=i("rerW"),s=i.n(n),a=i("omC7"),r=i.n(a),o=i("cLjf"),c=i.n(o),l=i("hDQ3"),u=i.n(l),d=i("6ZY3"),h=i.n(d),f=i("PdEq"),m={components:{staff_item:f.a},name:"department_staff_item",props:{root:{type:Object,default:{}},paddingLeft:{type:Number,default:12},checkboxIds:{type:Object,default:{}},department_is_add:{type:Boolean,default:!1},multiple:{type:Boolean,default:!1},department_is_click:{type:Boolean,default:!1}},data:function(){return{open:!1}},methods:{choiceDepartment:function(t){t.clientX?this.$emit("choiceDepartment",this.root):this.$emit("choiceDepartment",t)},handClick:function(){this.department_is_click?this.$emit("choiceDepartment",this.root):this.open=!this.open}}},p=(i("Gx7+"),i("ZrdR")),_=Object(p.a)(m,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",[i("div",{staticClass:"department_item",class:[t.checkboxIds.hasOwnProperty(t.root.id)&&t.department_is_click?"checkbox":""],style:{paddingLeft:t.paddingLeft+"px"},on:{click:t.handClick}},[i("i",{staticClass:"iconfont icon-ht_more_bottom",class:[1==t.open?"open":"",t.root.children&&0!=t.root.children.length||t.root.staff&&0!=t.root.staff.length?"":"opacity0"],on:{click:function(e){e.stopPropagation(),t.open=!t.open}}}),t._v(" "),i("i",{staticClass:"iconfont icon-wenjianjia"}),t._v(" "),i("div",{staticClass:"text"},[t._v(t._s(t.root.name))]),t._v(" "),t.department_is_add?[t.checkboxIds.hasOwnProperty(t.root.id)?i("i",{staticClass:"iconfont icon-all_xuanze",on:{click:function(t){t.stopPropagation()}}}):i("i",{staticClass:"iconfont icon-life-game-plus",on:{click:function(e){return e.stopPropagation(),t.choiceDepartment(e)}}})]:t._e()],2),t._v(" "),t.open?[t.root.children&&t.root.children.length>0?[t._l(t.root.children,function(e){return[i("department_staff_item",{key:e.id,attrs:{paddingLeft:t.paddingLeft+30,root:e,checkboxIds:t.checkboxIds,department_is_add:t.department_is_add,multiple:t.multiple,department_is_click:t.department_is_click},on:{choiceDepartment:t.choiceDepartment}})]})]:t._e(),t._v(" "),t.root.staff&&t.root.staff.length>0?[t._l(t.root.staff,function(e){return[e.department?t._e():i("staff_item",{key:e.user_id+"-"+t.root.id,attrs:{checkId:"user_id",paddingLeft:t.paddingLeft+48,root:e,checkboxIds:t.checkboxIds,multiple:t.multiple},on:{choiceDepartment:t.choiceDepartment}})]})]:t._e()]:t._e()],2)},[],!1,null,"589fe744",null);_.options.__file="department_staff_item.vue";var g=[],v=[],b=null,y={};function x(t,e){if("staff"==e.type&&t.staff&&e.name.indexOf(t.name)>=0&&(y[e.user_id]||(g.push(e),y[e.user_id]=1)),"department"==e.type&&t.department&&e.name.indexOf(t.name)>=0&&v.push(e),e.children&&e.children.length>0){var i=!0,n=!1,a=void 0;try{for(var r,o=s()(e.children);!(i=(r=o.next()).done);i=!0){x(t,r.value)}}catch(t){n=!0,a=t}finally{try{!i&&o.return&&o.return()}finally{if(n)throw a}}}if(e.staff&&e.staff.length>0){var c=!0,l=!1,u=void 0;try{for(var d,h=s()(e.staff);!(c=(d=h.next()).done);c=!0){x(t,d.value)}}catch(t){l=!0,u=t}finally{try{!c&&h.return&&h.return()}finally{if(l)throw u}}}}function k(t){var e=!0,i=!1,n=void 0;try{for(var a,r=s()(t);!(e=(a=r.next()).done);e=!0){var o=a.value;if(o.type="department",o.children&&o.children.length>0&&k(o.children),o.has_may_department_staff&&o.has_may_department_staff.length>0){var c=o.has_may_department_staff,l=[],u=!0,d=!1,h=void 0;try{for(var f,m=s()(c);!(u=(f=m.next()).done);u=!0){var p=f.value;if(p.has_one_staff){var _={user_id:p.has_one_staff.user_id,name:p.has_one_staff.name,uid:p.has_one_staff.uid,id:p.has_one_staff.id,type:"staff"};l.push(_)}}}catch(t){d=!0,h=t}finally{try{!u&&m.return&&m.return()}finally{if(d)throw h}}o.staff=l}}}catch(t){i=!0,n=t}finally{try{!e&&r.return&&r.return()}finally{if(i)throw n}}return t}var C={components:{department_staff_item:_.exports,staff_item:f.a},props:{department_is_add:{type:Boolean,default:!1},multiple:{type:Boolean,default:!1},department_is_click:{type:Boolean,default:!1},search_criteria:{type:Object,default:function(){return{text:"",staff:!0,department:!0}}},from:{type:String,default:""},choosedArr:{type:Array,default:function(){return[]}}},data:function(){return{depatmemtList:[],checkboxIds:{},staffArr:[],departmentArr:[]}},created:function(){},mounted:function(){"sign"==this.from?this.getSignDepartmentList():"welcome"==this.from?this.getWelcomeDepartmentList():this.getDepartmentList()},watch:{"search_criteria.name":function(t,e){var i=this;if(b&&clearTimeout(b),""==t)return this.staffArr=[],void(this.departmentArr=[]);b=setTimeout(function(){i.search()},500)}},computed:{search_criteria_computed:function(){return h()({name:"",staff:!0,department:!0},this.search_criteria)}},methods:{choiceData:function(t){0==this.multiple&&(this.checkboxIds={}),"staff"==t.type?this.$set(this.checkboxIds,t.user_id,t):this.$set(this.checkboxIds,t.id,t),this.$emit("choiceData",this.checkboxIds)},delChoiceData:function(t){this.$delete(this.checkboxIds,t),this.$emit("choiceData",this.checkboxIds)},delChoiceAll:function(){this.checkboxIds={},this.$emit("choiceData",this.checkboxIds)},setChoiceData:function(t){var e=this;this.checkboxIds={},this.$nextTick(function(){e.checkboxIds=JSON.parse(r()(t)),e.$emit("choiceData",e.checkboxIds)})},search:function(){var t=this.depatmemtList;g=[],v=[],y={};var e=!0,i=!1,n=void 0;try{for(var a,r=s()(t);!(e=(a=r.next()).done);e=!0){var o=a.value;x(this.search_criteria_computed,o)}}catch(t){i=!0,n=t}finally{try{!e&&r.return&&r.return()}finally{if(i)throw n}}console.log(g,v),this.staffArr=g,this.departmentArr=v},getDepartmentList:function(){var t=this;return u()(c.a.mark(function e(){var i;return c.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,$http.pc_get("plugin/WechatChatSidebar/getDepartmentMember",{});case 2:1===(i=e.sent).result&&(t.depatmemtList=k(i.data),console.log(t.depatmemtList));case 4:case"end":return e.stop()}},e,t)}))()},getSignDepartmentList:function(){var t=this;$http.post("plugin.yun-sign.frontend.company.getDepartmentMember",{id:this.id},"loading").then(function(e){1===e.result?(t.depatmemtList=k(e.data),console.log(t.depatmemtList)):t.$message.error(e.msg)}).catch(function(t){console.log(t)})},getWelcomeDepartmentList:function(){var t=this;$http.pc_post("plugin/WelcomeWords/getDepartmentMember","loading").then(function(e){1===e.result?(t.depatmemtList=k(e.data),console.log(t.depatmemtList)):t.$message.error(e.msg)}).catch(function(t){console.log(t)})}}},w=(i("bIWO"),Object(p.a)(C,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"department"},[""==t.search_criteria.name?t._l(t.depatmemtList,function(e){return i("department_staff_item",{key:e.id,attrs:{root:e,checkboxIds:t.checkboxIds,department_is_add:t.department_is_add,multiple:t.multiple,department_is_click:t.department_is_click},on:{choiceDepartment:t.choiceData}})}):t._e(),t._v(" "),""!=t.search_criteria.name?[t._l(t.departmentArr,function(e){return[i("department_staff_item",{key:e.id,attrs:{root:e,checkboxIds:t.checkboxIds,department_is_add:t.department_is_add,multiple:t.multiple,department_is_click:t.department_is_click},on:{choiceDepartment:t.choiceData}})]}),t._v(" "),t._l(t.staffArr,function(e){return[i("staff_item",{key:e.user_id,attrs:{root:e,checkId:"user_id",paddingLeft:12,checkboxIds:t.checkboxIds,multiple:t.multiple},on:{choiceDepartment:t.choiceData}})]})]:t._e()],2)},[],!1,null,"5709e542",null));w.options.__file="choice_department_staff.vue";var I={props:["show","from","choosedArr","only_staff"],components:{choice_department_staff:w.exports},watch:{dialogShow:function(t){this.$emit("update:show",t)},show:function(){this.dialogShow=this.show}},data:function(){return{search_text:"",checkboxArr:[],checkboxIds:{},dialogShow:!1}},methods:{choiceData:function(t){var e=[];for(var i in t)e.push(t[i]);this.checkboxArr=e,this.checkboxIds=t,this.$emit("change",this.callbackData())},delChoice:function(t){"staff"==t.type&&t.user_id?this.$refs.choice_department.delChoiceData(t.user_id):this.$refs.choice_department.delChoiceData(t.id)},setChoiceData:function(t){console.log("执行setChoiceData"),this.$refs.choice_department.setChoiceData(t)},closeDialog:function(){this.$emit("update:show",!1)},confirm:function(){this.$emit("confirm",this.callbackData()),this.closeDialog()},callbackData:function(){var t=[],e=[],i=!0,n=!1,a=void 0;try{for(var o,c=s()(this.checkboxArr);!(i=(o=c.next()).done);i=!0){var l=o.value;"staff"==l.type?t.push(l):e.push(l)}}catch(t){n=!0,a=t}finally{try{!i&&c.return&&c.return()}finally{if(n)throw a}}var u=JSON.parse(r()(this.checkboxIds));return{checkboxArr:JSON.parse(r()(this.checkboxArr)),checkboxIds:u,staffArr:t,departmentArr:e}}}},S=(i("uBcZ"),Object(p.a)(I,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("el-dialog",{attrs:{title:"选择可见范围",visible:t.dialogShow,width:"835px",center:""},on:{"update:visible":function(e){t.dialogShow=e}}},[i("div",{staticClass:"visibleRange"},[i("div",{staticClass:"visibleRange-left"},[i("div",{staticClass:"search-container"},[i("el-input",{attrs:{placeholder:"输入关键词搜索成员、部门"},model:{value:t.search_text,callback:function(e){t.search_text=e},expression:"search_text"}}),t._v(" "),i("div",{staticClass:"button theme-button",staticStyle:{width:"80px",height:"36px","margin-left":"20px","flex-shrink":"0"}},[t._v("\n          搜索\n        ")])],1),t._v(" "),i("div",{staticClass:"department-container"},[i("choice_department_staff",{ref:"choice_department",attrs:{from:t.from,choosedArr:t.choosedArr,department_is_add:!t.only_staff,multiple:!0,search_criteria:{name:t.search_text}},on:{choiceData:t.choiceData}})],1)]),t._v(" "),i("div",{staticStyle:{width:"50px"}}),t._v(" "),i("div",{staticClass:"visibleRange-right"},[i("div",{staticClass:"department-checkbox-container"},t._l(t.checkboxArr,function(e){return i("div",{key:"staff"==e.type?e.user_id:e.id,staticClass:"staff_item"},["department"==e.type?i("i",{staticClass:"iconfont icon-wenjianjia"}):t._e(),t._v(" "),"staff"==e.type?i("i",{staticClass:"iconfont icon-fontclass-daili"}):t._e(),t._v(" "),i("div",{staticClass:"text"},[t._v(t._s(e.name))]),t._v(" "),i("i",{staticClass:"iconfont icon-close11",on:{click:function(i){t.delChoice(e)}}})])}))])]),t._v(" "),i("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("div",{staticClass:"button gray-button",staticStyle:{width:"80px",height:"30px"},on:{click:t.closeDialog}},[t._v("\n      取消\n    ")]),t._v(" "),i("div",{staticClass:"button theme-button",staticStyle:{width:"80px",height:"30px","margin-left":"10px"},on:{click:t.confirm}},[t._v("\n      确定\n    ")])])])},[],!1,null,"bb238f1c",null));S.options.__file="dialog_choice_department_staff.vue";e.a=S.exports}}]);