(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-a712"],{"+4FS":function(t,e,a){},"3zjR":function(t,e,a){"use strict";a.r(e);var i=a("14Xm"),s=a.n(i),n=a("D3Ub"),l=a.n(n),r={components:{group_chat_side:a("NUmi").a},data:function(){return{group_name:"",listData:[],current_page:1,total:1,per_page:1,delLabelTipsShow:!1,group_id:""}},mounted:function(){this.getTagList(1)},methods:{delLabelShow:function(t){this.delLabelTipsShow=!0,this.group_id=t},delLabel:function(){var t=this;return l()(s.a.mark(function e(){var a;return s.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,$http.pc_post("plugin/GroupDevelopUser/delGroup",{group_id:t.group_id},"loading");case 2:(a=e.sent).result?(t.$message.success(a.msg),t.delLabelTipsShow=!1,t.getTagList(1)):t.$message.error(a.msg);case 4:case"end":return e.stop()}},e,t)}))()},search1:function(t){this.getTagList(t)},getTagList:function(t){var e=this;return l()(s.a.mark(function a(){var i;return s.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/GroupDevelopUser/getGroupList",{page:t,search:{group_name:e.group_name}},"loading");case 2:(i=a.sent).result?(e.listData=i.data.data,e.total=i.data.total,e.per_page=i.data.per_page,e.current_page=i.data.current_page):i.msg&&e.$message.error(i.msg);case 4:case"end":return a.stop()}},a,e)}))()},gotoLabelEdit:function(t){t?this.$router.push(this.fun.getUrl("groupingTagEdit",{},{group_id:t})):this.$router.push(this.fun.getUrl("groupingTagEdit",{},{}))},seeTag:function(t){this.$router.push(this.fun.getUrl("groupLabel",{id:t},{}))}}},o=(a("8/W0"),a("KHd+")),u=Object(o.a)(r,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"all"},[a("group_chat_side",{attrs:{defaultActive:"groupingTag"}}),t._v(" "),a("div",{attrs:{id:"app"}},[a("div",{staticClass:"header"},[a("div",{staticClass:"vue-main-title"},[a("div",{staticClass:"vue-main-title-left"}),t._v(" "),a("div",{staticClass:"vue-main-title-content customers_name title"},[t._v("\n          标签组管理\n        ")]),t._v(" "),a("div",{staticClass:"add_label_btn"},[a("el-button",{attrs:{type:"primary",size:"mini",plain:""},on:{click:function(e){t.gotoLabelEdit("")}}},[a("i",{staticClass:"el-icon-plus"}),t._v("添加分组")])],1)]),t._v(" "),a("div",{staticClass:"search"},[a("el-input",{staticStyle:{width:"150px","margin-right":"10px"},attrs:{placeholder:"分组名字"},model:{value:t.group_name,callback:function(e){t.group_name=e},expression:"group_name"}}),t._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(e){t.search1(1)}}},[t._v("搜索")])],1)]),t._v(" "),a("div",{staticClass:"list_container"},[t._m(0),t._v(" "),a("div",{staticClass:"list_table"},[a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.listData,"header-cell-style":{"text-align":"center"},"cell-style":{"text-align":"center"}}},[a("el-table-column",{attrs:{prop:"id",label:"ID",width:"180"}}),t._v(" "),a("el-table-column",{attrs:{prop:"group_name",label:"分组名称",width:"180"}}),t._v(" "),a("el-table-column",{attrs:{prop:"sort",label:"分组排序"}}),t._v(" "),a("el-table-column",{attrs:{prop:"tag_count",label:"标签数量"}}),t._v(" "),a("el-table-column",{attrs:{label:"操作",width:"200"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){t.gotoLabelEdit(e.row.id)}}},[t._v("编辑")]),t._v(" "),a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){t.seeTag(e.row.id)}}},[t._v("查看标签")]),t._v(" "),a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){t.delLabelShow(e.row.id)}}},[t._v("删除")])]}}])})],1)],1)])]),t._v(" "),a("el-dialog",{attrs:{title:"操作提示",visible:t.delLabelTipsShow,width:"30%",center:""},on:{"update:visible":function(e){t.delLabelTipsShow=e}}},[a("span",[t._v("是否删除当前标签组，此操作会将此标签组下的所有标签删除！！！")]),t._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{staticStyle:{"margin-right":"10px"},attrs:{type:"primary"},on:{click:t.delLabel}},[t._v("\n        确定\n      ")]),t._v(" "),a("el-button",{attrs:{type:"info"},on:{click:function(e){t.delLabelTipsShow=!1}}},[t._v("\n        取消\n      ")])],1)]),t._v(" "),a("div",{staticClass:"vue-page"},[a("el-row",[a("el-col",{attrs:{align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:t.total,"page-size":t.per_page,"current-page":t.current_page,background:""},on:{"current-change":t.search1}})],1)],1)],1)],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"vue-main-title"},[e("div",{staticClass:"vue-main-title-left"}),this._v(" "),e("div",{staticClass:"vue-main-title-content customers_name title"},[this._v("\n          分组列表\n        ")])])}],!1,null,"8bd0ba48",null);u.options.__file="grouping_tag.vue";e.default=u.exports},"8/W0":function(t,e,a){"use strict";var i=a("+4FS");a.n(i).a}}]);