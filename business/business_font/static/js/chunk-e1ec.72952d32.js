(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-e1ec"],{"/9tK":function(t,e,a){"use strict";var s=a("erMt");a.n(s).a},"4B8r":function(t,e,a){},Ts0H:function(t,e,a){"use strict";var s=a("4B8r");a.n(s).a},YsdZ:function(t,e,a){"use strict";var s=a("zNwO");a.n(s).a},erMt:function(t,e,a){},itsM:function(t,e,a){"use strict";var s=a("jswt");a.n(s).a},jswt:function(t,e,a){},shFe:function(t,e,a){"use strict";a.r(e);var s=a("3vhb"),i=a("rerW"),n=a.n(i),c=a("6ZY3"),r=a.n(c),o=a("cLjf"),l=a.n(o),d=a("hDQ3"),u=a.n(d),_={name:"department_item",props:{root:{type:Object,default:{}},paddingLeft:{type:Number,default:12},checkboxIds:{type:Object,default:{}},department_is_add:{type:Boolean,default:!1},multiple:{type:Boolean,default:!1},department_is_click:{type:Boolean,default:!1}},data:function(){return{open:!1}},created:function(){},methods:{choiceDepartment:function(t){t.clientX?this.$emit("choiceDepartment",this.root):this.$emit("choiceDepartment",t)},handClick:function(){this.department_is_click?this.$emit("choiceDepartment",this.root):this.open=!this.open}}},p=(a("itsM"),a("ZrdR")),h=Object(p.a)(_,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",[a("div",{staticClass:"department_item",class:[t.checkboxIds.hasOwnProperty(t.root.id)&&t.department_is_click?"checkbox":""],style:{paddingLeft:t.paddingLeft+"px"},on:{click:t.handClick}},[a("i",{staticClass:"iconfont icon-ht_more_bottom",class:[1==t.open?"open":"",0==t.root.has_one_sub_department.length?"opacity0":""],on:{click:function(e){e.stopPropagation(),t.open=!t.open}}}),t._v(" "),a("i",{staticClass:"iconfont icon-wenjianjia"}),t._v(" "),a("div",{staticClass:"text"},[t._v(t._s(t.root.name))]),t._v(" "),t.department_is_add?[t.checkboxIds.hasOwnProperty(t.root.id)?a("i",{staticClass:"iconfont icon-all_xuanze",on:{click:function(t){t.stopPropagation()}}}):a("i",{staticClass:"iconfont icon-life-game-plus",on:{click:function(e){return e.stopPropagation(),t.choiceDepartment(e)}}})]:t._e()],2),t._v(" "),t.open?[t._l(t.root.has_one_sub_department,function(e,s){return[a("department_item",{key:s,attrs:{paddingLeft:t.paddingLeft+30,root:e,checkboxIds:t.checkboxIds,department_is_add:t.department_is_add,multiple:t.multiple,department_is_click:t.department_is_click},on:{choiceDepartment:t.choiceDepartment}})]})]:t._e()],2)},[],!1,null,"7e736a56",null);h.options.__file="department_item.vue";var f=[],m=null;var v={components:{department_item:h.exports,staff_item:a("PdEq").a},props:{department_is_add:{type:Boolean,default:!1},multiple:{type:Boolean,default:!1},department_is_click:{type:Boolean,default:!1},search_name:{type:String,default:""},choice_obj:{type:Object,default:function(){return{data:[],staff:!0,department:!0}}}},data:function(){return{department_list:[],departmentArr:[],checkboxIds:{}}},created:function(){var t=this;return u()(l.a.mark(function e(){return l.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:0==t.choice_obj_computed.data.length?t.choice_obj_computed.department&&t.getDepartmentList():t.department_list=t.choice_obj_computed.data;case 1:case"end":return e.stop()}},e,t)}))()},watch:{search_name:function(t,e){var a=this;m&&clearTimeout(m),""!=t?m=setTimeout(function(){a.search()},500):this.departmentArr=[]}},computed:{choice_obj_computed:function(){return r()({data:[],staff:!0,department:!0},this.choice_obj)}},methods:{choiceData:function(t){0==this.multiple&&(this.checkboxIds={}),this.$set(this.checkboxIds,t.id,t),this.$emit("choiceData",this.checkboxIds)},delChoiceData:function(t){this.$delete(this.checkboxIds,t),this.$emit("choiceData",this.checkboxIds)},search:function(){f=[],function t(e,a){var s=!0;var i=!1;var c=void 0;try{for(var r,o=n()(a);!(s=(r=o.next()).done);s=!0){var l=r.value;l.name.indexOf(e)>=0&&f.push(l),l.has_one_sub_department&&l.has_one_sub_department.length>0&&t(e,l.has_one_sub_department)}}catch(t){i=!0,c=t}finally{try{!s&&o.return&&o.return()}finally{if(i)throw c}}}(this.search_name,this.department_list),this.departmentArr=f},getDepartmentList:function(){var t=this;return u()(l.a.mark(function e(){var a;return l.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,$http.pc_get("admin/getDepatmemtList",{});case 2:1===(a=e.sent).result&&(t.department_list=a.data.list,t.$emit("initDepartmentList",t.department_list[0]));case 4:case"end":return e.stop()}},e,t)}))()}}},b=(a("Ts0H"),Object(p.a)(v,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"department"},[""==t.search_name?[t._l(t.department_list,function(e){return[a("department_item",{key:e.id,attrs:{root:e,checkboxIds:t.checkboxIds,department_is_add:t.department_is_add,multiple:t.multiple,department_is_click:t.department_is_click},on:{choiceDepartment:t.choiceData}})]})]:t._e(),t._v(" "),""!=t.search_name?[t._l(t.departmentArr,function(e,s){return[a("department_item",{key:s,attrs:{root:e,checkboxIds:t.checkboxIds,department_is_add:t.department_is_add,multiple:t.multiple,department_is_click:t.department_is_click},on:{choiceDepartment:t.choiceData}})]})]:t._e()],2)},[],!1,null,"4c7b2daf",null));b.options.__file="choice_department.vue";var g=b.exports,k="",w="",x="",C="",y={components:{staff_side:s.a,choice_department:g},data:function(){return{search_status_arr:[{value:"-1",label:"企业微信状态"},{value:"0",label:"未关联"},{value:"1",label:"已激活"},{value:"2",label:"已禁用"},{value:"4",label:"未激活"},{value:"5",label:"退出企业"}],search_status_value:"-1",disabled_status_arr:[{value:"-1",label:"账户状态"},{value:"0",label:"启用"},{value:"1",label:"禁用"}],disabled_status_value:"-1",search_id:"",search_text:"",department_id:0,listData:[],page:1,total_page:0,staff_count:0}},created:function(){k="",w="",x="",C="",console.log(k)},methods:{choiceData:function(t){var e=0;for(var a in t)e=a;e!=this.department_id&&(this.department_id=e,this.page=1,this.getStaffList())},gotoStaffEdit:function(t){var e={};t>0&&(e.staff_id=t),this.$router.push(this.fun.getUrl("staffEdit",{},e))},gotoStaffPermission:function(t){this.$router.push(this.fun.getUrl("staffPermission",{},{id:t}))},initDepartmentList:function(t){this.department_id=t.id,this.getStaffList()},onSearch:function(){k=this.search_id,w=this.search_text,x="-1"==this.search_status_value?"":this.search_status_value,C="-1"==this.disabled_status_value?"":this.disabled_status_value,this.page=1,this.getStaffList()},getStaffList:function(){var t=this,e={department_id:this.department_id,page:this.page};k&&""!=k&&(e.id=k),w&&""!=w&&(e.kwd=w),x&&""!=x&&(e.status=x),C&&""!=C&&(e.disabled=C),$http.pc_get("admin/getStaffList",e,"loading").then(function(e){1===e.result?(t.listData=e.data.data,t.total_page=e.data.last_page,t.staff_count=e.data.total):e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)})},pageChange:function(t){this.page=t,this.getStaffList()},syncWechatStaffList:function(){var t=this;$http.pc_get("admin/refreshStaffList",{},"loading").then(function(e){1===e.result?(t.$message.success(e.msg),t.page=1,t.getStaffList()):e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)})},deleteStaff:function(t,e){var a=this;$http.pc_get("admin/deleteStaff",{id:t,disabled:e},"loading").then(function(t){1===t.result?(a.$message.success(t.msg),a.getStaffList()):t.msg&&a.$message.error(t.msg)}).catch(function(t){console.error(t)})}}},D=(a("/9tK"),a("YsdZ"),Object(p.a)(y,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"staff"},[a("staff_side"),t._v(" "),a("div",{staticClass:"staff-right-box"},[a("div",{staticClass:"staff-right-container"},[a("div",{staticClass:"header"},[t._m(0),t._v(" "),a("div",{staticClass:"header-operation"},[a("div",{staticClass:"header-operation-item"},[a("el-input",{attrs:{placeholder:"ID"},model:{value:t.search_id,callback:function(e){t.search_id=e},expression:"search_id"}})],1),t._v(" "),a("div",{staticClass:"header-operation-item"},[a("el-input",{attrs:{placeholder:"姓名/手机号"},model:{value:t.search_text,callback:function(e){t.search_text=e},expression:"search_text"}})],1),t._v(" "),a("div",{staticClass:"header-operation-item"},[a("el-select",{model:{value:t.search_status_value,callback:function(e){t.search_status_value=e},expression:"search_status_value"}},t._l(t.search_status_arr,function(t){return a("el-option",{key:t.value,attrs:{label:t.label,value:t.value}})}))],1),t._v(" "),a("div",{staticClass:"header-operation-item"},[a("el-select",{model:{value:t.disabled_status_value,callback:function(e){t.disabled_status_value=e},expression:"disabled_status_value"}},t._l(t.disabled_status_arr,function(t){return a("el-option",{key:t.value,attrs:{label:t.label,value:t.value}})}))],1),t._v(" "),a("div",{staticClass:"header-button"},[a("div",{staticClass:"button",on:{click:t.onSearch}},[t._v("搜索")])])])]),t._v(" "),a("div",{staticClass:"main"},[a("div",{staticClass:"main-left"},[a("choice_department",{ref:"choice_department",attrs:{department_is_click:!0},on:{choiceData:t.choiceData,initDepartmentList:t.initDepartmentList}})],1),t._v(" "),a("div",{staticClass:"main-right"},[a("div",{staticClass:"main-right-header"},[t._m(1),t._v(" "),a("div",{staticClass:"header-desc"},[t._v("部门成员数量："+t._s(t.staff_count))]),t._v(" "),a("div",{staticClass:"header-button"},[a("div",{staticClass:"button",on:{click:t.syncWechatStaffList}},[t._v("\n                同步企业微信通讯录\n              ")]),t._v(" "),a("div",{staticClass:"button",on:{click:function(e){t.gotoStaffEdit(0)}}},[t._v("添加员工")])])]),t._v(" "),a("div",{staticClass:"table-list"},[a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.listData,"row-key":"id",height:"calc(100vh - 35vh)","header-cell-style":{"text-align":"center"},"cell-style":{"text-align":"center"}}},[a("el-table-column",{attrs:{fixed:"",prop:"id",label:"ID",width:"100",fixed:""}}),t._v(" "),a("el-table-column",{attrs:{prop:"name",label:"姓名",width:"120"}}),t._v(" "),a("el-table-column",{attrs:{prop:"gender_desc",label:"性别",width:"120"}}),t._v(" "),a("el-table-column",{attrs:{prop:"position",label:"职务",width:"120"}}),t._v(" "),a("el-table-column",{attrs:{prop:"address",label:"系统会员",width:"250"},scopedSlots:t._u([{key:"default",fn:function(e){return e.row&&e.row.has_one_member?[a("div",{staticClass:"system-member"},[a("img",{attrs:{src:e.row.has_one_member.avatar,alt:""}}),t._v(" "),a("span",[t._v(t._s(e.row.has_one_member.nickname))])])]:void 0}}])}),t._v(" "),a("el-table-column",{attrs:{prop:"mobile",label:"手机号",width:"150"}}),t._v(" "),a("el-table-column",{attrs:{prop:"status",label:"状态",width:"120"}}),t._v(" "),a("el-table-column",{attrs:{label:"操作",width:"200",fixed:"right"},scopedSlots:t._u([{key:"default",fn:function(e){return e.row&&e.row.premission?[a("div",{staticClass:"operation"},[1==e.row.premission.setAuth?a("span",{on:{click:function(a){t.gotoStaffPermission(e.row.id)}}},[t._v("权限")]):t._e(),t._v(" "),1==e.row.premission.updateStaff?a("span",{on:{click:function(a){t.gotoStaffEdit(e.row.id)}}},[t._v("编辑")]):t._e(),t._v(" "),1==e.row.premission.deleteStaff?a("span",{on:{click:function(a){t.deleteStaff(e.row.id,e.row.disabled)}}},[t._v(t._s(0==e.row.disabled?"禁用":"解禁"))]):t._e()])]:void 0}}])})],1)],1),t._v(" "),a("div",{staticClass:"table-page"},[a("el-pagination",{attrs:{background:"",layout:"prev, pager, next","page-count":t.total_page},on:{"current-change":t.pageChange}})],1)])])])])],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"header-title"},[e("span"),e("b",[this._v("员工管理")])])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"header-title"},[e("span"),e("b",[this._v("员工管理")])])}],!1,null,"90f8f27e",null));D.options.__file="staff_list.vue";e.default=D.exports},zNwO:function(t,e,a){}}]);