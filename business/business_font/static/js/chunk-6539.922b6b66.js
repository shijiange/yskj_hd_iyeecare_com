(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-6539"],{"0sIj":function(t,e,n){},HIkJ:function(t,e,n){"use strict";n.r(e);var r={data:function(){return{search:{title:""},form:{title:"",content:""},list:[],pageSize:0,current_page:0,total:0,dialogTableVisible:!1,rules:{}}},created:function(){this.$store.dispatch("GetUserInfo"),this.currentChange(1)},destroyed:function(){},methods:{currentChange:function(t){var e=this;$http.post("plugin.yun-chat.frontend.common-reply.get-list",{page:t,title:this.search.title},"loading").then(function(t){1===t.result?(e.total=t.data.total,e.pageSize=t.data.per_page,e.list=t.data.data,e.current_page=t.data.current_page):(e.list=[],-1===t.data.status&&e.currentChange(1),e.$message.error(t.msg))}).catch(function(t){console.error(t)})},add:function(){this.dialogTableVisible=!0,this.clearForm()},edit:function(t){this.dialogTableVisible=!0,this.form={id:t.id,title:t.title,content:t.content}},clear:function(){this.dialogTableVisible=!1,this.clearForm()},clearForm:function(){this.form={title:"",content:""}},sureSave:function(){var t=this;if(this.form.title)if(this.form.content){var e={title:this.form.title,reply_content:this.form.content};this.form.id&&(e.id=this.form.id),$http.get("plugin.yun-chat.frontend.common-reply.save",e).then(function(e){1===e.result?(t.dialogTableVisible=!1,t.clearForm(),t.currentChange(t.current_page),t.$message.success(e.msg)):t.$message.error(e.msg)}).catch(function(t){console.error(t)})}else this.$message.error("请输入内容");else this.$message.error("请输入标题")},del:function(t){var e=this;this.$confirm("确定删除吗","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){$http.post("plugin.yun-chat.frontend.common-reply.delete",{id:t},"loading").then(function(t){1===t.result?(e.$message.success("删除成功"),e.currentChange(e.current_page)):t.msg&&e.$message.error(t.msg)}).catch(function(t){console.log(t)})}).catch(function(){})}}},l=(n("jY6Q"),n("ZrdR")),i=Object(l.a)(r,function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"right"},[n("el-form",{ref:"search",attrs:{inline:!0,model:t.search}},[n("el-row",[n("el-col",{attrs:{span:18}},[n("el-form-item",[n("el-input",{staticStyle:{width:"300px"},attrs:{placeholder:"请输入标题"},model:{value:t.search.title,callback:function(e){t.$set(t.search,"title",e)},expression:"search.title"}})],1)],1),t._v(" "),n("el-col",{attrs:{span:6,align:"right"}},[n("el-form-item",[n("el-button",{attrs:{type:"primary",icon:"el-icon-search"},on:{click:function(e){t.currentChange(1)}}},[t._v("查询\n          ")])],1),t._v(" "),n("el-form-item",[n("el-button",{attrs:{type:"primary",icon:"el-icon-plus"},on:{click:t.add}},[t._v("添加\n          ")])],1)],1)],1)],1),t._v(" "),n("div",{staticClass:"content"},[n("el-table",{staticStyle:{width:"100%"},attrs:{data:t.list,"empty-text":"暂无数据"}},[n("el-table-column",{attrs:{prop:"id",label:"id",width:"110"}}),t._v(" "),n("el-table-column",{attrs:{prop:"title",label:"标题"}}),t._v(" "),n("el-table-column",{attrs:{prop:"content",label:"内容"}}),t._v(" "),n("el-table-column",{attrs:{prop:"updated_at",label:"更新时间"}}),t._v(" "),n("el-table-column",{attrs:{label:"操作",width:"200"},scopedSlots:t._u([{key:"default",fn:function(e){return[n("el-button",{attrs:{size:"mini",type:"primary"},on:{click:function(n){t.edit(e.row)}}},[t._v("编辑")]),t._v(" "),n("el-button",{attrs:{size:"mini",type:"primary"},on:{click:function(n){t.del(e.row.id)}}},[t._v("删除")])]}}])})],1)],1),t._v(" "),n("el-col",{staticStyle:{padding:"15px 5% 15px 0"},attrs:{span:24,align:"right"}},[n("el-pagination",{attrs:{layout:"prev, pager, next","current-page":t.current_page,"page-size":t.pageSize,total:t.total,background:""},on:{"current-change":t.currentChange,"update:currentPage":function(e){t.current_page=e}}})],1),t._v(" "),n("el-dialog",{attrs:{title:"快捷回复信息",visible:t.dialogTableVisible,"close-on-click-modal":!1,"show-close":!1},on:{"update:visible":function(e){t.dialogTableVisible=e}}},[n("el-form",{ref:"form",attrs:{model:t.form,rules:t.rules,"label-width":"20%"}},[n("el-form-item",{attrs:{label:"标题",prop:"form_title"}},[n("el-input",{staticStyle:{width:"80%"},attrs:{placeholder:"请输入标题"},model:{value:t.form.title,callback:function(e){t.$set(t.form,"title",e)},expression:"form.title"}})],1),t._v(" "),n("el-form-item",{attrs:{label:"内容",prop:"form_content"}},[n("el-input",{staticStyle:{width:"80%"},attrs:{type:"text",placeholder:"请输入内容"},model:{value:t.form.content,callback:function(e){t.$set(t.form,"content",e)},expression:"form.content"}})],1)],1),t._v(" "),n("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[n("el-button",{on:{click:t.clear}},[t._v("取 消")]),t._v(" "),n("el-button",{attrs:{type:"primary"},on:{click:function(e){t.sureSave()}}},[t._v("确 定")])],1)],1)],1)},[],!1,null,"279049e1",null);i.options.__file="common_reply.vue";e.default=i.exports},jY6Q:function(t,e,n){"use strict";var r=n("0sIj");n.n(r).a}}]);