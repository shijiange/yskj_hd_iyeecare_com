(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-3531"],{AEfG:function(t,e,i){},Jopi:function(t,e,i){},L5M4:function(t,e,i){"use strict";i.r(e);var a=i("3vhb"),s=i("pRKR"),r={components:{staff_side:a.a,permission_aggregate:s.a},data:function(){return{radio:0}},methods:{getRightType:function(t){this.radio=t,console.log(t)},onSubmit:function(){this.$refs.permission_aggregate.setAuth()}}},n=(i("OY1J"),i("KHd+")),o=Object(n.a)(r,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"staff"},[i("staff_side"),t._v(" "),i("div",{staticClass:"staff-right-box"},[i("div",{staticStyle:{"font-size":"14px",color:"#333","padding-bottom":"10px"}},[t._v("\n      员工管理>成员权限\n    ")]),t._v(" "),i("div",{staticClass:"staff-right-container",style:{flex:0==t.radio?"1":"0"}},[t._m(0),t._v(" "),i("div",{staticClass:"main"},[i("div",{staticClass:"power"},[i("div",{staticClass:"power-item"},[i("div",{staticClass:"power-item-label"},[t._v("权限类型")]),t._v(" "),i("div",{staticClass:"power-item-radios"},[i("el-radio-group",{model:{value:t.radio,callback:function(e){t.radio=e},expression:"radio"}},[i("el-radio",{attrs:{label:0}},[t._v("部门权限")]),t._v(" "),i("el-radio",{attrs:{label:1}},[t._v("独立权限")])],1)],1)]),t._v(" "),t._m(1)])])]),t._v(" "),i("div",{directives:[{name:"show",rawName:"v-show",value:1==t.radio,expression:"radio == 1"}],staticClass:"permission"},[i("permission_aggregate",{ref:"permission_aggregate",attrs:{right_type:t.radio,is_leader:0,category:"staff",id:t.$route.query.id},on:{getRightType:t.getRightType}})],1),t._v(" "),i("div",{staticStyle:{height:"53px"}}),t._v(" "),i("div",{staticClass:"sendButtons"},[i("el-button",{staticStyle:{background:"#5ab79c","border-color":"#5ab79c"},attrs:{type:"primary"},on:{click:t.onSubmit}},[t._v("提交")]),t._v(" "),i("el-button",[t._v("取消")])],1)])],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"header"},[e("div",{staticClass:"header-title"},[e("span"),e("b",[this._v("员工权限")])])])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"power-item"},[e("div",{staticClass:"power-item-label"}),this._v(" "),e("div",{staticClass:"power-item-text"},[this._v("\n              如果选择部门权限，则该成员的权限以部门设置的权限为准，如果同属于多个部门，则权限叠加；如果设置独立权限，则后续权限以独立权限为准。\n            ")])])}],!1,null,"026ec14d",null);o.options.__file="permission.vue";e.default=o.exports},OY1J:function(t,e,i){"use strict";var a=i("Jopi");i.n(a).a},jUre:function(t,e,i){"use strict";var a=i("AEfG");i.n(a).a},pRKR:function(t,e,i){"use strict";var a=i("m1cH"),s=i.n(a),r=[];function n(t,e,i){t.forEach(function(t,a){t.id=e+"_"+(a+1),1==t.can&&r.push(t.id),t.level=i,t.child.length>0&&n(t.child,t.id,i)})}var o={props:{is_leader:{type:Number,default:0},category:{type:String,default:"department"},id:{type:[Number,String],default:0},right_type:{type:Number,default:0}},data:function(){return{activeName:"",tab_list:[],auth_list:{},defaultCheckedKeys:[]}},created:function(){r=[],this.getAuthList()},methods:{_getSendJson:function(){var t={};return this.category&&"department"==this.category&&(t.department_id=this.id),this.category&&"staff"==this.category&&(t.staff_id=this.id,t.right_type=this.right_type),t.is_leader=this.is_leader,t},getAuthList:function(){var t=this,e=this._getSendJson();$http.pc_get("admin/getAuthList",e,"loading").then(function(e){if(1===e.result){for(var i in t.tab_list=e.data.tab_list,r=[],t.activeName=t.tab_list[0].key,e.data.auth_list)n(e.data.auth_list[i],i,i);t.$emit("getRightType",e.data.right_type),t.auth_list=e.data.auth_list,t.defaultCheckedKeys=r,console.log(r)}else e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)})},setAuth:function(){for(var t=this,e=this.$refs.tree,i=[],a=0;a<e.length;a++)i.push.apply(i,s()(e[a].getCheckedNodes(!1,!0)));for(var r={},n=0;n<i.length;n++)r[i[n].level]||(r[i[n].level]=[]),r[i[n].level].push(i[n].route);var o=this._getSendJson();o.auth=r,$http.pc_post("admin/setAuth",o,"loading").then(function(e){1===e.result?t.$message.success(e.msg):e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)})}}},l=(i("jUre"),i("KHd+")),c=Object(l.a)(o,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"tabs"},[i("el-tabs",{model:{value:t.activeName,callback:function(e){t.activeName=e},expression:"activeName"}},t._l(t.tab_list,function(e,a){return i("el-tab-pane",{key:a,attrs:{label:e.name,name:e.key}},[i("el-tree",{ref:"tree",refInFor:!0,attrs:{data:t.auth_list[e.key],"show-checkbox":"","node-key":"id","default-checked-keys":t.defaultCheckedKeys,props:{children:"child",label:"name"}}})],1)}))],1)},[],!1,null,null,null);c.options.__file="permission_aggregate.vue";e.a=c.exports}}]);