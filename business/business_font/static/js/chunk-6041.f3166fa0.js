(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-6041"],{CTH0:function(e,t,a){},GwK5:function(e,t,a){"use strict";var s=a("CTH0");a.n(s).a},ieXM:function(e,t,a){},l14I:function(e,t,a){"use strict";var s=a("ieXM");a.n(s).a},ljWr:function(e,t,a){"use strict";a.r(t);var s=a("unDg"),r=a.n(s),l=a("bS4n"),n=a.n(l),i=a("RCcY"),o=a("8t5x"),c={props:{defaultActive:{type:String,default:"1"}},data:function(){return{router_list:[{category_id:"1",category_title:"客户管理",routers:[]}]}},components:{sideItem:i.a},computed:n()({},Object(o.b)(["permission_routers","userInfo"]),{allChecked:function(){return this.todos.every(function(e){return e.done})}}),watch:{permission_routers:function(e,t){this.signRouters(e)}},mounted:function(){this.signRouters()},methods:{signRouters:function(e){var t=(e||this.permission_routers).filter(function(e){return"wechatCustomers"===e.name});t[0]&&this.router_list.map(function(e){t[0].children.map(function(t){t.class_id==e.category_id&&e.routers.push(t)})}),console.log(this.router_list,"signRouters")}}},_=(a("GwK5"),a("ZrdR")),m=Object(_.a)(c,function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"second-side-box"},[t("div",{staticStyle:{width:"150px"}}),this._v(" "),t("div",{staticClass:"second-side-box-fixed"},[t("el-menu",{staticClass:"el-menu-vertical-demo",attrs:{"default-active":this.defaultActive}},this._l(this.router_list,function(e){return t("side-item",{key:e.category_id,attrs:{item:e}})}))],1)])},[],!1,null,"40030538",null);m.options.__file="wechat_customers_side.vue";var u=[{value:"0",label:"未知来源"},{value:"1",label:"扫描二维码"},{value:"2",label:"搜索手机号"},{value:"3",label:"名片分享"},{value:"4",label:"群聊"},{value:"5",label:"手机通讯录"},{value:"6",label:"微信联系人"},{value:"7",label:"来自微信的添加好友申请"},{value:"8",label:"安装第三方应用时自动添加的客服人员"},{value:"9",label:"搜索邮箱"},{value:"10",label:"未知来源"},{value:"201",label:"内部成员共享"},{value:"202",label:"管理员/负责人分配"}],d={components:{wechat_customers_side:m.exports},data:function(){return{form:{customer:"",member:"",add_way_type:"",employee_member:"",tags_data:"",type:"",time:"",status:""},add_way:[],tags:[],employee:[],external_type:[{value:"1",label:"微信"},{value:"2",label:"企业微信"}],contacts_status:[{value:"1",label:"正常"},{value:"-1",label:"已流失"}],list_data:[],info:!0,current_page:1,total:1,per_page:1,count:0,customer:{avatar:"",name:"",gender:"",external_type:"",external_userid:""},enterprise:{corp_name:"",corp_full_name:"",external_profile:"",position:""},enterprise_customer:{tag_name:"",remark:"",description:"",createtime:"",remark_corp_name:"",add_way:"",group_name:"",name:""},isShowBack:!1,all_loading:!0,is_binding:"",sysnSystemDataTipsShow:!1}},mounted:function(){this.$route.params&&this.$route.params.tag_id&&(this.form.tags_data=this.$route.params.tag_id),this.add_way=u,this.getData(1),window.history&&window.history.pushState&&(history.pushState(null,null,document.URL),window.addEventListener("popstate",this.onCloseModal,!1))},destroyed:function(){window.removeEventListener("popstate",this.onCloseModal,!1)},methods:{setSysnSystemDataTipsShow:function(){this.sysnSystemDataTipsShow=!this.sysnSystemDataTipsShow},onCloseModal:function(){this.info=!0,this.isShowBack=!1},getData:function(e){var t=this;this.all_loading=!0;var a={};for(var s in this.form)this.form[s]&&(a[s]=this.form[s]);$http.pc_post("plugin/WechatCustomers/getList",{page:e,search:a},"loading").then(function(e){e.result?(t.tags=[].concat(r()(e.data.tag)),t.employee=[].concat(r()(e.data.employee)),t.is_binding=e.data.is_binding,t.list_data=e.data.data,t.current_page=e.data.current_page,t.total=e.data.total,t.per_page=e.data.per_page,t.count=e.data.count):t.$message({message:e.msg,type:"error"}),t.all_loading=!1},function(e){t.$message({message:e.msg,type:"error"}),t.all_loading=!1})},synchBaseData:function(){var e=this;this.all_loading=!0,$http.pc_post("plugin/WechatCustomers/synchBaseData",{},"loading").then(function(t){t.result?(e.$message({message:t.msg,type:"success"}),e.getData(1)):e.$message({message:t.msg,type:"error"}),e.all_loading=!1},function(t){e.$message({message:t.msg,type:"error"}),e.all_loading=!1})},synSystemData:function(){var e=this;this.setSysnSystemDataTipsShow(),this.all_loading=!0,$http.pc_post("plugin/WechatCustomers/synchMemberBaseData",{},"loading").then(function(t){t.result?(e.$message({message:t.msg,type:"success"}),e.getData(1)):e.$message({message:t.msg,type:"error"}),e.all_loading=!1},function(t){e.$message({message:t.msg,type:"error"}),e.all_loading=!1})},btnSearch:function(){this.getData(1)},btnDetail:function(e,t){var a=this;this.info=!1,$http.pc_post("plugin/WechatCustomers/getDetails",{external_userid:e,userid:t},"loading").then(function(e){e.result?(a.customer.avatar=e.data.has_one_customer.avatar,a.customer.name=e.data.has_one_customer.name,a.customer.gender=e.data.has_one_customer.gender,a.customer.external_type=e.data.has_one_customer.external_type,a.customer.external_userid=e.data.has_one_customer.external_userid,a.enterprise.corp_name=e.data.has_one_customer.corp_name,a.enterprise.corp_full_name=e.data.has_one_customer.corp_full_name,a.enterprise.external_profile=e.data.has_one_customer.external_profile,a.enterprise.position=e.data.has_one_customer.position,a.enterprise_customer.tag_name=e.data.tag_name,a.enterprise_customer.remark=e.data.remark,a.enterprise_customer.description=e.data.description,a.enterprise_customer.createtime=e.data.createtime,a.enterprise_customer.remark_corp_name=e.data.remark_corp_name,a.enterprise_customer.add_way=e.data.add_way,a.enterprise_customer.name=e.data.has_one_employee?e.data.has_one_employee.name:"",a.enterprise_customer.mobile=e.data.remark_mobiles,a.enterprise_customer.group_name=e.data.group_name,a.enterprise_customer.type=e.data.type):a.$message({message:e.msg,type:"error"})},function(e){a.$message({message:e.msg,type:"error"})})},btnCustomer:function(){this.info=!0,this.isShowBack=!0},btnBack:function(){this.info=!0,this.isShowBack=!0},search:function(e){this.getData(e)}},filters:{formatDate:function(e){function t(e){return e.getFullYear()+"-"+(e.getMonth()+1)+"-"+e.getDate()+" "+e.getHours()+":"+e.getMinutes()+":"+e.getSeconds()}return t(new Date(1e3*e))},addWay:function(e){if(e)return u.filter(function(t){return t.value==e})[0].label}}},p=(a("l14I"),Object(_.a)(d,function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"all"},[a("wechat_customers_side",{attrs:{defaultActive:"1"}}),e._v(" "),a("div",{attrs:{id:"app"}},[e.info?a("el-form",{ref:"form",attrs:{model:e.form,"label-width":"15%"}},[a("div",{attrs:{id:"vue_head"}},[a("div",{staticClass:"base_set"},[a("div",{staticClass:"vue-main-title"},[a("div",{staticClass:"vue-main-title-left"}),e._v(" "),a("div",{staticClass:"vue-main-title-content customers_name title"},[e._v("\n              客户管理 "),a("span",[e._v(" > 客户管理")])])]),e._v(" "),a("div",{staticClass:"vue-main-form vue-main-title"},[a("el-input",{staticStyle:{width:"15%"},attrs:{placeholder:"客户信息"},model:{value:e.form.customer,callback:function(t){e.$set(e.form,"customer",t)},expression:"form.customer"}}),e._v(" "),a("el-input",{staticStyle:{width:"15%"},attrs:{placeholder:"系统会员ID"},model:{value:e.form.member,callback:function(t){e.$set(e.form,"member",t)},expression:"form.member"}}),e._v(" "),a("el-select",{attrs:{placeholder:"来源",clearable:""},model:{value:e.form.add_way_type,callback:function(t){e.$set(e.form,"add_way_type",t)},expression:"form.add_way_type"}},e._l(e.add_way,function(e){return a("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})})),e._v(" "),a("el-select",{attrs:{placeholder:"标签",clearable:""},model:{value:e.form.tags_data,callback:function(t){e.$set(e.form,"tags_data",t)},expression:"form.tags_data"}},e._l(e.tags,function(e){return a("el-option",{key:e.tag_id,attrs:{label:e.name,value:e.tag_id}})})),e._v(" "),a("el-select",{attrs:{placeholder:"归属成员",clearable:""},model:{value:e.form.employee_member,callback:function(t){e.$set(e.form,"employee_member",t)},expression:"form.employee_member"}},e._l(e.employee,function(e){return a("el-option",{key:e.user_id,attrs:{label:e.name,value:e.user_id}})})),e._v(" "),a("el-select",{attrs:{placeholder:"类型",clearable:""},model:{value:e.form.type,callback:function(t){e.$set(e.form,"type",t)},expression:"form.type"}},e._l(e.external_type,function(e){return a("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})})),e._v(" "),a("el-select",{attrs:{placeholder:"状态",clearable:""},model:{value:e.form.status,callback:function(t){e.$set(e.form,"status",t)},expression:"form.status"}},e._l(e.contacts_status,function(e){return a("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})})),e._v(" "),a("span",{staticClass:"add_time"},[a("span",{staticClass:"add_time_title"},[e._v("添加时间：")]),e._v(" "),a("el-date-picker",{attrs:{type:"datetimerange","value-format":"timestamp","start-placeholder":"开始日期","end-placeholder":"结束日期"},model:{value:e.form.time,callback:function(t){e.$set(e.form,"time",t)},expression:"form.time"}})],1),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:e.btnSearch}},[a("i",{staticClass:"el-icon-search"}),e._v("搜索")])],1)]),e._v(" "),a("div",{staticClass:"base_set"},[a("div",{staticClass:"vue-main-title"},[a("div",{staticClass:"vue-main-title-left",staticStyle:{background:"#fff"}}),e._v(" "),a("div",{staticClass:"vue-main-title-content customers_name"},[e._v("\n              共 "+e._s(e.count)+" 位客户\n            ")]),e._v(" "),a("div",{staticClass:"syn"},[a("span",{staticClass:"syn_line",on:{click:e.synchBaseData}},[e._v("同步企业微信")]),e._v(" "),1==e.is_binding?a("span",{staticClass:"syn_line",on:{click:e.setSysnSystemDataTipsShow}},[e._v("同步系统会员")]):e._e()])]),e._v(" "),a("div",{staticClass:"vue-main-form vue-main-title"},[a("el-table",{staticStyle:{width:"100%"},attrs:{data:e.list_data}},[a("el-table-column",{attrs:{label:"添加时间",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("div",[e._v(e._s(e._f("formatDate")(t.row.createtime)))])]}}])}),e._v(" "),a("el-table-column",{attrs:{label:"客户信息",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return t.row.has_one_customer?[a("div",[a("img",{staticClass:"member_img",attrs:{src:t.row.has_one_customer.avatar,alt:""}})]),e._v(" "),a("span",{staticClass:"member_nickName"},[e._v(e._s(t.row.has_one_customer.name))])]:void 0}}])}),e._v(" "),a("el-table-column",{attrs:{label:"姓名\n手机号",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("div",[e._v(e._s(t.row.remark_corp_name))]),e._v(" "),a("div",[e._v(e._s(t.row.remark_mobiles))])]}}])}),e._v(" "),a("el-table-column",{attrs:{label:"来源",align:"center",prop:"add_way"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("div",[e._v(e._s(e._f("addWay")(t.row.add_way)))])]}}])}),e._v(" "),a("el-table-column",{attrs:{label:"标签",align:"center",prop:"tag_name"}}),e._v(" "),a("el-table-column",{attrs:{label:"归属成员",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return t.row.has_one_employee?[a("div",[e._v(e._s(t.row.has_one_employee.name))])]:void 0}}])}),e._v(" "),a("el-table-column",{attrs:{label:"类型\n状态",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("div",[e._v("\n                    "+e._s(1===t.row.has_one_customer.external_type?"微信":"企业微信")+"\n                  ")]),e._v(" "),a("div",[e._v(e._s(1===t.row.status?"正常":"已流失"))])]}}])}),e._v(" "),1==e.is_binding?a("el-table-column",{attrs:{label:"系统会员ID\n注册时间",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("div",[e._v(e._s(t.row.has_one_customer.uid))]),e._v(" "),a("div",[e._v(e._s(t.row.has_one_customer.created_at))])]}}])}):e._e(),e._v(" "),a("el-table-column",{attrs:{label:"操作",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("span",{staticClass:"detail",on:{click:function(a){e.btnDetail(t.row.external_userid,t.row.userid)}}},[e._v("详情")])]}}])})],1)],1)])])]):e._e(),e._v(" "),e.info?e._e():a("el-form",{ref:"form",attrs:{"label-width":"15%"}},[a("div",{attrs:{id:"vue_head"}},[a("div",{staticClass:"top_title title"},[a("span",{staticStyle:{cursor:"pointer"},on:{click:e.btnCustomer}},[e._v("客户管理")]),e._v("\n          > "),a("span",[e._v("客户详情")])]),e._v(" "),a("div",{staticClass:"base_set"},[a("div",{staticClass:"vue-main-title"},[a("div",{staticClass:"vue-main-title-left"}),e._v(" "),a("div",{staticClass:"vue-main-title-content"},[e._v("客户基本信息")])]),e._v(" "),a("div",{staticClass:"vue-main-form vue-main-title"},[a("el-form",{staticStyle:{width:"100%"},attrs:{"label-width":"220px"}},[a("el-form-item",{attrs:{label:"客户信息"}},[a("div",{staticClass:"img_box"},[a("img",{staticClass:"member_img",attrs:{src:e.customer.avatar}}),e._v(" "),a("span",{staticClass:"member_nickName context"},[e._v(e._s(e.customer.name))])])]),e._v(" "),a("el-form-item",{attrs:{label:"客户类型"}},[a("span",{staticClass:"context"},[e._v(e._s(1===e.customer.external_type?"微信用户":"企业微信用户"))])]),e._v(" "),a("el-form-item",{attrs:{label:"性别"}},[a("span",{staticClass:"context"},[e._v(e._s(0===e.customer.gender?"未知":1===e.customer.gender?"男性":"女性"))])]),e._v(" "),a("el-form-item",{attrs:{label:"userid"}},[a("span",{staticClass:"context"},[e._v(e._s(e.customer.external_userid))])]),e._v(" "),a("el-form-item",{attrs:{label:"微信unionid"}},[a("span",{staticClass:"context"},[e._v(e._s(e.customer.unionid))])]),e._v(" "),a("el-form-item",{attrs:{label:"发起添加用户信息"}},[a("span",{staticClass:"context"},[e._v(e._s(e.customer.name))])]),e._v(" "),a("el-form-item",{attrs:{label:"发起添加用户类型"}},[a("span",{staticClass:"context"},[e._v(e._s(1===e.customer.external_type?"微信用户":"企业微信用户"))])])],1)],1)]),e._v(" "),a("div",{staticClass:"base_set"},[a("div",{staticClass:"vue-main-title"},[a("div",{staticClass:"vue-main-title-left"}),e._v(" "),a("div",{staticClass:"vue-main-title-content"},[e._v("客户企业信息")])]),e._v(" "),a("div",{staticClass:"vue-main-form vue-main-title"},[a("el-form",{staticStyle:{width:"100%"},attrs:{"label-width":"220px"}},[a("el-form-item",{attrs:{label:"职业"}},[a("span",{staticClass:"context"},[e._v(e._s(e.enterprise.position))])]),e._v(" "),a("el-form-item",{attrs:{label:"企业的简称"}},[a("span",{staticClass:"context"},[e._v(e._s(e.enterprise.corp_name))])]),e._v(" "),a("el-form-item",{attrs:{label:"企业名称"}},[a("span",{staticClass:"context"},[e._v(e._s(e.enterprise.corp_full_name))])]),e._v(" "),a("el-form-item",{attrs:{label:"自定义信息"}},[a("span",{staticClass:"context"},[e._v(e._s("null"===e.enterprise.external_profile?"":e.enterprise.external_profile))])])],1)],1)]),e._v(" "),a("div",{staticClass:"base_set"},[a("div",{staticClass:"vue-main-title"},[a("div",{staticClass:"vue-main-title-left"}),e._v(" "),a("div",{staticClass:"vue-main-title-content"},[e._v("企业成员对客户的关联信息")])]),e._v(" "),a("div",{staticClass:"vue-main-form vue-main-title"},[a("el-form",{staticStyle:{width:"100%"},attrs:{"label-width":"220px"}},[a("el-form-item",{attrs:{label:"添加客户成员名称"}},[a("span",{staticClass:"context"},[e._v(e._s(e.enterprise_customer.name))])]),e._v(" "),a("el-form-item",{attrs:{label:"成员对客户的备注"}},[a("span",{staticClass:"context"},[e._v(e._s(e.enterprise_customer.remark))])]),e._v(" "),a("el-form-item",{attrs:{label:"成员对客户的描述"}},[a("span",{staticClass:"context"},[e._v(e._s(e.enterprise_customer.description))])]),e._v(" "),a("el-form-item",{attrs:{label:"成员添加客户的时间"}},[a("span",{staticClass:"context"},[e._v(e._s(e._f("formatDate")(e.enterprise_customer.createtime)))])]),e._v(" "),a("el-form-item",{attrs:{label:"成员对客户打标签的分组名称"}},[a("span",{staticClass:"context"},[e._v(e._s(e.enterprise_customer.group_name))])]),e._v(" "),a("el-form-item",{attrs:{label:"成员对客户打标签的名称"}},[a("span",{staticClass:"context"},[e._v(e._s(e.enterprise_customer.tag_name))])]),e._v(" "),a("el-form-item",{attrs:{label:"成员对客户打标签的类型"}},[a("span",{staticClass:"context"},[e._v(e._s(2===e.enterprise_customer.type?"用户自定义":"企业设置"))])]),e._v(" "),a("el-form-item",{attrs:{label:"成员对客户备注的企业名称"}},[a("span",{staticClass:"context"},[e._v(e._s(e.enterprise_customer.remark_corp_name))])]),e._v(" "),a("el-form-item",{attrs:{label:"成员对客户备注的手机号"}},[a("span",{staticClass:"context"},[e._v(e._s(e.enterprise_customer.mobile))])]),e._v(" "),a("el-form-item",{attrs:{label:"成员添加此客户的来源"}},[a("span",{staticClass:"context"},[e._v(e._s(e._f("addWay")(e.enterprise_customer.add_way)))])])],1)],1)])])]),e._v(" "),a("el-dialog",{attrs:{title:"操作提示",visible:e.sysnSystemDataTipsShow,width:"30%",center:""},on:{"update:visible":function(t){e.sysnSystemDataTipsShow=t}}},[a("span",[e._v("公众号未绑定开放平台会导致会员重复")]),e._v(" "),a("span",{attrs:{slot:"footer"},slot:"footer"},[a("el-button",{staticStyle:{"margin-right":"10px"},attrs:{type:"primary"},on:{click:e.synSystemData}},[e._v("\n          确定\n        ")]),e._v(" "),a("el-button",{on:{click:function(t){e.sysnSystemDataTipsShow=!1}}},[e._v("\n          取消\n        ")])],1)]),e._v(" "),a("div",{staticClass:"vue-page"},[a("el-row",[e.info?a("el-col",{attrs:{align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:e.total,"page-size":e.per_page,"current-page":e.current_page,background:""},on:{"current-change":e.search}})],1):e._e(),e._v(" "),e.info?e._e():a("el-col",{attrs:{align:"center"}},[a("el-button",{on:{click:e.btnBack}},[e._v("返回")])],1)],1)],1)],1)],1)},[],!1,null,"cf932220",null));p.options.__file="index.vue";t.default=p.exports}}]);