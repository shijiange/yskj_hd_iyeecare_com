(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-6533"],{GJjS:function(e,t,a){"use strict";a.r(t);var s=a("14Xm"),r=a.n(s),n=a("QbLZ"),i=a.n(n),l=a("D3Ub"),c=a.n(l),o={components:{friend_fusion_side:a("aS6R").a},data:function(){return{search:{uid:"",keyword:"",activity_id:""},date:"",generateList:[],current_page:1,total:1,per_page:1}},mounted:function(){this.$route.params.activity_id&&(this.search.activity_id=this.$route.params.activity_id),this.getPosterList(1)},methods:{search1:function(e){this.getPosterList(e)},getPosterList:function(e){var t=this;return c()(r.a.mark(function a(){var s;return r.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/CustomerIncrease/posterList",i()({page:e},t.search,{start_time:null!==t.date&&""!==t.date?t.date[0]/1e3:"",end_time:null!==t.date&&""!==t.date?t.date[1]/1e3:""}));case 2:1==(s=a.sent).result?(t.generateList=s.data.data,t.total=s.data.total,t.per_page=s.data.per_page,t.current_page=s.data.current_page):t.$message.error(s.msg);case 4:case"end":return a.stop()}},a,t)}))()},delPoster:function(e){var t=this;return c()(r.a.mark(function a(){var s;return r.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/CustomerIncrease/posterDelete",{id:e});case 2:(s=a.sent).result?(t.$message.success(s.msg),location.reload()):t.$message.error(s.msg);case 4:case"end":return a.stop()}},a,t)}))()},regeneratePoste:function(e){var t=this;return c()(r.a.mark(function a(){var s;return r.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/CustomerIncrease/posterRefresh",{id:e});case 2:(s=a.sent).result?(t.$message.success(s.msg),location.reload()):t.$message.error(s.msg);case 4:case"end":return a.stop()}},a,t)}))()},oneClickDelet:function(){var e=this;return c()(r.a.mark(function t(){var a;return r.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,$http.pc_post("plugin/CustomerIncrease/deleteManyPoster",i()({},e.search,{start_time:null!==e.date&&""!==e.date?e.date[0]/1e3:"",end_time:null!==e.date&&""!==e.date?e.date[1]/1e3:""}));case 2:(a=t.sent).result?e.$message.success(a.msg):e.$message.error(a.msg);case 4:case"end":return t.stop()}},t,e)}))()}}},u=(a("X1gv"),a("KHd+")),d=Object(u.a)(o,function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[a("div",{staticClass:"all"},[a("friend_fusion_side",{attrs:{defaultActive:"friendFusionPoster"}}),e._v(" "),a("div",{staticStyle:{width:"calc(100% - 150px)"},attrs:{id:"app"}},[a("el-col",{attrs:{span:24}},[a("div",{staticClass:"poster-management"},[a("div",{staticClass:"vue-main-title"},[a("div",{staticClass:"vue-main-title-left"}),e._v(" "),a("div",{staticClass:"vue-main-title-content"},[e._v("生成记录")])]),e._v(" "),a("div",{staticClass:"vue-search"},[a("el-form",{staticClass:"demo-form-inline",attrs:{inline:!0}},[a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"会员ID"},model:{value:e.search.uid,callback:function(t){e.$set(e.search,"uid",t)},expression:"search.uid"}})],1),e._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"活动ID"},model:{value:e.search.activity_id,callback:function(t){e.$set(e.search,"activity_id",t)},expression:"search.activity_id"}})],1),e._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"会员昵称/姓名/手机号"},model:{value:e.search.keyword,callback:function(t){e.$set(e.search,"keyword",t)},expression:"search.keyword"}})],1),e._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-date-picker",{attrs:{"value-format":"timestamp",type:"datetimerange","range-separator":"至","start-placeholder":"开始日期","end-placeholder":"结束日期"},model:{value:e.date,callback:function(t){e.date=t},expression:"date"}})],1),e._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-button",{attrs:{type:"primary"},on:{click:function(t){e.search1(1)}}},[e._v("搜索")])],1)],1)],1)]),e._v(" "),a("div",{staticClass:"generate-list"},[a("div",{staticClass:"vue-main-title"},[a("div",{staticClass:"vue-main-title-left"}),e._v(" "),a("div",{staticClass:"vue-main-title-content"},[e._v("活动排名")]),e._v(" "),a("div",{staticClass:"generate-button"},[a("el-button",{attrs:{type:"danger",size:"small"},on:{click:e.oneClickDelet}},[e._v("一键删除")])],1)]),e._v(" "),a("div",{staticClass:"table-box"},[a("el-table",{staticStyle:{width:"100%"},attrs:{data:e.generateList}},[a("el-table-column",{attrs:{align:"center",prop:"created_at",label:"生成时间"}}),e._v(" "),a("el-table-column",{attrs:{align:"center",prop:"uid",label:"会员ID"}}),e._v(" "),a("el-table-column",{attrs:{align:"center",label:"会员信息"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("div",{staticClass:"generate-table-img"},[a("img",{attrs:{src:null!==t.row.has_one_member?t.row.has_one_member.avatar_image:"",alt:""}}),e._v(" "),a("span",[e._v(e._s(null!==t.row.has_one_member?t.row.has_one_member.username:""))])])]}}])}),e._v(" "),a("el-table-column",{attrs:{align:"center",prop:"poster",label:"海报路径"}}),e._v(" "),a("el-table-column",{attrs:{align:"center",label:"操作"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("div",{staticClass:"activity-list-i"},[a("span",{staticClass:"download-img"},[a("a",{attrs:{href:t.row.poster,download:"qro.png"}},[e._v("下载")])]),e._v(" "),a("el-button",{attrs:{type:"primary",plain:"",size:"mini"},on:{click:function(a){e.regeneratePoste(t.row.id)}}},[e._v("重新生成")]),e._v(" "),a("el-button",{attrs:{type:"danger",plain:"",size:"mini"},on:{click:function(a){e.delPoster(t.row.id)}}},[e._v("删除")])],1)]}}])})],1)],1)])])],1)],1),e._v(" "),a("div",{staticClass:"vue-page"},[a("el-row",[a("el-col",{attrs:{align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:e.total,"page-size":e.per_page,"current-page":e.current_page,background:""},on:{"current-change":e.search1}})],1)],1)],1)])},[],!1,null,"c21d99c2",null);d.options.__file="poster.vue";t.default=d.exports},JqSb:function(e,t,a){},X1gv:function(e,t,a){"use strict";var s=a("JqSb");a.n(s).a}}]);