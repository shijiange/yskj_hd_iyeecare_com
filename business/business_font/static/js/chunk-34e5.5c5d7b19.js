(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-34e5"],{"2lfY":function(t,e,s){"use strict";var i=s("e+uK");s.n(i).a},ChWx:function(t,e,s){"use strict";var i=s("bS4n"),n=s.n(i),a=s("RCcY"),r=s("8t5x"),o={data:function(){return{router_list:[{category_id:"1",category_title:"部门管理",routers:[]}]}},components:{sideItem:a.a},computed:n()({},Object(r.b)(["permission_routers","userInfo"])),watch:{permission_routers:function(t,e){this.signRouters(t)}},mounted:function(){this.signRouters()},methods:{signRouters:function(t){var e=(t||this.permission_routers).filter(function(t){return"department"===t.name});e[0]&&this.router_list.map(function(t){e[0].children.map(function(e){e.class_id==t.category_id&&t.routers.push(e)})})}}},c=(s("uePT"),s("ZrdR")),u=Object(c.a)(o,function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"second-side-box"},[e("div",{staticStyle:{width:"150px"}}),this._v(" "),e("div",{staticClass:"second-side-box-fixed"},[e("el-menu",{staticClass:"el-menu-vertical-demo",attrs:{"default-active":"1"}},this._l(this.router_list,function(t){return e("side-item",{key:t.category_id,attrs:{item:t}})}))],1)])},[],!1,null,"5618431a",null);u.options.__file="department_side.vue";e.a=u.exports},Iz0F:function(t,e,s){},Mo1I:function(t,e,s){},"d/jO":function(t,e,s){"use strict";var i=s("Iz0F");s.n(i).a},"e+uK":function(t,e,s){},efRA:function(t,e,s){"use strict";s.r(e);var i=s("ChWx"),n=s("pRKR"),a={components:{department_side:i.a,permission_aggregate:n.a},data:function(){return{power:1}},created:function(){},methods:{setAuth:function(){this.$refs.permission_aggregate.setAuth()},setPower:function(t){var e=this;this.power=t,this.$nextTick(function(){e.$refs.permission_aggregate.getAuthList()})}}},r=(s("d/jO"),s("2lfY"),s("ZrdR")),o=Object(r.a)(a,function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"staff"},[s("department_side"),t._v(" "),s("div",{staticClass:"staff-right-box"},[s("div",{staticStyle:{"font-size":"14px",color:"#333","padding-bottom":"10px"}},[t._v("\n      部门管理>权限设置\n    ")]),t._v(" "),s("div",{staticClass:"staff-right-container"},[s("div",{staticClass:"header"},[s("div",{staticClass:"header-btns"},[s("div",{staticClass:"button",class:[1==t.power?"theme-button":""],staticStyle:{width:"80px",height:"30px","margin-right":"17px"},on:{click:function(e){t.setPower(1)}}},[t._v("\n            主管权限\n          ")]),t._v(" "),s("div",{staticClass:"button",class:[0==t.power?"theme-button":""],staticStyle:{width:"80px",height:"30px"},on:{click:function(e){t.setPower(0)}}},[t._v("\n            成员权限\n          ")])])]),t._v(" "),s("permission_aggregate",{ref:"permission_aggregate",attrs:{is_leader:t.power,category:"department",id:t.$route.query.id}}),t._v(" "),s("div",{staticClass:"send-btns"},[s("div",{staticStyle:{height:"20px"}}),t._v(" "),s("el-button",{staticClass:"button theme-button",staticStyle:{"border-color":"#5ab79c"},attrs:{type:"primary"},on:{click:t.setAuth}},[t._v("提交")]),t._v(" "),s("el-button",[t._v("取消")])],1)],1)])],1)},[],!1,null,"5cbe2c14",null);o.options.__file="permission.vue";e.default=o.exports},jUre:function(t,e,s){"use strict";var i=s("Mo1I");s.n(i).a},pRKR:function(t,e,s){"use strict";var i=s("unDg"),n=s.n(i),a=[];function r(t,e,s){t.forEach(function(t,i){t.id=e+"_"+(i+1),1==t.can&&a.push(t.id),t.level=s,t.child.length>0&&r(t.child,t.id,s)})}var o={props:{is_leader:{type:Number,default:0},category:{type:String,default:"department"},id:{type:[Number,String],default:0},right_type:{type:Number,default:0}},data:function(){return{activeName:"",tab_list:[],auth_list:{},defaultCheckedKeys:[]}},created:function(){a=[],this.getAuthList()},methods:{_getSendJson:function(){var t={};return this.category&&"department"==this.category&&(t.department_id=this.id),this.category&&"staff"==this.category&&(t.staff_id=this.id,t.right_type=this.right_type),t.is_leader=this.is_leader,t},getAuthList:function(){var t=this,e=this._getSendJson();$http.pc_get("admin/getAuthList",e,"loading").then(function(e){if(1===e.result){for(var s in t.tab_list=e.data.tab_list,a=[],t.activeName=t.tab_list[0].key,e.data.auth_list)r(e.data.auth_list[s],s,s);t.$emit("getRightType",e.data.right_type),t.auth_list=e.data.auth_list,t.defaultCheckedKeys=a,console.log(a)}else e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)})},setAuth:function(){for(var t=this,e=this.$refs.tree,s=[],i=0;i<e.length;i++)s.push.apply(s,n()(e[i].getCheckedNodes(!1,!0)));for(var a={},r=0;r<s.length;r++)a[s[r].level]||(a[s[r].level]=[]),a[s[r].level].push(s[r].route);var o=this._getSendJson();o.auth=a,$http.pc_post("admin/setAuth",o,"loading").then(function(e){1===e.result?t.$message.success(e.msg):e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)})}}},c=(s("jUre"),s("ZrdR")),u=Object(c.a)(o,function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"tabs"},[s("el-tabs",{model:{value:t.activeName,callback:function(e){t.activeName=e},expression:"activeName"}},t._l(t.tab_list,function(e,i){return s("el-tab-pane",{key:i,attrs:{label:e.name,name:e.key}},[s("el-tree",{ref:"tree",refInFor:!0,attrs:{data:t.auth_list[e.key],"show-checkbox":"","node-key":"id","default-checked-keys":t.defaultCheckedKeys,props:{children:"child",label:"name"}}})],1)}))],1)},[],!1,null,null,null);u.options.__file="permission_aggregate.vue";e.a=u.exports},qcI1:function(t,e,s){},uePT:function(t,e,s){"use strict";var i=s("qcI1");s.n(i).a}}]);