(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-51e6"],{AokY:function(e,t,a){"use strict";var i=a("dLsp");a.n(i).a},dLsp:function(e,t,a){},w3Jw:function(e,t,a){"use strict";a.r(t);var i={data:function(){return{list:[],summary:{},times:[],search_form:{id:"",user_kwd:"",invitor_kwd:"",join_scene:""},group_id:"",current_id:0,rules:{},member_type:"2",current_page:1,total:1,per_page:1}},created:function(){},mounted:function(){this.group_id=this.$route.query.group_id,this.getData(1)},components:{group_chat_side:a("NUmi").a},methods:{getData:function(e){var t=this,a={page:e,group_id:this.group_id,id:this.search_form.id,user_kwd:this.search_form.user_kwd,invitor_kwd:this.search_form.invitor_kwd,join_scene:this.search_form.join_scene};this.times&&this.times.length>0&&(a.start_time=this.times[0],a.end_time=this.times[1]),$http.pc_post("plugin/GroupDevelopUser/getGroupEmployees",a,"loading").then(function(e){e.result?(t.list=e.data.list.data,t.current_page=e.data.list.current_page,t.total=e.data.list.total,t.per_page=e.data.list.per_page,t.summary=e.data.summary):t.$message({message:e.msg,type:"error"})},function(e){t.$message({message:e.msg,type:"error"})})},search:function(e){this.getData(e)},export1:function(){var e={};e.group_id=this.group_id,this.search_form.id&&(e.id=this.search_form.id),this.search_form.user_kwd&&(e.user_kwd=this.search_form.user_kwd),this.search_form.invitor_kwd&&(e.invitor_kwd=this.search_form.invitor_kwd),this.search_form.join_scene&&(e.join_scene=this.search_form.join_scene),this.times&&this.times.length>0&&(e.start_time=this.times[0],e.end_time=this.times[1]);var t=this.fun.getRealPCUrl("plugin/GroupDevelopUser/groupEmployeeListExport",e);this.download(t,"")},download:function(e,t){var a=document.createElement("a");a.download=t,a.href=e,a.click(),a.remove()},handleClick:function(e){1==e&&this.$router.push(this.fun.getUrl("groupChatMember",{},{group_id:this.group_id}))}}},s=(a("AokY"),a("ZrdR")),r=Object(s.a)(i,function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"all"},[a("group_chat_side"),e._v(" "),a("div",{attrs:{id:"app"}},[a("div",{staticClass:"vue-head"},[a("el-radio-group",{model:{value:e.member_type,callback:function(t){e.member_type=t},expression:"member_type"}},[a("el-radio-button",{attrs:{label:"1"},nativeOn:{click:function(t){e.handleClick(1)}}},[e._v("外部成员")]),e._v(" "),a("el-radio-button",{attrs:{label:"2"},nativeOn:{click:function(t){e.handleClick(2)}}},[e._v("内部成员")])],1)],1),e._v(" "),a("div",{staticClass:"vue-head"},[e._m(0),e._v(" "),a("div",{staticClass:"vue-search"},[a("el-form",{staticClass:"demo-form-inline",attrs:{inline:!0,model:e.search_form}},[a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"成员ID"},model:{value:e.search_form.id,callback:function(t){e.$set(e.search_form,"id",t)},expression:"search_form.id"}})],1),e._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"成员信息"},model:{value:e.search_form.user_kwd,callback:function(t){e.$set(e.search_form,"user_kwd",t)},expression:"search_form.user_kwd"}})],1),e._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"邀请人信息"},model:{value:e.search_form.invitor_kwd,callback:function(t){e.$set(e.search_form,"invitor_kwd",t)},expression:"search_form.invitor_kwd"}})],1),e._v(" "),a("el-select",{attrs:{clearable:"",placeholder:"入群方式"},model:{value:e.search_form.join_scene,callback:function(t){e.$set(e.search_form,"join_scene",t)},expression:"search_form.join_scene"}},[a("el-option",{attrs:{label:"直接邀请入群",value:"1"}}),e._v(" "),a("el-option",{attrs:{label:"邀请链接入群",value:"2"}}),e._v(" "),a("el-option",{attrs:{label:"扫描群二维码入群",value:"3"}})],1),e._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-date-picker",{staticStyle:{"margin-left":"5px"},attrs:{type:"datetimerange","value-format":"yyyy-MM-dd HH:mm:ss","range-separator":"至","start-placeholder":"开始时间","end-placeholder":"结束时间",align:"right"},model:{value:e.times,callback:function(t){e.times=t},expression:"times"}})],1),e._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-button",{attrs:{type:"primary"},on:{click:function(t){e.search(1)}}},[e._v("搜索")]),e._v(" "),a("el-button",{on:{click:e.export1}},[e._v("导出")])],1)],1)],1)]),e._v(" "),a("div",{staticClass:"vue-main"},[a("div",{staticClass:"vue-main-form"},[a("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[a("div",{staticClass:"vue-main-title-left"}),e._v(" "),a("div",{staticClass:"vue-main-title-content",staticStyle:{flex:"0 0 130px"}},[e._v("群内部成员列表")]),e._v(" "),a("div",{staticStyle:{"text-align":"left","font-size":"14px",color:"#999"}},[a("span",[e._v("历史内部成员总数："+e._s(e.total))]),e._v("   \n            "),a("span",[e._v("当前内部成员数量："+e._s(e.summary.in_group_count))]),e._v(" \n          ")]),e._v(" "),a("div",{staticClass:"vue-main-title-button"})]),e._v(" "),a("el-table",{staticStyle:{width:"100%"},attrs:{data:e.list}},[a("el-table-column",{attrs:{label:"成员ID",align:"center",prop:"id",width:"100"}}),e._v(" "),a("el-table-column",{attrs:{label:"加入时间",align:"center",width:"150",prop:"join_time_str"}}),e._v(" "),a("el-table-column",{attrs:{label:"状态",align:"center",prop:"status_desc"}}),e._v(" "),a("el-table-column",{attrs:{label:"成员信息",align:"center",prop:"has_one_customer"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("div",[t.row.has_one_employee?a("div",[a("div",[a("img",{staticStyle:{width:"30px",height:"30px",padding:"1px",border:"1px solid #ccc"},attrs:{src:t.row.has_one_employee.avatar_mediaid}})]),e._v(" "),t.row.has_one_employee.name?a("div",[e._v("\n                    "+e._s(t.row.has_one_employee.name)+"\n                  ")]):a("div",[e._v("\n                    未更新\n                  ")])]):a("div",[e._v("\n                  未更新\n                ")])])]}}])}),e._v(" "),a("el-table-column",{attrs:{label:"入群方式",align:"center",prop:"join_scene_desc"}}),e._v(" "),a("el-table-column",{attrs:{label:"邀请人",align:"center",prop:"has_one_invitor"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("div",[t.row.has_one_invitor?a("div",[a("div",[a("img",{staticStyle:{width:"30px",height:"30px",padding:"1px",border:"1px solid #ccc"},attrs:{src:t.row.has_one_invitor.avatar_mediaid}})]),e._v(" "),a("div",[e._v("\n                    "+e._s(t.row.has_one_invitor.name)+"\n                  ")])]):e._e()])]}}])})],1)],1)]),e._v(" "),e.total>0?a("div",{staticClass:"vue-page"},[a("el-row",[a("el-col",{attrs:{align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:e.total,"page-size":e.per_page,"current-page":e.current_page,background:""},on:{"current-change":e.search}})],1)],1)],1):e._e()])],1)},[function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[t("div",{staticClass:"vue-main-title-left"}),this._v(" "),t("div",{staticClass:"vue-main-title-content"},[this._v("群拓客 > 群成员")])])}],!1,null,"02c7a24b",null);r.options.__file="group_employee.vue";t.default=r.exports}}]);