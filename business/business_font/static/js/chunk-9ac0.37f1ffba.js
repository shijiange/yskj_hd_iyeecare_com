(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-9ac0"],{"1p6a":function(t,e,n){"use strict";var a=n("yFsL");n.n(a).a},xS5M:function(t,e,n){"use strict";n.r(e);var a=n("bS4n"),s=n.n(a),r=n("8t5x"),i={data:function(){return{list:[],pageSize:0,current_page:0,total:0,name:""}},created:function(){this.$store.dispatch("GetUserInfo"),this.currentChange(1)},computed:s()({},Object(r.b)(["signUserData"])),mounted:function(){},methods:{toSealDetail:function(t){this.$router.push(this.fun.getUrl("sealCompany",{id:t}))},setDefault:function(t,e){var n=this;t&&$http.post("plugin.yun-sign.frontend.company-seal.set-default",{id:e},"loading").then(function(t){1===t.result?(n.$message.success("设置成功"),n.currentChange(n.current_page)):t.msg&&n.$message.error(t.msg)}).catch(function(t){console.log(t)})},deleteIt:function(t){var e=this;$http.post("plugin.yun-sign.frontend.company-seal.delete-seal",{id:t},"loading").then(function(t){1===t.result?(e.currentChange(e.current_page),e.$message.success("删除成功")):t.msg&&e.$message.error(t.msg)}).catch(function(t){console.log(t)})},currentChange:function(t){var e=this;$http.post("plugin.yun-sign.frontend.company-seal.get-list",{page:t,search:{name:this.name}},"loading").then(function(t){1===t.result?(e.total=t.data.total,e.pageSize=t.data.per_page,e.list=t.data.data,e.current_page=t.data.current_page):(e.list=[],-1===t.data.status&&e.currentChange(1),e.$message.error(t.msg)),e.loading=!1}).catch(function(t){e.loading=!1,console.error(t)})},toCreateSeal:function(){this.$router.push(this.fun.getUrl("createCompanySeal"))},stopUse:function(t){var e=this,n=0===t.status?"启用":"禁用";this.$confirm("确定"+n+"吗","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){$http.get("plugin.yun-sign.frontend.company-seal.change-status",{id:t.id,status:1==t.status?0:1},"正在"+n).then(function(t){1===t.result?(e.currentChange(e.current_page),e.$message({type:"success",message:n+"成功!"})):e.$message.error({message:t.msg})}).catch(function(t){console.error(t),e.$message.error({type:"success",message:n+"失败!"})})}).catch(function(){e.$message({type:"info",message:"已取消"+n})})}}},l=(n("1p6a"),n("ZrdR")),o=Object(l.a)(i,function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{attrs:{id:"sign"}},[n("div",[t._m(0),t._v(" "),n("el-form",{attrs:{inline:!0}},[n("el-row",[n("el-col",{attrs:{span:18}},[n("el-form-item",[n("el-input",{staticStyle:{width:"400px"},attrs:{placeholder:"请输入印章名称"},on:{keyup:function(e){if(!("button"in e)&&t._k(e.keyCode,"enter",13,e.key,"Enter"))return null;t.currentChange(1)}},model:{value:t.name,callback:function(e){t.name=e},expression:"name"}})],1)],1),t._v(" "),n("el-col",{attrs:{span:6,align:"right"}},[n("el-form-item",[n("el-button",{attrs:{type:"primary",icon:"el-icon-search"},on:{click:function(e){t.currentChange(1)}}},[t._v("搜索\n            ")]),t._v(" "),t.signUserData&&1==t.signUserData.is_legal?n("el-button",{staticStyle:{height:"35px"},attrs:{type:"primary",icon:"el-icon-plus"},on:{click:t.toCreateSeal}},[t._v("新增企业印章")]):t._e()],1)],1)],1)],1)],1),t._v(" "),n("div",{staticClass:"box"},[n("div",{staticClass:"template-box"},[n("el-table",{staticStyle:{width:"100%"},attrs:{data:t.list,"empty-text":"暂无印章"}},[n("el-table-column",{attrs:{label:"印章",width:"170"},scopedSlots:t._u([{key:"default",fn:function(t){return[n("img",{staticStyle:{width:"100px",height:"100px"},attrs:{src:t.row.seal_url,alt:""}})]}}])}),t._v(" "),n("el-table-column",{attrs:{prop:"name",label:"印章名称"}}),t._v(" "),n("el-table-column",{attrs:{prop:"created_at",label:"创建时间",width:"170"}}),t._v(" "),n("el-table-column",{attrs:{label:"状态",prop:"status_desc",width:"120"}}),t._v(" "),n("el-table-column",{attrs:{label:"默认印章",prop:"is_default",width:"120"},scopedSlots:t._u([{key:"default",fn:function(e){return[t._v("\n            "+t._s(1==e.row.is_default?"是":"否")+"\n          ")]}}])}),t._v(" "),n("el-table-column",{attrs:{label:"是否默认",width:"100"},scopedSlots:t._u([{key:"default",fn:function(e){return[n("el-switch",{on:{change:function(n){t.setDefault(n,e.row.id)}},model:{value:1==e.row.is_default,callback:function(n){t.$set(e.row,"is_default == 1 ? true:false",n)},expression:"scope.row.is_default == 1 ? true:false"}})]}}])}),t._v(" "),n("el-table-column",{attrs:{label:"操作",width:"350"},scopedSlots:t._u([{key:"default",fn:function(e){return[n("el-button",{attrs:{size:"mini",type:"primary"},on:{click:function(n){t.toSealDetail(e.row.id)}}},[t._v("查看")]),t._v(" "),1==e.row.status?n("el-button",{attrs:{size:"mini",type:"info"},on:{click:function(n){t.stopUse(e.row)}}},[t._v("禁用")]):t._e(),t._v(" "),1!=e.row.status?n("el-button",{attrs:{size:"mini",type:"success"},on:{click:function(n){t.stopUse(e.row)}}},[t._v("启用\n            ")]):t._e(),t._v(" "),n("el-button",{attrs:{size:"mini",type:"danger"},on:{click:function(n){t.deleteIt(e.row.id)}}},[t._v("删除")])]}}])})],1)],1),t._v(" "),n("el-col",{staticStyle:{padding:"15px 5% 15px 0"},attrs:{span:24,align:"right"}},[n("el-pagination",{attrs:{layout:"prev, pager, next","current-page":t.current_page,"page-size":t.pageSize,total:t.total,background:""},on:{"current-change":t.currentChange,"update:currentPage":function(e){t.current_page=e}}})],1)],1)])},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"title"},[e("span",{staticClass:"line"}),this._v("企业印章：")])}],!1,null,"a5d011b6",null);o.options.__file="company_seal_list.vue";e.default=o.exports},yFsL:function(t,e,n){}}]);