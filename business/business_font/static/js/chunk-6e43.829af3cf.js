(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-6e43"],{FYVd:function(t,i,e){"use strict";var a=e("HVgR");e.n(a).a},HVgR:function(t,i,e){},gBxv:function(t,i,e){"use strict";e.r(i);var a=e("14Xm"),s=e.n(a),n=e("D3Ub"),r=e.n(n),c={components:{friend_fusion_side:e("aS6R").a},data:function(){return{overviewCardList:[{num:"",name:"活动总数",icon:"el-icon-document"},{num:"",name:"进行中活动",icon:"el-icon-eleme"},{num:"",name:"活动未开始",icon:"el-icon-orange"},{num:"",name:"二维码生成总数",icon:"el-icon-s-grid"}],activityRankingList:[],posterGenerationList:[],rewardDynamicsList:[]}},mounted:function(){this.getActivityAnalysisList()},methods:{getActivityAnalysisList:function(){var t=this;return r()(s.a.mark(function i(){var e;return s.a.wrap(function(i){for(;;)switch(i.prev=i.next){case 0:return i.next=2,$http.pc_post("plugin/CustomerIncrease/activityAnalysis");case 2:(e=i.sent).result?(t.overviewCardList[0].num=e.data.activity_count,t.overviewCardList[1].num=e.data.current_activity_count,t.overviewCardList[2].num=e.data.wait_activity_count,t.overviewCardList[3].num=e.data.poster_count,t.activityRankingList=e.data.activity_list,t.posterGenerationList=e.data.poster_list,t.rewardDynamicsList=e.data.reward_list,t.activityRankingList=t.activityRankingList.slice(0,10),t.posterGenerationList=t.posterGenerationList.slice(0,4),t.rewardDynamicsList=t.rewardDynamicsList.slice(0,3)):t.$message.error(e.msg);case 4:case"end":return i.stop()}},i,t)}))()},goPoster:function(t){this.$router.push(this.fun.getUrl("friendFusionPoster",{id:t}))},goReward:function(t){this.$router.push(this.fun.getUrl("friendFusionReward",{id:t}))}}},o=(e("FYVd"),e("KHd+")),l=Object(o.a)(c,function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("div",{staticClass:"all"},[e("friend_fusion_side",{attrs:{defaultActive:"friendFusionStatistics"}}),t._v(" "),e("div",{staticStyle:{width:"calc(100% - 150px)"},attrs:{id:"app"}},[e("el-col",{attrs:{span:12}},[e("div",{staticClass:"overview-record"},[e("div",{staticClass:"vue-main-title"},[e("div",{staticClass:"vue-main-title-left"}),t._v(" "),e("div",{staticClass:"vue-main-title-content"},[t._v("概况记录")])]),t._v(" "),e("div",{staticClass:"overview-card-box"},t._l(t.overviewCardList,function(i,a){return e("div",{key:a,staticClass:"overview-card"},[e("span",{class:"活动总数"==i.name?"inactive-num top-img-box":"进行中活动"==i.name?"inongoing-activities top-img-box":"活动未开始"==i.name?"inactivity-not-started top-img-box":"二维码生成总数"==i.name?"incode-generation top-img-box":"top-img-box"},[e("i",{class:"活动总数"==i.name?"inactive-num-i "+i.icon:"进行中活动"==i.name?"inongoing-activities-i "+i.icon:"活动未开始"==i.name?"inactivity-not-started-i "+i.icon:"二维码生成总数"==i.name?"incode-generation-i "+i.icon:i.icon})]),t._v(" "),e("span",{staticClass:"active-num"},[t._v(t._s(i.num))]),t._v(" "),e("span",[t._v(t._s(i.name))])])}))]),t._v(" "),e("div",{staticClass:"activity-ranking"},[e("div",{staticClass:"vue-main-title"},[e("div",{staticClass:"vue-main-title-left"}),t._v(" "),e("div",{staticClass:"vue-main-title-content"},[t._v("活动排名")])]),t._v(" "),e("div",{staticClass:"table-box"},[e("el-table",{staticStyle:{width:"100%"},attrs:{data:t.activityRankingList}},[e("el-table-column",{attrs:{align:"center",label:"活动名称"},scopedSlots:t._u([{key:"default",fn:function(i){return[e("span",[t._v(t._s(null!==i.row.has_one_activity?i.row.has_one_activity.name:""))])]}}])}),t._v(" "),e("el-table-column",{attrs:{align:"center",prop:"poster_count",label:"生成海报数量"}}),t._v(" "),e("el-table-column",{attrs:{align:"center",label:"创建时间"},scopedSlots:t._u([{key:"default",fn:function(i){return[e("span",[t._v(t._s(null!==i.row.has_one_activity?i.row.has_one_activity.created_at:""))])]}}])})],1)],1)])]),t._v(" "),e("el-col",{attrs:{span:12}},[e("div",[e("div",{staticClass:"poster-generation"},[e("div",{staticClass:"vue-main-title"},[e("div",{staticClass:"vue-main-title-left"}),t._v(" "),e("div",{staticClass:"vue-main-title-content"},[t._v("海报生成动态")])]),t._v(" "),t._l(t.posterGenerationList,function(i,a){return e("div",{key:a,staticClass:"poster-card"},[e("span",{staticStyle:{flex:"2"}},[t._v(t._s(i.created_at))]),t._v(" "),e("div",[e("img",{attrs:{src:null!==i.has_one_member?i.has_one_member.avatar:"",alt:""}}),e("span",[t._v(t._s(null!==i.has_one_member?i.has_one_member.nickname:""))])]),t._v(" "),e("span",{staticClass:"poster-name"},[t._v("生成了海报")])])}),t._v(" "),t.posterGenerationList.length>0?e("div",{staticClass:"more-poster-card",on:{click:function(i){t.goPoster("")}}},[t._v("查看更多生成记录>")]):t._e()],2),t._v(" "),e("div",{staticClass:"poster-generation reward-dynamics"},[e("div",{staticClass:"vue-main-title"},[e("div",{staticClass:"vue-main-title-left"}),t._v(" "),e("div",{staticClass:"vue-main-title-content"},[t._v("奖励动态")])]),t._v(" "),t._l(t.rewardDynamicsList,function(i,a){return e("div",{key:a,staticClass:"poster-card"},[e("span",{staticStyle:{flex:"2"}},[t._v(t._s(i.created_at))]),t._v(" "),e("div",[e("img",{attrs:{src:null!==i.has_one_member?i.has_one_member.avatar_image:"",alt:""}}),e("span",[t._v(t._s(null!==i.has_one_member?i.has_one_member.username:""))])]),t._v(" "),e("span",{staticClass:"poster-name"},[t._v(t._s(i.desc))])])}),t._v(" "),t.rewardDynamicsList.length>0?e("div",{staticClass:"more-poster-card",on:{click:function(i){t.goReward("")}}},[t._v("查看更多奖励记录>")]):t._e()],2)])])],1)],1)},[],!1,null,"12afccab",null);l.options.__file="statistics.vue";i.default=l.exports}}]);