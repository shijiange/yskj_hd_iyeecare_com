(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-d418"],{"+BNN":function(e,t,i){"use strict";var s=i("0SsP");i.n(s).a},"0SsP":function(e,t,i){},B4rm:function(e,t,i){"use strict";var s=i("WjPP");i.n(s).a},IrYA:function(e,t,i){"use strict";var s=i("JecQ");i.n(s).a},JecQ:function(e,t,i){},WjPP:function(e,t,i){},bZdz:function(e,t,i){e.exports=i.p+"static/img/welcome_top.d6767fe.png"},ueSZ:function(e,t,i){"use strict";i.r(t);var s=i("EJiy"),a=i.n(s),l=i("gDS+"),n=i.n(l),c=i("14Xm"),o=i.n(c),r=i("FyfS"),d=i.n(r),p=i("D3Ub"),_=i.n(p),m=i("x8Yw"),u=i("ErL5"),h=i("Fqtg"),v={components:{uploadImg:u.a,uploadVideo:h.a},data:function(){return{type_choice:[],select_type_id:0,message_type:"",uploadImgType:"",uploadImgIndex:"",uploadShow:!1,chioceList:[],customerNicknameList:[{name:"客户昵称",value:"{{客户昵称}}"}],uploadVideoShow:!1,changeVideoVisible:!1,uploadVideoType:"",uploadVideoIndex:"",test:"",testLength:"",testInnerHTML:"",showText:"",pos:"",avatar:"",selectCommandIshow:!0}},mounted:function(){var e=this;this.chioceList.forEach(function(t){e.type_choice.push({id:t.id,name:t.name})});var t=document.getElementById("test").innerHTML;this.$emit("news",t),this.$route.query.id?this.welcomeEditDataShow():(this.testLength=document.querySelector("#test").innerText,this.type_choice.push({id:0,name:"文本"}))},watch:{chioceList:{handler:function(e,t){this.$emit("chioceList",this.chioceList)},deep:!0},type_choice:{handler:function(e,t){this.$emit("typeChoice",this.type_choice)},deep:!0},select_type_id:function(e,t){var i=this;0==t&&(this.testInnerHTML=JSON.parse(n()(document.getElementById("test").innerHTML))),0==e&&this.$nextTick(function(){document.getElementById("test").innerHTML=i.testInnerHTML})}},methods:{welcomeEditDataShow:function(){var e=this;return _()(o.a.mark(function t(){var i;return o.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,$http.pc_post("plugin/WelcomeWords/detail",{id:e.$route.query.id});case 2:1==(i=t.sent).result?(e.avatar=null!==i.data.has_one_members?i.data.has_one_members.avatar:"",e.$emit("avatar",e.avatar),e.showDatafilter(i.data.content)):e.$message.error(i.msg),e.$nextTick(function(){e.testLength=e.$refs.test_show.innerText});case 5:case"end":return t.stop()}},t,e)}))()},showDatafilter:function(e){var t=!0,i=!1,s=void 0;try{for(var a,l=d()(e);!(t=(a=l.next()).done);t=!0){var n=a.value;if("text"==n.type){var c=n.news.replace(/\">{{客户昵称}}</g,'">客户昵称<');this.showText=c,this.$emit("news",this.showText),this.testLength=document.getElementById("test").innerText}var o=this.guid();this.type_choice.push({id:"text"==n.type?0:o,name:"text"==n.type?"文本":"image"==n.type?"图片":"link"==n.type?"链接":"applet"==n.type?"小程序":"video"==n.type?"视频":"file"==n.type?"文件":""}),this.chioceList.push({id:o,name:"text"==n.type?"文本":"image"==n.type?"图片":"link"==n.type?"链接":"applet"==n.type?"小程序":"video"==n.type?"视频":"file"==n.type?"文件":"",imgList:{link_img:"image"==n.type?n.link_img:"",id:o},linkList:{title:"link"==n.type?n.title:"",link:"link"==n.type?n.link:"",describe:"link"==n.type?n.describe:"",link_img:"link"==n.type?n.link_img:"",id:o},applet:{title:"applet"==n.type?n.title:"",appid:"applet"==n.type?n.appid:"",page:"applet"==n.type?n.page:"",link_img:"applet"==n.type?n.link_img:"",id:o},video:{link_video:"video"==n.type?n.link_video:"",id:o},file:{link_file:"file"==n.type?n.link_file:"",id:o}})}}catch(e){i=!0,s=e}finally{try{!t&&l.return&&l.return()}finally{if(i)throw s}}},guid:function(){return"xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g,function(e){var t=16*Math.random()|0;return("x"==e?t:3&t|8).toString(16)})},selectCommand:function(e){if(!(this.type_choice.length>9)){var t=this.guid();this.type_choice.push({id:t,name:e}),this.chioceList.push({id:t,name:e,imgList:{link_img:"",id:t},linkList:{title:"",link:"",describe:"",link_img:"",id:t},applet:{title:"",appid:"",page:"",link_img:"",id:t},video:{link_video:"",id:t},file:{link_file:"",id:t}})}},btnSelect:function(e,t){this.select_type_id=e,this.message_type=t},typeChange:function(e){var t=!0,i=!1,s=void 0;try{for(var a,l=d()(this.type_choice);!(t=(a=l.next()).done);t=!0){var n=a.value;n.id==this.select_type_id&&(n.name=e)}}catch(e){i=!0,s=e}finally{try{!t&&l.return&&l.return()}finally{if(i)throw s}}var c=!0,o=!1,r=void 0;try{for(var p,_=d()(this.chioceList);!(c=(p=_.next()).done);c=!0){var m=p.value;m.id==this.select_type_id&&(m.name=e,this.switchNull(m))}}catch(e){o=!0,r=e}finally{try{!c&&_.return&&_.return()}finally{if(o)throw r}}},switchNull:function(e){e.imgList.link_img="",e.linkList.title="",e.linkList.link="",e.linkList.describe="",e.linkList.link_img="",e.applet.title="",e.applet.page="",e.applet.link_img="",e.applet.appid="",e.video.link_video="",e.file.link_file=""},delItemCard:function(e,t){var i=this,s=void 0;this.type_choice.forEach(function(e,t){e.id==i.select_type_id&&(s=t)}),this.chioceList.splice(t,1),this.type_choice.splice(s,1),this.select_type_id=0},openUpload:function(e,t){this.uploadImgType=e,this.uploadImgIndex=t,this.uploadShow=!0},sureImg:function(e){switch(this.uploadImgType){case"img":this.chioceList[this.uploadImgIndex].imgList.link_img=e;break;case"link":this.chioceList[this.uploadImgIndex].linkList.link_img=e;break;case"applet":this.chioceList[this.uploadImgIndex].applet.link_img=e}},openUploadVideo:function(e,t){this.uploadVideoType=e,this.uploadVideoIndex=t,this.uploadVideoShow=!0},sureVideo:function(e){this.chioceList[this.uploadVideoIndex].video.link_video=e},uploadSuccess:function(e,t,i,s){1===e.result?(this.chioceList[s].file.link_file=e.data.img_url,this.$message.success("上传成功！")):this.$message.error(e.msg)},beforeUpload:function(e,t){},getPos:function(){this.pos=window.getSelection().getRangeAt(0)},addCustomerNickname:function(e){var t=document.createElement("span");if(t.innerHTML=e,t.style.color="#29ba9c",t.style.margin="0 5px",t.setAttribute("contenteditable","false"),test.appendChild(t),""===this.pos){var i=document.getElementById("test");i.focus();var s=window.getSelection();s.selectAllChildren(i),s.collapseToEnd(),this.pos=window.getSelection().getRangeAt(0)}this.pos.insertNode(t),this.blurChangeText()},blurChangeText:function(e){var t=document.getElementById("test").innerHTML;this.testInnerHTML=t,this.$emit("news",t),this.test=document.querySelector("#test").innerHTML,this.testLength=document.querySelector("#test").innerText}}},f=(i("+BNN"),i("KHd+")),g=Object(f.a)(v,function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",{attrs:{id:"welcome_card"}},[i("el-row",{staticClass:"card_detail"},[i("el-col",{attrs:{span:2}},[e._l(e.type_choice,function(t,s){return i("div",{key:s,staticClass:"choice_card",class:[e.select_type_id==t.id?"choice_card_active":"choice_card"],on:{click:function(i){e.btnSelect(t.id,t.name)}}},[e._v(e._s(t.name))])}),e._v(" "),this.type_choice.length>9?e._e():i("el-dropdown",{attrs:{trigger:"hover"},on:{command:e.selectCommand}},[i("div",{staticClass:"choice_add_card"},[i("i",{staticClass:"el-icon-plus"}),e._v("新建")]),e._v(" "),i("el-dropdown-menu",{attrs:{slot:"dropdown"},slot:"dropdown"},[i("el-dropdown-item",{attrs:{command:"图片"}},[e._v("图片")]),e._v(" "),i("el-dropdown-item",{attrs:{command:"链接"}},[e._v("链接")]),e._v(" "),i("el-dropdown-item",{attrs:{command:"小程序"}},[e._v("小程序")]),e._v(" "),i("el-dropdown-item",{attrs:{command:"视频"}},[e._v("视频")]),e._v(" "),i("el-dropdown-item",{attrs:{command:"文件"}},[e._v("文件")])],1)],1)],2),e._v(" "),i("el-col",{staticStyle:{"border-bottom":"1px solid #d9d9d9","border-top":"1px solid #d9d9d9"},attrs:{span:22}},[0==e.select_type_id?i("div",[i("el-form",{staticClass:"text-form-inline",attrs:{"label-width":"140px"}},[i("el-form-item",{attrs:{label:"文本消息:"}},[i("div",{staticClass:"text_message"},[e.$route.query.id?e._e():i("div",{staticStyle:{"padding-left":"10px"},attrs:{id:"test",contenteditable:"true",spellcheck:"true","data-medium-editor-element":"true",role:"textbox","aria-multiline":"true"},on:{keyup:e.blurChangeText,blur:e.getPos}},[e._v("感谢您的关注，我们将竭诚为您服务!")]),e._v(" "),e.$route.query.id?i("div",{ref:"test_show",staticStyle:{"padding-left":"10px"},attrs:{id:"test",contenteditable:"true",spellcheck:"true","data-medium-editor-element":"true",role:"textbox","aria-multiline":"true"},domProps:{innerHTML:e._s(e.showText)},on:{keyup:e.blurChangeText,blur:e.getPos}}):e._e(),e._v(" "),i("div",{staticClass:"chat-opt-header-item"},[e._l(e.customerNicknameList,function(t,s){return i("el-button",{key:s,staticClass:"item_card customer_item_card",attrs:{slot:"reference",plain:""},on:{click:function(i){e.addCustomerNickname(t.name)}},slot:"reference"},[e._v(e._s(t.name))])}),e._v(" "),i("span",{staticStyle:{position:"absolute",bottom:"45px",right:"75px","font-size":"14px",color:"#5c5c5c"}},[e._v(e._s(e.testLength.length)+"/1000")])],2)])])],1)],1):e._e(),e._v(" "),0!==e.select_type_id?i("div",[i("el-form",{staticClass:"text-form-inline",attrs:{"label-width":"140px"}},[i("el-form-item",{attrs:{label:"消息类型:"}},[i("el-radio-group",{on:{change:e.typeChange},model:{value:e.message_type,callback:function(t){e.message_type=t},expression:"message_type"}},[i("el-radio",{attrs:{label:"图片"}},[e._v("图片")]),e._v(" "),i("el-radio",{attrs:{label:"链接"}},[e._v("链接")]),e._v(" "),i("el-radio",{attrs:{label:"小程序"}},[e._v("小程序")]),e._v(" "),i("el-radio",{attrs:{label:"视频"}},[e._v("视频")]),e._v(" "),i("el-radio",{attrs:{label:"文件"}},[e._v("文件")])],1)],1),e._v(" "),e._l(e.chioceList,function(t,s){return"图片"==e.message_type&&t.imgList.id==e.select_type_id?i("div",{key:s},[i("el-form-item",{attrs:{label:"上传图片:"}},[i("div",{staticClass:"upload-box",on:{click:function(t){e.openUpload("img",s)}}},[i("i",{staticClass:"el-icon-plus",staticStyle:{"font-size":"32px"}})]),e._v(" "),t.imgList.link_img?i("div",{staticClass:"upload-boxed",on:{click:function(t){e.openUpload("img",s)}}},[i("img",{staticStyle:{width:"150px",height:"150px","border-radius":"5px",cursor:"pointer","object-fit":"contain","margin-top":"10px"},attrs:{src:t.imgList.link_img,alt:""}}),e._v(" "),i("div",{staticClass:"upload-boxed-text"},[e._v("点击重新上传")])]):e._e()]),e._v(" "),i("el-form-item",{attrs:{label:" "}},[i("span",{staticClass:"item_card",on:{click:function(t){e.delItemCard("img",s)}}},[e._v("删除该条")])])],1):e._e()}),e._v(" "),e._l(e.chioceList,function(t,s){return"链接"==e.message_type&&t.linkList.id==e.select_type_id?i("div",{key:s,staticClass:"link_card"},[i("el-form-item",{attrs:{label:"链接标题:",required:""}},[i("div",{staticClass:"more_words"},[i("el-input",{attrs:{placeholder:"请输入链接标题,最多64个字",maxlength:64},model:{value:t.linkList.title,callback:function(i){e.$set(t.linkList,"title",i)},expression:"item.linkList.title"}}),e._v(" "),i("span",[e._v(e._s(t.linkList.title.length)+"/64")])],1)]),e._v(" "),i("el-form-item",{attrs:{label:"链接地址:",required:""}},[i("div",{staticClass:"more_words"},[i("el-input",{attrs:{placeholder:"请以https://开头"},model:{value:t.linkList.link,callback:function(i){e.$set(t.linkList,"link",i)},expression:"item.linkList.link"}})],1)]),e._v(" "),i("el-form-item",{attrs:{label:"链接描述:"}},[i("div",{staticClass:"more_words"},[i("el-input",{attrs:{placeholder:"请输入链接描述,最多256个字",maxlength:256},model:{value:t.linkList.describe,callback:function(i){e.$set(t.linkList,"describe",i)},expression:"item.linkList.describe"}}),e._v(" "),i("span",[e._v(e._s(t.linkList.describe.length)+"/256")])],1)]),e._v(" "),i("el-form-item",{attrs:{label:"链接封面:"}},[i("div",{staticClass:"upload-box",on:{click:function(t){e.openUpload("link",s)}}},[i("i",{staticClass:"el-icon-plus",staticStyle:{"font-size":"32px"}})]),e._v(" "),t.linkList.link_img?i("div",{staticClass:"upload-boxed",on:{click:function(t){e.openUpload("link",s)}}},[i("img",{staticStyle:{width:"150px",height:"150px","border-radius":"5px",cursor:"pointer","object-fit":"contain"},attrs:{src:t.linkList.link_img,alt:""}}),e._v(" "),i("div",{staticClass:"upload-boxed-text"},[e._v("点击重新上传")])]):e._e()]),e._v(" "),i("el-form-item",{attrs:{label:" "}},[i("span",{staticClass:"item_card",on:{click:function(t){e.delItemCard("link",s)}}},[e._v("删除该条")])])],1):e._e()}),e._v(" "),e._l(e.chioceList,function(t,s){return"小程序"==e.message_type&&t.applet.id==e.select_type_id?i("div",{key:s,staticClass:"link_card"},[i("el-form-item",{attrs:{label:"小程序标题:",required:""}},[i("div",{staticClass:"more_words"},[i("el-input",{attrs:{placeholder:"请输入小程序标题,最多32个字",maxlength:32},model:{value:t.applet.title,callback:function(i){e.$set(t.applet,"title",i)},expression:"item.applet.title"}}),e._v(" "),i("span",[e._v(e._s(t.applet.title.length)+"/32")])],1)]),e._v(" "),i("el-form-item",{attrs:{label:"小程序appid:",required:""}},[i("div",{staticClass:"more_words"},[i("el-input",{attrs:{placeholder:"必须是关联到企业的小程序应用"},model:{value:t.applet.appid,callback:function(i){e.$set(t.applet,"appid",i)},expression:"item.applet.appid"}}),e._v(" "),i("span")],1)]),e._v(" "),i("el-form-item",{attrs:{label:"小程序page路径:",required:""}},[i("div",{staticClass:"more_words"},[i("el-input",{attrs:{placeholder:"请输入小程序路径",maxlength:256},model:{value:t.applet.page,callback:function(i){e.$set(t.applet,"page",i)},expression:"item.applet.page"}}),e._v(" "),i("span",[e._v(e._s(t.applet.page.length)+"/256")])],1)]),e._v(" "),i("el-form-item",{attrs:{label:"小程序封面:",required:""}},[i("div",{staticStyle:{display:"flex"}},[i("div",{staticClass:"upload-box",on:{click:function(t){e.openUpload("applet",s)}}},[i("i",{staticClass:"el-icon-plus",staticStyle:{"font-size":"32px"}})]),e._v(" "),t.applet.link_img?e._e():i("div",{staticClass:"tip",staticStyle:{display:"flex","align-items":"flex-end","margin-left":"5px","flex-shrink":"0"}},[e._v("建议尺寸为520*416")])]),e._v(" "),t.applet.link_img?i("div",{staticClass:"upload-boxed",on:{click:function(t){e.openUpload("applet",s)}}},[i("div",{staticStyle:{display:"flex"}},[i("img",{staticStyle:{width:"150px",height:"150px","border-radius":"5px",cursor:"pointer","margin-top":"10px"},attrs:{src:t.applet.link_img,alt:""}}),e._v(" "),i("div",{staticClass:"tip",staticStyle:{display:"flex","align-items":"flex-end","margin-left":"5px","flex-shrink":"0"}},[e._v("建议尺寸为520*416")])]),e._v(" "),i("div",{staticClass:"upload-boxed-text"},[e._v("点击重新上传")])]):e._e()]),e._v(" "),i("el-form-item",{attrs:{label:" "}},[i("span",{staticClass:"item_card",on:{click:function(t){e.delItemCard("applet",s)}}},[e._v("删除该条")])])],1):e._e()}),e._v(" "),e._l(e.chioceList,function(t,s){return"视频"==e.message_type&&t.video.id==e.select_type_id?i("div",{key:s,staticClass:"link_card"},[i("el-form-item",{attrs:{label:"上传视频:",required:""}},[i("div",{staticClass:"upload-box",on:{click:function(t){e.openUploadVideo("applet",s)}}},[i("i",{staticClass:"el-icon-plus",staticStyle:{"font-size":"32px"}})]),e._v(" "),t.video.link_video?i("div",{staticClass:"upload-boxed"},[i("video",{attrs:{src:t.video.link_video,alt:"",controls:"controls"}}),e._v(" "),i("div",{staticClass:"upload-boxed-text",on:{click:function(t){e.openUploadVideo("applet",s)}}},[e._v("点击重新上传")])]):e._e()]),e._v(" "),i("el-form-item",{attrs:{label:" "}},[i("span",{staticClass:"item_card",on:{click:function(t){e.delItemCard("video",s)}}},[e._v("删除该条")])])],1):e._e()}),e._v(" "),e._l(e.chioceList,function(t,s){return"文件"==e.message_type&&t.file.id==e.select_type_id?i("div",{key:s,staticClass:"link_card"},[i("el-form-item",{attrs:{label:"上传文件:",required:""}},[i("el-upload",{staticClass:"avatar-uploader",attrs:{action:e.fun.getRealUrl("upload.uploadPic&upload_type=file"),accept:".pdf, .doc, .docx, .xls, .xlsx","show-file-list":!1,"on-success":function(t,i,a){return e.uploadSuccess(t,i,a,s)},"before-upload":e.beforeUpload}},[t.file.link_file?e._e():i("div",{staticClass:"upload-box"},[i("i",{staticClass:"el-icon-plus",staticStyle:{"font-size":"32px"}})]),e._v(" "),t.file.link_file?i("div",[i("div",{staticClass:"check_card"},[i("i",{staticClass:"el-icon-circle-check"}),e._v("已选择1个文件 "),i("span",[e._v("[修改]")])])]):e._e()])],1),e._v(" "),i("el-form-item",{attrs:{label:" "}},[i("span",{staticClass:"item_card",on:{click:function(t){e.delItemCard("file",s)}}},[e._v("删除该条")])])],1):e._e()})],2)],1):e._e()])],1),e._v(" "),i("upload-img",{attrs:{centerDialogVisible:e.uploadShow},on:{changeVisible:function(t){e.uploadShow=!1},sureImg:e.sureImg}}),e._v(" "),i("upload-video",{attrs:{centerDialogVideoVisible:e.uploadVideoShow},on:{changeVideoVisible:function(t){e.uploadVideoShow=!1},sureVideo:e.sureVideo}})],1)},[],!1,null,"23a92dd9",null);g.options.__file="welcome_card.vue";var k=g.exports,x=[function(){var e=this.$createElement,t=this._self._c||e;return t("div",[t("img",{staticStyle:{width:"100%","padding-bottom":"40px"},attrs:{src:i("bZdz"),alt:""}})])}],y={data:function(){return{news:""}},props:["gnChioceLists","gnTypeChoices","gnText","avatar"],watch:{gnChioceLists:{handler:function(e,t){this.updateGnChioceLists()},deep:!0},gnTypeChoices:{handler:function(e,t){this.updateGnTypeChoices()},deep:!0},gnText:function(e,t){this.news=e}},mounted:function(){},methods:{updateGnChioceLists:function(){},updateGnTypeChoices:function(){}},components:{}},b=(i("B4rm"),Object(f.a)(y,function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",[e._m(0),e._v(" "),i("div",{staticClass:"show_item"},[i("div",{staticClass:"show_img"},[e.avatar?i("img",{attrs:{src:e.avatar,alt:""}}):e._e()]),e._v(" "),i("div",{staticClass:"show_content"},[e.avatar?i("div",{staticClass:"triangle"}):e._e(),e._v(" "),i("div",{staticClass:"test_msg"},[i("div",{staticClass:"link_list",staticStyle:{padding:"10px","line-height":"30px"}},[i("div",{staticStyle:{padding:"0px"},domProps:{innerHTML:e._s(e.news)}})])])])]),e._v(" "),e._l(e.gnChioceLists,function(t,s){return i("div",{key:s},["图片"==t.name&&t.imgList.link_img?i("div",{staticClass:"show_item"},[i("div",{staticClass:"show_img"},[e.avatar?i("img",{attrs:{src:e.avatar,alt:""}}):e._e()]),e._v(" "),i("div",{staticStyle:{width:"calc(100% - 40px)"}},[i("div",{}),e._v(" "),i("div",{},[i("img",{staticStyle:{width:"190px","object-fit":"cover","margin-left":"10px"},attrs:{src:t.imgList.link_img,alt:""}})])])]):e._e(),e._v(" "),"链接"==t.name&&(t.linkList.title||t.linkList.link||t.linkList.describe)?i("div",{staticClass:"show_item"},[i("div",{staticClass:"show_img"},[e.avatar?i("img",{attrs:{src:e.avatar,alt:""}}):e._e()]),e._v(" "),i("div",{staticClass:"type_show_content",staticStyle:{width:"calc(100% - 40px)"}},[e.avatar?i("div",{staticClass:"tyep_triangle"}):e._e(),e._v(" "),i("div",{staticClass:"test_msg"},["链接"==t.name?i("div",{staticClass:"link_list"},[i("div",[e._v(e._s(t.linkList.title))]),e._v(" "),i("div",[e._v(e._s(t.linkList.link))]),e._v(" "),i("div",[e._v(e._s(t.linkList.describe))]),e._v(" "),t.linkList.link_img?i("img",{attrs:{src:t.linkList.link_img,alt:""}}):e._e()]):e._e()])])]):e._e(),e._v(" "),"小程序"==t.name&&(t.applet.title||t.applet.appid||t.applet.page)?i("div",{staticClass:"show_item"},[i("div",{staticClass:"show_img"},[e.avatar?i("img",{attrs:{src:e.avatar,alt:""}}):e._e()]),e._v(" "),i("div",{staticClass:"type_show_content",staticStyle:{width:"calc(100% - 40px)"}},[e.avatar?i("div",{staticClass:"tyep_triangle"}):e._e(),e._v(" "),i("div",{staticClass:"test_msg"},[i("div",{staticClass:"link_list"},[i("div",[e._v(e._s(t.applet.title))]),e._v(" "),t.applet.link_img?i("img",{attrs:{src:t.applet.link_img,alt:""}}):e._e()])])])]):e._e(),e._v(" "),"视频"==t.name&&t.video.link_video?i("div",{staticClass:"show_item"},[i("div",{staticClass:"show_img"},[e.avatar?i("img",{attrs:{src:e.avatar,alt:""}}):e._e()]),e._v(" "),i("div",{staticClass:"type_show_content"},[i("div",{}),e._v(" "),i("div",{},["视频"==t.name&&t.video.link_video?i("video",{staticStyle:{width:"100%"},attrs:{src:t.video.link_video,alt:"",controls:"controls"}}):e._e()])])]):e._e(),e._v(" "),"文件"==t.name&&t.file.link_file?i("div",{staticClass:"show_item"},[i("div",{staticClass:"show_img"},[e.avatar?i("img",{attrs:{src:e.avatar,alt:""}}):e._e()]),e._v(" "),i("div",{staticClass:"type_show_content"},[e.avatar?i("div",{staticClass:"tyep_triangle"}):e._e(),e._v(" "),i("div",{staticClass:"test_msg "},[i("div",{staticClass:"link_list check_card"},[i("a",[e._v(e._s(t.file.link_file))])])])])]):e._e()])})],2)},x,!1,null,"ac294a56",null));b.options.__file="welcome_show.vue";var w=b.exports,C={data:function(){return{name:"",select_members:1,addDepartmentTipsShow:!1,checkboxArr:[],checkboxIds:{},gnChioceLists:null,gnTypeChoices:null,gnText:null,titleStatus:0,avatar:null}},components:{dialog_choice_department_staff:m.a,welcome_card:k,welcome_show:w},created:function(){this.$route.query.id&&this.welcomeEditDataShow()},methods:{welcomeEditDataShow:function(){var e=this;return _()(o.a.mark(function t(){var i,s,a,l,n,c,r,p,_,m,u,h,v,f,g,k,x;return o.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,$http.pc_post("plugin/WelcomeWords/detail",{id:e.$route.query.id});case 2:if(1!=(i=t.sent).result){t.next=52;break}for(a in e.name=i.data.name,e.select_members=i.data.type,s=[],i.data.appoint)s.push(i.data.appoint[a]);for(l={},n=[],c=!0,r=!1,p=void 0,t.prev=13,_=d()(s);!(c=(m=_.next()).done);c=!0)"department"==(u=m.value).type&&(u.type="department",l[u.id]=u,n.push(u));t.next=21;break;case 17:t.prev=17,t.t0=t.catch(13),r=!0,p=t.t0;case 21:t.prev=21,t.prev=22,!c&&_.return&&_.return();case 24:if(t.prev=24,!r){t.next=27;break}throw p;case 27:return t.finish(24);case 28:return t.finish(21);case 29:for(h=!0,v=!1,f=void 0,t.prev=32,g=d()(s);!(h=(k=g.next()).done);h=!0)"staff"==(x=k.value).type&&(x.type="staff",l[x.id]=x,n.push(x));t.next=40;break;case 36:t.prev=36,t.t1=t.catch(32),v=!0,f=t.t1;case 40:t.prev=40,t.prev=41,!h&&g.return&&g.return();case 43:if(t.prev=43,!v){t.next=46;break}throw f;case 46:return t.finish(43);case 47:return t.finish(40);case 48:e.checkboxArr=n,e.checkboxIds=l,t.next=53;break;case 52:e.$message.error(i.msg);case 53:case"end":return t.stop()}},t,e,[[13,17,21,29],[22,,24,28],[32,36,40,48],[41,,43,47]])}))()},chioceLists:function(e){this.gnChioceLists=e},typeChoices:function(e){this.gnTypeChoices=e},texts:function(e){this.gnText=e},avatars:function(e){this.avatar=e},choiceChange:function(e){},choiceComfirm:function(e){this.checkboxArr=e.checkboxArr,this.checkboxIds=e.checkboxIds},openChoice:function(){var e=this;this.addDepartmentTipsShow=!0,console.log(this.checkboxIds,"this.checkboxIds"),this.$nextTick(function(){e.$refs.dialog_choice_department_staff.setChoiceData(e.checkboxIds)})},choiceData:function(){var e=[];for(var t in this.checkboxIds)e.push(this.checkboxIds[t]);this.checkboxArr=e},delSelectMembers:function(e,t){"staff"==t.type?delete this.checkboxIds[t.user_id]:delete this.checkboxIds[t.id],this.choiceData()},changeMember:function(e){1==e&&(this.checkboxIds={},this.checkboxArr=[])},submit:function(){var e=this;return _()(o.a.mark(function t(){var i,s,l,c,r,p,_,m,u,h,v;return o.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return i=e.filterChioceListData(e.$refs.welcome_card.chioceList),(s=JSON.parse(n()(i))).unshift(s[i.length-1]),s.splice(s.length-1,1),i=s,t.next=7,$http.pc_post("plugin/WelcomeWords/save",{id:e.$route.query.id?e.$route.query.id:"",form:{name:e.name,type:e.select_members,appoint:1==e.select_members?"":e.checkboxIds,content:i}});case 7:if(1!==(l=t.sent).result){t.next=13;break}e.$message.success(l.msg),e.$router.push(e.fun.getUrl("welcomeList")),t.next=45;break;case 13:if(!l.msg){t.next=45;break}if(c=[],"object"!=a()(l.msg)){t.next=43;break}t.t0=o.a.keys(l.msg);case 17:if((t.t1=t.t0()).done){t.next=40;break}for(r=t.t1.value,p=!0,_=!1,m=void 0,t.prev=22,u=d()(l.msg[r]);!(p=(h=u.next()).done);p=!0)v=h.value,c.push(v);t.next=30;break;case 26:t.prev=26,t.t2=t.catch(22),_=!0,m=t.t2;case 30:t.prev=30,t.prev=31,!p&&u.return&&u.return();case 33:if(t.prev=33,!_){t.next=36;break}throw m;case 36:return t.finish(33);case 37:return t.finish(30);case 38:t.next=17;break;case 40:e.$message.error(c.toString()),t.next=44;break;case 43:e.$message.error(l.msg);case 44:console.log(a()(l.msg),123);case 45:case"end":return t.stop()}},t,e,[[22,26,30,38],[31,,33,37]])}))()},filterChioceListData:function(e){var t=this.gnText;t=t.replace(/\">客户昵称</g,'">{{客户昵称}}<');var i=[],s=!0,a=!1,l=void 0;try{for(var n,c=d()(e);!(s=(n=c.next()).done);s=!0){var o=n.value;switch(o.name){case"图片":i.push({type:"image",link_img:o.imgList.link_img});break;case"链接":i.push({type:"link",title:o.linkList.title,link:o.linkList.link,describe:o.linkList.describe,link_img:o.linkList.link_img});break;case"小程序":i.push({type:"applet",title:o.applet.title,appid:o.applet.appid,page:o.applet.page,link_img:o.applet.link_img});break;case"视频":i.push({type:"video",link_video:o.video.link_video});break;case"文件":i.push({type:"file",link_file:o.file.link_file})}}}catch(e){a=!0,l=e}finally{try{!s&&c.return&&c.return()}finally{if(a)throw l}}return i.push({type:"text",news:t}),i}}},L=(i("IrYA"),Object(f.a)(C,function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",{staticClass:"all"},[i("div",{staticClass:"welcome_title"},[i("span",{class:[0==e.titleStatus?"welcome_title_detail":"active_welcome_title_detail"],on:{click:function(t){e.titleStatus=1}}},[e._v("欢迎语")])]),e._v(" "),i("div",{staticClass:"welcome_editor",attrs:{id:"app"}},[i("div",{staticClass:"vue-head"},[e._m(0),e._v(" "),i("div",{staticClass:"vue-search"},[i("el-row",[i("el-col",{attrs:{span:16}},[i("el-form",{staticClass:"demo-form-inline",attrs:{"label-width":"140px"}},[i("el-form-item",{attrs:{label:"欢迎语名称"}},[i("el-input",{staticStyle:{width:"30%"},attrs:{placeholder:"请输入欢迎语名称"},model:{value:e.name,callback:function(t){e.name=t},expression:"name"}})],1),e._v(" "),i("el-form-item",{attrs:{label:"选择成员"}},[i("el-radio-group",{on:{change:e.changeMember},model:{value:e.select_members,callback:function(t){e.select_members=t},expression:"select_members"}},[i("el-radio",{attrs:{label:1}},[e._v("全部成员")]),e._v(" "),i("el-radio",{attrs:{label:2}},[e._v("指定成员/部门")])],1),e._v(" "),2==e.select_members?i("div",{staticClass:"add_memeber_department",on:{click:e.openChoice}},[i("span",{staticClass:"member_department_deail"},[e._v("添加指定成员/部门")])]):e._e(),e._v(" "),i("div",e._l(e.checkboxArr,function(t,s){return i("span",{key:"staff"==t.type?t.user_id:t.id},[i("span",{staticClass:"row_card"},[i("i",{staticClass:"iconfont icon-fontclass-rengezhongxin"}),e._v("\n                      "+e._s(t.name)+"\n                    ")]),e._v(" "),i("i",{staticClass:"el-icon-close",on:{click:function(i){e.delSelectMembers(s,t)}}})])}))],1),e._v(" "),i("el-form-item",{attrs:{label:"欢迎语内容"}},[i("div",{staticClass:"welcome_content"},[e._v("当填写小程序信息时请务必确认小程序正确,当填写小程序信息不正确时,所配置的欢迎语内容,企业微信全部不再推送,填写时,请仔细！！文本必填，最多添加9条附件!")])]),e._v(" "),i("el-form-item",[i("welcome_card",{ref:"welcome_card",on:{chioceList:e.chioceLists,typeChoice:e.typeChoices,news:e.texts,avatar:e.avatars}})],1)],1)],1),e._v(" "),i("el-col",{staticClass:"right_card",attrs:{span:8}},[i("div",{class:[2==e.select_members?e.checkboxArr.length>0?"welcome_show_select_acitve":"welcome_show_acitve":"welcome_show"]},[i("welcome_show",{attrs:{gnChioceLists:e.gnChioceLists,gnTypeChoices:e.gnTypeChoices,gnText:e.gnText,avatar:e.avatar}})],1)])],1)],1)]),e._v(" "),i("div",{staticClass:"sendButtons"},[i("el-button",{staticStyle:{background:"#5ab79c","border-color":"#5ab79c"},attrs:{type:"primary"},on:{click:e.submit}},[e._v("提交")])],1)]),e._v(" "),i("dialog_choice_department_staff",{ref:"dialog_choice_department_staff",attrs:{from:"welcome",show:e.addDepartmentTipsShow},on:{change:e.choiceChange,confirm:e.choiceComfirm,"update:show":function(t){e.addDepartmentTipsShow=t}}})],1)},[function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[t("div",{staticClass:"vue-main-title-left"}),this._v(" "),t("div",{staticClass:"vue-main-title-content"},[this._v("编辑欢迎语")])])}],!1,null,"ebdaafba",null));L.options.__file="welcome_editor.vue";t.default=L.exports}}]);