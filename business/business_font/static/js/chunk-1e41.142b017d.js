(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-1e41"],{"1x9Q":function(t,e,a){"use strict";var s=a("Zqu0");a.n(s).a},Zqu0:function(t,e,a){},"b+kc":function(t,e,a){},kF7g:function(t,e,a){"use strict";var s=a("b+kc");a.n(s).a},nioH:function(t,e,a){"use strict";a.r(e);var s={components:{sop_manage_side:a("fb88").a},data:function(){return{tableData:[]}},created:function(){this.getListData()},methods:{getListData:function(){var t=this;$http.pc_get("plugin/SopTask/getSet",{},"loading").then(function(e){1===e.result?t.tableData.push({url:e.data.url,url_name:"sop任务详情"}):e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)})},copyLink:function(t){this.$refs[t].select(),document.execCommand("Copy"),this.$message.success("复制成功!")}}},n=(a("kF7g"),a("1x9Q"),a("KHd+")),i=Object(n.a)(s,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"staff"},[a("sop_manage_side",{attrs:{defaultActive:"newsSopSet"}}),t._v(" "),a("div",{staticClass:"staff-right-box"},[a("div",{staticClass:"staff-right-container"},[t._m(0),t._v(" "),a("div",{staticClass:"table-list"},[a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.tableData,"row-key":"id"}},[a("el-table-column",{attrs:{prop:"url_name",label:"名称",width:"200"}}),t._v(" "),a("el-table-column",{attrs:{prop:"link",label:"页面地址"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("span",[t._v(t._s(e.row.url))]),t._v(" "),a("input",{ref:"link_"+e.row.url_name,staticStyle:{position:"relative",opacity:"0"},attrs:{type:"value"},domProps:{value:e.row.url}})]}}])}),t._v(" "),a("el-table-column",{attrs:{label:"操作",width:"120"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("div",{staticClass:"operation"},[a("i",{staticClass:"iconfont icon-ht_operation_copyline",on:{click:function(a){t.copyLink("link_"+e.row.url_name)}}})])]}}])})],1)],1)])])],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"header"},[e("div",{staticClass:"header-title"},[e("span"),e("b",[this._v("基础设置")])])])}],!1,null,"1c02c67c",null);i.options.__file="news_sop_set.vue";e.default=i.exports}}]);