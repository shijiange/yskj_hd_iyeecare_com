(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-9209"],{L147:function(s,t,e){"use strict";var i=e("wB55");e.n(i).a},YiCG:function(s,t,e){"use strict";e.r(t);var i=e("gDS+"),a=e.n(i),n=e("JiwJ"),r=e("pZTO"),o=[],c=[],_=[],l=void 0,g=void 0,h={components:{work_session_side:n.a,message_wrapper:r.a},data:function(){return{msg_type:[{type:"all",text:"全部"},{type:"text",text:"文本"},{type:"image",text:"图片"},{type:"voice",text:"语音"},{type:"video",text:"视频"},{type:"file",text:"文件"},{type:"weapp",text:"小程序"},{type:"other",text:"其他"}],msg_type_active:"all",search_staff_text:"",search_session_text:"",search_message_text:"",search_message_time:"",is_inside:1,chat_type:0,staff_list:[],staff_user_id:0,session_list:[],session_user_id:0,group_list:[],group_room_id:0,message_list:[],cacheOjb:{},page:1,pageLoading:!1,pageNoMore:!1,intersectionObserver:null}},created:function(){this.getStaffList()},methods:{initPage:function(){this.page=1,this.pageLoading=!1,this.pageNoMore=!1},handSearchMessage:function(){l=this.search_message_text,g=this.search_message_time,this.getMessageList()},resetSearch:function(){this.search_message_text="",this.search_message_time="",l="",g=""},getMessageList:function(){var s,t=this,e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:1,i={},a="plugin/WorkSession/getPrivateChatMsg";if(0==this.chat_type){if(!this.staff_user_id||!this.session_user_id)return;i={staff_id:this.staff_user_id,othre_user_id:this.session_user_id}}else if(1==this.chat_type){if(!this.group_room_id)return;a="plugin/WorkSession/getChatMsg",i={room_id:this.group_room_id}}1==e&&this.initPage(),this.pageLoading=!0,i.page=e,i.search={},"all"!=this.msg_type_active&&(i.search.msg_type=this.msg_type_active),""!=l&&(i.search.msg_keyword=l),g&&2==g.length&&(i.start=g[0].getTime(),i.end=g[1].getTime());var n=[];n[0]=a,n[1]=i,1==e&&(n[2]="loading"),(s=$http).pc_post.apply(s,n).then(function(s){1===s.result&&t.setMessageList(s.data.message_list)})},getSessionList:function(){var s=this;$http.pc_get("plugin/WorkSession/switchStaff",{staff_id:this.staff_user_id,is_inside:this.is_inside,chat_type:this.chat_type},"loading").then(function(t){if(1===t.result){var e=t.data.chat;e&&Array.isArray(e)&&0==s.chat_type?(s.session_list=e,c=JSON.parse(a()(e)),s.session_user_id=e[0]?e[0].user_id:0):e&&Array.isArray(e)&&1==s.chat_type&&(s.group_list=e,_=JSON.parse(a()(e)),s.group_room_id=e[0]?e[0].room_id:0),s.msg_type_active="all",s.setMessageList(t.data.message_list)}})},getStaffList:function(){var s=this;$http.pc_get("plugin/WorkSession/getList",{},"loading").then(function(t){if(1===t.result){s.staff_list=t.data.staff,s.staff_list&&s.staff_list.length&&(o=JSON.parse(a()(s.staff_list)),s.staff_user_id=s.staff_list[0].user_id);var e=t.data.private_chat;e&&Array.isArray(e)&&0==s.chat_type?(s.session_list=e,c=JSON.parse(a()(e)),s.session_user_id=e[0]?e[0].user_id:0):e&&Array.isArray(e)&&1==s.chat_type&&(s.group_list=e,_=JSON.parse(a()(e)),s.group_room_id=e[0]?e[0].user_id:0),s.msg_type_active="all",s.setMessageList(t.data.message_list)}else t.msg&&s.$message.error(t.msg)}).catch(function(s){console.error(s)})},setMessageList:function(s){var t=this;1==s.current_page&&this.initPage();var e=s.data||[];if(this.pageLoading=!1,this.page>=s.last_page&&(this.pageNoMore=!0),!e||0==e.length)return this.pageNoMore=!0,void(1==s.current_page&&(this.message_list=[]));e.unshift({type:"seat"}),this.message_list=1==s.current_page?e:e.concat(this.message_list),1!=s.current_page?this.$nextTick(function(){t.$refs.message_list_seat[1].scrollIntoView(!0),t.$refs.message_list.scrollTop=t.$refs.message_list.scrollTop-34}):this.setScrollBottom(),this.page=Number(s.current_page)+1},setScrollBottom:function(){var s=this;setTimeout(function(){s.$nextTick(function(){s.$refs.message_list_end.scrollIntoView(!1),s.intersectionObserver&&(s.intersectionObserver.unobserve(s.$refs.message_list_start),s.intersectionObserver.disconnect(),s.intersectionObserver=null),s.intersectionObserver=new IntersectionObserver(s.touchTop),s.intersectionObserver.observe(s.$refs.message_list_start)})},150)},touchTop:function(s){var t=s[0];this.pageLoading||this.pageNoMore||1!=t.intersectionRatio||this.getMessageList(this.page)},handSetMsgType:function(s){this.msg_type_active!=s&&(this.msg_type_active=s,this.getMessageList())},setChatType:function(s){this.chat_type!=s&&(this.chat_type=s,this.getSessionList())},setIsInside:function(s){this.is_inside!=s&&(this.is_inside=s,this.getSessionList())},setStaffUserId:function(s){this.staff_user_id!=s&&(this.staff_user_id=s,this.getSessionList())},setSessionUserId:function(s){this.session_user_id!=s&&(this.session_user_id=s,this.getMessageList())},setGroupUserId:function(s){this.group_room_id!=s&&(this.group_room_id=s,this.getMessageList())},confirmSearchStaffList:function(s){var t=[];JSON.parse(a()(o)).forEach(function(e){e.name.indexOf(s)>=0&&t.push(e)}),this.staff_list=t},confirmSearchSession:function(s){if(0==this.chat_type){var t=[];JSON.parse(a()(c)).forEach(function(e){e.name.indexOf(s)>=0&&t.push(e)}),this.session_list=t}else if(1==this.chat_type){var e=[];JSON.parse(a()(_)).forEach(function(t){t.room_name.indexOf(s)>=0&&e.push(t)}),this.group_list=e}}}},d=(e("L147"),e("KHd+")),p=Object(d.a)(h,function(){var s=this,t=s.$createElement,e=s._self._c||t;return e("div",{staticClass:"workSession"},[e("work_session_side",{attrs:{defaultActive:"2"}}),s._v(" "),e("div",{staticClass:"workSession-wrapper"},[e("div",{staticClass:"workSession-container"},[e("div",{staticClass:"member-list"},[e("div",{staticClass:"member-list-title"},[s._v("成员列表")]),s._v(" "),e("div",{staticClass:"search-input"},[e("el-input",{attrs:{placeholder:"请输入内容","prefix-icon":"el-icon-search"},on:{change:s.confirmSearchStaffList},model:{value:s.search_staff_text,callback:function(t){s.search_staff_text=t},expression:"search_staff_text"}})],1),s._v(" "),e("div",{staticClass:"list-container"},[s._l(s.staff_list,function(t){return e("div",{key:t.user_id,staticClass:"list-item-bg",class:{active:t.user_id==s.staff_user_id}},[e("div",{staticClass:"list-item",on:{click:function(e){s.setStaffUserId(t.user_id)}}},[e("div",{staticClass:"face"},[e("img",{attrs:{src:t.avatar,alt:""}})]),s._v(" "),e("div",{staticClass:"list-content"},[e("div",{staticClass:"list-item-title"},[s._v(s._s(t.name))]),s._v(" "),e("div",{staticClass:"list-item-desc"},[s._v(s._s(t.lately_msg))])])])])}),s._v(" "),0==s.staff_list.length?e("div",{staticClass:"noMore"}):s._e()],2)]),s._v(" "),e("div",{staticClass:"session-main"},[e("div",{staticClass:"group-tabs"},[e("div",{staticClass:"group-tab",class:{active:0==s.chat_type},on:{click:function(t){s.setChatType(0)}}},[s._v("\n            私聊信息\n          ")]),s._v(" "),e("div",{staticClass:"group-tab",class:{active:1==s.chat_type},staticStyle:{"margin-left":"5px"},on:{click:function(t){s.setChatType(1)}}},[s._v("\n            群聊信息\n          ")])]),s._v(" "),e("div",{staticClass:"session-container"},[e("div",{staticClass:"session-list"},[e("div",{staticClass:"session-tabs"},[e("div",{staticClass:"session-tab",class:{active:1==s.is_inside},on:{click:function(t){s.setIsInside(1)}}},[s._v("\n                员工\n              ")]),s._v(" "),e("div",{staticClass:"session-tab",class:{active:0==s.is_inside},on:{click:function(t){s.setIsInside(0)}}},[s._v("\n                客户\n              ")])]),s._v(" "),e("div",{staticClass:"search-input"},[e("el-input",{attrs:{placeholder:"请输入内容","prefix-icon":"el-icon-search"},on:{change:s.confirmSearchSession},model:{value:s.search_session_text,callback:function(t){s.search_session_text=t},expression:"search_session_text"}})],1),s._v(" "),e("div",{staticClass:"list-container"},[0==s.chat_type?[s._l(s.session_list,function(t){return e("div",{key:t.user_id,staticClass:"list-item",class:{active:t.user_id==s.session_user_id},on:{click:function(e){s.setSessionUserId(t.user_id)}}},[e("div",{staticClass:"face"},[e("img",{attrs:{src:t.avatar,alt:""}})]),s._v(" "),e("div",{staticClass:"list-item-title overflow"},[s._v(s._s(t.name))])])}),s._v(" "),0==s.session_list.length?e("div",{staticClass:"noMore"},[s._v("\n                  暂无消息\n                ")]):s._e()]:s._e(),s._v(" "),1==s.chat_type?[s._l(s.group_list,function(t){return e("div",{key:t.room_id,staticClass:"list-item",class:{active:t.room_id==s.group_room_id},on:{click:function(e){s.setGroupUserId(t.room_id)}}},[e("div",{staticClass:"list-item-title overflow"},[s._v("\n                    "+s._s(t.room_name||t.room_id)+"\n                  ")])])}),s._v(" "),0==s.group_list.length?e("div",{staticClass:"noMore"},[s._v("\n                  暂无消息\n                ")]):s._e()]:s._e()],2)]),s._v(" "),e("div",{staticClass:"message-container"},[e("div",{staticClass:"message-tabs"},s._l(s.msg_type,function(t,i){return e("div",{key:i,staticClass:"message-tab",class:{active:s.msg_type_active==t.type},on:{click:function(e){s.handSetMsgType(t.type)}}},[s._v("\n                "+s._s(t.text)+"\n              ")])})),s._v(" "),e("div",{staticClass:"message-search"},[e("div",{staticClass:"search-input"},[e("el-input",{attrs:{placeholder:"请输入搜索内容"},model:{value:s.search_message_text,callback:function(t){s.search_message_text=t},expression:"search_message_text"}})],1),s._v(" "),e("div",{staticClass:"search-datetime"},[e("el-date-picker",{attrs:{type:"datetimerange","range-separator":"至","start-placeholder":"开始日期","end-placeholder":"结束日期"},model:{value:s.search_message_time,callback:function(t){s.search_message_time=t},expression:"search_message_time"}})],1),s._v(" "),e("el-button",{attrs:{type:"primary"},on:{click:s.handSearchMessage}},[s._v("搜索")]),s._v(" "),e("el-button",{attrs:{type:"info"},on:{click:s.resetSearch}},[s._v("清空")])],1),s._v(" "),e("div",{ref:"message_list",staticClass:"message-list",attrs:{id:"message-list"}},[e("div",{staticClass:"more"},[s.pageNoMore&&!s.pageLoading?e("div",{staticClass:"noMore"},[s._v("\n                  没有更多了\n                ")]):s._e(),s._v(" "),!s.pageLoading&&!s.pageNoMore&&s.message_list.length>0?e("div",{staticClass:"addMore",on:{click:function(t){s.getMessageList(s.page)}}},[s._v("\n                  加载更多\n                ")]):s._e(),s._v(" "),s.pageLoading&&!s.pageNoMore?e("div",{staticClass:"noMore"},[e("i",{staticClass:"el-icon-loading"}),s._v(" 加载中...\n                ")]):s._e()]),s._v(" "),e("div",{ref:"message_list_start",staticStyle:{height:"1px"}}),s._v(" "),s._l(s.message_list,function(t,i){return["seat"!=t.type?e("div",{key:t.msg_id,staticClass:"message-item"},[e("message_wrapper",{attrs:{item:t,staff_user_id:s.staff_user_id}})],1):e("div",{key:i,ref:"message_list_seat",refInFor:!0,staticStyle:{height:"1px"}})]}),s._v(" "),e("div",{ref:"message_list_end",staticStyle:{height:"1px"}})],2)])])])])])],1)},[],!1,null,"8237b63e",null);p.options.__file="index.vue";t.default=p.exports},wB55:function(s,t,e){}}]);