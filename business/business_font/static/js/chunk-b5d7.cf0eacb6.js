(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-b5d7"],{"/01j":function(e,t,s){"use strict";s.r(t);var a={components:{dialog_choice_department_staff:s("x8Yw").a},data:function(){return{person_id:"",seal_id:"",options:[],loading:!1,signerLoading:!1,addDepartmentTipsShow:!1,checkAll:!1,isIndeterminate:!1,worker_list:[],progressFlag1:!1,progressFlag2:!1,progressPercent1:0,progressPercent2:0,id:"",currIndex:1,maxSize:104693760,contract_attach:[],contract_doc_name:"",contract_doc_url:"",showSeal:"0",showSigner:"0",ruleForm:{name:"",status:!0,auth_worker_status:"0",auth_worker:[]},rules:{name:[{required:!0,message:"请输入模版名称",trigger:"blur"}]},checkboxArr:[],checkboxIds:{}}},watch:{},created:function(){this.id=this.$route.query.id,this.getDeatil()},destroyed:function(){},methods:{remoteMethod:function(e){var t=this;this.signerLoading=!0,$http.post("plugin.yun-sign.frontend.company-seal.getWorkerList",{kwd:e}).then(function(e){1===e.result?t.worker_list=e.data.worker_list:console.log(e.msg),t.signerLoading=!1}).catch(function(e){console.log(e)})},remoteMethodSeal:function(e){var t=this;this.loading=!0,$http.post("plugin.yun-sign.frontend.template.getCompanySeal",{kwd:e}).then(function(e){1===e.result?t.options=e.data:console.log(e.msg),t.loading=!1}).catch(function(e){console.log(e)})},choiceComfirm:function(e){this.checkboxArr=e.checkboxArr,this.checkboxIds=e.checkboxIds},delChoice:function(e){"staff"==e.type?delete this.checkboxIds[e.user_id]:delete this.checkboxIds[e.id];var t=[];for(var s in this.checkboxIds)t.push(this.checkboxIds[s]);this.checkboxArr=t},openChoice:function(){var e=this;this.addDepartmentTipsShow=!0,this.$nextTick(function(){e.$refs.dialog_choice_department_staff.setChoiceData(e.checkboxIds)})},getDeatil:function(){var e=this;$http.post("plugin.yun-sign.frontend.template.get-detail",{id:this.id},"loading").then(function(t){if(1===t.result){e.Data=t.data,e.ruleForm.name=e.Data.name,1==e.Data.status?e.ruleForm.status=!0:e.ruleForm.status=!1,e.contract_doc_name=e.Data.contract_doc_name,e.contract_doc_url=e.Data.contract_doc_url,e.contract_attach=e.Data.contract_attach||[],e.Data.auth_worker_status&&(e.ruleForm.auth_worker_status=e.Data.auth_worker_status.toString());var s=e.Data.staff||[],a=e.Data.department||[];e.checkboxArr=s.concat(a)||[];var o={};e.checkboxArr.map(function(e){e.user_id?e.type="staff":e.type="department",o[e.user_id?e.user_id:e.id]=e}),e.checkboxIds=o,e.Data.appoint_person&&(e.showSigner="1",e.person_id=e.Data.appoint_person.name),e.Data.appoint_seal&&(e.showSeal="1",e.seal_id=e.Data.appoint_seal.name),e.remoteMethodSeal("")}else e.$message.error(t.msg)}).catch(function(e){console.log(e)})},selectStyle:function(){this.currIndex=1},outStyle:function(){this.currIndex=1},deleteSingle:function(){this.contract_doc_name="",this.contract_doc_url=""},deleteList:function(e){this.contract_attach.splice(e,1)},onProgress1:function(e,t,s){this.progressPercent1=Number(e.percent.toFixed(2))},onProgress2:function(e,t,s){this.progressPercent2=Number(e.percent.toFixed(2))},beforeUpload1:function(e){if(e.size>=this.maxSize)return this.$message.error("文件大小超出10M"),!1;this.progressFlag1=!0},beforeUpload2:function(e){if(e.size>=this.maxSize)return this.$message.error("文件大小超出10M"),!1;this.progressFlag2=!0},onSuccess:function(e,t,s){100===this.progressPercent1&&(this.progressFlag1=!1,this.progressPercent1=0),this.contract_doc_name=e.data.file_name,this.contract_doc_url=e.data.file_url},onSuccess2:function(e,t,s){100===this.progressPercent2&&(this.progressFlag2=!1,this.progressPercent2=0),this.contract_attach.push(e.data)},onError:function(){this.progressFlag1=!1,this.progressFlag2=!1,this.progressPercent1=0,this.progressPercent2=0,this.$message.error("上传失败请重新上传")},submitForm:function(e){var t=this;if(this.ruleForm.name)if(this.contract_doc_url){var s=this.ruleForm.auth_worker;s=s.map(function(e){return{worker_id:e}});var a=0;a=this.ruleForm.status?1:0;var o={name:this.ruleForm.name,status:a,auth_worker_status:this.ruleForm.auth_worker_status,auth_worker:s,contract_doc_name:this.contract_doc_name,contract_doc_url:this.contract_doc_url,contract_attach:this.contract_attach||[]},r=[],i=[];this.checkboxArr.map(function(e){"staff"==e.type?r.push(e.id):i.push(e.id)}),o.staff_ids=r,o.department_ids=i,"1"==this.showSeal&&(o.seal_id=Number(this.seal_id)>=0?this.seal_id:this.Data.appoint_seal?this.Data.appoint_seal.id:""),"1"==this.showSigner&&(o.person_id=Number(this.person_id)>=0?this.person_id:this.Data.appoint_person?this.Data.appoint_person.id:"");var n="";"save"==e?(o.id=this.id,n="plugin.yun-sign.frontend.template.edit-template"):n="plugin.yun-sign.frontend.template.add-template",$http.post(n,o,"loading").then(function(e){if(1===e.result){var s="";s=e.data.template_id?e.data.template_id:t.id,t.$router.push(t.fun.getUrl("set_template",{id:s}))}else t.$message.error(e.msg)}).catch(function(e){console.log(e)})}else this.$message.error("请先上传模版文件");else this.$message.error("请先填写模版名称")}}},o=(s("FEgw"),s("KHd+")),r=Object(o.a)(a,function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{attrs:{id:"sign"}},[a("div",{staticStyle:{"font-size":"14px",color:"#666666","margin-bottom":"10px"}},[e._v("电子合同 -> 企业管理 -> 模板管理 -> 创建模板")]),e._v(" "),a("div",{staticClass:"box"},[e._m(0),e._v(" "),a("div",{staticStyle:{"padding-right":"50px"}},[a("el-form",{ref:"ruleForm",staticClass:"demo-ruleForm",attrs:{model:e.ruleForm,rules:e.rules,"label-width":"140px"},nativeOn:{submit:function(e){e.preventDefault()}}},[a("el-form-item",{attrs:{label:"模版名称",prop:"name"}},[a("el-input",{attrs:{placeholder:"请输入模版名称"},model:{value:e.ruleForm.name,callback:function(t){e.$set(e.ruleForm,"name","string"==typeof t?t.trim():t)},expression:"ruleForm.name"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"状态"}},[a("el-switch",{model:{value:e.ruleForm.status,callback:function(t){e.$set(e.ruleForm,"status",t)},expression:"ruleForm.status"}}),e._v(" "),a("span",{staticStyle:{"margin-left":"20px"}},[e._v(e._s(e.ruleForm.status?"启用":"禁用"))])],1),e._v(" "),a("el-form-item",{attrs:{label:"是否指定印章"}},[a("el-radio",{attrs:{label:"1"},model:{value:e.showSeal,callback:function(t){e.showSeal=t},expression:"showSeal"}},[e._v("是")]),e._v(" "),a("el-radio",{attrs:{label:"0"},model:{value:e.showSeal,callback:function(t){e.showSeal=t},expression:"showSeal"}},[e._v("否")]),e._v(" "),1==e.showSeal?a("el-select",{staticStyle:{width:"250px"},attrs:{filterable:"",remote:"","reserve-keyword":"",placeholder:"可搜索选择印章","remote-method":e.remoteMethodSeal,loading:e.loading},model:{value:e.seal_id,callback:function(t){e.seal_id=t},expression:"seal_id"}},e._l(e.options,function(e){return a("el-option",{key:e.id,attrs:{label:e.name,value:e.id}})})):e._e()],1),e._v(" "),a("el-form-item",{attrs:{label:"可见范围"}},[a("div",{staticStyle:{display:"flex","flex-wrap":"wrap"}},[a("div",{staticClass:"show-people"},e._l(e.checkboxArr,function(t){return a("span",{staticClass:"show-people-item"},[a("i",{staticClass:"iconfont ",class:["department"==t.type?"icon-fontclass-bumenguanli":"icon-fontclass-yuangongguanli"]}),e._v(e._s(t.name)),a("i",{staticClass:"iconfont icon-close11",on:{click:function(s){e.delChoice(t)}}})])})),e._v(" "),a("el-button",{attrs:{type:"text"},on:{click:e.openChoice}},[e._v("添加")])],1)]),e._v(" "),a("el-form-item",{attrs:{label:"是否指定签署人"}},[a("el-radio",{attrs:{label:"1"},model:{value:e.showSigner,callback:function(t){e.showSigner=t},expression:"showSigner"}},[e._v("是")]),e._v(" "),a("el-radio",{attrs:{label:"0"},model:{value:e.showSigner,callback:function(t){e.showSigner=t},expression:"showSigner"}},[e._v("否")]),e._v(" "),1==e.showSigner?a("el-select",{staticStyle:{width:"250px"},attrs:{filterable:"",remote:"","reserve-keyword":"",placeholder:"搜索员工姓名选择指定签署人","remote-method":e.remoteMethod,loading:e.signerLoading},model:{value:e.person_id,callback:function(t){e.person_id=t},expression:"person_id"}},e._l(e.worker_list,function(e){return a("el-option",{key:e.person.id,attrs:{label:e.name+(e.person?e.person.tel:""),value:e.person.id}})})):e._e()],1)],1)],1)]),e._v(" "),a("dialog_choice_department_staff",{ref:"dialog_choice_department_staff",attrs:{from:"sign",show:e.addDepartmentTipsShow},on:{confirm:e.choiceComfirm,"update:show":function(t){e.addDepartmentTipsShow=t}}}),e._v(" "),a("div",{staticClass:"box"},[e._m(1),e._v(" "),a("div",{staticClass:"template-box"},[a("el-row",[a("el-col",{attrs:{span:3}},[a("div",[e._v("合同文档")])]),e._v(" "),a("el-col",{attrs:{span:10}},[e.contract_doc_name?e._e():a("el-upload",{ref:"upload",staticClass:"upload-demo",attrs:{"show-file-list":!1,"before-upload":e.beforeUpload1,"on-progress":e.onProgress1,"on-success":e.onSuccess,"on-error":e.onError,accept:"application/pdf",action:e.fun.getRealUrl("plugin.yun-sign.frontend.template.upload")}},[a("div",{directives:[{name:"show",rawName:"v-show",value:e.progressFlag1,expression:"progressFlag1"}],staticClass:"progress-box"},[a("el-progress",{attrs:{type:"circle",percentage:e.progressPercent1}})],1),e._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:!e.progressFlag1,expression:"!progressFlag1"}],staticClass:"fileAddItem_1Vqb7"},[a("i",{staticClass:"iconfont icon-adsystem_icon_add"}),e._v(" "),a("p",{staticClass:"defaultInfoStyle_2mgdq"},[e._v("添加模版")])]),e._v(" "),a("div",{staticClass:"el-upload__tip",attrs:{slot:"tip"},slot:"tip"},[e._v("支持10M以内的pdf格式文件")])]),e._v(" "),a("div",{staticStyle:{height:"20px"}}),e._v(" "),e.contract_doc_name?a("div",{staticClass:"fileItemArea_2VWWl"},[a("div",{staticClass:"imgPlaceholder_22teb"},[a("div",{directives:[{name:"show",rawName:"v-show",value:1==e.currIndex,expression:"currIndex == 1"}],on:{mouseover:e.selectStyle,mouseout:e.outStyle}},[a("img",{attrs:{src:s("ud4p"),alt:""}})]),e._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:0==e.currIndex,expression:"currIndex == 0"}],on:{mouseover:e.selectStyle,mouseout:e.outStyle}},[a("img",{attrs:{src:s("G2Fa"),alt:""}})])]),e._v(" "),a("div",{staticClass:"fileInfoArea_3dGBW"},[a("p",{staticClass:"fileName_25vmY"},[e._v(e._s(e.contract_doc_name))]),e._v(" "),a("p",{staticClass:"fileName_25vmY deleted",on:{click:e.deleteSingle}},[a("i",{staticClass:"el-icon-delete"}),e._v("删除")])])]):e._e()],1)],1),e._v(" "),a("el-row",[a("el-col",{attrs:{span:3}},[a("div",[e._v("模版附件")])]),e._v(" "),a("el-col",{attrs:{span:20}},[a("el-upload",{ref:"upload",staticClass:"upload-demo",attrs:{"show-file-list":!1,"before-upload":e.beforeUpload2,"on-progress":e.onProgress2,"on-success":e.onSuccess2,"on-error":e.onError,accept:"application/pdf",action:e.fun.getRealUrl("plugin.yun-sign.frontend.template.upload")}},[a("el-button",{attrs:{size:"small",type:"primary"}},[e._v("点击上传附件")]),e._v(" "),a("div",{staticClass:"el-upload__tip",attrs:{slot:"tip"},slot:"tip"},[e._v("支持10M以内的pdf格式文件")])],1),e._v(" "),a("div",{staticStyle:{height:"20px"}}),e._v(" "),e._l(e.contract_attach,function(t,o){return a("div",{key:o,staticClass:"fileItemArea_2VWWl"},[a("div",{staticClass:"imgPlaceholder_22teb"},[a("div",{directives:[{name:"show",rawName:"v-show",value:1==e.currIndex,expression:"currIndex == 1"}],on:{mouseover:e.selectStyle,mouseout:e.outStyle}},[a("img",{attrs:{src:s("ud4p"),alt:""}})]),e._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:0==e.currIndex,expression:"currIndex == 0"}],on:{mouseover:e.selectStyle,mouseout:e.outStyle}},[a("img",{attrs:{src:s("G2Fa"),alt:""}})])]),e._v(" "),a("div",{staticClass:"fileInfoArea_3dGBW"},[a("p",{staticClass:"fileName_25vmY"},[e._v(e._s(t.file_name))]),e._v(" "),a("p",{staticClass:"fileName_25vmY deleted",on:{click:function(t){e.deleteList(o)}}},[a("i",{staticClass:"el-icon-delete"}),e._v("删除")])])])}),e._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:e.progressFlag2,expression:"progressFlag2"}],staticClass:"progress-box",staticStyle:{display:"inline-block"}},[a("el-progress",{attrs:{type:"circle",percentage:e.progressPercent2}})],1)],2)],1)],1)]),e._v(" "),a("div",{staticStyle:{"text-align":"center"}},[e.id?a("el-button",{staticStyle:{width:"300px"},attrs:{type:"primary"},on:{click:function(t){e.submitForm("save")}}},[e._v("下一步")]):a("el-button",{staticStyle:{width:"300px"},attrs:{type:"primary"},on:{click:e.submitForm}},[e._v("下一步")])],1)],1)},[function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"right-head"},[t("div",{staticClass:"right-head-con"},[t("span",{staticClass:"green-title-line"}),this._v("模版基本信息")])])},function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"right-head"},[t("div",{staticClass:"right-head-con"},[t("span",{staticClass:"green-title-line"}),this._v("上传模版")])])}],!1,null,"9230b58c",null);r.options.__file="create_template.vue";t.default=r.exports},"2lpc":function(e,t,s){},FEgw:function(e,t,s){"use strict";var a=s("2lpc");s.n(a).a},G2Fa:function(e,t){e.exports="data:image/png;base64,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"},ud4p:function(e,t){e.exports="data:image/png;base64,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"}}]);