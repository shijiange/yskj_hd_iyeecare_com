(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-4669"],{Vilj:function(t,e,a){"use strict";a.r(e);var i=a("14Xm"),s=a.n(i),l=a("D3Ub"),n=a.n(l),r={components:{group_chat_side:a("NUmi").a},data:function(){return{tag_name:"",group_id:"",group_arr:[],listData:[],current_page:1,total:1,per_page:1,delLabelTipsShow:!1,tag_id:""}},mounted:function(){this.$route.params.id&&(this.group_id=this.$route.params.id),this.getTagList(1),this.getLabelList(),console.log(this.$route.params.id,123)},methods:{delLabelShow:function(t){this.delLabelTipsShow=!0,this.tag_id=t},delLabel:function(){var t=this;return n()(s.a.mark(function e(){var a;return s.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,$http.pc_post("plugin/GroupDevelopUser/delTag",{tag_id:t.tag_id},"loading");case 2:(a=e.sent).result?(t.$message.success(a.msg),t.delLabelTipsShow=!1,t.getTagList(1)):t.$message.error(a.msg);case 4:case"end":return e.stop()}},e,t)}))()},search1:function(t){this.getTagList(t)},getTagList:function(t){var e=this;$http.pc_post("plugin/GroupDevelopUser/getTagList",{page:t,search:{group_id:this.group_id,tag_name:this.tag_name}},"loading").then(function(t){1===t.result?(e.listData=t.data.data,e.total=t.data.total,e.per_page=t.data.per_page,e.current_page=t.data.current_page):t.msg&&e.$message.error(t.msg)}).catch(function(t){console.error(t)})},getLabelList:function(){var t=this;$http.pc_post("plugin/GroupDevelopUser/getGroupList",{},"loading").then(function(e){1===e.result?t.group_arr=e.data.data:e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)})},gotoLabelEdit:function(t){this.$router.push(this.fun.getUrl("groupLabelEdit",{},{tag_id:t}))},seeGroup:function(t){this.$router.push(this.fun.getUrl("groupChatIndex",{id:t},{}))}}},o=(a("mKgB"),a("KHd+")),c=Object(o.a)(r,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"all"},[a("group_chat_side",{attrs:{defaultActive:"groupLabel"}}),t._v(" "),a("div",{attrs:{id:"app"}},[a("div",{staticClass:"header"},[a("div",{staticClass:"vue-main-title"},[a("div",{staticClass:"vue-main-title-left"}),t._v(" "),a("div",{staticClass:"vue-main-title-content customers_name title"},[t._v("\n          标签管理\n        ")]),t._v(" "),a("div",{staticClass:"add_label_btn"},[a("el-button",{attrs:{type:"primary",size:"mini",plain:""},on:{click:function(e){t.gotoLabelEdit("")}}},[a("i",{staticClass:"el-icon-plus"}),t._v("添加标签")])],1)]),t._v(" "),a("div",{staticClass:"search"},[a("el-input",{staticStyle:{width:"150px","margin-right":"10px"},attrs:{placeholder:"标签名字"},model:{value:t.tag_name,callback:function(e){t.tag_name=e},expression:"tag_name"}}),t._v(" "),a("el-select",{staticStyle:{width:"120px","margin-right":"50px"},attrs:{placeholder:"标签组分类",clearable:""},model:{value:t.group_id,callback:function(e){t.group_id=e},expression:"group_id"}},t._l(t.group_arr,function(t,e){return a("el-option",{key:e,attrs:{label:t.group_name,value:t.id}})})),t._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(e){t.search1(1)}}},[t._v("搜索")])],1)]),t._v(" "),a("div",{staticClass:"list_container"},[t._m(0),t._v(" "),a("div",{staticClass:"list_table"},[a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.listData,"header-cell-style":{"text-align":"center"},"cell-style":{"text-align":"center"}}},[a("el-table-column",{attrs:{prop:"id",label:"ID",width:"180"}}),t._v(" "),a("el-table-column",{attrs:{prop:"tag_name",label:"标签名称",width:"180"}}),t._v(" "),a("el-table-column",{attrs:{prop:"has_one_group",label:"标签组"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("span",[t._v(t._s(null!==e.row.has_one_group?e.row.has_one_group.group_name:"无"))])]}}])}),t._v(" "),a("el-table-column",{attrs:{prop:"group_chat_cout",label:"标签数量"}}),t._v(" "),a("el-table-column",{attrs:{label:"操作",width:"200"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){t.gotoLabelEdit(e.row.id)}}},[t._v("编辑")]),t._v(" "),a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){t.seeGroup(e.row.id)}}},[t._v("查看群聊")]),t._v(" "),a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){t.delLabelShow(e.row.id)}}},[t._v("删除")])]}}])})],1)],1)])]),t._v(" "),a("el-dialog",{attrs:{title:"操作提示",visible:t.delLabelTipsShow,width:"30%",center:""},on:{"update:visible":function(e){t.delLabelTipsShow=e}}},[a("span",[t._v("您确定要删除当前标签嘛！！！")]),t._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{staticStyle:{"margin-right":"10px"},attrs:{type:"primary"},on:{click:t.delLabel}},[t._v("\n        确定\n      ")]),t._v(" "),a("el-button",{attrs:{type:"info"},on:{click:function(e){t.delLabelTipsShow=!1}}},[t._v("\n        取消\n      ")])],1)]),t._v(" "),a("div",{staticClass:"vue-page"},[a("el-row",[a("el-col",{attrs:{align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:t.total,"page-size":t.per_page,"current-page":t.current_page,background:""},on:{"current-change":t.search1}})],1)],1)],1)],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"vue-main-title"},[e("div",{staticClass:"vue-main-title-left"}),this._v(" "),e("div",{staticClass:"vue-main-title-content customers_name title"},[this._v("\n          标签列表\n        ")])])}],!1,null,"157c7688",null);c.options.__file="group_label.vue";e.default=c.exports},mKgB:function(t,e,a){"use strict";var i=a("mrD5");a.n(i).a},mrD5:function(t,e,a){}}]);