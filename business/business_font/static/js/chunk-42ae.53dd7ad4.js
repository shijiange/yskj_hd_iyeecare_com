(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-42ae"],{"/gjq":function(t,e,a){"use strict";var s=a("qhdJ");a.n(s).a},"57Ib":function(t,e,a){},U6oN:function(t,e,a){"use strict";var s={props:{side_card_name:{type:String,default:""}},components:{},data:function(){return{active_status:0}},created:function(){},methods:{changeActive:function(){console.log(123),this.active_status=1}}},i=(a("/gjq"),a("KHd+")),n=Object(i.a)(s,function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"side_card"},[e("div",{staticClass:"side-fixed"},[e("div",{class:1==this.active_status?"side-fixed-title side-fixed-title-active":"side-fixed-title",on:{click:this.changeActive}},[this._v(this._s(this.side_card_name))])])])},[],!1,null,"27d8649c",null);n.options.__file="side_card.vue";e.a=n.exports},fXyV:function(t,e,a){"use strict";var s=a("57Ib");a.n(s).a},qhdJ:function(t,e,a){},x5lF:function(t,e,a){"use strict";a.r(e);var s=a("14Xm"),i=a.n(s),n=a("QbLZ"),l=a.n(n),c=a("D3Ub"),r=a.n(c),o={components:{side_card:a("U6oN").a},data:function(){return{search:{activity:"",group_name:"",status:""},side_card_name:"活动管理",active_state_list:[{name:"全部",value:4},{name:"已结束",value:3},{name:"进行中",value:2},{name:"未开始",value:1}],acitve_select:4,group_list:[],dialogVisible:!1,dialogManualEnd:!1,group_chat:null,times:"",balance:"",coupon:"",point:"",current_page:1,total:1,per_page:1,manual_end_id:""}},mounted:function(){this.getActivityList(1)},methods:{selcteStatus:function(t){this.acitve_select=t,this.search.status=t,this.getActivityList(1)},checkout:function(t){this.group_chat=t,this.dialogVisible=!0},btnEdit:function(t){t?this.$router.push(this.fun.getUrl("groupDeitor",{},{id:t})):this.$router.push(this.fun.getUrl("groupDeitor"))},checkDetail:function(t){this.$router.push(this.fun.getUrl("groupRecord",{},{id:t}))},getActivityList:function(t){var e=this;return r()(i.a.mark(function a(){var s;return i.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/GroupReward/getActivityList",{page:t,search:l()({},e.search,{status:4==e.search.status?"":e.search.status,begin_time:e.times?e.times[0]:"",end_time:e.times?e.times[1]:""})});case 2:1==(s=a.sent).result?(e.group_list=s.data.data,e.balance=s.data.balance,e.coupon=s.data.coupon,e.point=s.data.point,e.total=s.data.total,e.per_page=s.data.per_page,e.current_page=s.data.current_page):e.$message.error(s.msg);case 4:case"end":return a.stop()}},a,e)}))()},searchs:function(t){this.getActivityList(t),this.acitve_select=this.search.status?this.search.status:4},btnManualEnd:function(t){this.dialogManualEnd=!0,this.manual_end_id=t},manualEnd:function(){var t=this;return r()(i.a.mark(function e(){var a;return i.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,$http.pc_post("plugin/GroupReward/setActivityStatus",{id:t.manual_end_id});case 2:1==(a=e.sent).result?(t.$message.success(a.msg),location.reload()):t.$message.error(a.msg),t.dialogManualEnd=!1;case 5:case"end":return e.stop()}},e,t)}))()},export1:function(){var t=this.fun.getRealPCUrl("plugin/GroupReward/rewardExport")+"&export_type=activity&search[status]="+(4==this.search.status?"":this.search.status)+"&search[begin_time]="+(this.times?this.times[0]:"")+"\n      &search[end_time]="+(this.times?this.times[1]:"")+"&search[activity]="+(this.search.activity?this.search.activity:"")+"&search[group_name]="+(this.search.group_name?this.search.group_name:"");this.download(t,"")},download:function(t,e){var a=document.createElement("a");a.download=e,a.href=t,a.click(),a.remove()}}},u=(a("fXyV"),a("KHd+")),d=Object(u.a)(o,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"all group-box"},[a("div",{staticClass:"ground-side-card"},[a("side_card",{attrs:{side_card_name:t.side_card_name}})],1),t._v(" "),a("div",{staticClass:"group-box-content",attrs:{id:"app"}},[a("div",{staticClass:"title-tag"},[t._v("群拓客 > 活动管理")]),t._v(" "),a("div",{staticClass:"vue-head"},[t._m(0),t._v(" "),a("div",{staticClass:"vue-search"},[a("el-form",{staticClass:"demo-form-inline",attrs:{inline:!0,model:t.search}},[a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"活动名称/ID"},model:{value:t.search.activity,callback:function(e){t.$set(t.search,"activity",e)},expression:"search.activity"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"群聊名称"},model:{value:t.search.group_name,callback:function(e){t.$set(t.search,"group_name",e)},expression:"search.group_name"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-select",{attrs:{placeholder:"活动状态",clearable:"",filterable:""},model:{value:t.search.status,callback:function(e){t.$set(t.search,"status",e)},expression:"search.status"}},t._l(t.active_state_list,function(t){return a("el-option",{key:t.value,attrs:{label:t.name,value:t.value}})}))],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-date-picker",{staticStyle:{"margin-left":"5px"},attrs:{type:"datetimerange","value-format":"yyyy-MM-dd HH:mm:ss","range-separator":"至","start-placeholder":"开始时间","end-placeholder":"结束时间",align:"right"},model:{value:t.times,callback:function(e){t.times=e},expression:"times"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-button",{attrs:{type:"primary"},on:{click:function(e){t.searchs(1)}}},[t._v("搜索")]),t._v(" "),a("el-button",{attrs:{plain:""},on:{click:t.export1}},[t._v("导出")])],1)],1)],1)]),t._v(" "),a("div",{staticClass:"vue-head"},[a("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[a("div",{staticClass:"vue-main-title-left"}),t._v(" "),a("div",{staticClass:"vue-main-title-list"},[t._v("活动列表")]),t._v(" "),a("div",{staticClass:"vue-main-count"},[a("span",[t._v("累计: ")]),t._v(" "),a("span",[t._v("积分: "+t._s(t.point))]),t._v(" "),a("span",[t._v("余额: "+t._s(t.balance))]),t._v(" "),a("span",[t._v("优惠券: "+t._s(t.coupon)+"张")])]),t._v(" "),a("div",{staticClass:"vue-main-title-button"},[a("el-button",{attrs:{type:"primary",plain:"",icon:"el-icon-plus",size:"mini"},on:{click:function(e){t.btnEdit("")}}},[t._v("创建活动")])],1)]),t._v(" "),a("div",{staticClass:"vue-search"},[a("div",{staticClass:"vue-search-status"},t._l(t.active_state_list,function(e,s){return a("span",{key:s,class:[t.acitve_select==e.value?"acitve_select":"",0==s?"acitve_radius_left":"",s==t.active_state_list.length-1?"acitve_radius_right":""],on:{click:function(a){t.selcteStatus(e.value)}}},[t._v(t._s(e.name))])})),t._v(" "),a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.group_list}},[a("el-table-column",{attrs:{label:"活动ID",align:"center",prop:"id"}}),t._v(" "),a("el-table-column",{attrs:{label:"活动名称",align:"center",prop:"activity_name"}}),t._v(" "),a("el-table-column",{attrs:{label:"指定群聊",align:"center"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("span",{staticClass:"group-checkout",on:{click:function(a){t.checkout(e.row.group_chat_list)}}},[t._v("查看")])]}}])}),t._v(" "),a("el-table-column",{attrs:{label:"活动时间",align:"center",width:"150"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("span",{class:"永久"!==e.row.end_time?"end-time":""},[t._v(t._s(e.row.begin_time)+" 至 "+t._s(e.row.end_time))])]}}])}),t._v(" "),a("el-table-column",{attrs:{label:"状态",align:"center",prop:"status"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("span",{class:1==e.row.status?"not_started":2==e.row.status?"in_hand":3==e.row.status?"has_ended":""},[t._v("\r\n                  "+t._s(1==e.row.status?"未开始":2==e.row.status?"进行中":3==e.row.status?"已结束":"")+"\r\n                ")])]}}])}),t._v(" "),a("el-table-column",{attrs:{label:"积分",align:"center",prop:"point"}}),t._v(" "),a("el-table-column",{attrs:{label:"余额",align:"center",prop:"balance"}}),t._v(" "),a("el-table-column",{attrs:{label:"优惠券",align:"center",prop:"coupon"},scopedSlots:t._u([{key:"default",fn:function(e){return[t._v("\r\n                "+t._s(e.row.coupon)+"张\r\n              ")]}}])}),t._v(" "),a("el-table-column",{attrs:{label:" ",align:"center",prop:"coupon"},scopedSlots:t._u([{key:"default",fn:function(e){return[3!==e.row.status?a("span",{staticClass:"manual-end",on:{click:function(a){t.btnManualEnd(e.row.id)}}},[t._v("手动结束")]):t._e()]}}])}),t._v(" "),a("el-table-column",{attrs:{label:"操作",align:"center"},scopedSlots:t._u([{key:"default",fn:function(e){return[3!==e.row.status?a("i",{staticClass:"el-icon-edit",staticStyle:{color:"#999999"},on:{click:function(a){t.btnEdit(e.row.id)}}}):t._e(),t._v(" "),a("i",{staticClass:"el-icon-s-order",on:{click:function(a){t.checkDetail(e.row.id)}}})]}}])})],1)],1)]),t._v(" "),a("div",{staticClass:"group-dialog"},[a("el-dialog",{attrs:{title:"群聊",visible:t.dialogVisible,modal:!1,width:"30%"},on:{"update:visible":function(e){t.dialogVisible=e}}},t._l(t.group_chat,function(e,s){return a("div",{key:s,staticClass:"dialog-content",staticStyle:{"margin-bottom":"10px"}},[t._v(t._s(e))])}))],1),t._v(" "),a("div",{staticClass:"manual-end-dialog"},[a("el-dialog",{attrs:{title:"是否确定结束活动?",visible:t.dialogManualEnd,width:"30%","show-close":!1,center:""},on:{"update:visible":function(e){t.dialogManualEnd=e}}},[a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(e){t.dialogManualEnd=!1}}},[t._v("取 消")]),t._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:t.manualEnd}},[t._v("确 定")])],1)])],1),t._v(" "),a("div",{staticClass:"vue-page"},[a("el-row",[a("el-col",{attrs:{align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:t.total,"page-size":t.per_page,"current-page":t.current_page,background:""},on:{"current-change":t.searchs}})],1)],1)],1)])])},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[e("div",{staticClass:"vue-main-title-left"}),this._v(" "),e("div",{staticClass:"vue-main-title-content"},[this._v("活动筛选")])])}],!1,null,"057672d0",null);d.options.__file="index.vue";e.default=d.exports}}]);