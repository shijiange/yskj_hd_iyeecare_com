(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-a934"],{"+swa":function(t,e,a){},FU51:function(t,e,a){"use strict";var n=a("+swa");a.n(n).a},I17m:function(t,e,a){"use strict";a.r(e);var n={data:function(){return{list2:[],dialogTableVisible:!1,search:{name:"",id:""},list:[],pageSize:0,current_page:0,total:0,loading:!1,showDialog:!1,redirect:void 0}},components:{},created:function(){this.$store.dispatch("GetUserInfo"),this.currentChange(1)},destroyed:function(){},methods:{open:function(t){this.list2=t.auth_worker_list,this.dialogTableVisible=!0,console.log(t)},toAdd:function(){this.$router.push(this.fun.getUrl("create_template"))},currentChange:function(t){var e=this;$http.post("plugin.yun-sign.frontend.template.get-list",{page:t,name:this.search.name,id:this.search.id},"loading").then(function(t){1===t.result?(e.total=t.data.total,e.pageSize=t.data.per_page,e.list=t.data.data,e.current_page=t.data.current_page):(e.list=[],-1===t.data.status&&e.currentChange(1),e.$message.error(t.msg)),e.loading=!1}).catch(function(t){e.loading=!1,console.error(t)})},toDetail:function(t){this.$router.push(this.fun.getUrl("create_template",{},{id:t.id}))},deleteIt:function(t){var e=this;$http.post("plugin.yun-sign.frontend.template.delete-template",{id:t},"loading").then(function(t){1===t.result?(e.currentChange(e.current_page),e.$message.success("删除成功")):t.msg&&e.$message.error(t.msg)}).catch(function(t){console.log(t)})},stopUse:function(t){var e=this,a=0===t.status?"启用":"禁用";this.$confirm("确定"+a+"吗","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){$http.get("plugin.yun-sign.frontend.template.change-status",{id:t.id,status:1==t.status?0:1},"正在"+a).then(function(t){1===t.result?(e.currentChange(1),e.$message({type:"success",message:a+"成功!"})):e.$message.error({message:t.msg})}).catch(function(t){console.error(t),e.$message.error({type:"success",message:a+"失败!"})})}).catch(function(){e.$message({type:"info",message:"已取消"+a})})}}},s=(a("FU51"),a("KHd+")),i=Object(s.a)(n,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"right"},[t._m(0),t._v(" "),a("el-form",{ref:"search",attrs:{inline:!0,model:t.search}},[a("el-row",[a("el-col",{attrs:{span:18}},[a("el-form-item",[a("el-input",{staticStyle:{width:"300px"},attrs:{placeholder:"请输入模版名称"},model:{value:t.search.name,callback:function(e){t.$set(t.search,"name",e)},expression:"search.name"}})],1),t._v(" "),a("el-form-item",[a("el-input",{staticStyle:{width:"300px"},attrs:{placeholder:"请输入模版id"},model:{value:t.search.id,callback:function(e){t.$set(t.search,"id",e)},expression:"search.id"}})],1)],1),t._v(" "),a("el-col",{attrs:{span:6,align:"right"}},[a("el-form-item",[a("el-button",{attrs:{type:"primary",icon:"el-icon-search"},on:{click:function(e){t.currentChange(1)}}},[t._v("查询\n          ")])],1),t._v(" "),a("el-form-item",[a("el-button",{attrs:{type:"primary",icon:"el-icon-plus"},on:{click:t.toAdd}},[t._v("新增模版\n          ")])],1)],1)],1)],1),t._v(" "),a("div",{staticClass:"content"},[a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.list,"empty-text":"暂无合同"}},[a("el-table-column",{attrs:{prop:"id",label:"id",width:"110"}}),t._v(" "),a("el-table-column",{attrs:{align:"center",prop:"name",label:"模版名称"}}),t._v(" "),a("el-table-column",{attrs:{prop:"created_user",width:"200",label:"创建人"}}),t._v(" "),a("el-table-column",{attrs:{prop:"created_at",width:"200",label:"更新时间"}}),t._v(" "),a("el-table-column",{attrs:{width:"110",prop:"status_desc",label:"状态"}}),t._v(" "),a("el-table-column",{attrs:{label:"操作",width:"300"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-button",{attrs:{size:"mini",type:"danger"},on:{click:function(a){t.deleteIt(e.row.id)}}},[t._v("删除")]),t._v(" "),a("el-button",{attrs:{size:"mini",type:"primary"},on:{click:function(a){t.toDetail(e.row)}}},[t._v("编辑")]),t._v(" "),1==e.row.status?a("el-button",{attrs:{size:"mini",type:"info"},on:{click:function(a){t.stopUse(e.row)}}},[t._v("禁用")]):t._e(),t._v(" "),1!=e.row.status?a("el-button",{attrs:{size:"mini",type:"success"},on:{click:function(a){t.stopUse(e.row)}}},[t._v("启用")]):t._e()]}}])})],1)],1),t._v(" "),a("el-dialog",{attrs:{title:"授权员工信息",visible:t.dialogTableVisible},on:{"update:visible":function(e){t.dialogTableVisible=e}}},[a("div",{staticStyle:{margin:"30px 0"}},[a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.list2}},[a("el-table-column",{attrs:{prop:"name",label:"姓名",align:"center"}}),t._v(" "),a("el-table-column",{attrs:{prop:"tel",label:"手机号",align:"center"}})],1)],1)]),t._v(" "),a("el-col",{staticStyle:{padding:"15px 5% 15px 0"},attrs:{span:24,align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next","current-page":t.current_page,"page-size":t.pageSize,total:t.total,background:""},on:{"current-change":t.currentChange,"update:currentPage":function(e){t.current_page=e}}})],1)],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"green-title-box"},[e("span",{staticClass:"green-title-line"}),this._v("模板列表")])}],!1,null,"63adffb2",null);i.options.__file="template_manage.vue";e.default=i.exports}}]);