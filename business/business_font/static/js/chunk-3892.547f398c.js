(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-3892"],{RKTU:function(e,t,s){"use strict";s.r(t);var r=s("bS4n"),_=s.n(r),o=s("glbJ"),a=s("2gMQ"),i={data:function(){return{order_type:"1",chat_opt_setting_arr:[],words_reply_closed_time:"",receive_sms_period:"",words_reply_closed_weekday_arr:[],form:{greeting:"",unread_msg_tmp:"",unread_msg_notice_work_wechat:"",unread_msg_notice_sms_tmp:"",chat_opt_setting:[],receive_sms_start_period:"",receive_sms_end_period:"",words_reply_status:"",words_reply_closed_weekday:[],words_reply_closed_start_time:"",words_reply_closed_end_time:""},temp_list:[],rules:{}}},components:{Tinymce:o.a,yun_service_side:a.a},created:function(){},mounted:function(){this.getData()},methods:{getData:function(){var e=this;$http.pc_post("plugin/YunChat/setBasic",{},"loading").then(function(t){t.result?(e.form=_()({},t.data),e.form.receive_sms_start_period&&e.form.receive_sms_end_period&&(e.receive_sms_period=[new Date(e.form.receive_sms_start_period),new Date(e.form.receive_sms_end_period)]),e.form.words_reply_closed_start_time&&e.form.words_reply_closed_end_time&&(e.words_reply_closed_time=[new Date(e.form.words_reply_closed_start_time),new Date(e.form.words_reply_closed_end_time)]),e.chat_opt_setting_arr=e.form.chat_opt_setting||[],e.words_reply_closed_weekday_arr=e.form.words_reply_closed_weekday||[],e.temp_list=t.data.temp_list):e.$message({message:t.msg,type:"error"})},function(t){e.$message({message:t.msg,type:"error"})})},submitForm:function(e){var t=this;console.log(this.form);this.receive_sms_period?2==this.receive_sms_period.length?(this.form.receive_sms_start_period=this.receive_sms_period[0],this.form.receive_sms_end_period=this.receive_sms_period[1]):this.$message({message:"接收短信时间范围错误",type:"error"}):(this.form.receive_sms_start_period="",this.form.receive_sms_end_period=""),this.words_reply_closed_time?2==this.words_reply_closed_time.length?(this.form.words_reply_closed_start_time=this.words_reply_closed_time[0],this.form.words_reply_closed_end_time=this.words_reply_closed_time[1]):this.$message({message:"关键词回复关闭时间段时间范围错误",type:"error"}):(this.form.words_reply_closed_start_time="",this.form.words_reply_closed_end_time="");var s={greeting:this.form.greeting,yunqian_app_id:this.form.yunqian_app_id,yunqian_app_secret:this.form.yunqian_app_secret,unread_msg_tmp:this.form.unread_msg_tmp,unread_msg_notice_work_wechat:this.form.unread_msg_notice_work_wechat,unread_msg_notice_sms_tmp:this.form.unread_msg_notice_sms_tmp,chat_opt_setting:this.chat_opt_setting_arr||[],receive_sms_start_period:this.form.receive_sms_start_period,receive_sms_end_period:this.form.receive_sms_end_period,words_reply_status:this.form.words_reply_status,words_reply_closed_weekday:this.words_reply_closed_weekday_arr||[],words_reply_closed_start_time:this.form.words_reply_closed_start_time,words_reply_closed_end_time:this.form.words_reply_closed_end_time};this.$refs[e].validate(function(e){if(!e)return console.log("error submit!!"),!1;$http.pc_post("plugin/YunChat/setBasicPost",s,"loading").then(function(e){e.result?t.$message({type:"success",message:"操作成功!"}):t.$message({message:e.msg,type:"error"})},function(e){})})},goBack:function(){history.go(-1)},gotoOther:function(e){1==e||2==e&&this.$router.push(this.fun.getUrl("serviceWordsReplyList"))}}},l=(s("thZ+"),s("ZrdR")),c=Object(l.a)(i,function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"all"},[s("yun_service_side",{attrs:{defaultActive:"serviceBasic"}}),e._v(" "),s("div",{attrs:{id:"app"}},[s("el-form",{ref:"form",attrs:{model:e.form,rules:e.rules,"label-width":"15%"}},[s("div",{staticClass:"vue-head"},[s("el-radio-group",{model:{value:e.order_type,callback:function(t){e.order_type=t},expression:"order_type"}},[s("el-radio-button",{attrs:{label:"1"},nativeOn:{click:function(t){e.gotoOther(1)}}},[e._v("基础设置")]),e._v(" "),s("el-radio-button",{attrs:{label:"2"},nativeOn:{click:function(t){e.gotoOther(2)}}},[e._v("关键词回复")])],1)],1),e._v(" "),s("div",{staticClass:"vue-head"},[s("div",{staticClass:"vue-main-title"},[s("div",{staticClass:"vue-main-title-left"}),e._v(" "),s("div",{staticClass:"vue-main-title-content"},[e._v("基础设置")])]),e._v(" "),s("div",{staticClass:"vue-main-form"},[s("el-form-item",{attrs:{label:"欢迎语",prop:"greeting"}},[s("tinymce",{model:{value:e.form.greeting,callback:function(t){e.$set(e.form,"greeting",t)},expression:"form.greeting"}}),e._v(" "),s("div",{staticClass:"sub-title"},[e._v("用户打开客服页面，向客户发送欢迎语，一小时内多次打开客服页面，只发送一次。")])],1)],1),e._v(" "),s("div",{staticClass:"vue-main-form"},[s("el-form-item",{attrs:{label:"聊天设置",prop:"chat_opt_setting"}},[s("el-checkbox-group",{model:{value:e.chat_opt_setting_arr,callback:function(t){e.chat_opt_setting_arr=t},expression:"chat_opt_setting_arr"}},[s("el-checkbox",{attrs:{label:"1"}},[e._v("图片")]),e._v(" "),s("el-checkbox",{attrs:{label:"2"}},[e._v("商品")]),e._v(" "),s("el-checkbox",{attrs:{label:"3"}},[e._v("订单")]),e._v(" "),s("el-checkbox",{attrs:{label:"4"}},[e._v("转接客服")]),e._v(" "),s("el-checkbox",{attrs:{label:"5"}},[e._v("快捷回复")])],1)],1)],1)]),e._v(" "),s("div",{staticClass:"vue-head",staticStyle:{"margin-top":"20px"}},[s("div",{staticClass:"vue-main-title"},[s("div",{staticClass:"vue-main-title-left"}),e._v(" "),s("div",{staticClass:"vue-main-title-content"},[e._v("客服不在线时新消息通知设置")])]),e._v(" "),s("div",{staticClass:"vue-main-form"},[s("el-form-item",{attrs:{label:"客服新消息提醒",prop:"store_pay"}},[s("el-select",{staticStyle:{width:"70%"},attrs:{filterable:"",clearable:"",placeholder:"请选择消息模板"},model:{value:e.form.unread_msg_tmp,callback:function(t){e.$set(e.form,"unread_msg_tmp",t)},expression:"form.unread_msg_tmp"}},[s("el-option",{attrs:{label:"不通知",value:""}}),e._v(" "),e._l(e.temp_list,function(e,t){return s("el-option",{key:t,attrs:{label:e.title,value:e.id}})})],2),e._v(" "),s("div",{staticClass:"sub-title"},[e._v("用户向同一位客服咨询，客服不在线时，每5分钟只通知一次")])],1),e._v(" "),s("el-form-item",{attrs:{label:"企业微信通知",prop:"unread_msg_notice_work_wechat"}},[s("el-switch",{attrs:{"active-value":1,"inactive-value":0},model:{value:e.form.unread_msg_notice_work_wechat,callback:function(t){e.$set(e.form,"unread_msg_notice_work_wechat",t)},expression:"form.unread_msg_notice_work_wechat"}}),e._v(" "),s("div",{staticClass:"sub-title"},[e._v("需要配置企业微信信息，开启后，客服要有对应的企业微信号才能收到通知。用户向同一位客服咨询，客服不在线时，每5分钟只通知一次")])],1),e._v(" "),s("el-form-item",{attrs:{label:"短信通知模版",prop:"unread_msg_notice_sms_tmp"}},[s("el-input",{ref:"unread_msg_notice_sms_tmp",staticStyle:{width:"70%"},model:{value:e.form.unread_msg_notice_sms_tmp,callback:function(t){e.$set(e.form,"unread_msg_notice_sms_tmp",t)},expression:"form.unread_msg_notice_sms_tmp"}}),e._v(" "),s("div",{staticClass:"sub-title"},[e._v("填写短信通知模版后，用户向同一位客服咨询，客服不在线时，每5分钟只通知一次")])],1),e._v(" "),s("el-form-item",{attrs:{label:"接收短信时间"}},[s("el-time-picker",{attrs:{"is-range":"","range-separator":"至","start-placeholder":"开始时间","end-placeholder":"结束时间"},model:{value:e.receive_sms_period,callback:function(t){e.receive_sms_period=t},expression:"receive_sms_period"}}),e._v(" "),s("div",{staticClass:"sub-title"},[e._v("只在接收时间范围内，才发送短息消息")])],1),e._v(" "),s("el-form-item",{attrs:{label:"关键词自动回复",prop:"words_reply_status"}},[s("el-switch",{attrs:{"active-value":1,"inactive-value":0},model:{value:e.form.words_reply_status,callback:function(t){e.$set(e.form,"words_reply_status",t)},expression:"form.words_reply_status"}})],1),e._v(" "),s("el-form-item",{attrs:{label:"关键词回复关闭时间段",prop:"words_reply_closed_weekday_arr"}},[s("el-checkbox-group",{model:{value:e.words_reply_closed_weekday_arr,callback:function(t){e.words_reply_closed_weekday_arr=t},expression:"words_reply_closed_weekday_arr"}},[s("el-checkbox",{attrs:{label:"1"}},[e._v("星期一")]),e._v(" "),s("el-checkbox",{attrs:{label:"2"}},[e._v("星期二")]),e._v(" "),s("el-checkbox",{attrs:{label:"3"}},[e._v("星期三")]),e._v(" "),s("el-checkbox",{attrs:{label:"4"}},[e._v("星期四")]),e._v(" "),s("el-checkbox",{attrs:{label:"5"}},[e._v("星期五")]),e._v(" "),s("el-checkbox",{attrs:{label:"6"}},[e._v("星期六")]),e._v(" "),s("el-checkbox",{attrs:{label:"0"}},[e._v("星期七")])],1),e._v(" "),s("el-time-picker",{attrs:{"is-range":"","range-separator":"至","start-placeholder":"开始时间","end-placeholder":"结束时间"},model:{value:e.words_reply_closed_time,callback:function(t){e.words_reply_closed_time=t},expression:"words_reply_closed_time"}})],1)],1)])]),e._v(" "),s("div",{staticClass:"vue-page"},[s("div",{staticClass:"vue-center"},[s("el-button",{attrs:{type:"primary"},on:{click:function(t){e.submitForm("form")}}},[e._v("提交")]),e._v(" "),s("el-button",{on:{click:e.goBack}},[e._v("返回")])],1)])],1)],1)},[],!1,null,"dafd41ec",null);c.options.__file="chat_basicIndex.vue";t.default=c.exports},"thZ+":function(e,t,s){"use strict";var r=s("woNP");s.n(r).a},woNP:function(e,t,s){}}]);