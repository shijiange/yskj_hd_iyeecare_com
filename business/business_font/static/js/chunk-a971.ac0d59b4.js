(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-a971"],{"0zLs":function(t,e,a){"use strict";var s=a("WUZj");a.n(s).a},"6Oc6":function(t,e,a){"use strict";var s=a("FyfS"),i=a.n(s),l={props:{detail_dialog:{type:Boolean,default:!1},content_list:{type:Array,default:function(){return[]}}},data:function(){return{}},watch:{content_list:{handler:function(t,e){var a=!0,s=!1,l=void 0;try{for(var n,o=i()(this.content_list);!(a=(n=o.next()).done);a=!0){var c=n.value;"text"==c.type&&(c.news=c.news.replace(/\">{{客户昵称}}</g,'">客户昵称<'))}}catch(t){s=!0,l=t}finally{try{!a&&o.return&&o.return()}finally{if(s)throw l}}},deep:!0}},mounted:function(){},methods:{closeDelStatus:function(){this.$emit("closeDetailStatus",!1)}}},n=(a("0zLs"),a("KHd+")),o=Object(n.a)(l,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{},[a("el-dialog",{attrs:{visible:t.detail_dialog,width:"30%","show-close":!1,"close-on-click-modal":!1,"close-on-press-escape":!1},on:{"update:visible":function(e){t.detail_dialog=e}}},[a("i",{staticClass:"el-icon-circle-close",on:{click:t.closeDelStatus}}),t._v(" "),a("div",{attrs:{id:"welcome_dialog_card"}},t._l(t.content_list,function(e,s){return a("div",{key:s},["text"==e.type?a("div",{staticClass:"show_item"},[a("div",{staticClass:"show_content"},[a("div",{staticClass:"triangle"}),t._v(" "),a("div",{staticClass:"test_msg"},[a("div",{staticClass:"link_list",staticStyle:{padding:"10px","line-height":"22px"}},[a("div",{staticStyle:{padding:"0px"},domProps:{innerHTML:t._s(e.news)}})])])])]):t._e(),t._v(" "),"image"==e.type?a("div",{staticClass:"show_item "},[a("div",{},[a("div",{},[a("img",{staticStyle:{padding:"0 10px 0 10px",width:"200px",height:"200px"},attrs:{src:e.link_img,alt:""}})])])]):t._e(),t._v(" "),"link"==e.type?a("div",{staticClass:"show_item"},[a("div",{staticClass:"type_show_content"},[a("div",{staticClass:"tyep_triangle"}),t._v(" "),a("div",{staticClass:"test_msg"},[a("div",{staticClass:"link_list"},[a("div",[t._v(t._s(e.title))]),t._v(" "),a("div",[t._v(t._s(e.link))]),t._v(" "),a("div",[t._v(t._s(e.describe))]),t._v(" "),a("img",{attrs:{src:e.link_img,alt:""}})])])])]):t._e(),t._v(" "),"applet"==e.type?a("div",{staticClass:"show_item"},[a("div",{staticClass:"type_show_content"},[a("div",{staticClass:"tyep_triangle"}),t._v(" "),a("div",{staticClass:"test_msg"},[a("div",{staticClass:"link_list"},[a("div",[t._v(t._s(e.title))]),t._v(" "),a("img",{attrs:{src:e.link_img,alt:""}})])])])]):t._e(),t._v(" "),"video"==e.type?a("div",{staticClass:"show_item",staticStyle:{display:"flex"}},[a("div",{staticClass:"type_show_content",staticStyle:{display:"flex"}},[a("div",{}),t._v(" "),a("div",{},[a("video",{staticStyle:{width:"100%"},attrs:{src:e.link_video,alt:"",controls:"controls"}})])])]):t._e(),t._v(" "),"file"==e.type?a("div",{staticClass:"show_item"},[a("div",{staticClass:"type_show_content"},[a("div",{staticClass:"tyep_triangle"}),t._v(" "),a("div",{staticClass:"test_msg "},[a("div",{staticClass:"link_list check_card"},[a("a",[t._v(t._s(e.link_file))])])])])]):t._e()])}))])],1)},[],!1,null,"b3b4fde8",null);o.options.__file="task_detail_dialog.vue";e.a=o.exports},PT4m:function(t,e,a){"use strict";var s=a("TtYU");a.n(s).a},TtYU:function(t,e,a){},WUZj:function(t,e,a){},zLPf:function(t,e,a){"use strict";a.r(e);var s=a("14Xm"),i=a.n(s),l=a("QbLZ"),n=a.n(l),o=a("D3Ub"),c=a.n(o),r=a("fb88"),_=a("6Oc6"),d={components:{sop_manage_side:r.a,task_detail_dialog:_.a},data:function(){return{search:{staff_info:"",customers_info:"",is_complete:""},options:[{value:1,label:"已完成"},{value:0,label:"未完成"}],date:"",task_list:[],detail_dialog:!1,content_list:[],task_total:"",completed_total:"",incomplete_total:"",current_page:1,total:1,per_page:1}},mounted:function(){this.getMemberDetailList(1)},methods:{getMemberDetailList:function(t){var e=this;return c()(i.a.mark(function a(){var s;return i.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/SopTask/getLogList",{page:t,id:e.$route.query.id,task_type:4,search:n()({},e.search,{start_time:e.date?e.date[0]:"",end_time:e.date?e.date[1]:""})});case 2:(s=a.sent).result?(e.task_list=s.data.data,e.task_total=s.data.task_total,e.completed_total=s.data.completed_total,e.incomplete_total=s.data.incomplete_total,e.total=s.data.total,e.per_page=s.data.per_page,e.current_page=s.data.current_page):e.$message.error(s.msg);case 4:case"end":return a.stop()}},a,e)}))()},search1:function(t){this.getMemberDetailList(t)},export1:function(){var t=this.fun.getRealPCUrl("plugin/SopTask/logExport")+"&search[start_time]="+(this.date?this.date[0]:"")+"&search[end_time]="+(this.date?this.date[1]:"")+"&search[staff_info]="+(this.search.staff_info?this.search.staff_info:"")+"&task_type=4&search[customers_info]="+(this.search.customers_info?this.search.customers_info:"")+"&search[is_complete]="+(this.search.is_complete?this.search.is_complete:"")+"&id="+this.$route.query.id;console.log(t,"href"),this.download(t,"")},download:function(t,e){var a=document.createElement("a");a.download=e,a.href=t,a.click(),a.remove()},checked:function(t){this.content_list=t.content_list,this.detail_dialog=!0},closeDetailStatus:function(t){this.detail_dialog=t}}},u=(a("PT4m"),a("KHd+")),p=Object(u.a)(d,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"all"},[a("sop_manage_side",{attrs:{defaultActive:"groupSop"}}),t._v(" "),a("div",{staticStyle:{width:"calc(100% - 150px)"},attrs:{id:"app"}},[a("div",{staticClass:"news-sop"},[t._m(0),t._v(" "),a("div",{staticClass:"vue-search"},[a("el-form",{staticClass:"demo-form-inline",attrs:{inline:!0}},[a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"成员昵称/姓名/手机号"},model:{value:t.search.staff_info,callback:function(e){t.$set(t.search,"staff_info",e)},expression:"search.staff_info"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"群聊名称"},model:{value:t.search.customers_info,callback:function(e){t.$set(t.search,"customers_info",e)},expression:"search.customers_info"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-select",{attrs:{clearable:"",filterable:"",placeholder:"状态"},model:{value:t.search.is_complete,callback:function(e){t.$set(t.search,"is_complete",e)},expression:"search.is_complete"}},t._l(t.options,function(t){return a("el-option",{key:t.value,attrs:{label:t.label,value:t.value}})}))],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-date-picker",{attrs:{"value-format":"yyyy-MM-dd HH:mm:ss",type:"datetimerange","range-separator":"至","start-placeholder":"开始日期","end-placeholder":"结束日期"},model:{value:t.date,callback:function(e){t.date=e},expression:"date"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-button",{attrs:{type:"primary"},on:{click:function(e){t.search1(1)}}},[t._v("搜索")])],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-button",{attrs:{type:"plain"},on:{click:t.export1}},[t._v("导出")])],1)],1)],1)]),t._v(" "),a("div",{staticClass:"task-list"},[a("div",{staticClass:"vue-main-title"},[a("div",{staticClass:"vue-main-title-left"}),t._v(" "),a("div",{staticClass:"vue-main-title-content"},[t._v("任务列表"),a("span",{staticClass:"task-num"},[t._v("任务数量: "+t._s(t.task_total)+" 已完成: "+t._s(t.completed_total)+"  未完成: "+t._s(t.incomplete_total))])])]),t._v(" "),a("div",{staticClass:"table-box"},[a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.task_list}},[a("el-table-column",{attrs:{align:"center",prop:"created_at",label:"推送时间"}}),t._v(" "),a("el-table-column",{attrs:{align:"center",label:"执行人"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("div",{staticClass:"task-table-img"},[a("img",{attrs:{src:null!==e.row.has_one_staff?e.row.has_one_staff.avatar:"",alt:""}}),t._v(" "),a("span",[t._v(t._s(null!==e.row.has_one_staff?e.row.has_one_staff.name:""))])])]}}])}),t._v(" "),a("el-table-column",{attrs:{align:"center",label:"推送群聊"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("div",{staticClass:"task-table-img"},[a("img",{attrs:{src:null!==e.row.group_chat_avatar?e.row.group_chat_avatar:"",alt:""}}),t._v(" "),a("span",[t._v(t._s(null!==e.row.has_one_group_chat?e.row.has_one_group_chat.group_name:""))])])]}}])}),t._v(" "),a("el-table-column",{attrs:{align:"center",prop:"send",label:"推送内容"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("span",{staticClass:"task-check",on:{click:function(a){t.checked(e.row)}}},[t._v("查看")])]}}])}),t._v(" "),a("el-table-column",{attrs:{align:"center",prop:"is_complete",label:"执行状态"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("span",[t._v(t._s(1==e.row.is_complete?"完成 ":"未完成"))])]}}])}),t._v(" "),a("el-table-column",{attrs:{align:"center",prop:"condition",label:"群聊"}})],1)],1)])]),t._v(" "),t.total>0?a("div",{staticClass:"vue-page"},[a("el-row",[a("el-col",{attrs:{align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:t.total,"page-size":t.per_page,"current-page":t.current_page,background:""},on:{"current-change":t.search1}})],1)],1)],1):t._e(),t._v(" "),a("task_detail_dialog",{attrs:{detail_dialog:t.detail_dialog,content_list:t.content_list},on:{closeDetailStatus:t.closeDetailStatus}})],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"vue-main-title"},[e("div",{staticClass:"vue-main-title-left"}),this._v(" "),e("div",{staticClass:"vue-main-title-content"},[this._v("任务管理")])])}],!1,null,"21680e2d",null);p.options.__file="group_sop_detail.vue";e.default=p.exports}}]);