(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-7aa0"],{"8KLn":function(t,e,s){},hmZ6:function(t,e,s){"use strict";var a=s("8KLn");s.n(a).a},k0s9:function(t,e,s){"use strict";s.r(e);var a={data:function(){return{list:[],search_form:{id:"",kwd:""},times:[],current_page:1,total:1,per_page:1}},components:{yun_service_side:s("2gMQ").a},created:function(){},mounted:function(){this.search_form.id=this.$route.query.id,this.getData(1)},methods:{getData:function(t){var e=this,s={page:t,id:this.search_form.id,kwd:this.search_form.kwd};this.times&&this.times.length>0&&(s.start_time=this.times[0],s.end_time=this.times[1]),$http.pc_post("plugin/YunChat/chatGetChatList",s,"loading").then(function(t){t.result?(e.list=t.data.data,e.current_page=t.data.current_page,e.total=t.data.total,e.per_page=t.data.per_page):e.$message({message:t.msg,type:"error"})},function(t){e.$message({message:t.msg,type:"error"})})},deleteData:function(t){var e=this;this.$confirm("确定删除吗?删除后，客服和用户将无法看到该消息","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){$http.pc_post("plugin/YunChat/chatDeleteChat",{id:t},"loading").then(function(t){t.result?(e.$message({type:"success",message:"操作成功!"}),e.getData(e.current_page)):e.$message({type:"error",message:t.msg}),e.search(e.current_page)},function(t){e.$message({type:"error",message:t.msg})})}).catch(function(){e.$message({type:"info",message:"已取消操作"})})},search:function(t){this.getData(t)}}},i=(s("hmZ6"),s("KHd+")),r=Object(i.a)(a,function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"all"},[s("yun_service_side",{attrs:{defaultActive:"serviceChatHistory-1"}}),t._v(" "),s("div",{attrs:{id:"app"}},[s("div",{staticClass:"vue-crumbs"},[t._v("\n      在线客服 > 会话消息管理\n    ")]),t._v(" "),s("div",{staticClass:"vue-head"},[t._m(0),t._v(" "),s("div",{staticClass:"vue-search"},[s("el-form",{staticClass:"demo-form-inline",attrs:{inline:!0,model:t.search_form}},[s("el-form-item",{attrs:{label:""}},[s("el-input",{attrs:{placeholder:"会话ID"},model:{value:t.search_form.id,callback:function(e){t.$set(t.search_form,"id",e)},expression:"search_form.id"}})],1),t._v(" "),s("el-form-item",{attrs:{label:""}},[s("el-input",{attrs:{placeholder:"会话内容关键词"},model:{value:t.search_form.kwd,callback:function(e){t.$set(t.search_form,"kwd",e)},expression:"search_form.kwd"}})],1),t._v(" "),s("el-form-item",{attrs:{label:""}},[s("el-date-picker",{staticStyle:{"margin-left":"5px"},attrs:{type:"datetimerange","value-format":"yyyy-MM-dd HH:mm:ss","range-separator":"至","start-placeholder":"开始时间","end-placeholder":"结束时间",align:"right"},model:{value:t.times,callback:function(e){t.times=e},expression:"times"}})],1),t._v(" "),s("el-form-item",{attrs:{label:""}},[s("el-button",{attrs:{type:"primary"},on:{click:function(e){t.search(1)}}},[t._v("搜索")])],1)],1)],1)]),t._v(" "),s("div",{staticClass:"vue-main"},[s("div",{staticClass:"vue-main-form"},[s("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[s("div",{staticClass:"vue-main-title-left"}),t._v(" "),s("div",{staticClass:"vue-main-title-content",staticStyle:{flex:"0 0 130px"}},[t._v("会话消息列表")]),t._v(" "),s("div",{staticStyle:{"text-align":"left","font-size":"14px",color:"#999"}},[s("span",[t._v("会话消息数量："+t._s(t.total))]),t._v("   \n          ")]),t._v(" "),s("div",{staticClass:"vue-main-title-button"})]),t._v(" "),s("el-table",{staticStyle:{width:"100%"},attrs:{data:t.list}},[s("el-table-column",{attrs:{label:"ID",align:"center",prop:"id",width:"80"}}),t._v(" "),s("el-table-column",{attrs:{label:"消息发送人",align:"center",prop:"username",width:"180"},scopedSlots:t._u([{key:"default",fn:function(e){return[s("div",[s("div",[s("img",{staticStyle:{width:"30px",height:"30px",padding:"1px",border:"1px solid #ccc"},attrs:{src:e.row.send_msg_user_avatar}})]),t._v(" "),s("div",[t._v("\n                  【"+t._s(e.row.send_msg_user_type)+"】"+t._s(e.row.send_msg_user.nickname)+"\n                ")])])]}}])}),t._v(" "),s("el-table-column",{attrs:{label:"消息接收人",align:"center",prop:"display_order",width:"180"},scopedSlots:t._u([{key:"default",fn:function(e){return[s("div",[s("div",[s("img",{staticStyle:{width:"40px",height:"40px","border-radius":"50%"},attrs:{src:e.row.receive_msg_user_avatar,alt:""}})]),t._v(" "),s("div",[t._v("\n                  【"+t._s(e.row.receive_msg_user_type)+"】"+t._s(e.row.receive_msg_user.nickname)+"\n                ")])])]}}])}),t._v(" "),s("el-table-column",{attrs:{label:"发送时间",align:"center",prop:"created_at",width:"150"}}),t._v(" "),s("el-table-column",{attrs:{label:"消息类型",align:"center",prop:"content_type_desc",width:"100"}}),t._v(" "),s("el-table-column",{attrs:{label:"消息内容",align:"center",prop:"content"},scopedSlots:t._u([{key:"default",fn:function(e){return[1==e.row.content_type?s("div",[s("a",{staticClass:"pic-txt",attrs:{href:e.row.content,target:"_blank"}},[s("img",{attrs:{src:e.row.content}})])]):2==e.row.content_type?s("div",{staticClass:"goods-con"},[s("div",{staticClass:"goods-img"},[s("img",{attrs:{src:e.row.content.thumb}})]),t._v(" "),s("div",{staticClass:"goods-txt"},[s("div",{staticClass:"goods-title"},[t._v(t._s(e.row.content.title))]),t._v(" "),s("div",{staticClass:"goods-price"},[t._v("￥"+t._s(e.row.content.price))])])]):3==e.row.content_type?s("div",{staticClass:"order-con"},[s("div",{staticClass:"order-header"},[s("span",{staticClass:"order-no"},[t._v("订单号："+t._s(e.row.content.order_sn))]),t._v(" "),s("span",{staticClass:"order-status"},[t._v(t._s(e.row.content.status_name))])]),t._v(" "),t._l(e.row.content.has_many_order_goods,function(e){return s("div",{key:e.goods_id,staticClass:"order-item-con"},[s("div",{staticClass:"order-goods-img"},[s("img",{attrs:{src:e.thumb}})]),t._v(" "),s("div",{staticClass:"order-item-txt"},[s("div",{staticClass:"order-goods-title"},[t._v(t._s(e.title))]),t._v(" "),s("div",{staticClass:"order-goods-price"},[s("span",{staticClass:"order-goods-num"},[t._v("x"+t._s(e.total))]),t._v("￥"+t._s(e.price))])])])}),t._v(" "),s("div",{staticClass:"order-footer"},[t._v("\n                  共 "+t._s(e.row.content.goods_total)+" 件商品 实付：¥"+t._s(e.row.content.price)+"\n                ")])],2):s("div",[s("span",{staticClass:"txt-content",domProps:{innerHTML:t._s(e.row.content)}})])]}}])}),t._v(" "),s("el-table-column",{attrs:{label:"操作",align:"center",width:"80"},scopedSlots:t._u([{key:"default",fn:function(e){return[s("div",{staticClass:"table-option"},[s("el-link",{staticStyle:{"text-align":"center",width:"50px"},attrs:{title:"删除",underline:!1},on:{click:function(s){t.deleteData(e.row.id)}}},[s("a",[t._v("删除")])])],1)]}}])})],1)],1)]),t._v(" "),t.total>0?s("div",{staticClass:"vue-page"},[s("el-row",[s("el-col",{attrs:{align:"right"}},[s("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:t.total,"page-size":t.per_page,"current-page":t.current_page,background:""},on:{"current-change":t.search}})],1)],1)],1):t._e()])],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[e("div",{staticClass:"vue-main-title-left"}),this._v(" "),e("div",{staticClass:"vue-main-title-content"},[this._v("会话消息管理")])])}],!1,null,"081cdb50",null);r.options.__file="chat_chatList.vue";e.default=r.exports}}]);