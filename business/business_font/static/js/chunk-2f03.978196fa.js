(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-2f03"],{"+7V1":function(t,e,i){},"+NPD":function(t,e,i){"use strict";var n=i("QiPw");i.n(n).a},"0H4B":function(t,e,i){},"0oOj":function(t,e,i){"use strict";var n=i("21jc");i.n(n).a},"1y1d":function(t,e,i){},"21jc":function(t,e,i){},"2r0p":function(t,e,i){},"63kS":function(t,e,i){},"6yxo":function(t,e,i){},ARp1:function(t,e,i){"use strict";var n=i("2r0p");i.n(n).a},AY6Z:function(t,e,i){"use strict";var n=i("1y1d");i.n(n).a},BJoN:function(t,e,i){},DDfB:function(t,e,i){"use strict";var n=i("nCe3");i.n(n).a},FsYO:function(t,e,i){},FxAy:function(t,e,i){},JMhm:function(t,e,i){},JiwJ:function(t,e,i){"use strict";var n=i("QbLZ"),s=i.n(n),a=i("RCcY"),o=i("L2JU"),c={props:{defaultActive:{type:String,default:"1"}},data:function(){return{router_list:[{category_id:"1",category_title:"基础设置",routers:[]},{category_id:"2",category_title:"会话存档",routers:[]}]}},components:{sideItem:a.a},computed:s()({},Object(o.b)(["permission_routers","userInfo"])),watch:{permission_routers:function(t,e){this.signRouters(t)}},mounted:function(){this.signRouters()},methods:{signRouters:function(t){var e=(t||this.permission_routers).filter(function(t){return"workSession"===t.name});e[0]&&this.router_list.map(function(t){e[0].children.map(function(e){e.class_id==t.category_id&&t.routers.push(e)})})}}},r=(i("MyMa"),i("KHd+")),l=Object(r.a)(c,function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"second-side-box"},[e("div",{staticStyle:{width:"150px"}}),this._v(" "),e("div",{staticClass:"second-side-box-fixed"},[e("el-menu",{staticClass:"el-menu-vertical-demo",attrs:{"default-active":this.defaultActive}},this._l(this.router_list,function(t){return e("side-item",{key:t.category_id,attrs:{item:t}})}))],1)])},[],!1,null,"5928de46",null);l.options.__file="work_session_side.vue";e.a=l.exports},KGJi:function(t,e,i){"use strict";var n=i("JMhm");i.n(n).a},LWJm:function(t,e,i){"use strict";var n=i("BJoN");i.n(n).a},Lk73:function(t,e,i){},MyMa:function(t,e,i){"use strict";var n=i("T97z");i.n(n).a},NQcK:function(t,e,i){},QiPw:function(t,e,i){},R37U:function(t,e,i){},T97z:function(t,e,i){},Ueul:function(t,e,i){"use strict";var n=i("FxAy");i.n(n).a},V931:function(t,e,i){},Yqil:function(t,e,i){"use strict";var n=i("63kS");i.n(n).a},a0Uq:function(t,e,i){"use strict";var n=i("Lk73");i.n(n).a},aWhl:function(t,e,i){"use strict";var n=i("h3Dy");i.n(n).a},ePUQ:function(t,e,i){"use strict";var n=i("FsYO");i.n(n).a},h3Dy:function(t,e,i){},nCe3:function(t,e,i){},pZTO:function(t,e,i){"use strict";var n={props:["item"],data:function(){return{}}},s=(i("ePUQ"),i("KHd+")),a=Object(s.a)(n,function(){var t=this.$createElement;return(this._self._c||t)("div",{staticClass:"text"},[this._v(this._s(this.item.content))])},[],!1,null,"330fc659",null);a.options.__file="text.vue";var o=a.exports,c={props:["item"],data:function(){return{showViewer:!1,previewSrcList:[]}},components:{ImageViewer:i("CKnL").a},created:function(){},methods:{handClick:function(){for(var t=document.querySelectorAll(".message-type-image"),e=[],i=0,n=0;n<t.length;n++)t[n].dataset.url==this.item.content&&(i=n),e.push(t[n].dataset.url);this.previewSrcList=e,this.$refs.imageViewer.index=i,this.showViewer=!0},closeViewer:function(){this.showViewer=!1}}},r=(i("rtn/"),Object(s.a)(c,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",[i("div",{staticClass:"message-type-image",staticStyle:{display:"none"},attrs:{"data-url":t.item.content}}),t._v(" "),i("el-image",{staticClass:"image",attrs:{ft:"contain",src:t.item.content,alt:"",lazy:""},on:{click:t.handClick}}),t._v(" "),i("image-viewer",{directives:[{name:"show",rawName:"v-show",value:t.showViewer,expression:"showViewer"}],ref:"imageViewer",attrs:{"initial-index":0,"on-close":t.closeViewer,"url-list":t.previewSrcList}})],1)},[],!1,null,"267a5aa7",null));r.options.__file="image.vue";var l=r.exports,_={props:["item"],data:function(){return{playCount:2,audio:null,duration:0,time:null,is_play:!1,is_transcoding:!1,transcoding_loading:!1}},created:function(){},methods:{createAudio:function(){var t=this,e=this.item.content;this.audio||(this.audio=document.createElement("AUDIO"),this.audio.src=e,this.audio.oncanplay=function(e){t.is_play=!0,t.duration=Math.ceil(t.audio.duration)},this.audio.onended=function(){t.endPlayback()},this.audio.onpause=function(){t.time&&(clearInterval(t.time),t.playCount=2)},this.audio.onerror=function(){t.endPlayback()})},playAudio:function(){var t=this;this.is_play&&(window.message_voice_obj!=this.audio?(this.endPlayback(),this.audio.play(),window.message_voice_obj=this.audio,this.time=setInterval(function(){t.playCount++},300)):this.endPlayback())},endPlayback:function(){window.message_voice_obj&&(window.message_voice_obj.pause(),window.message_voice_obj=null),this.time&&(clearInterval(this.time),this.playCount=2)}}},u=(i("KGJi"),Object(s.a)(_,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"voice"},[i("div",{staticClass:"box",style:{width:15*t.duration+"px"},on:{click:t.playAudio}},[i("div",{staticClass:"wifi-symbol"},[i("div",{staticClass:"wifi-circle first"}),t._v(" "),i("div",{directives:[{name:"show",rawName:"v-show",value:t.playCount%3>=1,expression:"playCount % 3 >= 1"}],staticClass:"wifi-circle second"}),t._v(" "),i("div",{directives:[{name:"show",rawName:"v-show",value:t.playCount%3>=2,expression:"playCount % 3 >= 2"}],staticClass:"wifi-circle third"})])]),t._v(" "),t._e(),t._v(" "),i("div",{staticClass:"transcoding"},[t.transcoding_loading?t._e():i("a",{staticClass:"text",attrs:{href:t.item.content,target:"_blank"}},[t._v("下载")])])])},[],!1,null,"8a81c194",null));u.options.__file="voice.vue";var v=u.exports,m={props:["item"],data:function(){return{}}},d=(i("AY6Z"),Object(s.a)(m,function(){var t=this,e=t.$createElement,i=t._self._c||e;return t.item.content?i("div",{staticClass:"weapp"},[i("div",{staticClass:"small-title"},[t._v(t._s(t.item.content.displayname))]),t._v(" "),t.item.content.title?i("div",{staticClass:"main-title"},[t._v(t._s(t.item.content.title))]):t._e(),t._v(" "),t.item.content.description?i("div",{staticClass:"desc"},[t._v(t._s(t.item.content.description))]):t._e(),t._v(" "),i("div",{staticClass:"hr"}),t._v(" "),t._m(0)]):t._e()},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"type-name"},[e("i",{staticClass:"iconfont icon-all_smallprogram"}),this._v(" "),e("span",[this._v("小程序")])])}],!1,null,"f9fd665a",null));d.options.__file="weapp.vue";var f=d.exports,p={props:["item"],data:function(){return{}},computed:{fileSize:function(){if(this.item.content&&this.item.content.filesize){var t=this.item.content.filesize,e="k";return(t/=1024)>1024&&(t/=1024,e="M"),(t=t.toFixed(2))+" "+e}return""}}},h=(i("qxX3"),Object(s.a)(p,function(){var t=this,e=t.$createElement,i=t._self._c||e;return t.item.content?i("a",{attrs:{href:t.item.content.file,target:"_blank",download:""}},[i("div",{staticClass:"file"},[t._m(0),t._v(" "),i("div",{staticClass:"content"},[i("div",{staticClass:"title overflow"},[t._v(t._s(t.item.content.filename))]),t._v(" "),i("div",{staticClass:"size"},[t._v(t._s(t.fileSize))])])])]):t._e()},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"icon"},[e("i",{staticClass:"iconfont icon-fontclass-wenzhang"})])}],!1,null,"3c906867",null));h.options.__file="file.vue";var y=h.exports,C={props:["item"],data:function(){return{}}},g=(i("a0Uq"),Object(s.a)(C,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"card"},[t.item.content?i("div",{staticClass:"info"},[i("div",{staticClass:"face"},[i("img",{attrs:{src:t.item.content.avatar,alt:""}})]),t._v(" "),i("div",{staticClass:"content"},[i("div",{staticClass:"name"},[t._v(t._s(t.item.content.name))]),t._v(" "),i("div",{staticClass:"company"},[t._v(t._s(t.item.content.corpname))])])]):t._e(),t._v(" "),t._e()])},[],!1,null,"c2fa7864",null));g.options.__file="card.vue";var w=g.exports,b={props:["item"],data:function(){return{red_type:["","普通红包","拼手气群红包","激励群红包"]}},computed:{from_name:function(){var t="";return this.item.send_user&&this.item.send_user.name&&(t=this.item.send_user.name),t}}},x=(i("rtCZ"),Object(s.a)(b,function(){var t=this,e=t.$createElement,i=t._self._c||e;return t.item.content?i("div",{staticClass:"redpacket"},[i("div",{staticClass:"item"},[t._v("【"+t._s(t.from_name)+"】发送【"+t._s(t.red_type[t.item.content.type])+"】")]),t._v(" "),i("div",{staticClass:"item"},[t._v("红包祝福语："+t._s(t.item.content.wish))]),t._v(" "),i("div",{staticClass:"item"},[t._v("红包总个数："+t._s(t.item.content.totalcnt))])]):t._e()},[],!1,null,"166e602a",null));x.options.__file="redpacket.vue";var k=x.exports,j={props:["item"],data:function(){return{}}},O=(i("uX5P"),Object(s.a)(j,function(){var t=this,e=t.$createElement,i=t._self._c||e;return t.item.content?i("div",{staticClass:"meeting"},[i("div",{staticClass:"item"},[t._v("会议主体："+t._s(t.item.content.topic))]),t._v(" "),i("div",{staticClass:"item"},[t._v("会议时间："+t._s(t.item.content.starttime)+"-"+t._s(t.item.content.endtime))]),t._v(" "),i("div",{staticClass:"item"},[t._v("会议地址："+t._s(t.item.content.address||"无"))]),t._v(" "),i("div",{staticClass:"item"},[t._v("会议备注："+t._s(t.item.content.remarks||"无"))])]):t._e()},[],!1,null,"7093a159",null));O.options.__file="meeting.vue";var E=O.exports,$={props:["item"],data:function(){return{}}},A=(i("DDfB"),Object(s.a)($,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"calendar"},[i("div",{staticClass:"item"},[t._v(t._s(t.item.content.title))]),t._v(" "),i("div",{staticClass:"item"},[t._v(t._s(t.item.content.starttime)+"-"+t._s(t.item.content.endtime))]),t._v(" "),i("div",{staticClass:"item"},[t._v("组织者："+t._s(t.item.content.creatorname))]),t._v(" "),i("div",{staticClass:"item"},[t._v("参与者："+t._s(t.item.content.attendeename.join(",")))]),t._v(" "),i("div",{staticClass:"item"},[t._v("地点："+t._s(t.item.content.place||"无"))]),t._v(" "),i("div",{staticClass:"item"},[t._v("备注："+t._s(t.item.content.remarks||"无"))])])},[],!1,null,"ecc3ec00",null));A.options.__file="calendar.vue";var S=A.exports,J={props:["item"],data:function(){return{}}},P=(i("ARp1"),Object(s.a)(J,function(){var t=this,e=t.$createElement,i=t._self._c||e;return t.item.content&&t.item.content.link_url?i("a",{attrs:{href:t.item.content.link_url,target:"_blank"}},[i("div",{staticClass:"docmsg"},[i("div",{staticClass:"content"},[i("div",{staticClass:"name overflow"},[t._v(t._s(t.item.content.title))]),t._v(" "),i("div",{staticClass:"author"},[t._v(t._s(t.item.content.doc_creator))])]),t._v(" "),t._m(0)])]):t._e()},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"icon"},[e("i",{staticClass:"iconfont icon-fontclass-jilu31"})])}],!1,null,"33b8faae",null));P.options.__file="docmsg.vue";var M=P.exports,V={props:["item"],data:function(){return{}}},L=(i("0oOj"),Object(s.a)(V,function(){var t=this.$createElement;return(this._self._c||t)("video",{staticClass:"video",attrs:{controls:"controls",src:this.item.content}})},[],!1,null,"2fa17cbb",null));L.options.__file="video.vue";var q=L.exports,z={data:function(){return{}}},U=(i("+NPD"),Object(s.a)(z,function(){var t=this.$createElement;return(this._self._c||t)("div",{staticClass:"revoke"},[this._v("\n  撤回了一条消息\n")])},[],!1,null,"69857336",null));U.options.__file="revoke.vue";var D=U.exports,N={props:["item"],data:function(){return{}}},F=(i("LWJm"),Object(s.a)(N,function(){var t=this,e=t.$createElement,i=t._self._c||e;return t.item.content?i("a",{attrs:{href:t.item.content.link_url,target:"_blank"}},[i("div",{staticClass:"news"},[i("div",{staticClass:"title"},[t._v("\n        "+t._s(t.item.content.title)+"\n      ")]),t._v(" "),i("div",{staticClass:"content"},[i("div",{staticClass:"source overflow"},[t._v(t._s(t.item.content.description))]),t._v(" "),i("div",{staticClass:"image"},[i("img",{attrs:{src:t.item.content.image_url,alt:""}})])])])]):t._e()},[],!1,null,"58c0778c",null));F.options.__file="link.vue";var R=F.exports,Z={props:["item"],data:function(){return{}}},I=(i("soE4"),Object(s.a)(Z,function(){var t=this.$createElement;return(this._self._c||t)("img",{staticClass:"emotion",attrs:{src:this.item.content,alt:""}})},[],!1,null,"b4157f98",null));I.options.__file="emotion.vue";var K=I.exports,Q={props:["item"],components:{type_text:o,type_image:l,type_file:y,type_card:w,type_meeting:E,type_calendar:S,type_docmsg:M,type_video:q,type_link:R,type_emotion:K},data:function(){return{msg_type:["type_text","type_image","type_file","type_card","type_meeting","type_calendar","type_docmsg","type_video","type_link","type_emotion"],content:[]}},created:function(){var t=this.item.content;t.map(function(t){t.msg_components="type_"+t.type}),this.content=t,console.log(this.content)}},Y=(i("qluH"),Object(s.a)(Q,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"mixed"},[t._l(t.content,function(e,n){return[t.msg_type.indexOf(e.msg_components)>=0?i("div",{key:n,staticClass:"mixed-item"},[i(e.msg_components,{tag:"component",attrs:{item:e}})],1):t._e()]})],2)},[],!1,null,"b3a3e7f8",null));Y.options.__file="mixed.vue";var B=Y.exports,H={props:["item"],data:function(){return{}},created:function(){setTimeout(function(){},2e3)},mounted:function(){var t=this.item.content,e=t.longitude,i=t.latitude;console.log(e,i);var n=new AMap.Map(this.$refs.workSessionMap,{resizeEnable:!0,zoom:11,center:[e,i]}),s=new AMap.Circle({center:new AMap.LngLat(e,i),radius:1e3,strokeColor:"#F33",strokeOpacity:1,strokeWeight:3,fillColor:"#ee2200",fillOpacity:.35});n.add(s),console.log(n)}},W=(i("aWhl"),Object(s.a)(H,function(){var t=this,e=t.$createElement,i=t._self._c||e;return t.item.content?i("div",{staticClass:"location"},[i("div",{staticClass:"title"},[t._v("\n    "+t._s(t.item.content.title)+"-"+t._s(t.item.content.address)+"\n  ")]),t._v(" "),i("div",{ref:"workSessionMap",staticClass:"map"})]):t._e()},[],!1,null,"c18184cc",null));W.options.__file="location.vue";var T=W.exports,X={props:["item"],data:function(){return{}},computed:{},methods:{}},G=(i("x0ke"),Object(s.a)(X,function(){var t=this,e=t.$createElement,i=t._self._c||e;return t.item.content?i("div",{staticClass:"meeting_voice_call"},[i("div",{staticClass:"item"},[t._v("音频存档消息")]),t._v(" "),t.item.content&&t.item.content.file?i("div",{staticClass:"item"},[i("a",{attrs:{href:t.item.content.file,target:"_blank"}},[t._v("下载")])]):t._e()]):t._e()},[],!1,null,"bc8714ee",null));G.options.__file="meeting_voice_call.vue";var tt=G.exports,et={props:["item"],data:function(){return{}},computed:{},methods:{}},it=(i("qoPS"),Object(s.a)(et,function(){var t=this,e=t.$createElement,i=t._self._c||e;return t.item.content?i("div",{staticClass:"voip_doc_share"},[i("div",{staticClass:"item"},[t._v("音频共享文档消息")]),t._v(" "),t.item.content&&t.item.content.file?i("div",{staticClass:"item"},[i("a",{attrs:{href:t.item.content.file,target:"_blank"}},[t._v(t._s(t.item.content.filename))])]):t._e()]):t._e()},[],!1,null,"2cf53515",null));it.options.__file="voip_doc_share.vue";var nt=it.exports,st={props:["item"],data:function(){return{feed_type:{2:"图片",4:"视频",9:"直播"}}}},at=(i("Ueul"),Object(s.a)(st,function(){var t=this,e=t.$createElement,i=t._self._c||e;return t.item.content?i("div",{staticClass:"sphfeed"},[i("div",{staticClass:"item"},[t._v("视频号")]),t._v(" "),i("div",{staticClass:"item"},[t._v("视频号账号名称："+t._s(t.item.content.sph_name))]),t._v(" "),i("div",{staticClass:"item"},[t._v("消息类型："+t._s(t.feed_type[t.item.content.feed_type]))]),t._v(" "),i("div",{staticClass:"item"},[t._v("消息描述："+t._s(t.item.content.feed_desc))])]):t._e()},[],!1,null,"fa79d696",null));at.options.__file="sphfeed.vue";var ot={props:["item","staff_user_id"],components:{type_text:o,type_image:l,type_voice:v,type_weapp:f,type_file:y,type_card:w,type_redpacket:k,type_external_redpacket:k,type_meeting:E,type_calendar:S,type_docmsg:M,type_video:q,type_revoke:D,type_link:R,type_mixed:B,type_emotion:K,type_location:T,type_meeting_voice_call:tt,type_voip_doc_share:nt,type_sphfeed:at.exports},data:function(){return{msg_type:["text","image","voice","weapp","file","card","redpacket","external_redpacket","meeting","calendar","docmsg","video","revoke","link","mixed","emotion","location","meeting_voice_call","voip_doc_share","phfeed"],obj:{}}},created:function(){var t=this.item;t.msg_components="type_"+t.msg_type,this.obj=t}},ct=(i("Yqil"),Object(s.a)(ot,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"messge-item-container"},[t.obj.send_user?i("div",{staticClass:"face"},[t.obj.send_user.avatar?i("img",{attrs:{src:t.obj.send_user.avatar,alt:""}}):t._e()]):t._e(),t._v(" "),i("div",{staticClass:"content-wrapper"},[i("div",{staticClass:"member"},[t.obj.send_user&&t.obj.send_user.name?i("div",{staticClass:"name",class:{from:t.staff_user_id==t.obj.from}},[t._v(t._s(t.obj.send_user.name))]):t._e(),t._v(" "),i("div",{staticClass:"time"},[t._v(t._s(t.item.msg_time))])]),t._v(" "),t.msg_type.indexOf(t.item.msg_type)>=0?i("div",{staticClass:"content"},[i(t.obj.msg_components,{tag:"component",attrs:{item:t.obj}}),t._v(" "),1==t.obj.revoke?i("div",{staticClass:"Withdrawn"},[t._v("已撤回")]):t._e()],1):t._e()])])},[],!1,null,"f7d2fb38",null));ct.options.__file="message_wrapper.vue";e.a=ct.exports},qluH:function(t,e,i){"use strict";var n=i("wJ1s");i.n(n).a},qoPS:function(t,e,i){"use strict";var n=i("V931");i.n(n).a},qxX3:function(t,e,i){"use strict";var n=i("NQcK");i.n(n).a},rtCZ:function(t,e,i){"use strict";var n=i("wFZw");i.n(n).a},"rtn/":function(t,e,i){"use strict";var n=i("+7V1");i.n(n).a},soE4:function(t,e,i){"use strict";var n=i("R37U");i.n(n).a},uX5P:function(t,e,i){"use strict";var n=i("6yxo");i.n(n).a},wFZw:function(t,e,i){},wJ1s:function(t,e,i){},x0ke:function(t,e,i){"use strict";var n=i("0H4B");i.n(n).a}}]);