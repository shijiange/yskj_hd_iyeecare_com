(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-73cf"],{"/f1G":function(t,e,a){t.exports={default:a("nhzr"),__esModule:!0}},"/gjq":function(t,e,a){"use strict";var i=a("qhdJ");a.n(i).a},"8hVh":function(t,e,a){"use strict";var i=a("GwzX");a.n(i).a},E8gZ:function(t,e,a){var i=a("jmDH"),n=a("w6GO"),o=a("NsO/"),s=a("NV0k").f;t.exports=function(t){return function(e){for(var a,l=o(e),r=n(l),c=r.length,u=0,p=[];c>u;)a=r[u++],i&&!s.call(l,a)||p.push(t?[a,l[a]]:l[a]);return p}}},"G+BI":function(t,e,a){},GwzX:function(t,e,a){},LfMG:function(t,e,a){"use strict";a.r(e);var i=a("EJiy"),n=a.n(i),o=a("QbLZ"),s=a.n(o),l=a("/f1G"),r=a.n(l),c=a("14Xm"),u=a.n(c),p=a("FyfS"),d=a.n(p),m=a("D3Ub"),_=a.n(m),v=a("U6oN"),f={props:{dialogVisible:{type:Boolean,default:!1}},components:{},data:function(){return{current_page:1,total:1,per_page:1,search:{keyword:""},tableData:[]}},computed:{},created:function(){},mounted:function(){this.getActivityList(1)},methods:{select:function(t){t&&this.$emit("optionData",t),this.$emit("changeVisible",!1)},getActivityList:function(t){var e=this;return _()(u.a.mark(function a(){var i;return u.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/GroupReward/searchGroup",{page:t,search:s()({},e.search)});case 2:1==(i=a.sent).result?(e.tableData=i.data.data,e.total=i.data.total,e.per_page=i.data.per_page,e.current_page=i.data.current_page):e.$message.error(i.msg),console.log(i,"res");case 5:case"end":return a.stop()}},a,e)}))()},searchs:function(t){this.getActivityList(t)}}},g=(a("8hVh"),a("KHd+")),h=Object(g.a)(f,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"group_dialog_card"},[a("el-dialog",{attrs:{center:"",title:"选择群聊",visible:t.dialogVisible,"before-close":t.select,width:"50%"},on:{"update:visible":function(e){t.dialogVisible=e}}},[a("div",{staticStyle:{display:"flex",width:"95%"}},[a("el-input",{attrs:{placeholder:"请输入群聊ID/名称"},model:{value:t.search.keyword,callback:function(e){t.$set(t.search,"keyword",e)},expression:"search.keyword"}}),t._v(" "),a("el-button",{staticStyle:{"margin-left":"10px"},attrs:{type:"primary"},on:{click:function(e){t.searchs(1)}}},[t._v("搜索")])],1),t._v(" "),a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.tableData}},[a("el-table-column",{attrs:{align:"center",prop:"id",label:"ID"}}),t._v(" "),a("el-table-column",{attrs:{prop:"group_name",align:"center",label:"群名称"}}),t._v(" "),a("el-table-column",{attrs:{align:"center",label:"操作"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-button",{attrs:{plain:""},on:{click:function(a){t.select(e.row)}}},[t._v("选择")])]}}])})],1),t._v(" "),a("div",{staticClass:"vue-page"},[a("el-row",[a("el-col",{attrs:{align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:t.total,"page-size":t.per_page,"current-page":t.current_page,background:""},on:{"current-change":t.searchs}})],1)],1)],1)],1)],1)},[],!1,null,"26a29d1e",null);h.options.__file="group_dialog_card.vue";var b=h.exports,y={props:{couponDialogVisible:{type:Boolean,default:!1},selectCouponType:{type:String,default:""}},components:{},data:function(){return{search:{keyword:""},tableData:[],current_page:1,total:1,per_page:1}},computed:{},created:function(){},mounted:function(){this.getActivityList(1)},methods:{searchs:function(t){this.getActivityList(t)},select:function(t){t&&this.$emit("couponOptionData",{data:t,couponType:this.selectCouponType}),this.$emit("couponChangeVisible",!1)},getActivityList:function(t){var e=this;return _()(u.a.mark(function a(){var i;return u.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/GroupReward/searchCoupon",{page:t,search:s()({},e.search)});case 2:1==(i=a.sent).result?(e.tableData=i.data.data,e.total=i.data.total,e.per_page=i.data.per_page,e.current_page=i.data.current_page):e.$message.error(i.msg),console.log(i,"res");case 5:case"end":return a.stop()}},a,e)}))()}}},w=(a("iW1Y"),Object(g.a)(y,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"group_coupon_dialog"},[a("el-dialog",{attrs:{title:"选择优惠券",visible:t.couponDialogVisible,"before-close":t.select,width:"50%"},on:{"update:visible":function(e){t.couponDialogVisible=e}}},[a("div",{staticStyle:{display:"flex",width:"95%"}},[a("el-input",{attrs:{placeholder:"请输入群聊ID/名称"},model:{value:t.search.keyword,callback:function(e){t.$set(t.search,"keyword",e)},expression:"search.keyword"}}),t._v(" "),a("el-button",{staticStyle:{"margin-left":"10px"},attrs:{type:"primary"},on:{click:function(e){t.searchs(1)}}},[t._v("搜索")])],1),t._v(" "),a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.tableData}},[a("el-table-column",{attrs:{align:"center",prop:"id",label:"ID"}}),t._v(" "),a("el-table-column",{attrs:{prop:"name",align:"center",label:"优惠券名称"}}),t._v(" "),a("el-table-column",{attrs:{align:"center",label:"操作"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-button",{attrs:{plain:""},on:{click:function(a){t.select(e.row)}}},[t._v("选择")])]}}])})],1),t._v(" "),a("div",{staticClass:"vue-page"},[a("el-row",[a("el-col",{attrs:{align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:t.total,"page-size":t.per_page,"current-page":t.current_page,background:""},on:{"current-change":t.searchs}})],1)],1)],1)],1)],1)},[],!1,null,"41c9363e",null));w.options.__file="group_coupon_dialog.vue";var x=w.exports,k={components:{side_card:v.a,group_dialog_card:b,group_coupon_dialog:x},data:function(){return{form:{activity_name:"",begin_time:"",end_time:"",new_balance:"",old_balance:"",new_point:"",old_point:"",new_coupons:[],old_coupons:[],group_ids:[]},id:"",side_card_name:"活动管理",active_type_list:[{name:"活动设置",value:1},{name:"活动奖励设置",value:2}],active_type:1,dialogVisible:!1,couponDialogVisible:!1,selectCouponType:"",submitStatus:!0}},mounted:function(){this.$route.query.id&&this.getCheckDetail(this.$route.query.id)},methods:{getCheckDetail:function(t){var e=this;return _()(u.a.mark(function a(){var i,n,o,s,l,r,c;return u.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/GroupReward/getActivityDetail",{id:t});case 2:if(1!=(i=a.sent).result){a.next=36;break}for(e.id=i.data.id,e.form.activity_name=i.data.activity_name,e.form.begin_time=i.data.begin_time,e.form.end_time="永久"==i.data.end_time?"":i.data.end_time,e.form.new_balance=i.data.new_balance,e.form.old_balance=i.data.old_balance,e.form.new_point=i.data.new_point,e.form.old_point=i.data.old_point,e.form.new_coupons=i.data.new_coupon_list,e.form.old_coupons=i.data.old_coupon_list,e.form.group_ids=i.data.group_list,n=!0,o=!1,s=void 0,a.prev=18,l=d()(e.form.group_ids);!(n=(r=l.next()).done);n=!0)(c=r.value).name=c.group_name,delete c.group_name;a.next=26;break;case 22:a.prev=22,a.t0=a.catch(18),o=!0,s=a.t0;case 26:a.prev=26,a.prev=27,!n&&l.return&&l.return();case 29:if(a.prev=29,!o){a.next=32;break}throw s;case 32:return a.finish(29);case 33:return a.finish(26);case 34:a.next=37;break;case 36:e.$message.error(i.msg);case 37:case"end":return a.stop()}},a,e,[[18,22,26,34],[27,,29,33]])}))()},activeType:function(t){this.active_type=t},addGroupManagement:function(){this.dialogVisible=!0},changeVisible:function(t){this.dialogVisible=t},getOption:function(t){"function"!=typeof t&&(0==this.form.group_ids.filter(function(e){return e.id==t.id}).length&&this.form.group_ids.push({id:t.id,name:t.group_name}))},delGroupNameList:function(t){this.form.group_ids.splice(t,1)},selectCoupon:function(t){this.couponDialogVisible=!0,this.selectCouponType=t},getCouponOption:function(t){if(r()(t.data).length>0){if("new"==t.couponType)0==this.form.new_coupons.filter(function(e){return e.id==t.data.id}).length&&this.form.new_coupons.push({name:t.data.name,num:"",id:t.data.id});if("old"==t.couponType)0==this.form.old_coupons.filter(function(e){return e.id==t.data.id}).length&&this.form.old_coupons.push({name:t.data.name,num:"",id:t.data.id})}},couponChangeVisible:function(t){this.couponDialogVisible=t},couponDel:function(t,e){"new"==e&&this.form.new_coupons.splice(t,1),"old"==e&&this.form.old_coupons.splice(t,1)},submit:function(){var t=this;return _()(u.a.mark(function e(){var a,i,o;return u.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:if(""!=t.form.begin_time&&null!=t.form.begin_time){e.next=3;break}return t.$message.warning("开始时间必填"),e.abrupt("return");case 3:if(!t.submitStatus){e.next=9;break}return t.submitStatus=!1,e.next=7,$http.pc_post("plugin/GroupReward/setGroupActivity",{id:t.id,form:s()({},t.form)});case 7:if(1==(a=e.sent).result)t.$message.success(a.msg),t.$router.push(t.fun.getUrl("groupReward",{}));else if("object"==n()(a.msg)){for(o in i="",a.msg)i+=a.msg[o][0];i=i.replace(/validation.gt.numeric/,"结束时间必须大于开始时间"),t.$message.error(i)}else t.$message.error(a.msg);case 9:case"end":return e.stop()}},e,t)}))()}}},C=(a("nh3r"),Object(g.a)(k,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"all group-box"},[a("div",{staticClass:"ground-side-card"},[a("side_card",{attrs:{side_card_name:t.side_card_name}})],1),t._v(" "),a("div",{staticClass:"group-box-content",attrs:{id:"app"}},[a("div",{staticClass:"vue-head active-type"},t._l(t.active_type_list,function(e,i){return a("span",{key:i,class:[t.active_type==e.value?"active-type-active":"",0==i?"active-type-active-left":"",1==i?"active-type-active-right":""],on:{click:function(a){t.activeType(e.value)}}},[t._v(t._s(e.name))])})),t._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:1==t.active_type,expression:"active_type == 1"}],staticClass:"vue-head"},[t._m(0),t._v(" "),a("div",{staticClass:"vue-search"},[a("el-form",{staticClass:"demo-form-inline",attrs:{"label-width":"120px"}},[a("el-form-item",{attrs:{label:"活动名称"}},[a("el-input",{staticStyle:{width:"39.5%"},attrs:{placeholder:"15个字以内",max:"15",maxlength:"15"},model:{value:t.form.activity_name,callback:function(e){t.$set(t.form,"activity_name",e)},expression:"form.activity_name"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"开始时间",required:""}},[a("el-date-picker",{attrs:{type:"datetime",format:"yyyy-MM-dd HH:mm","value-format":"yyyy-MM-dd HH:mm",placeholder:"选择起始时间"},model:{value:t.form.begin_time,callback:function(e){t.$set(t.form,"begin_time",e)},expression:"form.begin_time"}}),t._v(" "),a("span",{staticStyle:{margin:"40px"}},[t._v("结束时间")]),t._v(" "),a("el-date-picker",{attrs:{type:"datetime",format:"yyyy-MM-dd HH:mm","value-format":"yyyy-MM-dd HH:mm",placeholder:"选择起始时间"},model:{value:t.form.end_time,callback:function(e){t.$set(t.form,"end_time",e)},expression:"form.end_time"}}),t._v(" "),a("div",{staticClass:"tip-explain"},[t._v("说明: 结束时间可不填，若不填活动列表页也不展示结束时间;不填则活动不会自动结束，需手动结束。")])],1),t._v(" "),a("el-form-item",{attrs:{label:"指定群聊"}},[a("span",{staticClass:"specify-group",on:{click:t.addGroupManagement}},[a("i",{staticClass:"el-icon-plus"}),t._v("添加群管理")]),t._v(" "),a("div",{staticStyle:{"margin-top":"20px"}},t._l(t.form.group_ids,function(e,i){return a("span",{key:i,staticClass:"specify-group-appoint"},[t._v(t._s(e.name)),a("i",{staticClass:"el-icon-circle-close",on:{click:function(e){t.delGroupNameList(i)}}})])}))])],1)],1)]),t._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:2==t.active_type,expression:"active_type == 2"}],staticClass:"vue-head"},[t._m(1),t._v(" "),a("div",{staticClass:"vue-search"},[a("el-form",{staticClass:"demo-form-inline",attrs:{"label-width":"120px"}},[a("el-form-item",{attrs:{label:"余额设置"}}),t._v(" "),a("el-form-item",{attrs:{label:"新会员奖励余额","label-width":"250px"}},[a("el-input",{staticStyle:{width:"40%"},model:{value:t.form.new_balance,callback:function(e){t.$set(t.form,"new_balance",e)},expression:"form.new_balance"}},[a("template",{slot:"append"},[t._v("元")])],2),t._v(" "),a("div",{staticClass:"tip"},[t._v("不填写则不奖励")])],1),t._v(" "),a("el-form-item",{attrs:{label:"老会员奖励余额","label-width":"250px"}},[a("el-input",{staticStyle:{width:"40%"},model:{value:t.form.old_balance,callback:function(e){t.$set(t.form,"old_balance",e)},expression:"form.old_balance"}},[a("template",{slot:"append"},[t._v("元")])],2),t._v(" "),a("div",{staticClass:"tip"},[t._v("不填写则不奖励")])],1),t._v(" "),a("el-form-item",{attrs:{label:"积分设置"}}),t._v(" "),a("el-form-item",{attrs:{label:"新会员奖励积分","label-width":"250px"}},[a("el-input",{staticStyle:{width:"40%"},model:{value:t.form.new_point,callback:function(e){t.$set(t.form,"new_point",e)},expression:"form.new_point"}},[a("template",{slot:"append"},[t._v("分")])],2),t._v(" "),a("div",{staticClass:"tip"},[t._v("不填写则不奖励")])],1),t._v(" "),a("el-form-item",{attrs:{label:"老会员奖励积分","label-width":"250px"}},[a("el-input",{staticStyle:{width:"40%"},model:{value:t.form.old_point,callback:function(e){t.$set(t.form,"old_point",e)},expression:"form.old_point"}},[a("template",{slot:"append"},[t._v("分")])],2),t._v(" "),a("div",{staticClass:"tip"},[t._v("不填写则不奖励")])],1),t._v(" "),a("el-form-item",{attrs:{label:"优惠券设置"}}),t._v(" "),a("el-form-item",{attrs:{label:"新会员优惠券奖励","label-width":"256px",inline:!1}}),t._v(" "),a("el-form-item",{attrs:{label:" ","label-width":"139px",inline:!1}},[t._l(t.form.new_coupons,function(e,i){return a("div",{key:i,staticClass:"coupon-name-card",staticStyle:{display:"flex","margin-bottom":"10px"}},[a("span",{staticClass:"coupon-name"},[t._v("优惠券名称")]),t._v(" "),a("el-input",{staticStyle:{width:"30%"},attrs:{disabled:""},model:{value:e.name,callback:function(a){t.$set(e,"name",a)},expression:"item.name"}},[a("template",{slot:"append"},[t._v("赠送")])],2),t._v(" "),a("el-input",{staticStyle:{width:"30%"},model:{value:e.num,callback:function(a){t.$set(e,"num",a)},expression:"item.num"}},[a("template",{slot:"append"},[t._v("张")])],2),t._v(" "),a("span",{staticClass:"coupon-name-del",on:{click:function(e){t.couponDel(i,"new")}}},[t._v("x")])],1)}),t._v(" "),a("el-button",{attrs:{plain:"",size:"small"},on:{click:function(e){t.selectCoupon("new")}}},[t._v("选择优惠券")])],2),t._v(" "),a("el-form-item",{attrs:{label:"老会员优惠券奖励","label-width":"256px",inline:!1}}),t._v(" "),a("el-form-item",{attrs:{label:" ","label-width":"139px",inline:!1}},[t._l(t.form.old_coupons,function(e,i){return a("div",{key:i,staticClass:"coupon-name-card",staticStyle:{display:"flex","margin-bottom":"10px",height:"38px"}},[a("span",{staticClass:"coupon-name"},[t._v("优惠券名称")]),t._v(" "),a("el-input",{staticStyle:{width:"30%"},attrs:{disabled:""},model:{value:e.name,callback:function(a){t.$set(e,"name",a)},expression:"item.name"}},[a("template",{slot:"append"},[t._v("赠送")])],2),t._v(" "),a("el-input",{staticStyle:{width:"30%"},model:{value:e.num,callback:function(a){t.$set(e,"num",a)},expression:"item.num"}},[a("template",{slot:"append"},[t._v("张")])],2),t._v(" "),a("span",{staticClass:"coupon-name-del",on:{click:function(e){t.couponDel(i,"old")}}},[t._v("x")])],1)}),t._v(" "),a("el-button",{attrs:{plain:"",size:"small"},on:{click:function(e){t.selectCoupon("old")}}},[t._v("选择优惠券")])],2)],1)],1)]),t._v(" "),a("div",{staticClass:"sendButtons"},[a("el-button",{staticStyle:{background:"#5ab79c","border-color":"#5ab79c"},attrs:{type:"primary"},on:{click:t.submit}},[t._v("提交")])],1)]),t._v(" "),a("group_dialog_card",{attrs:{dialogVisible:t.dialogVisible},on:{optionData:t.getOption,changeVisible:t.changeVisible}}),t._v(" "),a("group_coupon_dialog",{attrs:{couponDialogVisible:t.couponDialogVisible,selectCouponType:t.selectCouponType},on:{couponOptionData:t.getCouponOption,couponChangeVisible:t.couponChangeVisible}})],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[e("div",{staticClass:"vue-main-title-left"}),this._v(" "),e("div",{staticClass:"vue-main-title-content"},[this._v("基本信息")])])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[e("div",{staticClass:"vue-main-title-left"}),this._v(" "),e("div",{staticClass:"vue-main-title-content"},[this._v("奖励设置")])])}],!1,null,"3e148b35",null));C.options.__file="group_deitor.vue";e.default=C.exports},U6oN:function(t,e,a){"use strict";var i={props:{side_card_name:{type:String,default:""}},components:{},data:function(){return{active_status:0}},created:function(){},methods:{changeActive:function(){console.log(123),this.active_status=1}}},n=(a("/gjq"),a("KHd+")),o=Object(n.a)(i,function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"side_card"},[e("div",{staticClass:"side-fixed"},[e("div",{class:1==this.active_status?"side-fixed-title side-fixed-title-active":"side-fixed-title",on:{click:this.changeActive}},[this._v(this._s(this.side_card_name))])])])},[],!1,null,"27d8649c",null);o.options.__file="side_card.vue";e.a=o.exports},cGhi:function(t,e,a){},fW1p:function(t,e,a){var i=a("Y7ZC"),n=a("E8gZ")(!1);i(i.S,"Object",{values:function(t){return n(t)}})},iW1Y:function(t,e,a){"use strict";var i=a("cGhi");a.n(i).a},nh3r:function(t,e,a){"use strict";var i=a("G+BI");a.n(i).a},nhzr:function(t,e,a){a("fW1p"),t.exports=a("WEpk").Object.values},qhdJ:function(t,e,a){}}]);