(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-803c"],{"4M9q":function(t,e,i){"use strict";var s=i("QbLZ"),n=i.n(s),a=i("RCcY"),o=i("L2JU"),r={data:function(){return{router_list:[{category_id:"1",category_title:"聊天侧边栏",routers:[]}]}},components:{sideItem:a.a},computed:n()({},Object(o.b)(["permission_routers","userInfo"])),watch:{permission_routers:function(t,e){this.signRouters(t)}},mounted:function(){this.signRouters()},methods:{signRouters:function(t){var e=(t||this.permission_routers).filter(function(t){return"wechatSidebar"===t.name});e[0]&&this.router_list.map(function(t){e[0].children.map(function(e){e.class_id==t.category_id&&t.routers.push(e)})})}}},c=(i("b85x"),i("KHd+")),d=Object(c.a)(r,function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"second-side-box"},[e("div",{staticStyle:{width:"150px"}}),this._v(" "),e("div",{staticClass:"second-side-box-fixed"},[e("el-menu",{staticClass:"el-menu-vertical-demo",attrs:{"default-active":"1","default-openeds":["1"]}},this._l(this.router_list,function(t){return e("side-item",{key:t.category_id,attrs:{item:t}})}))],1)])},[],!1,null,"3e9f1b7e",null);d.options.__file="wechat_sidebar_side.vue";e.a=d.exports},"6iHH":function(t,e,i){"use strict";i.r(e);var s=i("FyfS"),n=i.n(s),a=i("4M9q"),o=i("x8Yw"),r={components:{wechat_sidebar_side:a.a,dialog_choice_department_staff:o.a},data:function(){return{addDepartmentTipsShow:!1,checkboxArr:[],checkboxIds:{}}},created:function(){this.getLinkPower()},methods:{choiceData:function(){var t=[];for(var e in this.checkboxIds)t.push(this.checkboxIds[e]);this.checkboxArr=t,this.editPower()},delChoice:function(t){"staff"==t.type?delete this.checkboxIds[t.user_id]:delete this.checkboxIds[t.id],this.choiceData()},choiceComfirm:function(t){this.checkboxArr=t.checkboxArr,this.checkboxIds=t.checkboxIds,this.editPower()},choiceChange:function(t){},openChoice:function(){var t=this;this.addDepartmentTipsShow=!0,this.$nextTick(function(){t.$refs.dialog_choice_department_staff.setChoiceData(t.checkboxIds)})},getLinkPower:function(){var t=this;$http.pc_get("plugin/WechatChatSidebar/getLinkPower",{link_name:this.$route.query.type_name},"loading").then(function(e){if(1===e.result){var i=e.data.department,s=e.data.staff,a={},o=[],r=!0,c=!1,d=void 0;try{for(var h,u=n()(i);!(r=(h=u.next()).done);r=!0){var f=h.value;f.type="department",a[f.id]=f,o.push(f)}}catch(t){c=!0,d=t}finally{try{!r&&u.return&&u.return()}finally{if(c)throw d}}var l=!0,_=!1,p=void 0;try{for(var v,m=n()(s);!(l=(v=m.next()).done);l=!0){var b=v.value;b.type="staff",a[b.user_id]=b,o.push(b)}}catch(t){_=!0,p=t}finally{try{!l&&m.return&&m.return()}finally{if(_)throw p}}t.checkboxArr=o,t.checkboxIds=a,console.log(o,a)}else e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)})},editPower:function(){var t=this,e=[],i=[],s=!0,a=!1,o=void 0;try{for(var r,c=n()(this.checkboxArr);!(s=(r=c.next()).done);s=!0){var d=r.value;"staff"==d.type?e.push(d.user_id):i.push(d.id)}}catch(t){a=!0,o=t}finally{try{!s&&c.return&&c.return()}finally{if(a)throw o}}$http.pc_post("plugin/WechatChatSidebar/editPower",{link_name:this.$route.query.type_name,user_ids:e,department_ids:i},"loading").then(function(e){1===e.result?console.log(e):e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)})}}},c=(i("JSgK"),i("KHd+")),d=Object(c.a)(r,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"staff"},[i("wechat_sidebar_side"),t._v(" "),i("div",{staticClass:"staff-right-box"},[i("div",{staticStyle:{"font-size":"14px",color:"#333","padding-bottom":"10px"}},[t._v("\n      聊天侧边栏>权限设置\n    ")]),t._v(" "),i("div",{staticClass:"staff-right-container"},[t._m(0),t._v(" "),i("div",{staticClass:"main"},[i("div",{staticClass:"left-main"},[t._v("可使用成员")]),t._v(" "),i("div",{staticClass:"right-main"},[t._l(t.checkboxArr,function(e){return i("div",{key:"staff"==e.type?e.user_id:e.id,staticClass:"label"},["department"==e.type?i("i",{staticClass:"iconfont icon-wenjianjia"}):t._e(),t._v(" "),"staff"==e.type?i("i",{staticClass:"iconfont icon-fontclass-daili"}):t._e(),t._v("\n            "+t._s(e.name)+"\n            "),i("i",{staticClass:"iconfont icon-close11",staticStyle:{"font-size":"12px",cursor:"pointer"},on:{click:function(i){t.delChoice(e)}}})])}),t._v(" "),i("div",{staticClass:"add",on:{click:t.openChoice}},[t._v("添加")])],2)])])]),t._v(" "),i("dialog_choice_department_staff",{ref:"dialog_choice_department_staff",attrs:{show:t.addDepartmentTipsShow},on:{change:t.choiceChange,confirm:t.choiceComfirm,"update:show":function(e){t.addDepartmentTipsShow=e}}})],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"header"},[e("div",{staticClass:"header-title"},[e("span"),e("b",[this._v("权限设置")])])])}],!1,null,"2eddeb8b",null);d.options.__file="permission.vue";e.default=d.exports},IiE1:function(t,e,i){},JSgK:function(t,e,i){"use strict";var s=i("Jb6e");i.n(s).a},Jb6e:function(t,e,i){},b85x:function(t,e,i){"use strict";var s=i("IiE1");i.n(s).a}}]);