(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-6291"],{"0aQq":function(t,e,i){},"4/oN":function(t,e,i){"use strict";var a=i("te+8");i.n(a).a},"4M9q":function(t,e,i){"use strict";var a=i("bS4n"),n=i.n(a),c=i("RCcY"),s=i("8t5x"),o={data:function(){return{router_list:[{category_id:"1",category_title:"聊天侧边栏",routers:[]}]}},components:{sideItem:c.a},computed:n()({},Object(s.b)(["permission_routers","userInfo"])),watch:{permission_routers:function(t,e){this.signRouters(t)}},mounted:function(){this.signRouters()},methods:{signRouters:function(t){var e=(t||this.permission_routers).filter(function(t){return"wechatSidebar"===t.name});e[0]&&this.router_list.map(function(t){e[0].children.map(function(e){e.class_id==t.category_id&&t.routers.push(e)})})}}},r=(i("B13u"),i("ZrdR")),d=Object(r.a)(o,function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"second-side-box"},[e("div",{staticStyle:{width:"150px"}}),this._v(" "),e("div",{staticClass:"second-side-box-fixed"},[e("el-menu",{staticClass:"el-menu-vertical-demo",attrs:{"default-active":"1"}},this._l(this.router_list,function(t){return e("side-item",{key:t.category_id,attrs:{item:t}})}))],1)])},[],!1,null,"05d25dfc",null);d.options.__file="wechat_sidebar_side.vue";e.a=d.exports},"6CdW":function(t,e,i){"use strict";var a=i("AueX");i.n(a).a},"6iHH":function(t,e,i){"use strict";i.r(e);var a=i("rerW"),n=i.n(a),c=i("4M9q"),s=i("omC7"),o=i.n(s),r=i("cLjf"),d=i.n(r),h=i("hDQ3"),l=i.n(h),f=i("6ZY3"),u=i.n(f),p=i("PdEq"),_={components:{staff_item:p.a},name:"department_staff_item",props:{root:{type:Object,default:{}},paddingLeft:{type:Number,default:12},checkboxIds:{type:Object,default:{}},department_is_add:{type:Boolean,default:!1},multiple:{type:Boolean,default:!1},department_is_click:{type:Boolean,default:!1}},data:function(){return{open:!1}},methods:{choiceDepartment:function(t){t.clientX?this.$emit("choiceDepartment",this.root):this.$emit("choiceDepartment",t)},handClick:function(){this.department_is_click?this.$emit("choiceDepartment",this.root):this.open=!this.open}}},m=(i("wrRQ"),i("ZrdR")),v=Object(m.a)(_,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",[i("div",{staticClass:"department_item",class:[t.checkboxIds.hasOwnProperty(t.root.id)&&t.department_is_click?"checkbox":""],style:{paddingLeft:t.paddingLeft+"px"},on:{click:t.handClick}},[i("i",{staticClass:"iconfont icon-ht_more_bottom",class:[1==t.open?"open":"",t.root.children&&0!=t.root.children.length||t.root.staff&&0!=t.root.staff.length?"":"opacity0"],on:{click:function(e){e.stopPropagation(),t.open=!t.open}}}),t._v(" "),i("i",{staticClass:"iconfont icon-wenjianjia"}),t._v(" "),i("div",{staticClass:"text"},[t._v(t._s(t.root.name))]),t._v(" "),t.department_is_add?[t.checkboxIds.hasOwnProperty(t.root.id)?i("i",{staticClass:"iconfont icon-all_xuanze",on:{click:function(t){t.stopPropagation()}}}):i("i",{staticClass:"iconfont icon-life-game-plus",on:{click:function(e){return e.stopPropagation(),t.choiceDepartment(e)}}})]:t._e()],2),t._v(" "),t.open?[t.root.children&&t.root.children.length>0?[t._l(t.root.children,function(e){return[i("department_staff_item",{key:e.id,attrs:{paddingLeft:t.paddingLeft+30,root:e,checkboxIds:t.checkboxIds,department_is_add:t.department_is_add,multiple:t.multiple,department_is_click:t.department_is_click},on:{choiceDepartment:t.choiceDepartment}})]})]:t._e(),t._v(" "),t.root.staff&&t.root.staff.length>0?[t._l(t.root.staff,function(e){return[e.department?t._e():i("staff_item",{key:e.user_id+"-"+t.root.id,attrs:{checkId:"user_id",paddingLeft:t.paddingLeft+48,root:e,checkboxIds:t.checkboxIds,multiple:t.multiple},on:{choiceDepartment:t.choiceDepartment}})]})]:t._e()]:t._e()],2)},[],!1,null,"82c92de0",null);v.options.__file="department_staff_item.vue";var x=[],k=[],b=null,g={};function y(t,e){if(console.log(e.name,t.name),"staff"==e.type&&t.staff&&e.name.indexOf(t.name)>=0&&(g[e.user_id]||(x.push(e),g[e.user_id]=1)),"department"==e.type&&t.department&&e.name.indexOf(t.name)>=0&&k.push(e),e.children&&e.children.length>0){var i=!0,a=!1,c=void 0;try{for(var s,o=n()(e.children);!(i=(s=o.next()).done);i=!0){y(t,s.value)}}catch(t){a=!0,c=t}finally{try{!i&&o.return&&o.return()}finally{if(a)throw c}}}if(e.staff&&e.staff.length>0){var r=!0,d=!1,h=void 0;try{for(var l,f=n()(e.staff);!(r=(l=f.next()).done);r=!0){y(t,l.value)}}catch(t){d=!0,h=t}finally{try{!r&&f.return&&f.return()}finally{if(d)throw h}}}}var C={components:{department_staff_item:v.exports,staff_item:p.a},props:{department_is_add:{type:Boolean,default:!1},multiple:{type:Boolean,default:!1},department_is_click:{type:Boolean,default:!1},search_criteria:{type:Object,default:function(){return{text:"",staff:!0,department:!0}}}},data:function(){return{depatmemtList:[],checkboxIds:{},staffArr:[],departmentArr:[]}},created:function(){this.getDepartmentList()},watch:{"search_criteria.name":function(t,e){var i=this;if(b&&clearTimeout(b),""==t)return this.staffArr=[],void(this.departmentArr=[]);b=setTimeout(function(){i.search()},500)}},computed:{search_criteria_computed:function(){return u()({name:"",staff:!0,department:!0},this.search_criteria)}},methods:{choiceData:function(t){0==this.multiple&&(this.checkboxIds={}),"staff"==t.type?this.$set(this.checkboxIds,t.user_id,t):this.$set(this.checkboxIds,t.id,t),this.$emit("choiceData",this.checkboxIds)},delChoiceData:function(t){this.$delete(this.checkboxIds,t),this.$emit("choiceData",this.checkboxIds)},delChoiceAll:function(){this.checkboxIds={},this.$emit("choiceData",this.checkboxIds)},setChoiceData:function(t){var e=this;this.checkboxIds={},this.$nextTick(function(){e.checkboxIds=JSON.parse(o()(t)),e.$emit("choiceData",e.checkboxIds)})},search:function(){var t=this.depatmemtList;x=[],k=[],g={};var e=!0,i=!1,a=void 0;try{for(var c,s=n()(t);!(e=(c=s.next()).done);e=!0){var o=c.value;y(this.search_criteria_computed,o)}}catch(t){i=!0,a=t}finally{try{!e&&s.return&&s.return()}finally{if(i)throw a}}console.log(x,k),this.staffArr=x,this.departmentArr=k},getDepartmentList:function(){var t=this;return l()(d.a.mark(function e(){var i;return d.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,$http.pc_get("plugin/WechatChatSidebar/getDepartmentMember",{});case 2:1===(i=e.sent).result&&(t.depatmemtList=i.data);case 4:case"end":return e.stop()}},e,t)}))()}}},w=(i("6CdW"),Object(m.a)(C,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"department"},[""==t.search_criteria.name?t._l(t.depatmemtList,function(e){return i("department_staff_item",{key:e.id,attrs:{root:e,checkboxIds:t.checkboxIds,department_is_add:t.department_is_add,multiple:t.multiple,department_is_click:t.department_is_click},on:{choiceDepartment:t.choiceData}})}):t._e(),t._v(" "),""!=t.search_criteria.name?[t._l(t.departmentArr,function(e){return[i("department_staff_item",{key:e.id,attrs:{root:e,checkboxIds:t.checkboxIds,department_is_add:t.department_is_add,multiple:t.multiple,department_is_click:t.department_is_click},on:{choiceDepartment:t.choiceData}})]}),t._v(" "),t._l(t.staffArr,function(e){return[i("staff_item",{key:e.user_id,attrs:{root:e,checkId:"user_id",paddingLeft:12,checkboxIds:t.checkboxIds,multiple:t.multiple},on:{choiceDepartment:t.choiceData}})]})]:t._e()],2)},[],!1,null,"5c7fa152",null));w.options.__file="choice_department_staff.vue";var D={props:["show"],components:{choice_department_staff:w.exports},watch:{dialogShow:function(t){this.$emit("update:show",t)},show:function(){this.dialogShow=this.show}},data:function(){return{search_text:"",checkboxArr:[],checkboxIds:{},dialogShow:!1}},methods:{choiceData:function(t){var e=[];for(var i in t)e.push(t[i]);this.checkboxArr=e,this.checkboxIds=t,this.$emit("change",this.callbackData())},delChoice:function(t){"staff"==t.type?this.$refs.choice_department.delChoiceData(t.user_id):this.$refs.choice_department.delChoiceData(t.id)},setChoiceData:function(t){console.log("执行setChoiceData"),this.$refs.choice_department.setChoiceData(t)},closeDialog:function(){this.$emit("update:show",!1)},confirm:function(){this.$emit("confirm",this.callbackData()),this.closeDialog()},callbackData:function(){var t=[],e=[],i=!0,a=!1,c=void 0;try{for(var s,r=n()(this.checkboxArr);!(i=(s=r.next()).done);i=!0){var d=s.value;"staff"==d.type?t.push(d):e.push(d)}}catch(t){a=!0,c=t}finally{try{!i&&r.return&&r.return()}finally{if(a)throw c}}var h=JSON.parse(o()(this.checkboxIds));return{checkboxArr:JSON.parse(o()(this.checkboxArr)),checkboxIds:h,staffArr:t,departmentArr:e}}}},I=(i("4/oN"),Object(m.a)(D,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("el-dialog",{attrs:{title:"选择可见范围",visible:t.dialogShow,width:"835px",center:""},on:{"update:visible":function(e){t.dialogShow=e}}},[i("div",{staticClass:"visibleRange"},[i("div",{staticClass:"visibleRange-left"},[i("div",{staticClass:"search-container"},[i("el-input",{attrs:{placeholder:"输入关键词搜索成员、部门"},model:{value:t.search_text,callback:function(e){t.search_text=e},expression:"search_text"}}),t._v(" "),i("div",{staticClass:"button theme-button",staticStyle:{width:"80px",height:"36px","margin-left":"20px","flex-shrink":"0"}},[t._v("\n          搜索\n        ")])],1),t._v(" "),i("div",{staticClass:"department-container"},[i("choice_department_staff",{ref:"choice_department",attrs:{department_is_add:!0,multiple:!0,search_criteria:{name:t.search_text}},on:{choiceData:t.choiceData}})],1)]),t._v(" "),i("div",{staticStyle:{width:"50px"}}),t._v(" "),i("div",{staticClass:"visibleRange-right"},[i("div",{staticClass:"department-checkbox-container"},t._l(t.checkboxArr,function(e){return i("div",{key:"staff"==e.type?e.user_id:e.id,staticClass:"staff_item"},["department"==e.type?i("i",{staticClass:"iconfont icon-wenjianjia"}):t._e(),t._v(" "),"staff"==e.type?i("i",{staticClass:"iconfont icon-fontclass-daili"}):t._e(),t._v(" "),i("div",{staticClass:"text"},[t._v(t._s(e.name))]),t._v(" "),i("i",{staticClass:"iconfont icon-close11",on:{click:function(i){t.delChoice(e)}}})])}))])]),t._v(" "),i("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("div",{staticClass:"button gray-button",staticStyle:{width:"80px",height:"30px"},on:{click:t.closeDialog}},[t._v("\n      取消\n    ")]),t._v(" "),i("div",{staticClass:"button theme-button",staticStyle:{width:"80px",height:"30px","margin-left":"10px"},on:{click:t.confirm}},[t._v("\n      确定\n    ")])])])},[],!1,null,"884432f8",null));I.options.__file="dialog_choice_department_staff.vue";var $=I.exports,A={components:{wechat_sidebar_side:c.a,dialog_choice_department_staff:$},data:function(){return{addDepartmentTipsShow:!1,checkboxArr:[],checkboxIds:{}}},created:function(){this.getLinkPower()},methods:{choiceData:function(){var t=[];for(var e in this.checkboxIds)t.push(this.checkboxIds[e]);this.checkboxArr=t,this.editPower()},delChoice:function(t){"staff"==t.type?delete this.checkboxIds[t.user_id]:delete this.checkboxIds[t.id],this.choiceData()},choiceComfirm:function(t){this.checkboxArr=t.checkboxArr,this.checkboxIds=t.checkboxIds,this.editPower()},choiceChange:function(t){},openChoice:function(){var t=this;this.addDepartmentTipsShow=!0,this.$nextTick(function(){t.$refs.dialog_choice_department_staff.setChoiceData(t.checkboxIds)})},getLinkPower:function(){var t=this;$http.pc_get("plugin/WechatChatSidebar/getLinkPower",{link_name:this.$route.query.type_name},"loading").then(function(e){if(1===e.result){var i=e.data.department,a=e.data.staff,c={},s=[],o=!0,r=!1,d=void 0;try{for(var h,l=n()(i);!(o=(h=l.next()).done);o=!0){var f=h.value;f.type="department",c[f.id]=f,s.push(f)}}catch(t){r=!0,d=t}finally{try{!o&&l.return&&l.return()}finally{if(r)throw d}}var u=!0,p=!1,_=void 0;try{for(var m,v=n()(a);!(u=(m=v.next()).done);u=!0){var x=m.value;x.type="staff",c[x.user_id]=x,s.push(x)}}catch(t){p=!0,_=t}finally{try{!u&&v.return&&v.return()}finally{if(p)throw _}}t.checkboxArr=s,t.checkboxIds=c,console.log(s,c)}else e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)})},editPower:function(){var t=this,e=[],i=[],a=!0,c=!1,s=void 0;try{for(var o,r=n()(this.checkboxArr);!(a=(o=r.next()).done);a=!0){var d=o.value;"staff"==d.type?e.push(d.user_id):i.push(d.id)}}catch(t){c=!0,s=t}finally{try{!a&&r.return&&r.return()}finally{if(c)throw s}}$http.pc_post("plugin/WechatChatSidebar/editPower",{link_name:this.$route.query.type_name,user_ids:e,department_ids:i},"loading").then(function(e){1===e.result?console.log(e):e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)})}}},S=(i("hz5Y"),Object(m.a)(A,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"staff"},[i("wechat_sidebar_side"),t._v(" "),i("div",{staticClass:"staff-right-box"},[i("div",{staticStyle:{"font-size":"14px",color:"#333","padding-bottom":"10px"}},[t._v("\n      聊天侧边栏>权限设置\n    ")]),t._v(" "),i("div",{staticClass:"staff-right-container"},[t._m(0),t._v(" "),i("div",{staticClass:"main"},[i("div",{staticClass:"left-main"},[t._v("可使用成员")]),t._v(" "),i("div",{staticClass:"right-main"},[t._l(t.checkboxArr,function(e){return i("div",{key:"staff"==e.type?e.user_id:e.id,staticClass:"label"},["department"==e.type?i("i",{staticClass:"iconfont icon-wenjianjia"}):t._e(),t._v(" "),"staff"==e.type?i("i",{staticClass:"iconfont icon-fontclass-daili"}):t._e(),t._v("\n            "+t._s(e.name)+"\n            "),i("i",{staticClass:"iconfont icon-close11",staticStyle:{"font-size":"12px",cursor:"pointer"},on:{click:function(i){t.delChoice(e)}}})])}),t._v(" "),i("div",{staticClass:"add",on:{click:t.openChoice}},[t._v("添加")])],2)])])]),t._v(" "),i("dialog_choice_department_staff",{ref:"dialog_choice_department_staff",attrs:{show:t.addDepartmentTipsShow},on:{change:t.choiceChange,confirm:t.choiceComfirm,"update:show":function(e){t.addDepartmentTipsShow=e}}})],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"header"},[e("div",{staticClass:"header-title"},[e("span"),e("b",[this._v("权限设置")])])])}],!1,null,"1daead2a",null));S.options.__file="permission.vue";e.default=S.exports},AueX:function(t,e,i){},B13u:function(t,e,i){"use strict";var a=i("pEXN");i.n(a).a},bgUQ:function(t,e,i){},hz5Y:function(t,e,i){"use strict";var a=i("0aQq");i.n(a).a},pEXN:function(t,e,i){},"te+8":function(t,e,i){},wrRQ:function(t,e,i){"use strict";var a=i("bgUQ");i.n(a).a}}]);