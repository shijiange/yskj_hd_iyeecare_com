(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-31e5"],{"22ek":function(e,t,r){"use strict";r.r(t);var o=r("ErL5"),s=r("NUmi"),a={data:function(){return{list:[],summary:{},times:[],search_form:{id:"",name:"",owner_name:"",owner_member_kwd:"",owner_member_uid:""},uploadDialogShow:!1,uploadShow:!1,chooseImgName:"",current_id:0,current_row:{},current_qrcode_image:"",member_keyword:"",member_show:!1,member_list:[],member_loading:!1,choosed_member:{},new_post_show:!1,new_post_show_url:"",rules:{},current_page:1,total:1,per_page:1,loading:null}},created:function(){},destroyed:function(){this.timer&&clearInterval(this.timer)},mounted:function(){this.getData(1)},components:{uploadImg:o.a,group_chat_side:s.a},methods:{getData:function(e){var t=this,r={page:e,id:this.search_form.id,name:this.search_form.name,owner_name:this.search_form.owner_name,owner_member_kwd:this.search_form.owner_member_kwd,owner_member_uid:this.search_form.owner_member_uid};this.times&&this.times.length>0&&(r.start_time=this.times[0],r.end_time=this.times[1]),$http.pc_post("plugin/GroupDevelopUser/getList",r,"loading").then(function(e){e.result?(t.list=e.data.list.data,t.current_page=e.data.list.current_page,t.total=e.data.list.total,t.per_page=e.data.list.per_page,t.summary=e.data.summary):t.$message({message:e.msg,type:"error"})},function(e){t.$message({message:e.msg,type:"error"})})},export1:function(){console.log(this.search_form);var e={};this.search_form.id&&(e.id=this.search_form.id),this.search_form.name&&(e.name=this.search_form.name),this.search_form.owner_name&&(e.owner_name=this.search_form.owner_name),this.search_form.owner_member_kwd&&(e.owner_member_kwd=this.search_form.owner_member_kwd),this.search_form.owner_member_uid&&(e.owner_member_uid=this.search_form.owner_member_uid),this.times&&this.times.length>0&&(e.start_time=this.times[0],e.end_time=this.times[1]);var t=this.fun.getRealPCUrl("plugin/GroupDevelopUser/listExport",e);this.download(t,"")},syncData:function(){var e=this;this.$confirm("确定同步吗？该过程可能耗时较长，同步完成前，请不要离开此页面，以免影响同步进度！","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){e.count=0,$http.pc_post("plugin/GroupDevelopUser/synch",{is_start:1}).then(function(t){t.result?e.loop(1,t.data.next_cursor):e.$message({type:"error",message:t.msg})},function(e){this.$message({type:"error",message:e.msg})})}).catch(function(){e.$message({type:"info",message:"已取消操作"})})},loop:function(e,t){var r=this;$http.pc_post("plugin/GroupDevelopUser/synch",{next_cursor:t},"loading").then(function(t){t.result?t.data.next_cursor?(e++,r.$message({type:"success",message:"已同步"+e+"个群数据"}),r.loop(e,t.data.next_cursor)):(r.$message({type:"success",message:"数据同步成功!"}),r.getData(r.current_page)):r.$message({type:"error",message:t.msg})},function(e){r.$message({type:"error",message:e.msg})})},search:function(e){this.getData(e)},openMember:function(e){this.current_id=e,this.member_show=!0},getMember:function(){var e=this;$http.pc_post("admin/businessGetMemberByMobile",{mobile:this.member_keyword},"loading").then(function(t){t.result?e.member_list=t.data:e.$message({type:"error",message:t.msg})},function(t){e.$message({type:"error",message:t.msg}),console.log(t)})},chooseMember:function(e){this.choosed_member=e,this.bindUser(this.current_id,e.uid),this.member_show=!1,console.log(this.form)},bindUser:function(e,t){var r=this;$http.pc_post("plugin/GroupDevelopUser/bindUser",{id:e,uid:t},"loading").then(function(e){if(e.result){var t=r.current_page;r.getData(t),r.$message({type:"success",message:"操作成功"})}else r.$message({type:"error",message:e.msg})},function(e){r.$message({type:"error",message:e.msg}),console.log(e)})},gotoGroupMembers:function(e){this.$router.push(this.fun.getUrl("groupChatMember",{},{group_id:e}))},showUploadDialog:function(e){this.uploadDialogShow=!0,this.current_row=e,this.current_qrcode_image=e.qrcode_image},openUpload:function(e){this.chooseImgName=e,this.uploadShow=!0},sureImg:function(e){this.current_qrcode_image=e},clearImg:function(e){this.current_qrcode_image="",this.$forceUpdate()},saveQrcodeImg:function(){var e=this;$http.pc_post("plugin/GroupDevelopUser/saveQrcodeImg",{id:this.current_row.id,qrcode_url:this.current_qrcode_image},"loading").then(function(t){if(t.result){var r=e.current_page;e.getData(r),e.current_qrcode_image="",e.uploadDialogShow=!1,e.uploadShow=!1,e.$message({type:"success",message:"操作成功"})}else e.$message({type:"error",message:t.msg})},function(t){e.$message({type:"error",message:t.msg}),console.log(t)})},showNewPost:function(e){var t=this;$http.pc_post("plugin/GroupDevelopUser/getNewPost",{id:e},"loading").then(function(e){e.result?(t.new_post_show=!0,t.new_post_show_url=e.data.image_url):t.$message({type:"error",message:e.msg})},function(e){t.$message({type:"error",message:e.msg}),console.log(e)})},download:function(e,t){var r=document.createElement("a");r.download=t,r.href=e,r.click(),r.remove()}}},i=(r("IAhp"),r("ZrdR")),n=Object(i.a)(a,function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("div",{staticClass:"all"},[r("group_chat_side"),e._v(" "),r("div",{attrs:{id:"app"}},[r("div",{staticClass:"vue-head"},[r("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[r("div",{staticClass:"vue-main-title-left"}),e._v(" "),r("div",{staticClass:"vue-main-title-content"},[e._v("群拓客 > 群管理")]),e._v(" "),r("div",{staticClass:"vue-main-title-button"},[r("el-button",{attrs:{type:"primary",icon:"el-icon-refresh",size:"mini"},on:{click:e.syncData}},[e._v("同步群信息")])],1)]),e._v(" "),r("div",{staticClass:"vue-search"},[r("el-form",{staticClass:"demo-form-inline",attrs:{inline:!0,model:e.search_form}},[r("el-form-item",{attrs:{label:""}},[r("el-input",{attrs:{placeholder:"群ID"},model:{value:e.search_form.id,callback:function(t){e.$set(e.search_form,"id",t)},expression:"search_form.id"}})],1),e._v(" "),r("el-form-item",{attrs:{label:""}},[r("el-input",{attrs:{placeholder:"群名称"},model:{value:e.search_form.name,callback:function(t){e.$set(e.search_form,"name",t)},expression:"search_form.name"}})],1),e._v(" "),r("el-form-item",{attrs:{label:""}},[r("el-input",{attrs:{placeholder:"群主"},model:{value:e.search_form.owner_name,callback:function(t){e.$set(e.search_form,"owner_name",t)},expression:"search_form.owner_name"}})],1),e._v(" "),r("el-form-item",{attrs:{label:""}},[r("el-input",{attrs:{placeholder:"锁客会员昵称/姓名/手机号"},model:{value:e.search_form.owner_member_kwd,callback:function(t){e.$set(e.search_form,"owner_member_kwd",t)},expression:"search_form.owner_member_kwd"}})],1),e._v(" "),r("el-form-item",{attrs:{label:""}},[r("el-input",{attrs:{placeholder:"锁客会员会员ID"},model:{value:e.search_form.owner_member_uid,callback:function(t){e.$set(e.search_form,"owner_member_uid",t)},expression:"search_form.owner_member_uid"}})],1),e._v(" "),r("el-form-item",{attrs:{label:""}},[r("el-date-picker",{staticStyle:{"margin-left":"5px"},attrs:{type:"datetimerange","value-format":"yyyy-MM-dd HH:mm:ss","range-separator":"至","start-placeholder":"开始时间","end-placeholder":"结束时间",align:"right"},model:{value:e.times,callback:function(t){e.times=t},expression:"times"}})],1),e._v(" "),r("el-form-item",{attrs:{label:""}},[r("el-button",{attrs:{type:"primary"},on:{click:function(t){e.search(1)}}},[e._v("搜索")]),e._v(" "),r("el-button",{on:{click:function(t){e.export1()}}},[e._v("导出")])],1)],1)],1),e._v(" "),e._m(0)]),e._v(" "),r("div",{staticClass:"vue-main"},[r("div",{staticClass:"vue-main-form"},[r("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[r("div",{staticClass:"vue-main-title-left"}),e._v(" "),r("div",{staticClass:"vue-main-title-content",staticStyle:{flex:"0 0 130px"}},[e._v("群列表")]),e._v(" "),r("div",{staticStyle:{"text-align":"left","font-size":"14px",color:"#999"}},[r("span",[e._v("群数量："+e._s(e.total))]),e._v("   \n            "),r("span",[e._v("群客户总数量（未去重）："+e._s(e.summary.all_members))]),e._v("   \n            "),r("span",[e._v("群客户数量（去重）："+e._s(e.summary.all_distinct_members))]),e._v("   \n          ")]),e._v(" "),r("div",{staticClass:"vue-main-title-button"})]),e._v(" "),r("el-table",{staticStyle:{width:"100%"},attrs:{data:e.list}},[r("el-table-column",{attrs:{label:"ID",align:"center",prop:"id",width:"100"}}),e._v(" "),r("el-table-column",{attrs:{label:"创建时间",align:"center",prop:"group_created_time_str"}}),e._v(" "),r("el-table-column",{attrs:{label:"群名",align:"center",prop:"group_name"}}),e._v(" "),r("el-table-column",{attrs:{label:"群主",align:"center",prop:"owner_name"}}),e._v(" "),r("el-table-column",{attrs:{align:"center",prop:"mobile"},scopedSlots:e._u([{key:"header",fn:function(t){return[r("div",[e._v("外部客户数量")]),e._v(" "),r("div",[e._v("企业员工数量")])]}},{key:"default",fn:function(t){return[e._v("\n              "+e._s(t.row.customer_count)),r("br"),e._v("\n              "+e._s(t.row.employee_count)+"\n            ")]}}])}),e._v(" "),r("el-table-column",{attrs:{label:"锁客会员",align:"center",prop:"username"},scopedSlots:e._u([{key:"default",fn:function(t){return[r("div",{staticStyle:{cursor:"pointer"},on:{click:function(r){e.openMember(t.row.id)}}},[t.row.has_one_owner_member?r("div",[r("div",[r("img",{staticStyle:{width:"30px",height:"30px",padding:"1px",border:"1px solid #ccc"},attrs:{src:t.row.has_one_owner_member.avatar_image}})]),e._v(" "),r("div",[e._v("\n                    "+e._s(t.row.has_one_owner_member.nickname)+"\n                  ")])]):r("div",[r("i",{staticClass:"el-icon-plus",staticStyle:{"font-size":"18px","font-weight":"600"}})])])]}}])}),e._v(" "),r("el-table-column",{attrs:{label:"群二维码",align:"center",prop:"qrcode_url"},scopedSlots:e._u([{key:"default",fn:function(t){return[t.row.qrcode_url?r("a",{attrs:{href:t.row.qrcode_image}},[r("img",{staticStyle:{width:"30px",height:"30px",padding:"1px",border:"1px solid #ccc"},attrs:{src:t.row.qrcode_image}})]):e._e()]}}])}),e._v(" "),r("el-table-column",{attrs:{prop:"refund_time",label:"操作",align:"center",width:"100"},scopedSlots:e._u([{key:"default",fn:function(t){return[r("el-dropdown",{attrs:{trigger:"click"}},[r("span",{staticClass:"el-dropdown-link"},[r("el-button",{attrs:{size:"small"}},[e._v("操作")])],1),e._v(" "),r("el-dropdown-menu",{attrs:{slot:"dropdown"},slot:"dropdown"},[r("el-dropdown-item",{nativeOn:{click:function(r){e.gotoGroupMembers(t.row.id)}}},[e._v("群成员")]),e._v(" "),r("el-dropdown-item",{nativeOn:{click:function(r){e.showUploadDialog(t.row)}}},[e._v("上传群二维码")]),e._v(" "),r("el-dropdown-item",{nativeOn:{click:function(r){e.showNewPost(t.row.id)}}},[e._v("生成海报")])],1)],1)]}}])})],1)],1)]),e._v(" "),e.total>0?r("div",{staticClass:"vue-page"},[r("el-row",[r("el-col",{attrs:{align:"right"}},[r("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:e.total,"page-size":e.per_page,"current-page":e.current_page,background:""},on:{"current-change":e.search}})],1)],1)],1):e._e(),e._v(" "),r("el-dialog",{attrs:{title:"选择会员",visible:e.member_show,width:"60%"},on:{"update:visible":function(t){e.member_show=t}}},[r("div",[r("el-input",{staticStyle:{width:"60%"},attrs:{placeholder:"会员手机号码"},model:{value:e.member_keyword,callback:function(t){e.member_keyword=t},expression:"member_keyword"}}),e._v(" "),r("el-button",{on:{click:e.getMember}},[e._v("搜索")])],1),e._v(" "),r("el-table",{directives:[{name:"loading",rawName:"v-loading",value:e.member_loading,expression:"member_loading"}],staticStyle:{width:"100%",height:"400px",overflow:"auto","margin-top":"10px"},attrs:{data:e.member_list}},[r("el-table-column",{attrs:{label:"ID",prop:"uid",align:"center",width:"100px"}}),e._v(" "),r("el-table-column",{attrs:{label:"会员信息"},scopedSlots:e._u([{key:"default",fn:function(t){return[r("div",{staticStyle:{display:"flex","align-items":"center"}},[t.row.avatar_image?r("div",{staticStyle:{width:"40px"}},[r("el-image",{staticStyle:{width:"40px",height:"40px","border-radius":"50%"},attrs:{src:t.row.avatar_image,alt:""}})],1):e._e(),e._v(" "),r("div",{staticStyle:{flex:"1"}},[e._v("【id:"+e._s(t.row.uid)+"】"+e._s(t.row.nickname))])])]}}])}),e._v(" "),r("el-table-column",{attrs:{prop:"refund_time",label:"操作",align:"center",width:"320"},scopedSlots:e._u([{key:"default",fn:function(t){return[r("el-button",{on:{click:function(r){e.chooseMember(t.row)}}},[e._v("\n              选择\n            ")])]}}])})],1),e._v(" "),r("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[r("el-button",{on:{click:function(t){e.member_show=!1}}},[e._v("取 消")])],1)],1),e._v(" "),r("el-dialog",{attrs:{title:"上传二维码",visible:e.uploadDialogShow,width:"60%"},on:{"update:visible":function(t){e.uploadDialogShow=t}}},[r("el-form",{ref:"upload_qrcode_img_form",attrs:{"label-width":"15%"}},[r("el-form-item",{attrs:{label:"二维码",prop:"avatar"}},[e.current_qrcode_image?e._e():r("div",{staticClass:"upload-box",on:{click:function(t){e.openUpload("qrcode_image")}}},[r("i",{staticClass:"el-icon-plus",staticStyle:{"font-size":"32px"}})]),e._v(" "),e.current_qrcode_image?r("div",{staticClass:"upload-boxed",on:{click:function(t){e.openUpload("qrcode_image")}}},[r("img",{staticStyle:{width:"150px",height:"150px","border-radius":"5px",cursor:"pointer"},attrs:{src:e.current_qrcode_image,alt:""}}),e._v(" "),r("div",{staticClass:"upload-boxed-text"},[e._v("点击重新上传")]),e._v(" "),r("div",{staticStyle:{cursor:"pointer"},on:{click:function(t){t.stopPropagation(),e.clearImg("qrcode_image")}}},[r("i",{staticClass:"el-icon-close"}),e._v("点击清除图片\n            ")])]):e._e(),e._v(" "),r("div",{staticClass:"tip"},[e._v("提示: 需通过新海报插件添加群拓客海报，上传二维码图片仅需要上传二维码部分，方形图片！")])])],1),e._v(" "),r("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[r("el-button",{on:{click:e.saveQrcodeImg}},[e._v("保 存")]),e._v(" "),r("el-button",{on:{click:function(t){e.uploadDialogShow=!1}}},[e._v("取 消")])],1)],1),e._v(" "),r("el-dialog",{attrs:{title:"海报",visible:e.new_post_show,width:"500"},on:{"update:visible":function(t){e.new_post_show=t}}},[r("div",{staticStyle:{display:"flex"}},[r("div",{staticClass:"center",staticStyle:{width:"280px",height:"410px",margin:"0 auto"}},[r("img",{staticStyle:{width:"100%"},attrs:{src:e.new_post_show_url,alt:""}})])]),e._v(" "),r("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[r("el-button",{attrs:{type:"primary"},on:{click:function(t){e.download(e.new_post_show_url,"poster")}}},[e._v("下载海报")])],1)]),e._v(" "),r("upload-img",{attrs:{centerDialogVisible:e.uploadShow},on:{changeVisible:function(t){e.uploadShow=!1},sureImg:e.sureImg}})],1)],1)},[function(){var e=this.$createElement,t=this._self._c||e;return t("div",[t("p",[this._v("同步群信息时，请不要离开此页面，以免影响同步进度！")])])}],!1,null,"4ab6f26a",null);n.options.__file="index.vue";t.default=n.exports},"8LKx":function(e,t,r){},IAhp:function(e,t,r){"use strict";var o=r("8LKx");r.n(o).a}}]);