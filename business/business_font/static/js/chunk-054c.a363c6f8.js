(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-054c"],{"+g2U":function(t,e,i){},"4M9q":function(t,e,i){"use strict";var s=i("bS4n"),a=i.n(s),n=i("RCcY"),o=i("8t5x"),r={data:function(){return{router_list:[{category_id:"1",category_title:"聊天侧边栏",routers:[]}]}},components:{sideItem:n.a},computed:a()({},Object(o.b)(["permission_routers","userInfo"])),watch:{permission_routers:function(t,e){this.signRouters(t)}},mounted:function(){this.signRouters()},methods:{signRouters:function(t){var e=(t||this.permission_routers).filter(function(t){return"wechatSidebar"===t.name});e[0]&&this.router_list.map(function(t){e[0].children.map(function(e){e.class_id==t.category_id&&t.routers.push(e)})})}}},c=(i("ZFmS"),i("ZrdR")),l=Object(c.a)(r,function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"second-side-box"},[e("div",{staticStyle:{width:"150px"}}),this._v(" "),e("div",{staticClass:"second-side-box-fixed"},[e("el-menu",{staticClass:"el-menu-vertical-demo",attrs:{"default-active":"1"}},this._l(this.router_list,function(t){return e("side-item",{key:t.category_id,attrs:{item:t}})}))],1)])},[],!1,null,"59130a46",null);l.options.__file="wechat_sidebar_side.vue";e.a=l.exports},"9vWz":function(t,e,i){},EjxZ:function(t,e,i){"use strict";var s=i("+g2U");i.n(s).a},Hp1R:function(t,e,i){"use strict";i.r(e);var s={components:{wechat_sidebar_side:i("4M9q").a},data:function(){return{tableData:[]}},created:function(){this.getListData()},methods:{gotoWechatSidebarPermission:function(t){this.$router.push(this.fun.getUrl("wechatSidebarPermission",{},{type_name:t.type_name}))},getListData:function(){var t=this;$http.pc_get("plugin/WechatChatSidebar/getData",{},"loading").then(function(e){1===e.result?t.tableData=e.data:e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)})},copyLink:function(t){this.$refs[t].select(),document.execCommand("Copy"),this.$message.success("复制成功!")}}},a=(i("EjxZ"),i("egNa"),i("ZrdR")),n=Object(a.a)(s,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"staff"},[i("wechat_sidebar_side"),t._v(" "),i("div",{staticClass:"staff-right-box"},[i("div",{staticClass:"staff-right-container"},[t._m(0),t._v(" "),i("div",{staticClass:"table-list"},[i("el-table",{staticStyle:{width:"100%"},attrs:{data:t.tableData,"row-key":"id"}},[i("el-table-column",{attrs:{prop:"name",label:"名称",width:"200"}}),t._v(" "),i("el-table-column",{attrs:{prop:"link",label:"页面地址"},scopedSlots:t._u([{key:"default",fn:function(e){return[i("span",[t._v(t._s(e.row.link))]),t._v(" "),i("input",{ref:"link_"+e.row.type_name,staticStyle:{position:"relative",opacity:"0"},attrs:{type:"value"},domProps:{value:e.row.link}})]}}])}),t._v(" "),i("el-table-column",{attrs:{label:"操作",width:"120"},scopedSlots:t._u([{key:"default",fn:function(e){return[i("div",{staticClass:"operation"},[i("i",{staticClass:"iconfont icon-ht_operation_copyline",on:{click:function(i){t.copyLink("link_"+e.row.type_name)}}}),t._v(" "),i("i",{staticClass:"iconfont icon-fontclass-mima",on:{click:function(i){t.gotoWechatSidebarPermission(e.row)}}})])]}}])})],1)],1)])])],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"header"},[e("div",{staticClass:"header-title"},[e("span"),e("b",[this._v("聊天侧边栏")])])])}],!1,null,"42e67269",null);n.options.__file="wechat_sidebar.vue";e.default=n.exports},JYRL:function(t,e,i){},ZFmS:function(t,e,i){"use strict";var s=i("9vWz");i.n(s).a},egNa:function(t,e,i){"use strict";var s=i("JYRL");i.n(s).a}}]);