(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-790c"],{"6OMw":function(t,e,a){"use strict";a.r(e);var s=a("14Xm"),i=a.n(s),l=a("QbLZ"),n=a.n(l),o=a("D3Ub"),r=a.n(o),c=a("fb88"),u=a("mKY0"),d={components:{sop_manage_side:c.a,task_dialog:u.a},data:function(){return{search:{member_info:"",task_name:""},date:"",task_list:[],dialogTag:!1,status_type:"",status_index:"",dialog_task:!1,dialog_task_id:"",axios_url:"",dialog_text:[],dialog_name:"",title:"",current_page:1,total:0,per_page:1}},mounted:function(){this.getMemberList(1)},methods:{getMemberList:function(t){var e=this;return r()(i.a.mark(function a(){var s;return i.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/SopTask/getTaskList",{page:t,search:n()({},e.search,{start_time:null!==e.date?e.date[0]:"",end_time:null!==e.date?e.date[1]:""}),task_type:1});case 2:(s=a.sent).result?(e.task_list=s.data.data,e.total=s.data.total,e.per_page=s.data.per_page,e.current_page=s.data.current_page):e.$message.error(s.msg);case 4:case"end":return a.stop()}},a,e)}))()},search1:function(t){this.getMemberList(t)},export1:function(){var t=this.fun.getRealPCUrl("plugin/SopTask/taskExport")+"&search[start_time]="+(this.date?this.date[0]:"")+"&search[end_time]="+(this.date?this.date[1]:"")+"&search[member_info]="+(this.search.member_info?this.search.member_info:"")+"&task_type=1&search[task_name]="+(this.search.task_name?this.search.task_name:"");console.log(t,"href"),this.download(t,"")},download:function(t,e){var a=document.createElement("a");a.download=e,a.href=t,a.click(),a.remove()},dialogDeleteTag:function(){this.dialogTag=!1},btnSwitchStatus:function(t,e,a){var s="1"==e?"是否重新开启任务":"是否手动结束任务";this.getDialogData(t,"plugin/SopTask/setTaskStatus",[s],"status","提示"),this.status_type=e+"",this.status_index=a},btnDelTask:function(t){this.getDialogData(t,"plugin/SopTask/delTask",["是否确定删除任务"],"deleted","提示")},btnCheck:function(t){this.getDialogData("","",t,"","标签")},getDialogData:function(t,e,a,s,i){this.dialog_task=!0,this.dialog_task_id=t+"",this.axios_url=e,this.dialog_text=a,this.dialog_name=s,this.title=i},closeStatus:function(t){"status"==t.name&&(this.task_list[this.status_index].is_open="1"===this.status_type?0:1),this.dialog_task=t.closeDelStatus},btnChecked:function(t){this.$router.push(this.fun.getUrl("memberSopDetail",{},{id:t}))},btnEditor:function(t){t?this.$router.push(this.fun.getUrl("memberSopEditor",{},{id:t})):this.$router.push(this.fun.getUrl("memberSopEditor",{},{}))}}},_=(a("kGux"),a("KHd+")),p=Object(_.a)(d,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"all"},[a("sop_manage_side",{attrs:{defaultActive:"memberSop"}}),t._v(" "),a("div",{staticStyle:{width:"calc(100% - 150px)"},attrs:{id:"app"}},[a("div",{staticClass:"news-sop"},[t._m(0),t._v(" "),a("div",{staticClass:"vue-search"},[a("el-form",{staticClass:"demo-form-inline",attrs:{inline:!0}},[a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"成员昵称/姓名/手机号"},model:{value:t.search.member_info,callback:function(e){t.$set(t.search,"member_info",e)},expression:"search.member_info"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"任务名称"},model:{value:t.search.task_name,callback:function(e){t.$set(t.search,"task_name",e)},expression:"search.task_name"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-date-picker",{attrs:{"value-format":"yyyy-MM-dd HH:mm:ss",type:"datetimerange","range-separator":"至","start-placeholder":"开始日期","end-placeholder":"结束日期"},model:{value:t.date,callback:function(e){t.date=e},expression:"date"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-button",{attrs:{type:"primary"},on:{click:function(e){t.search1(1)}}},[t._v("搜索")])],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-button",{attrs:{type:"plain"},on:{click:t.export1}},[t._v("导出")])],1)],1)],1)]),t._v(" "),a("div",{staticClass:"task-list"},[a("div",{staticClass:"vue-main-title"},[a("div",{staticClass:"vue-main-title-left"}),t._v(" "),a("div",{staticClass:"vue-main-title-content"},[t._v("任务列表"),a("span",{staticClass:"task-num"},[t._v("任务数量: "+t._s(t.total))])]),t._v(" "),a("div",{staticClass:"task-button"},[a("el-button",{attrs:{type:"primary",size:"small"},on:{click:function(e){t.btnEditor("")}}},[t._v("添加任务")])],1)]),t._v(" "),a("div",{staticClass:"table-box"},[a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.task_list}},[a("el-table-column",{attrs:{align:"center",prop:"created_at",label:"创建时间"}}),t._v(" "),a("el-table-column",{attrs:{align:"center",label:"创建人"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("div",{staticClass:"task-table-img"},[a("img",{attrs:{src:null!==e.row.has_one_member?e.row.has_one_member.avatar_image:"",alt:""}}),t._v(" "),a("span",[t._v(t._s(null!==e.row.has_one_member?e.row.has_one_member.nickname:""))])])]}}])}),t._v(" "),a("el-table-column",{attrs:{align:"center",prop:"executor",label:"执行者"},scopedSlots:t._u([{key:"default",fn:function(e){return t._l(e.row.execution_type,function(e,s){return a("div",{key:s},[t._v("\n                "+t._s(1==e?"关系链上级第一位成员":2==e?"首次添加企业微信成员":3==e?"随机抽选一位成员":"")+"\n              ")])})}}])}),t._v(" "),a("el-table-column",{attrs:{align:"center",prop:"name",label:"任务名称"}}),t._v(" "),a("el-table-column",{attrs:{align:"center",prop:"tag",label:"标签"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("span",{staticClass:"task-check",on:{click:function(a){t.btnCheck(e.row.task_set.tag_list)}}},[t._v("查看")])]}}])}),t._v(" "),a("el-table-column",{attrs:{align:"center",prop:"completed_total",label:"已完成"}}),t._v(" "),a("el-table-column",{attrs:{align:"center",prop:"incomplete_total",label:"未完成"}}),t._v(" "),a("el-table-column",{attrs:{align:"center",prop:"total",label:"任务总数"}}),t._v(" "),a("el-table-column",{attrs:{align:"center",prop:"status",label:"状态"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("div",{on:{click:function(a){t.btnSwitchStatus(e.row.id,e.row.is_open,e.$index)}}},[a("el-switch",{attrs:{"active-value":1,"inactive-value":0},model:{value:e.row.is_open,callback:function(a){t.$set(e.row,"is_open",a)},expression:"scope.row.is_open"}})],1)]}}])}),t._v(" "),a("el-table-column",{attrs:{align:"center",label:"操作"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-tooltip",{staticClass:"item",attrs:{effect:"dark",content:"查看",placement:"top"}},[a("i",{staticClass:"el-icon-view",on:{click:function(a){t.btnChecked(e.row.id)}}})]),t._v(" "),a("el-tooltip",{staticClass:"item",attrs:{effect:"dark",content:"编辑",placement:"top"}},[a("i",{staticClass:"el-icon-edit",staticStyle:{color:"#999"},on:{click:function(a){t.btnEditor(e.row.id)}}})]),t._v(" "),a("el-tooltip",{staticClass:"item",attrs:{effect:"dark",content:"删除",placement:"top"}},[a("i",{staticClass:"el-icon-delete-solid",on:{click:function(a){t.btnDelTask(e.row.id)}}})])]}}])})],1)],1)]),t._v(" "),t.total>0?a("div",{staticClass:"vue-page"},[a("el-row",[a("el-col",{attrs:{align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:t.total,"page-size":t.per_page,"current-page":t.current_page,background:""},on:{"current-change":t.search1}})],1)],1)],1):t._e()]),t._v(" "),a("task_dialog",{attrs:{title:t.title,dialog_name:t.dialog_name,status_type:t.status_type,dialog_del_status:t.dialog_task,dialog_id:t.dialog_task_id,axios_url:t.axios_url,dialog_text:t.dialog_text},on:{closeStatus:t.closeStatus}})],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"vue-main-title"},[e("div",{staticClass:"vue-main-title-left"}),this._v(" "),e("div",{staticClass:"vue-main-title-content"},[this._v("任务管理")])])}],!1,null,"4510394b",null);p.options.__file="member_sop.vue";e.default=p.exports},G3qG:function(t,e,a){"use strict";var s=a("Mg2o");a.n(s).a},GoBY:function(t,e,a){},Mg2o:function(t,e,a){},kGux:function(t,e,a){"use strict";var s=a("GoBY");a.n(s).a},mKY0:function(t,e,a){"use strict";var s=a("14Xm"),i=a.n(s),l=a("D3Ub"),n=a.n(l),o={props:{dialog_del_status:{type:Boolean,default:!1},dialog_id:{type:String,default:""},axios_url:{type:String,default:""},dialog_text:{type:Array,default:function(){return[]}},dialog_name:{type:String,default:""},title:{type:String,default:"提示"},status_type:{type:String,default:""}},data:function(){return{task_id:""}},mounted:function(){},methods:{determineDelTask:function(){var t=this;return n()(i.a.mark(function e(){var a;return i.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return console.log(t.dialog_id,t.axios_url,t.status_type,"dialog_id"),e.next=3,$http.pc_post(t.axios_url,{id:t.dialog_id,type:t.status_type});case 3:(a=e.sent).result?(t.$message.success(a.msg),location.reload()):t.$message.error(a.msg),t.$emit("closeStatus",{closeDelStatus:!1,name:""});case 6:case"end":return e.stop()}},e,t)}))()},closeDelStatus:function(){this.$emit("closeStatus",{closeDelStatus:!1,name:this.dialog_name})}}},r=(a("G3qG"),a("KHd+")),c=Object(r.a)(o,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{},[a("el-dialog",{attrs:{title:t.title,visible:t.dialog_del_status,width:"18%",center:"","show-close":!1,"close-on-click-modal":!1,"close-on-press-escape":!1},on:{"update:visible":function(e){t.dialog_del_status=e}}},[a("i",{staticClass:"el-icon-circle-close",on:{click:t.closeDelStatus}}),t._v(" "),t.dialog_name?a("div",{staticClass:"dialog-festival-card"},[t._v("\n      "+t._s(t.dialog_text[0])+"\n    ")]):t._e(),t._v(" "),t.dialog_name?t._e():a("div",{staticClass:"dialog-tag-card",staticStyle:{"justify-content":"normal"}},t._l(t.dialog_text,function(e,s){return a("span",{key:s,staticClass:"dialog-tag-item",staticStyle:{margin:"0 10px 10px 10px","text-align":"center"}},[t._v(t._s(e.name?e.name:e.holiday_name))])})),t._v(" "),t.dialog_name?a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:t.closeDelStatus}},[t._v("取 消")]),t._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:t.determineDelTask}},[t._v("确 定")])],1):t._e()])],1)},[],!1,null,"cabc8e40",null);c.options.__file="task_dialog.vue";e.a=c.exports}}]);