(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-75f8"],{Apst:function(e,t,a){},nJPM:function(e,t,a){"use strict";a.r(t);var l=a("cLjf"),r=a.n(l),s=a("bS4n"),n=a.n(s),i=a("hDQ3"),o=a.n(i),c={components:{friend_fusion_side:a("aS6R").a},data:function(){return{search:{uid:"",keyword:"",activity_name:"",reward_type:"",time_type:"",state:""},times:"",rewardOptions:[{value:"point",label:"积分"},{value:"balance",label:"余额"},{value:"integral",label:"消费积分"},{value:"love",label:"爱心值"},{value:"coupon",label:"优惠券"},{value:"member_level",label:"升级到指定会员等级"}],time_type_list:[{value:1,label:"奖励时间"},{value:2,label:"发放时间"}],stateOptions:[{value:1,label:"待发放"},{value:2,label:"已发放"},{value:3,label:"已失效"}],generateList:[],point_sum:"",balance_sum:"",love_sum:"",integral_sum:"",type_name_arr:{},current_page:1,total:1,per_page:1}},mounted:function(){this.$route.params.activity_id&&(this.search.activity_name=this.$route.params.activity_id),this.getPosterList(1)},methods:{getPosterList:function(e){var t=this;return o()(r.a.mark(function a(){var l;return r.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/CustomerIncrease/rewardList",n()({page:e},t.search,{start_time:null!==t.times&&t.times?t.times[0]/1e3:"",end_time:null!==t.times&&t.times?t.times[1]/1e3:""}));case 2:1==(l=a.sent).result?(t.generateList=l.data.data,t.point_sum=l.data.point_sum,t.balance_sum=l.data.balance_sum,t.love_sum=l.data.love_sum,t.integral_sum=l.data.integral_sum,t.total=l.data.total,t.per_page=l.data.per_page,t.current_page=l.data.current_page,t.type_name_arr=l.data.type_name_arr):t.$message.error(l.msg);case 4:case"end":return a.stop()}},a,t)}))()},search1:function(e){this.getPosterList(e)},sendAward:function(e){var t=this;return o()(r.a.mark(function a(){var l;return r.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/CustomerIncrease/rewardByPeople",{id:e});case 2:l=a.sent,console.log(l,"res"),1==l.result?(t.$message.success(l.msg),location.reload()):t.$message.error(l.msg);case 5:case"end":return a.stop()}},a,t)}))()}}},u=(a("x811"),a("ZrdR")),_=Object(u.a)(c,function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[a("div",{staticClass:"all"},[a("friend_fusion_side",{attrs:{defaultActive:"friendFusionReward"}}),e._v(" "),a("div",{staticStyle:{width:"calc(100% - 150px)"},attrs:{id:"app"}},[a("el-col",{attrs:{span:24}},[a("div",{staticClass:"member-participation-record"},[a("div",{staticClass:"vue-main-title"},[a("div",{staticClass:"vue-main-title-left"}),e._v(" "),a("div",{staticClass:"vue-main-title-content"},[e._v("奖励记录")])]),e._v(" "),a("div",{staticClass:"vue-search"},[a("el-form",{staticClass:"demo-form-inline",attrs:{inline:!0}},[a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"会员ID"},model:{value:e.search.uid,callback:function(t){e.$set(e.search,"uid",t)},expression:"search.uid"}})],1),e._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"会员昵称/姓名/手机号"},model:{value:e.search.keyword,callback:function(t){e.$set(e.search,"keyword",t)},expression:"search.keyword"}})],1),e._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"活动名称/活动ID"},model:{value:e.search.activity_name,callback:function(t){e.$set(e.search,"activity_name",t)},expression:"search.activity_name"}})],1),e._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-select",{attrs:{placeholder:"奖励",clearable:"",filterable:""},model:{value:e.search.reward_type,callback:function(t){e.$set(e.search,"reward_type",t)},expression:"search.reward_type"}},e._l(e.rewardOptions,function(e){return a("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})}))],1),e._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-select",{attrs:{placeholder:"状态",clearable:"",filterable:""},model:{value:e.search.state,callback:function(t){e.$set(e.search,"state",t)},expression:"search.state"}},e._l(e.stateOptions,function(e){return a("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})}))],1),e._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-select",{attrs:{placeholder:"搜索时间类型",clearable:"",filterable:""},model:{value:e.search.time_type,callback:function(t){e.$set(e.search,"time_type",t)},expression:"search.time_type"}},e._l(e.time_type_list,function(e){return a("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})}))],1),e._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-date-picker",{staticStyle:{"margin-left":"5px"},attrs:{type:"datetimerange","value-format":"timestamp","range-separator":"至","start-placeholder":"开始时间","end-placeholder":"结束时间",align:"right"},model:{value:e.times,callback:function(t){e.times=t},expression:"times"}})],1),e._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-button",{attrs:{type:"primary"},on:{click:function(t){e.search1(1)}}},[e._v("搜索")])],1)],1)],1)]),e._v(" "),a("div",{staticClass:"record-list"},[a("div",{staticClass:"vue-main-title"},[a("div",{staticClass:"vue-main-title-left"}),e._v(" "),a("div",{staticClass:"vue-main-title-content"},[e._v("奖励列表")]),e._v(" "),a("div",{staticClass:"all-num"},[a("span",[e._v(e._s(e.type_name_arr.balance)+"总数: "+e._s(e.point_sum)+",")]),e._v(" "),a("span",[e._v(e._s(e.type_name_arr.point)+"总数: "+e._s(e.point_sum)+",")]),e._v(" "),a("span",[e._v(e._s(e.type_name_arr.integral)+"总数: "+e._s(e.integral_sum)+",")]),e._v(" "),a("span",[e._v(e._s(e.type_name_arr.love)+"总数: "+e._s(e.love_sum))])])]),e._v(" "),a("div",{staticClass:"table-box"},[a("el-table",{staticStyle:{width:"100%"},attrs:{data:e.generateList}},[a("el-table-column",{attrs:{align:"center",prop:"time",label:"奖励时间/发放时间"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("div",[e._v(e._s(t.row.created_at))]),e._v(" "),a("div",[e._v(e._s(t.row.reward_time))])]}}])}),e._v(" "),a("el-table-column",{attrs:{align:"center",prop:"active_name",label:"活动名称"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("div",[e._v(e._s(null!==t.row.has_one_activity?t.row.has_one_activity.name:""))])]}}])}),e._v(" "),a("el-table-column",{attrs:{align:"center",prop:"id",label:"会员ID"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("div",[e._v(e._s(null!==t.row.has_one_member?t.row.has_one_member.uid:""))])]}}])}),e._v(" "),a("el-table-column",{attrs:{align:"center",label:"会员信息"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("div",{staticClass:"generate-table-img"},[a("img",{attrs:{src:null!==t.row.has_one_member?t.row.has_one_member.avatar_image:"",alt:""}}),e._v(" "),a("span",[e._v(e._s(null!==t.row.has_one_member?t.row.has_one_member.username:""))])])]}}])}),e._v(" "),a("el-table-column",{attrs:{align:"center",prop:"people_num",label:"邀请人数"}}),e._v(" "),a("el-table-column",{attrs:{align:"center",prop:"reward_detail",label:"奖励"}}),e._v(" "),a("el-table-column",{attrs:{align:"center",prop:"state_name",label:"状态"}}),e._v(" "),a("el-table-column",{attrs:{align:"center",label:" "},scopedSlots:e._u([{key:"default",fn:function(t){return["已发放"!==t.row.state_name?a("el-button",{attrs:{type:"primary",size:"mini"},on:{click:function(a){e.sendAward(t.row.id)}}},[e._v("发放奖励")]):e._e()]}}])})],1)],1)])])],1)],1),e._v(" "),a("div",{staticClass:"vue-page"},[a("el-row",[a("el-col",{attrs:{align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:e.total,"page-size":e.per_page,"current-page":e.current_page,background:""},on:{"current-change":e.search1}})],1)],1)],1)])},[],!1,null,"0099f0d6",null);_.options.__file="reward.vue";t.default=_.exports},x811:function(e,t,a){"use strict";var l=a("Apst");a.n(l).a}}]);