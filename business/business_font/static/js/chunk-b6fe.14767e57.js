(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-b6fe"],{"30Mt":function(t,e,n){},"4YjH":function(t,e,n){"use strict";var s=n("t+g3");n.n(s).a},"61jh":function(t,e,n){"use strict";n.r(e);var s={props:["tableData"],data:function(){return{}},methods:{handleClick:function(t){var e=this;this.$prompt("请输入手机号","企业转让",{confirmButtonText:"确定",cancelButtonText:"取消",inputType:""}).then(function(t){var n=t.value;console.log(n),$http.pc_get("admin/changeBusinessOwner",{business_id:e.$route.query.business_id,mobile:n},"loading").then(function(t){1===t.result&&(e.userList=t.data.list)})}).catch(function(){})},deleteIt:function(t){var e=this;this.$confirm("确定删除吗","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){$http.pc_get("admin/deleteManager",{business_id:e.$route.query.business_id,id:t.id},"loading").then(function(t){1===t.result?(e.currentChange(1),e.$message({type:"success",message:"删除成功!"})):t.msg&&e.$message.error(t.msg)})}).catch(function(){})}}},a=(n("dCL5"),n("KHd+")),i=Object(a.a)(s,function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{attrs:{id:"businessList"}},[[n("el-table",{staticStyle:{width:"100%"},attrs:{data:t.tableData}},[n("el-table-column",{attrs:{prop:"avatar",label:"用户头像"},scopedSlots:t._u([{key:"default",fn:function(t){return[n("img",{staticClass:"avatar",attrs:{src:t.row.avatar,alt:""}})]}}])}),t._v(" "),n("el-table-column",{attrs:{prop:"nickname",label:"用户昵称"}}),t._v(" "),n("el-table-column",{attrs:{prop:"realname",label:"姓名"}}),t._v(" "),n("el-table-column",{attrs:{prop:"identity_desc",label:"身份"}}),t._v(" "),n("el-table-column",{attrs:{prop:"name",label:"操作"},scopedSlots:t._u([{key:"default",fn:function(e){return[n("el-button",{attrs:{type:"primary",size:"small"},on:{click:function(n){t.handleClick(e.row)}}},[t._v("转让")]),t._v(" "),n("el-button",{attrs:{type:"danger",size:"small"},on:{click:function(n){t.deleteIt(e.row)}}},[t._v("删除")])]}}])})],1)]],2)},[],!1,null,"7c2294a3",null);i.options.__file="businessList.vue";var l={data:function(){return{userList:[]}},mounted:function(){this.getData()},methods:{getData:function(){var t=this;$http.pc_get("admin/managerList",{business_id:this.$route.query.business_id},"loading").then(function(e){1===e.result&&(t.userList=e.data.list)})},handleClick:function(t){var e=this;this.$prompt("请输入手机号","企业转让",{confirmButtonText:"确定",cancelButtonText:"取消",inputType:""}).then(function(t){var n=t.value;$http.pc_get("admin/changeBusinessOwner",{business_id:e.$route.query.business_id,mobile:n},"loading").then(function(t){1===t.result?(e.getData(),e.$message({type:"success",message:"转让成功!"})):t.msg&&e.$message.error(t.msg)})}).catch(function(){})},deleteIt:function(t){var e=this;this.$confirm("确定删除吗","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){$http.pc_get("admin/deleteManager",{business_id:e.$route.query.business_id,id:t.id},"loading").then(function(t){1===t.result?(e.getData(),e.$message({type:"success",message:"删除成功!"})):t.msg&&e.$message.error(t.msg)})}).catch(function(){})},open:function(){var t=this;this.$prompt("请输入手机号","添加管理员",{confirmButtonText:"确定",cancelButtonText:"取消",inputType:""}).then(function(e){var n=e.value;console.log(n),$http.pc_get("admin/addManager",{business_id:t.$route.query.business_id,mobile:n},"loading").then(function(e){1===e.result?(t.getData(),t.$message({type:"success",message:"添加成功!"})):e.msg&&t.$message.error(e.msg)})}).catch(function(){})}},components:{b_list:i.exports}},r=(n("4YjH"),Object(a.a)(l,function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"people"},[n("el-main",[n("div",{staticClass:"conterMain"},[n("div",{staticClass:"centerHead"},[n("div",{staticStyle:{display:"flex",height:"17px"}},[n("div",{staticClass:"message-top-title"}),t._v("\n          企业名称 > 管理员\n        ")]),t._v(" "),n("el-button",{attrs:{type:"primary",plain:""},on:{click:t.open}},[t._v("+添加管理员")])],1),t._v(" "),n("div",{attrs:{id:"businessList"}},[[n("el-table",{staticStyle:{width:"100%"},attrs:{data:t.userList}},[n("el-table-column",{attrs:{prop:"avatar",label:"用户头像"},scopedSlots:t._u([{key:"default",fn:function(t){return[n("img",{staticClass:"avatar",attrs:{src:t.row.avatar,alt:""}})]}}])}),t._v(" "),n("el-table-column",{attrs:{prop:"nickname",label:"用户昵称"}}),t._v(" "),n("el-table-column",{attrs:{prop:"realname",label:"姓名"}}),t._v(" "),n("el-table-column",{attrs:{prop:"identity_desc",label:"身份"}}),t._v(" "),n("el-table-column",{attrs:{label:"操作"},scopedSlots:t._u([{key:"default",fn:function(e){return[Number(e.row.identity)>2?n("el-button",{attrs:{type:"primary",size:"small"},on:{click:function(n){t.handleClick(e.row)}}},[t._v("转让")]):t._e(),t._v(" "),Number(e.row.identity)<=2?n("el-button",{attrs:{type:"danger",size:"small"},on:{click:function(n){t.deleteIt(e.row)}}},[t._v("删除")]):t._e()]}}])})],1)]],2)])])],1)},[],!1,null,"636eb35e",null));r.options.__file="business_people.vue";e.default=r.exports},dCL5:function(t,e,n){"use strict";var s=n("30Mt");n.n(s).a},"t+g3":function(t,e,n){}}]);