(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-33b8"],{DY47:function(t,e,i){"use strict";var a=i("PP9j");i.n(a).a},PP9j:function(t,e,i){},Qtx4:function(t,e,i){"use strict";i.r(e);var a=i("14Xm"),s=i.n(a),n=i("QbLZ"),l=i.n(n),o=i("D3Ub"),c=i.n(o),r={components:{friend_fusion_side:i("aS6R").a},data:function(){return{search:{name:"",state:""},statusOptions:[{value:1,label:"未开始"},{value:2,label:"活动中"},{value:3,label:"已结束"}],activityList:[],dataStatisticsList:[],dialogVisible_end:!1,dialogVisible_data:!1,dialogVisible_extension:!1,web_url:"",web_code:"",mini_url:"",mini_code:"",current_page:1,total:1,per_page:1,poster_count:"",manual_end_id:""}},mounted:function(){this.getActivityList(1)},methods:{getActivityList:function(t){var e=this;return c()(s.a.mark(function i(){var a;return s.a.wrap(function(i){for(;;)switch(i.prev=i.next){case 0:return i.next=2,$http.pc_post("plugin/CustomerIncrease/activityList",l()({page:t},e.search));case 2:(a=i.sent).result?(e.activityList=a.data.data,e.poster_count=a.data.poster_count,e.total=a.data.total,e.per_page=a.data.per_page,e.current_page=a.data.current_page):e.$message.error(a.msg);case 4:case"end":return i.stop()}},i,e)}))()},extension:function(t){var e=this;return c()(s.a.mark(function i(){var a;return s.a.wrap(function(i){for(;;)switch(i.prev=i.next){case 0:return i.next=2,$http.pc_post("plugin/CustomerIncrease/activityCode",{id:t});case 2:(a=i.sent).result?(e.web_code=a.data.web_code,e.mini_code=a.data.mini_code,e.web_url=a.data.web_url,e.mini_url=a.data.mini_url):e.$message.error(a.msg),e.dialogVisible_extension=!0;case 5:case"end":return i.stop()}},i,e)}))()},manualEnd:function(t){this.dialogVisible_end=!0,this.manual_end_id=t},dialogManualEnd:function(){var t=this;return c()(s.a.mark(function e(){var i;return s.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,$http.pc_post("plugin/CustomerIncrease/activityClose",{id:t.manual_end_id});case 2:(i=e.sent).result?(t.$message.success(i.msg),location.reload()):t.$message.error(i.msg),t.dialogVisible_end=!1;case 5:case"end":return e.stop()}},e,t)}))()},dataStatistics:function(t){var e=this;return c()(s.a.mark(function i(){var a;return s.a.wrap(function(i){for(;;)switch(i.prev=i.next){case 0:return i.next=2,$http.pc_post("plugin/CustomerIncrease/activityCount",{id:t});case 2:(a=i.sent).result?e.dataStatisticsList=a.data:e.$message.error(a.msg),e.dialogVisible_data=!0;case 5:case"end":return i.stop()}},i,e)}))()},copy:function(t){this.$refs[t].select(),document.execCommand("Copy",!1),this.$message({message:"复制成功！",type:"success"})},goEditAcitve:function(t){t?this.$router.push(this.fun.getUrl("friendFusionActivityEditor",{},{id:t})):this.$router.push(this.fun.getUrl("friendFusionActivityEditor",{},{}))},goPoster:function(t){this.$router.push(this.fun.getUrl("friendFusionPoster",{activity_id:t}))},goReward:function(t){this.$router.push(this.fun.getUrl("friendFusionReward",{activity_id:t}))},search1:function(t){this.getActivityList(t)}}},u=(i("DY47"),i("KHd+")),d=Object(u.a)(r,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",[i("div",{staticClass:"all"},[i("friend_fusion_side",{attrs:{defaultActive:"friendFusionActivity"}}),t._v(" "),i("div",{staticStyle:{width:"calc(100% - 150px)"},attrs:{id:"app"}},[i("el-col",{attrs:{span:24}},[i("div",{staticClass:"activity-management"},[i("div",{staticClass:"vue-main-title"},[i("div",{staticClass:"vue-main-title-left"}),t._v(" "),i("div",{staticClass:"vue-main-title-content"},[t._v("活动管理")]),t._v(" "),i("div",{staticClass:"vue-main-title-button"},[i("el-button",{staticStyle:{height:"40px","font-size":"14px"},attrs:{type:"primary",plain:"",icon:"el-icon-plus",size:"mini"},on:{click:function(e){t.goEditAcitve("")}}},[t._v("添加活动")])],1)]),t._v(" "),i("div",{staticClass:"vue-search"},[i("el-form",{staticClass:"demo-form-inline",attrs:{inline:!0}},[i("el-form-item",{attrs:{label:""}},[i("el-input",{attrs:{placeholder:"活动名称"},model:{value:t.search.name,callback:function(e){t.$set(t.search,"name",e)},expression:"search.name"}})],1),t._v(" "),i("el-form-item",{attrs:{label:""}},[i("el-select",{attrs:{placeholder:"状态",clearable:"",filterable:""},model:{value:t.search.state,callback:function(e){t.$set(t.search,"state",e)},expression:"search.state"}},t._l(t.statusOptions,function(t){return i("el-option",{key:t.value,attrs:{label:t.label,value:t.value}})}))],1),t._v(" "),i("el-form-item",{attrs:{label:""}},[i("el-button",{attrs:{type:"primary"},on:{click:function(e){t.search1(1)}}},[t._v("搜索")])],1)],1)],1)]),t._v(" "),i("div",{staticClass:"activity-list"},[i("div",{staticClass:"vue-main-title"},[i("div",{staticClass:"vue-main-title-left"}),t._v(" "),i("div",{staticClass:"vue-main-title-content"},[t._v("活动排名")]),t._v(" "),i("div",{staticClass:"calculation"},[i("span",[t._v("累计: "+t._s(t.total)+"个活动")]),t._v(" "),i("span",[t._v("生成海报数量: "+t._s(t.poster_count)+"个")])])]),t._v(" "),i("div",{staticClass:"table-box"},[i("el-table",{staticStyle:{width:"100%"},attrs:{data:t.activityList}},[i("el-table-column",{attrs:{align:"center",prop:"id",label:"活动ID"}}),t._v(" "),i("el-table-column",{attrs:{align:"center",prop:"name",label:"活动名称"}}),t._v(" "),i("el-table-column",{attrs:{align:"center",prop:"times",label:"活动时间"},scopedSlots:t._u([{key:"default",fn:function(e){return[i("div",[t._v(t._s(e.row.start_time)+"至")]),t._v(" "),i("div",{staticStyle:{"margin-right":"14px"}},[t._v(t._s(e.row.end_time)+" ")])]}}])}),t._v(" "),i("el-table-column",{attrs:{align:"center",prop:"has_many_poster_count",label:"生成海报数量"}}),t._v(" "),i("el-table-column",{attrs:{align:"center",label:"状态",prop:"state_name"}}),t._v(" "),i("el-table-column",{attrs:{align:"center",label:" "},scopedSlots:t._u([{key:"default",fn:function(e){return["已结束"!==e.row.state_name?i("span",{staticClass:"manual-end",on:{click:function(i){t.manualEnd(e.row.id)}}},[t._v("手动结束")]):t._e()]}}])}),t._v(" "),i("el-table-column",{attrs:{align:"center",label:"操作"},scopedSlots:t._u([{key:"default",fn:function(e){return[i("div",{staticClass:"activity-list-i"},[i("el-tooltip",{staticClass:"item",attrs:{effect:"dark",content:"推广",placement:"top"}},[i("i",{staticClass:"el-icon-s-grid",on:{click:function(i){t.extension(e.row.id)}}})]),t._v(" "),i("el-tooltip",{staticClass:"item",attrs:{effect:"dark",content:"数据统计",placement:"top"}},[i("i",{staticClass:"el-icon-s-marketing",on:{click:function(i){t.dataStatistics(e.row.id)}}})]),t._v(" "),i("el-tooltip",{staticClass:"item",attrs:{effect:"dark",content:"海报生成记录",placement:"top"}},[i("i",{staticClass:"el-icon-picture",on:{click:function(i){t.goPoster(e.row.id)}}})]),t._v(" "),i("el-tooltip",{staticClass:"item",attrs:{effect:"dark",content:"奖励记录",placement:"top"}},[i("i",{staticClass:"el-icon-film",on:{click:function(i){t.goReward(e.row.id)}}})]),t._v(" "),i("el-tooltip",{staticClass:"item",attrs:{effect:"dark",content:"编辑",placement:"top"}},["已结束"!==e.row.state_name?i("i",{staticClass:"el-icon-edit",on:{click:function(i){t.goEditAcitve(e.row.id)}}}):t._e()])],1)]}}])})],1)],1)])])],1)],1),t._v(" "),i("div",{staticClass:"vue-page"},[i("el-row",[i("el-col",{attrs:{align:"right"}},[i("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:t.total,"page-size":t.per_page,"current-page":t.current_page,background:""},on:{"current-change":t.search1}})],1)],1)],1),t._v(" "),i("el-dialog",{attrs:{visible:t.dialogVisible_end,center:"","show-close":!1,width:"20%"},on:{"update:visible":function(e){t.dialogVisible_end=e}}},[i("span",{staticClass:"dialog-el"},[t._v("是否确认结束?")]),t._v(" "),i("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{on:{click:function(e){t.dialogVisible_end=!1}}},[t._v("取 消")]),t._v(" "),i("el-button",{attrs:{type:"primary"},on:{click:t.dialogManualEnd}},[t._v("确 定")])],1)]),t._v(" "),i("el-dialog",{staticClass:"dialog-statistics",attrs:{visible:t.dialogVisible_data,center:"",title:"数据统计",width:"30%"},on:{"update:visible":function(e){t.dialogVisible_data=e}}},[i("div",[i("el-table",{staticStyle:{width:"100%"},attrs:{data:t.dataStatisticsList}},[i("el-table-column",{attrs:{align:"center",prop:"name",label:"梯度"}}),t._v(" "),i("el-table-column",{attrs:{align:"center",prop:"step_people_count",label:"达到人数"}}),t._v(" "),i("el-table-column",{attrs:{align:"center",prop:"introduce_people_count",label:"助力总人数"}})],1)],1)]),t._v(" "),i("el-dialog",{staticClass:"dialog-extension",attrs:{visible:t.dialogVisible_extension,title:"推广",width:"600px"},on:{"update:visible":function(e){t.dialogVisible_extension=e}}},[i("div",{staticClass:"extension-content"},[i("div",{staticClass:"img-item"},[i("img",{attrs:{src:t.web_code,alt:""}}),t._v(" "),i("span",[i("a",{attrs:{href:t.web_code,download:"qro.png"}},[t._v("下载二维码图片")])])]),t._v(" "),t.mini_code?i("div",{staticClass:"img-item"},[i("img",{attrs:{src:t.mini_code,alt:""}}),t._v(" "),i("span",[i("a",{attrs:{href:t.mini_code,download:"qro.png"}},[t._v("下载小程序码图片")])])]):t._e()]),t._v(" "),i("div",{staticClass:"line h-line"},[i("span",[t._v("H5页面链接")]),t._v(" "),i("div",[i("el-input",{ref:"web_url",model:{value:t.web_url,callback:function(e){t.web_url=e},expression:"web_url"}}),t._v(" "),i("el-button",{on:{click:function(e){t.copy("web_url")}}},[t._v("复制")])],1)]),t._v(" "),t.mini_url?i("div",{staticClass:"line applet-line"},[i("span",[t._v("小程序页面链接")]),t._v(" "),i("div",[i("el-input",{ref:"mini_url",model:{value:t.mini_url,callback:function(e){t.mini_url=e},expression:"mini_url"}}),t._v(" "),i("el-button",{on:{click:function(e){t.copy("mini_url")}}},[t._v("复制")])],1)]):t._e(),t._v(" "),i("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{on:{click:function(e){t.dialogVisible_extension=!1}}},[t._v("取 消")])],1)])],1)},[],!1,null,"b2a5c7f2",null);d.options.__file="activity.vue";e.default=d.exports}}]);