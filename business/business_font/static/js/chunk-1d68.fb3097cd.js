(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-1d68"],{"7gQq":function(t,e,a){"use strict";var i=a("ARMF");a.n(i).a},ARMF:function(t,e,a){},"Lx+7":function(t,e,a){"use strict";var i=a("eIlN");a.n(i).a},"RU/L":function(t,e,a){a("Rqdy");var i=a("WEpk").Object;t.exports=function(t,e,a){return i.defineProperty(t,e,a)}},RWOJ:function(t,e,a){},Rqdy:function(t,e,a){var i=a("Y7ZC");i(i.S+i.F*!a("jmDH"),"Object",{defineProperty:a("2faE").f})},SEkw:function(t,e,a){t.exports={default:a("RU/L"),__esModule:!0}},YEIV:function(t,e,a){"use strict";e.__esModule=!0;var i=function(t){return t&&t.__esModule?t:{default:t}}(a("SEkw"));e.default=function(t,e,a){return e in t?(0,i.default)(t,e,{value:a,enumerable:!0,configurable:!0,writable:!0}):t[e]=a,t}},eIlN:function(t,e,a){},sp3N:function(t,e,a){},sr7m:function(t,e,a){"use strict";var i=a("RWOJ");a.n(i).a},uTKx:function(t,e,a){"use strict";a.r(e);var i=a("YEIV"),s=a.n(i),r=a("FyfS"),n=a.n(r),o=a("14Xm"),l=a.n(o),c=a("QbLZ"),u=a.n(c),p=a("D3Ub"),d=a.n(p),m=a("x8Yw"),_=a("0VAP"),f={props:{groupDialogVisible:{type:Boolean,default:!1},group_data:{type:Object,default:{id:"",name:""}},permissionList:{type:Array,default:function(){return[]}}},data:function(){return{group_name:"",permission_info:!1}},mounted:function(){},watch:{group_data:function(t){this.group_name=t.group_name},permissionList:function(){this.permission_info=!0}},methods:{saveGroup:function(){var t=[];if(this.group_data.hasOwnProperty("permission"))for(var e in this.group_data.permission)t.push(s()({id:this.group_data.permission[e].id,name:this.group_data.permission[e].name},"id",this.group_data.permission[e].id));return{group_id:this.group_data.id?this.group_data.id:"",form:{group_name:this.group_name,permission:this.permission_info?this.permissionList:t}}},select:function(t){this.$emit("groupChange",{state:!1,type:"departmemt"==t||"save"==t?t:"",form:this.saveGroup()})}}},g=(a("7gQq"),a("KHd+")),v=Object(g.a)(f,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{attrs:{id:"tag-dialog"}},[a("el-dialog",{attrs:{"show-close":!1,title:"添加分组",visible:t.groupDialogVisible,"before-close":t.select,width:"15%"},on:{"update:visible":function(e){t.groupDialogVisible=e}}},[a("div",[a("el-input",{attrs:{placeholder:"请输入分组名称"},model:{value:t.group_name,callback:function(e){t.group_name=e},expression:"group_name"}}),t._v(" "),a("div",{staticClass:"group-item"},[a("span",[t._v("可见范围")]),t._v(" "),a("span",{staticClass:"group-select",on:{click:function(e){t.select("departmemt")}}},[t._v("选择")])])],1),t._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:t.select}},[t._v("取 消")]),t._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(e){t.select("save")}}},[t._v("确 定")])],1)])],1)},[],!1,null,"2d15384c",null);v.options.__file="group_dialog.vue";var h=v.exports,b={props:{tipDialogVisible:{type:Boolean,default:!1}},data:function(){return{name:""}},mounted:function(){},methods:{select:function(t){this.$emit("tipChange",{state:!1,type:"save"==t?t:""})}}},w=(a("Lx+7"),Object(g.a)(b,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{attrs:{id:"material-tag-dialog"}},[a("el-dialog",{attrs:{center:"",title:"提示",visible:t.tipDialogVisible,showClose:!1,"before-close":t.select,width:"15%"},on:{"update:visible":function(e){t.tipDialogVisible=e}}},[a("i",{staticClass:"el-icon-circle-close",on:{click:t.select}}),t._v(" "),a("div",{staticClass:"tip-title"},[t._v("是否确定删除素材")]),t._v(" "),a("span",{attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:t.select}},[t._v("取 消")]),t._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(e){t.select("save")}}},[t._v("确 定")])],1)])],1)},[],!1,null,"9ca0957c",null));w.options.__file="del_tip_dialog.vue";var y=w.exports,x={components:{script_library_side:_.a,group_dialog:h,del_tip_dialog:y,dialog_choice_department_staff:m.a},data:function(){return{search:{material_name:"",staff_info:""},date:"",menu_item_list:[],material_list:[],deltaY:"",current_page:1,total:1,per_page:1,groupDialogVisible:!1,group_data:{},tipDialogVisible:!1,addDepartmentTipsShow:!1,permissionList:[],select_group_id:"",openeds:["1"]}},mounted:function(){this.getGroupList(),this.getMaterialList(1)},methods:{getMaterialList:function(t){var e=this;return d()(l.a.mark(function a(){var i;return l.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/SpeechcraftLibrary/getMaterialList",{page:t,group_id:e.select_group_id,search:u()({},e.search,{start_time:null!==e.date&&e.date?e.date[0]/1e3:"",end_time:null!==e.date&&e.date?e.date[1]/1e3:""})});case 2:(i=a.sent).result?(e.material_list=i.data.data,e.current_page=i.data.current_page,e.total=i.data.total,e.per_page=i.data.per_page):e.$message.error(i.msg);case 4:case"end":return a.stop()}},a,e)}))()},getGroupList:function(){var t=this;return d()(l.a.mark(function e(){var a;return l.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,$http.pc_post("plugin/SpeechcraftLibrary/getGroupList",{},"loading");case 2:(a=e.sent).result?t.menu_item_list=a.data:t.$message.error(a.msg);case 4:case"end":return e.stop()}},e,t)}))()},handleSelect:function(t){this.select_group_id=t,this.getMaterialList()},search1:function(t){this.getMaterialList(t)},addGroup:function(t){var e=this;return d()(l.a.mark(function a(){var i,r,o,c,p,d,m,_;return l.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:if(e.groupDialogVisible=!0,e.group_data={id:t,group_name:"",permission:{}},!t){a.next=32;break}return a.next=5,$http.pc_post("plugin/SpeechcraftLibrary/getGroupInfo",{group_id:t},"loading");case 5:if(!(i=a.sent).result){a.next=31;break}for(e.group_data={id:i.data.id,group_name:i.data.group_name},r=null,o=!0,c=!1,p=void 0,a.prev=12,d=n()(i.data.permission);!(o=(m=d.next()).done);o=!0)_=m.value,r=u()({},r,s()({},_.id,u()({},_)));a.next=20;break;case 16:a.prev=16,a.t0=a.catch(12),c=!0,p=a.t0;case 20:a.prev=20,a.prev=21,!o&&d.return&&d.return();case 23:if(a.prev=23,!c){a.next=26;break}throw p;case 26:return a.finish(23);case 27:return a.finish(20);case 28:e.group_data={id:i.data.id,group_name:i.data.group_name,permission:r},a.next=32;break;case 31:e.$message.error(i.msg);case 32:case"end":return a.stop()}},a,e,[[12,16,20,28],[21,,23,27]])}))()},getGroupChange:function(t){var e=this;return d()(l.a.mark(function a(){var i;return l.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:if(e.groupDialogVisible=t.state,"departmemt"==t.type&&(e.groupDialogVisible=!0,e.addDepartmentTipsShow=!0,void 0!==e.group_data.permission&&e.$nextTick(function(){e.$refs.dialog_choice_department_staff.setChoiceData(null!==e.group_data.permission?e.group_data.permission:{})})),"save"!=t.type){a.next=7;break}return a.next=5,$http.pc_post("plugin/SpeechcraftLibrary/saveGroup",u()({},t.form),"loading");case 5:(i=a.sent).result?(e.$message.success(i.msg),e.getGroupList()):(e.group_data={id:"",group_name:t.form.form.group_name},e.groupDialogVisible=!0,e.$message.error(i.msg));case 7:case"end":return a.stop()}},a,e)}))()},deleteMaterial:function(t){var e=this;return d()(l.a.mark(function a(){var i;return l.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/SpeechcraftLibrary/delGroup",{group_id:t},"loading");case 2:(i=a.sent).result?(e.$message.success(i.msg),e.getGroupList()):e.$message.error(i.msg);case 4:case"end":return a.stop()}},a,e)}))()},deleted:function(t){this.tipDialogVisible=!0,this.del_material_id=t},tipChange:function(t){var e=this;return d()(l.a.mark(function a(){var i;return l.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:if(!t.type){a.next=5;break}return a.next=3,$http.pc_post("plugin/SpeechcraftLibrary/delMaterial",{material_id:e.del_material_id},"loading");case 3:(i=a.sent).result?(e.$message.success(i.msg),location.reload()):e.$message.error(i.msg);case 5:e.tipDialogVisible=t.state;case 6:case"end":return a.stop()}},a,e)}))()},addTask:function(){this.$router.push(this.fun.getUrl("scriptLibraryMaterialEditor",{}))},editor:function(t){this.$router.push(this.fun.getUrl("scriptLibraryMaterialEditor",{},{id:t}))},choiceComfirm:function(t){var e=[];t.checkboxArr.forEach(function(t,a){e.push({id:t.id,type:t.type,name:t.name})}),this.permissionList=e,this.groupDialogVisible=!0},changeState:function(t){var e=this;return d()(l.a.mark(function a(){var i;return l.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/SpeechcraftLibrary/editMaterialStatus",{material_id:t.id,status:t.is_enable},"loading");case 2:(i=a.sent).result?e.$message.success(i.msg):e.$message.error(i.msg);case 4:case"end":return a.stop()}},a,e)}))()}}},k=(a("sr7m"),a("xgz6"),Object(g.a)(x,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"all"},[a("script_library_side",{attrs:{defaultActive:"scriptLibraryMaterial"}}),t._v(" "),a("div",{staticClass:"material"},[a("div",{staticClass:"material-left"},[a("div",{staticClass:"vue-main-title"},[a("div",{staticClass:"vue-main-title-left"}),t._v(" "),a("div",{staticClass:"vue-main-title-content"},[t._v("\n          素材分组\n          "),a("i",{staticClass:"el-icon-plus",on:{click:function(e){t.addGroup("")}}})])]),t._v(" "),a("el-menu",{staticClass:"el-menu-vertical-demo",attrs:{"default-active":"1","default-openeds":t.openeds}},[a("el-submenu",{class:""===t.select_group_id?"acitve-submenu":"",attrs:{index:"1"}},[a("template",{slot:"title"},[a("div",{class:""===t.select_group_id?"acitve-submenu-item":"",on:{click:function(e){t.handleSelect("")}}},[a("i",{staticClass:"el-icon-folder-opened",class:""===t.select_group_id?"acitve-submenu-item":""}),t._v(" "),a("span",[t._v("全部素材")])])]),t._v(" "),a("el-menu-item-group",t._l(t.menu_item_list,function(e,i){return a("div",{key:i,staticStyle:{position:"relative"},attrs:{index:e.id+""},on:{click:function(a){t.handleSelect(e.id)}}},[a("el-tooltip",{attrs:{placement:"right",effect:"light",offset:10,"popper-class":"testtooltip"}},[a("div",{staticStyle:{display:"flex"},attrs:{slot:"content"},slot:"content"},[a("i",{staticClass:"el-icon-more",staticStyle:{transform:"rotate(90deg)",color:"#c0c0c1",position:"absolute",top:"10px",left:"-21px","font-size":"16px"}}),t._v(" "),a("div",{staticStyle:{cursor:"pointer",color:"#939393"}},[a("div",{staticStyle:{"margin-bottom":"3px"},on:{click:function(a){t.addGroup(e.id)}}},[t._v("编辑")]),t._v(" "),a("div",{on:{click:function(a){t.deleteMaterial(e.id)}}},[t._v("删除")])])]),t._v(" "),a("el-menu-item",[a("div",{staticStyle:{display:"flex",width:"147px !important",padding:"10px 13px 10px 0"},style:[{color:Number(t.select_group_id)==e.id?"#29ba9c":""}]},[a("i",{staticClass:"el-icon-folder-opened"}),t._v(" "),a("span",{staticStyle:{position:"relative","white-space":"normal !important","line-height":"normal"}},[t._v("\n                      "+t._s(e.group_name)+"\n                    ")])])])],1)],1)}))],2)],1)],1),t._v(" "),a("div",{staticClass:"material-rigth"},[a("div",{staticClass:"material-top"},[t._m(0),t._v(" "),a("div",{staticClass:"vue-search"},[a("el-form",{staticClass:"demo-form-inline",attrs:{inline:!0}},[a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"素材名称"},model:{value:t.search.material_name,callback:function(e){t.$set(t.search,"material_name",e)},expression:"search.material_name"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"成员名称"},model:{value:t.search.staff_info,callback:function(e){t.$set(t.search,"staff_info",e)},expression:"search.staff_info"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("span",{staticClass:"add-date"},[t._v("添加日期")]),a("el-date-picker",{attrs:{"value-format":"timestamp",type:"datetimerange","range-separator":"至","start-placeholder":"开始日期","end-placeholder":"结束日期"},model:{value:t.date,callback:function(e){t.date=e},expression:"date"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-button",{attrs:{type:"primary"},on:{click:function(e){t.search1(1)}}},[t._v("搜索")])],1)],1)],1)]),t._v(" "),a("div",{staticClass:"material-bottom"},[a("div",{staticClass:"vue-main-title"},[a("div",{staticClass:"vue-main-title-left"}),t._v(" "),a("div",{staticClass:"vue-main-title-content"},[a("div",{staticClass:"material-list"},[t._v("\n              素材列表\n              "),a("span",{staticClass:"material-num"},[t._v("素材数量: "+t._s(t.total))])]),t._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:t.addTask}},[t._v("添加")])],1)]),t._v(" "),a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.material_list}},[a("el-table-column",{attrs:{align:"center",prop:"created_at",label:"创建时间"}}),t._v(" "),a("el-table-column",{attrs:{align:"center",label:"创建人"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("div",{staticClass:"generate-table-img"},[a("img",{attrs:{src:null!==e.row.has_one_staff?e.row.has_one_staff.avatar:null!==e.row.has_one_member?e.row.has_one_member.avatar:"",alt:""}}),t._v(" "),a("span",[t._v(t._s(null!==e.row.has_one_staff?e.row.has_one_staff.name:null!==e.row.has_one_member?e.row.has_one_member.username:""))])])]}}])}),t._v(" "),a("el-table-column",{attrs:{align:"center",prop:"material_name",label:"素材名称"}}),t._v(" "),a("el-table-column",{attrs:{align:"center",prop:"content_count",label:"素材数量"}}),t._v(" "),a("el-table-column",{attrs:{align:"center",prop:"use_count",label:"使用次数"}}),t._v(" "),a("el-table-column",{attrs:{align:"center",label:"状态"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-switch",{attrs:{"active-value":1,"inactive-value":0},on:{change:function(a){t.changeState(e.row)}},model:{value:e.row.is_enable,callback:function(a){t.$set(e.row,"is_enable",a)},expression:"scope.row.is_enable"}})]}}])}),t._v(" "),a("el-table-column",{attrs:{align:"center",label:"操作"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-tooltip",{staticClass:"item",attrs:{effect:"dark",content:"编辑",placement:"top"}},[a("i",{staticClass:"el-icon-edit",staticStyle:{color:"#999"},on:{click:function(a){t.editor(e.row.id)}}})]),t._v(" "),a("el-tooltip",{staticClass:"item",attrs:{effect:"dark",content:"删除",placement:"top"}},[a("i",{staticClass:"el-icon-delete-solid",on:{click:function(a){t.deleted(e.row.id)}}})])]}}])})],1)],1)])]),t._v(" "),a("div",{staticClass:"vue-page"},[a("el-row",[a("el-col",{attrs:{align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:t.total,"page-size":t.per_page,"current-page":t.current_page,background:""},on:{"current-change":t.search1}})],1)],1)],1),t._v(" "),a("dialog_choice_department_staff",{ref:"dialog_choice_department_staff",attrs:{from:"speechcraft",show:t.addDepartmentTipsShow},on:{confirm:t.choiceComfirm,"update:show":function(e){t.addDepartmentTipsShow=e}}}),t._v(" "),a("group_dialog",{attrs:{permissionList:t.permissionList,groupDialogVisible:t.groupDialogVisible,group_data:t.group_data},on:{groupChange:t.getGroupChange}}),t._v(" "),a("del_tip_dialog",{attrs:{tipDialogVisible:t.tipDialogVisible},on:{tipChange:t.tipChange}})],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"vue-main-title"},[e("div",{staticClass:"vue-main-title-left"}),this._v(" "),e("div",{staticClass:"vue-main-title-content"},[this._v("素材管理")])])}],!1,null,"c12321d4",null));k.options.__file="material.vue";e.default=k.exports},xgz6:function(t,e,a){"use strict";var i=a("sp3N");a.n(i).a}}]);