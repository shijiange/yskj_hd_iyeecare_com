(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-877e"],{"5mjz":function(e,t,a){},"8FTT":function(e,t,a){"use strict";var i=a("5mjz");a.n(i).a},Ajro:function(e,t,a){"use strict";a.r(t);var i={components:{dialog_choice_department_staff:a("x8Yw").a},data:function(){return{checkboxArr:[],manager_uid:[],worker_uid:[],chooseStr:"",staffArr:[],departmentArr:[],addDepartmentTipsShow:!1,dialog_show:!1,isVerify:!0,timeNumber:60,imgcode:"",form:{mobile:"",code:"",captcha:""},dialogVisible:!1,list:[],list2:[],worker_ids:[],pageSize:0,current_page:0,total:0,pageSize2:0,current_page2:0,total2:0,company:{},kwd:"",ruleForm:{name:"",use_scene:[]},isAccredit:!1}},watch:{},created:function(){this.id=this.$route.params.id,this.getData()},destroyed:function(){},methods:{showAddDepartment:function(e){this.chooseStr=e,"manager"==this.chooseStr?this.checkboxArr=this.manager_uid:this.checkboxArr=this.worker_uid,this.addDepartmentTipsShow=!0},choiceComfirm:function(e){"manager"==this.chooseStr?this.manager_uid=e.checkboxArr:this.worker_uid=e.checkboxArr,this.staffArr=e.staffArr},delChoice:function(e,t){"manager"==t?this.manager_uid=this.manager_uid.filter(function(t){return t.id!=e.id}):this.worker_uid=this.worker_uid.filter(function(t){return t.id!=e.id})},toUrl:function(e){this.$router.push(this.fun.getUrl(e))},isArrEqual:function(e,t){var a=!0;return e.length!==t.length?a=!1:e.forEach(function(e){-1===t.indexOf(e)&&(a=!1)}),a},getimgdata:function(e){var t=this;void 0!==e&&e.captcha?this.imgcode=e.captcha.img:$http.get("home-page.getCaptcha").then(function(e){e.data.captcha&&(t.imgcode=e.data.captcha.img)}).catch(function(e){console.log(e)})},getcode:function(){this.isVerify=!1;var e=this;this.timmer=setInterval(function(){e.timeNumber=--e.timeNumber,0===e.timeNumber&&(e.isVerify=!0,e.timeNumber=60,clearInterval(e.timmer))},1e3)},sendCode:function(){var e=this;$http.post("plugin.yun-sign.frontend.company-seal.empowerWorkerSms",{uids:this.worker_uid.map(function(e){return e.id})},"loading").then(function(t){1===t.result?(e.$message.success("验证码已发送"),e.getcode()):t.msg&&e.$message.error(t.msg)}).catch(function(e){console.log(e)})},sureAccredit:function(){var e=this;this.form.code?$http.post("plugin.yun-sign.frontend.company-seal.empowerWorker",{uids:this.worker_uid.map(function(e){return e.id}),sms_code:this.form.code},"loading").then(function(t){1===t.result?(e.dialog_show=!1,e.isAccredit=!0,e.$message.success("授权成功"),e.submitSeal()):t.msg&&e.$message.error(t.msg)}).catch(function(e){console.log(e)}):this.$message.error("请输入验证码")},handleSelectionChange:function(e){this.multipleSelection=e;var t=[];this.multipleSelection=this.multipleSelection.map(function(e){t.push(e.id)}),this.worker_ids=t.join(",")},cancelIt:function(){this.dialogVisible=!1,this.kwd=""},handleDelete:function(e){var t=this;$http.post("plugin.yun-sign.frontend.worker.delete-seal-auth",{id:e},"loading").then(function(e){1===e.result?(t.$message.success("删除成功"),t.currentChange(t.current_page)):e.msg&&t.$message.error(e.msg)}).catch(function(e){console.log(e)})},sureAdd:function(){var e=this;$http.post("plugin.yun-sign.frontend.worker.add-seal-auth",{seal_id:this.id,worker_ids:this.worker_ids},"loading").then(function(t){1===t.result?(e.dialogVisible=!1,e.$message.success("添加成功"),e.currentChange(e.current_page)):t.msg&&e.$message.error(t.msg)}).catch(function(e){console.log(e)})},currentChange:function(e){var t=this;$http.post("plugin.yun-sign.frontend.worker.get-seal-auth-worker",{page:e,seal_id:this.id},"loading").then(function(e){1===e.result?(t.total=e.data.total,t.pageSize=e.data.per_page,t.list=e.data.data,t.current_page=e.data.current_page):(t.list=[],-1===e.data.status&&t.currentChange(1),t.$message.error(e.msg)),t.loading=!1}).catch(function(e){t.loading=!1,console.error(e)})},currentChange2:function(e){var t=this;$http.post("plugin.yun-sign.frontend.worker.get-none-seal-auth-worker",{page:e,seal_id:this.id,kwd:this.kwd},"loading").then(function(e){1===e.result?(t.dialogVisible=!0,t.total2=e.data.total,t.pageSize2=e.data.per_page,t.list2=e.data.data,t.current_page2=e.data.current_page):(t.list2=[],-1===e.data.status&&t.currentChange2(1),t.$message.error(e.msg)),t.loading=!1}).catch(function(e){t.loading=!1,console.error(e)})},getData:function(){var e=this;$http.post("plugin.yun-sign.frontend.company-seal.detail",{id:this.id},"loading").then(function(t){1===t.result?(e.company=t.data,e.form.mobile=t.data.legal_tel,e.manager_uid=t.data.seal_manage_data.managers,e.worker_uid=t.data.seal_manage_data.workers||[],e.ruleForm.use_scene=t.data.seal_manage_data.use_scene):t.msg&&e.$message.error(t.msg)}).catch(function(e){console.log(e)})},submitSeal:function(){var e=this,t=this.worker_uid.filter(function(e){return e.id}),a=[];this.company.seal_manage_data&&this.company.seal_manage_data.workers&&Array.isArray(this.company.seal_manage_data.workers)&&(a=this.company.seal_manage_data.workers.filter(function(e){return e.id})),this.isArrEqual(t,a)||this.isAccredit?$http.post("plugin.yun-sign.frontend.company-seal.editSeal",{id:this.id,form:{manager_uid:this.manager_uid.map(function(e){return e.id}),worker_uid:this.worker_uid.map(function(e){return e.id}),use_scene:this.ruleForm.use_scene}},"loading").then(function(t){1===t.result?t.msg&&e.$message.success(t.msg):t.msg&&e.$message.error(t.msg)}).catch(function(t){e.loading=!1,console.error(t)}):this.dialog_show=!0}}},s=(a("8FTT"),a("ZrdR")),n=Object(s.a)(i,function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{attrs:{id:"sign"}},[a("div",{staticStyle:{"font-size":"14px",color:"#666666","margin-bottom":"10px"}},[e._v("电子合同 -> 企业管理 -> 企业印章 -> 印章设置")]),e._v(" "),a("div",{staticClass:"box"},[e._m(0),e._v(" "),a("div",{staticStyle:{"padding-right":"50px"}},[a("el-form",{ref:"ruleForm",staticClass:"demo-ruleForm",attrs:{model:e.ruleForm,"label-width":"120px"},nativeOn:{submit:function(e){e.preventDefault()}}},[a("el-form-item",{attrs:{label:"印章名称",prop:"name","label-width":"200px"}},[a("p",{staticStyle:{"margin-left":"40px"}},[e._v(e._s(e.company.name))])]),e._v(" "),a("el-form-item",{attrs:{label:"效果预览","label-width":"200px"}},[a("div",{staticClass:"img-box"},[a("img",{attrs:{src:e.company.seal_url,alt:""}})])])],1)],1)]),e._v(" "),a("div",[a("el-form",{ref:"ruleForm",staticClass:"demo-ruleForm",attrs:{model:e.ruleForm,"label-width":"140px"},nativeOn:{submit:function(e){e.preventDefault()}}},[a("el-form-item",{attrs:{label:"印章管理员","label-width":"200px"}},[a("div",{staticStyle:{display:"flex","flex-wrap":"wrap"}},[a("div",{staticClass:"show-people"},e._l(e.manager_uid,function(t){return a("span",{staticClass:"show-people-item"},[a("i",{staticClass:"iconfont ",class:["department"==t.type?"icon-fontclass-bumenguanli":"icon-fontclass-yuangongguanli"]}),e._v(e._s(t.name)),1==e.company.is_legal?a("i",{staticClass:"iconfont icon-close11",on:{click:function(a){e.delChoice(t,"manager")}}}):e._e()])})),e._v(" "),1==e.company.is_legal?a("el-button",{attrs:{type:"text"},on:{click:function(t){e.showAddDepartment("manager")}}},[e._v("添加")]):e._e()],1),e._v(" "),a("p",[e._v("只有法人可以添加印章管理员；印章管理员可以给该印章授权员工使用。法人、企业管理员、印章管理员默认都具备使用权限。")])]),e._v(" "),a("el-form-item",{attrs:{label:"授权员工","label-width":"200px"}},[a("div",{staticStyle:{display:"flex","flex-wrap":"wrap"}},[a("div",{staticClass:"show-people"},e._l(e.worker_uid,function(t){return a("span",{staticClass:"show-people-item"},[a("i",{staticClass:"iconfont ",class:["department"==t.type?"icon-fontclass-bumenguanli":"icon-fontclass-yuangongguanli"]}),e._v(e._s(t.name)),1==e.company.is_legal||1==e.company.is_company_manager||1==e.company.is_seal_manager?a("i",{staticClass:"iconfont icon-close11",on:{click:function(a){e.delChoice(t,"worker")}}}):e._e()])})),e._v(" "),1==e.company.is_legal||1==e.company.is_company_manager||1==e.company.is_seal_manager?a("el-button",{attrs:{type:"text"},on:{click:function(t){e.showAddDepartment("worker")}}},[e._v("添加")]):e._e()],1)]),e._v(" "),a("el-form-item",{attrs:{label:"授权员工使用印章场景","label-width":"200px"}},[a("el-checkbox-group",{model:{value:e.ruleForm.use_scene,callback:function(t){e.$set(e.ruleForm,"use_scene",t)},expression:"ruleForm.use_scene"}},[a("el-checkbox",{attrs:{disabled:1!=e.company.is_legal&&1!=e.company.is_company_manager&&1!=e.company.is_seal_manager,label:"1"}},[e._v("模板签署")]),e._v(" "),a("el-checkbox",{attrs:{disabled:1!=e.company.is_legal&&1!=e.company.is_company_manager&&1!=e.company.is_seal_manager,label:"2"}},[e._v("发起签署")])],1)],1)],1)],1),e._v(" "),a("dialog_choice_department_staff",{ref:"dialog_choice_department_staff",attrs:{choosedArr:e.checkboxArr,from:"sign",only_staff:!0,show:e.addDepartmentTipsShow},on:{confirm:e.choiceComfirm,"update:show":function(t){e.addDepartmentTipsShow=t}}}),e._v(" "),a("el-dialog",{attrs:{title:"添加授权意愿认证",visible:e.dialog_show,"close-on-click-modal":!1,width:"60%"},on:{"update:visible":function(t){e.dialog_show=t}}},[a("div",[a("el-form",{ref:"form",attrs:{model:e.form,"label-width":"100px"}},[a("el-form-item",{attrs:{label:"手机号码"}},[a("div",{staticClass:"flex flex-a-c"},[a("el-input",{attrs:{disabled:!0,placeholder:"请输入手机号码"},model:{value:e.form.mobile,callback:function(t){e.$set(e.form,"mobile",t)},expression:"form.mobile"}})],1)]),e._v(" "),e.imgcode?a("el-form-item",{attrs:{label:"图形验证码"}},[a("div",{staticClass:"flex flex-a-c"},[a("div",{staticClass:"imgwrap",staticStyle:{position:"relative",display:"flex","align-items":"center"}},[a("el-input",{attrs:{placeholder:"请输入右侧图形验证码"},model:{value:e.form.captcha,callback:function(t){e.$set(e.form,"captcha",t)},expression:"form.captcha"}}),e._v(" "),a("img",{staticClass:"imgCode",attrs:{src:e.imgcode},on:{click:e.getimgdata}})],1)])]):e._e(),e._v(" "),a("el-form-item",{attrs:{label:"验证码"}},[a("div",{staticStyle:{position:"relative",display:"flex","align-items":"center"}},[a("el-input",{attrs:{placeholder:"验证码"},model:{value:e.form.code,callback:function(t){e.$set(e.form,"code",t)},expression:"form.code"}}),e._v(" "),e.isVerify?a("div",{staticClass:"getCode",on:{click:e.sendCode}},[e._v("获取验证码")]):e._e(),e._v(" "),e.isVerify?e._e():a("div",{staticClass:"getCode",staticStyle:{color:"#666"}},[e._v("重新发送("+e._s(e.timeNumber)+"秒)")])],1)])],1)],1),e._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{attrs:{type:"primary"},on:{click:e.sureAccredit}},[e._v("确定")]),e._v(" "),a("el-button",{on:{click:function(t){e.dialog_show=!1}}},[e._v("取 消")])],1)]),e._v(" "),a("div",{staticClass:"buttonLis"},[a("el-button",{staticStyle:{width:"200px"},attrs:{type:"primary"},on:{click:e.submitSeal}},[e._v("提交")]),e._v(" "),a("el-button",{staticStyle:{width:"200px","margin-left":"50px"},on:{click:function(t){e.toUrl("sealCompanyList")}}},[e._v("返回")])],1),e._v(" "),e._e(),e._v(" "),a("el-dialog",{attrs:{title:"新增印章持有人",visible:e.dialogVisible,width:"700px","close-on-click-modal":!1,"show-close":!1},on:{"update:visible":function(t){e.dialogVisible=t}}},[a("div",{staticStyle:{padding:"0 30px"}},[a("div",{staticClass:"search"},[a("el-input",{staticStyle:{width:"70%","margin-right":"5%"},attrs:{placeholder:"输入员工姓名"},model:{value:e.kwd,callback:function(t){e.kwd=t},expression:"kwd"}}),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(t){e.currentChange2(1)}}},[e._v("查询")])],1),e._v(" "),a("div",{staticClass:"pop-table"},[a("el-table",{ref:"multipleTable",staticStyle:{width:"100%"},attrs:{data:e.list2,"tooltip-effect":"dark",border:!0},on:{"selection-change":e.handleSelectionChange}},[a("el-table-column",{attrs:{type:"selection",width:"55"}}),e._v(" "),a("el-table-column",{attrs:{prop:"name",label:"姓名"}}),e._v(" "),a("el-table-column",{attrs:{prop:"has_one_member.mobile",label:"手机号"}})],1)],1),e._v(" "),a("el-col",{staticStyle:{padding:"15px 5% 15px 0"},attrs:{span:24,align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next","current-page":e.current_page,"page-size":e.pageSize,total:e.total,background:""},on:{"current-change":e.currentChange2,"update:currentPage":function(t){e.current_page=t}}})],1)],1),e._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:e.cancelIt}},[e._v("取 消")]),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:e.sureAdd}},[e._v("确 定")])],1)])],1)},[function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"right-head"},[t("div",{staticClass:"right-head-con"},[t("span",{staticClass:"green-title-line"}),this._v("印章基本信息")])])},function(){var e=this.$createElement,t=this._self._c||e;return t("p",{staticStyle:{flex:"1",display:"flex","align-items":"center"}},[t("span",{staticClass:"green-title-line"}),this._v("印章持有人")])}],!1,null,"6506a206",null);n.options.__file="company_seal.vue";t.default=n.exports}}]);