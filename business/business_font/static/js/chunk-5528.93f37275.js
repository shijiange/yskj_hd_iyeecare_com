(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-5528"],{bXcL:function(t,e,n){"use strict";n.r(e);var a=n("bS4n"),c=n.n(a);window.isFirst=0;var r={name:"PlatformManage",data:function(){return{search:{contract_name:"",joiner_name:"",account_name:"",template_name:"",status:""},contract_type:"",contract_type_title:"",list:[],pageSize:0,current_page:0,total:0,loading:!1,showDialog:!1}},created:function(){this.$store.dispatch("GetUserInfo"),"Manage"==this.$route.name?(this.contract_type=2,this.contract_type_title="我收到的"):"copy"==this.$route.name?(this.contract_type=3,this.contract_type_title="抄送我的"):"company"==this.$route.name?(this.contract_type=4,this.contract_type_title="公司"):(this.contract_type=1,this.contract_type_title="我发起的"),this.currentChange(1)},destroyed:function(){},methods:{toAdd:function(){this.$router.push(this.fun.getUrl("create_sign",{id:-1}))},downpdf:function(t){window.open(t.download_url)},toSign:function(t,e){"check"==e||2==this.contract_type?this.$router.push(this.fun.getUrl("sign_contract",{id:t.id})):1==this.contract_type&&(t.status<1?t.template_id?this.$router.push(this.fun.getUrl("create_sign",{id:t.id},{template_id:t.template_id})):this.$router.push(this.fun.getUrl("create_sign",{id:-1},{template_id:t.id})):4==t.status&&t.is_edit?t.template_id?this.$router.push(this.fun.getUrl("create_sign",{id:t.id},{template_id:t.template_id})):this.$router.push(this.fun.getUrl("create_sign",{id:-1},{template_id:t.id})):this.$router.push(this.fun.getUrl("sign_contract",{id:t.id})))},currentChange:function(t){var e=this;0===window.isFirst&&(this.loading=!0),$http.post("plugin.yun-sign.frontend.contract.get-list",{page:t,search:c()({contract_type:this.contract_type},this.search)},"loading").then(function(t){1===t.result?(e.total=t.data.list.total,e.pageSize=t.data.list.per_page,e.list=t.data.list.data,e.current_page=t.data.list.current_page):(e.list=[],-1===t.data.status&&e.currentChange(1),e.$message.error(t.msg)),window.isFirst=1,e.loading=!1}).catch(function(t){e.loading=!1,console.error(t)})},stopUse:function(t){var e=this;this.$confirm("确定取消吗","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){$http.get("plugin.yun-sign.frontend.contract.cancel",{id:t.id},"正在取消").then(function(t){1===t.result?(e.currentChange(1),e.$message({type:"success",message:"取消成功!"})):t.msg&&e.$message.error(t.msg)}).catch(function(t){console.error(t),e.$message.error({type:"success",message:"取消失败!"})})}).catch(function(){})},deleteIt:function(t){var e=this;this.$confirm("确定删除吗","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){$http.get("plugin.yun-sign.frontend.contract.delete-contract",{contract_id:t.id},"正在删除").then(function(t){1===t.result?(e.currentChange(1),e.$message({type:"success",message:"删除成功!"})):t.msg&&e.$message.error(t.msg)}).catch(function(t){console.error(t),e.$message.error({type:"success",message:"删除失败!"})})}).catch(function(){})}}},s=(n("sbHq"),n("ZrdR")),i=Object(s.a)(r,function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"right"},[n("div",{staticClass:"green-title-box"},[n("span",{staticClass:"green-title-line"}),t._v(t._s(t.contract_type_title)+"合同列表")]),t._v(" "),n("el-form",{ref:"search",attrs:{inline:!0,model:t.search}},[n("el-form-item",[n("el-input",{staticStyle:{width:"300px"},attrs:{placeholder:"请输入合同名称"},model:{value:t.search.contract_name,callback:function(e){t.$set(t.search,"contract_name",e)},expression:"search.contract_name"}})],1),t._v(" "),n("el-form-item",[n("el-input",{staticStyle:{width:"300px"},attrs:{placeholder:"请输入参与人姓名"},model:{value:t.search.joiner_name,callback:function(e){t.$set(t.search,"joiner_name",e)},expression:"search.joiner_name"}})],1),t._v(" "),4==t.contract_type?n("el-form-item",[n("el-input",{staticStyle:{width:"300px"},attrs:{placeholder:"请输入发起人姓名"},model:{value:t.search.account_name,callback:function(e){t.$set(t.search,"account_name",e)},expression:"search.account_name"}})],1):t._e(),t._v(" "),n("el-form-item",[n("el-input",{staticStyle:{width:"300px"},attrs:{placeholder:"请输入模板名称"},model:{value:t.search.template_name,callback:function(e){t.$set(t.search,"template_name",e)},expression:"search.template_name"}})],1),t._v(" "),n("el-form-item",[n("el-select",{attrs:{clearable:"",placeholder:"状态"},model:{value:t.search.status,callback:function(e){t.$set(t.search,"status",e)},expression:"search.status"}},[n("el-option",{attrs:{label:"填写中",value:0}}),t._v(" "),n("el-option",{attrs:{label:"签署中",value:1}}),t._v(" "),n("el-option",{attrs:{label:"已完成",value:2}}),t._v(" "),n("el-option",{attrs:{label:"已撤回",value:3}}),t._v(" "),n("el-option",{attrs:{label:"已超时",value:4}}),t._v(" "),n("el-option",{attrs:{label:"已过期",value:5}}),t._v(" "),n("el-option",{attrs:{label:"已取消",value:6}})],1)],1),t._v(" "),n("el-form-item",[n("el-button",{attrs:{type:"primary",icon:"el-icon-search"},on:{click:function(e){t.currentChange(1)}}},[t._v("搜索\n      ")]),t._v(" "),n("el-button",{attrs:{type:"primary",plain:"",icon:"el-icon-plus"},on:{click:t.toAdd}},[t._v("发起签署\n      ")])],1)],1),t._v(" "),n("div",{staticClass:"content"},[n("el-table",{staticStyle:{width:"100%"},attrs:{data:t.list,"empty-text":"暂无合同"}},[n("el-table-column",{attrs:{prop:"name",width:"150",label:"合同名称"}}),t._v(" "),n("el-table-column",{attrs:{prop:"created_at",width:"180",label:"发起时间"}}),t._v(" "),n("el-table-column",{attrs:{prop:"contract_end_date",width:"150",label:"合同到期时间"}}),t._v(" "),n("el-table-column",{attrs:{prop:"account_name",width:"110",label:"发起人"}}),t._v(" "),n("el-table-column",{attrs:{prop:"has_many_role",label:"参与人"},scopedSlots:t._u([{key:"default",fn:function(e){return t._l(e.row.has_many_role,function(a,c){return n("span",{key:a.id},[t._v(t._s(a.name)+"\n            "),c<e.row.has_many_role.length-1?n("em",[t._v("，\n            ")]):t._e()])})}}])}),t._v(" "),n("el-table-column",{attrs:{label:"状态",prop:"status_desc",width:"110"}}),t._v(" "),n("el-table-column",{attrs:{label:"操作",width:1==t.contract_type?300:150},scopedSlots:t._u([{key:"default",fn:function(e){return[2==t.contract_type||1==t.contract_type?n("el-button",{attrs:{size:"mini",type:"primary"},on:{click:function(n){t.toSign(e.row)}}},[t._v("签署")]):t._e(),t._v(" "),t.contract_type&&3!=t.contract_type?n("el-button",{attrs:{size:"mini",type:"primary"},on:{click:function(n){t.downpdf(e.row)}}},[t._v("下载")]):t._e(),t._v(" "),1==t.contract_type?n("el-button",{attrs:{size:"mini",type:"info"},on:{click:function(n){t.stopUse(e.row)}}},[t._v("取消")]):t._e(),t._v(" "),1==t.contract_type?n("el-button",{attrs:{size:"mini",type:"danger"},on:{click:function(n){t.deleteIt(e.row)}}},[t._v("删除")]):t._e(),t._v(" "),3==t.contract_type||4==t.contract_type?n("el-button",{attrs:{size:"mini",type:"success"},on:{click:function(n){t.toSign(e.row,"check")}}},[t._v("查看")]):t._e()]}}])})],1)],1),t._v(" "),n("el-col",{staticStyle:{padding:"15px 5% 15px 0"},attrs:{span:24,align:"right"}},[n("el-pagination",{attrs:{layout:"prev, pager, next","current-page":t.current_page,"page-size":t.pageSize,total:t.total,background:""},on:{"current-change":t.currentChange,"update:currentPage":function(e){t.current_page=e}}})],1)],1)},[],!1,null,"6db94570",null);i.options.__file="index.vue";e.default=i.exports},fqCH:function(t,e,n){},sbHq:function(t,e,n){"use strict";var a=n("fqCH");n.n(a).a}}]);