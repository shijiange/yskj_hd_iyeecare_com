(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-1b68"],{"4kY+":function(e,t,r){},"5G0V":function(e,t,r){"use strict";var o=r("4kY+");r.n(o).a},Oh87:function(e,t,r){"use strict";r.r(t);var o={data:function(){return{form:{open_state:0,corpid:"",agentid:"",agent_secret:"",contact_secret:"",contact_token:"",contact_aes_key:"",customer_secret:"",customer_token:"",customer_aes_key:"",work_session_secret:"",work_session_aes_key:"",work_session_aes_key_version:"",contact_notice_url:"",customer_notice_url:""},rules:{corpid:[{required:!0,message:"请项为必填项",trigger:"blur"}],agentid:[{required:!0,message:"请项为必填项",trigger:"blur"}],agent_secret:[{required:!0,message:"请项为必填项",trigger:"blur"}],contact_secret:[{required:!0,message:"请项为必填项",trigger:"blur"}],contact_token:[{required:!0,message:"请项为必填项",trigger:"blur"}],contact_aes_key:[{required:!0,message:"请项为必填项",trigger:"blur"}],customer_secret:[{required:!0,message:"请项为必填项",trigger:"blur"}],customer_token:[{required:!0,message:"请项为必填项",trigger:"blur"}],customer_aes_key:[{required:!0,message:"请项为必填项",trigger:"blur"}]},arrSp:[{category_id:"1",category_title:"企业信息",routers:[]},{category_id:"2",category_title:"企业微信配置",routers:[]}]}},created:function(){this.getData()},methods:{checkForm:function(e){var t=this;this.$refs[e].validate(function(e){if(!e)return!1;t.submit()})},submit:function(){var e=this;$http.pc_post("admin/businessQyWxSetting",this.form,"loading").then(function(t){1===t.result?e.$message.success(t.msg):t.msg&&e.$message.error(t.msg)}).catch(function(e){console.error(e)})},getData:function(){var e=this;$http.pc_get("admin/businessQyWxSetting",{},"loading").then(function(t){1===t.result?e.form=t.data:t.msg&&e.$message.error(t.msg)}).catch(function(e){console.error(e)})},copyLink:function(e){this.$refs[e].select(),document.execCommand("Copy"),this.$message.success("复制成功!")}},components:{sign_side:r("2kDQ").a}},s=(r("5G0V"),r("KHd+")),a=Object(s.a)(o,function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("div",{staticClass:"information"},[r("sign_side",{attrs:{defaultActive:"settingConfig",router_list:e.arrSp}}),e._v(" "),r("div",{staticClass:"rightBox"},[e._m(0),e._v(" "),r("el-form",{ref:"ruleForm",staticClass:"formClass",attrs:{"label-position":"right","label-width":"200px",model:e.form,rules:e.rules}},[r("el-form-item",{attrs:{label:"企业微信"}},[r("el-switch",{attrs:{"active-value":1,"inactive-value":0},model:{value:e.form.open_state,callback:function(t){e.$set(e.form,"open_state",t)},expression:"form.open_state"}})],1),e._v(" "),r("el-form-item",{attrs:{label:"corpid",prop:"corpid"}},[r("el-input",{model:{value:e.form.corpid,callback:function(t){e.$set(e.form,"corpid",t)},expression:"form.corpid"}})],1),e._v(" "),r("el-form-item",{attrs:{label:"AgentId",prop:"agentid"}},[r("el-input",{model:{value:e.form.agentid,callback:function(t){e.$set(e.form,"agentid",t)},expression:"form.agentid"}})],1),e._v(" "),r("el-form-item",{attrs:{label:"AgentSecret",prop:"agent_secret"}},[r("el-input",{model:{value:e.form.agent_secret,callback:function(t){e.$set(e.form,"agent_secret",t)},expression:"form.agent_secret"}})],1),e._v(" "),r("el-form-item",{attrs:{label:"通讯录管理sercet",prop:"contact_secret"}},[r("el-input",{model:{value:e.form.contact_secret,callback:function(t){e.$set(e.form,"contact_secret",t)},expression:"form.contact_secret"}})],1),e._v(" "),r("el-form-item",{attrs:{label:"通讯录变更通知token",prop:"contact_token"}},[r("el-input",{model:{value:e.form.contact_token,callback:function(t){e.$set(e.form,"contact_token",t)},expression:"form.contact_token"}})],1),e._v(" "),r("el-form-item",{attrs:{label:"通讯录变更通知aseKey",prop:"contact_aes_key"}},[r("el-input",{model:{value:e.form.contact_aes_key,callback:function(t){e.$set(e.form,"contact_aes_key",t)},expression:"form.contact_aes_key"}})],1),e._v(" "),r("el-form-item",{attrs:{label:"客户管理secret"}},[r("el-input",{model:{value:e.form.customer_secret,callback:function(t){e.$set(e.form,"customer_secret",t)},expression:"form.customer_secret"}})],1),e._v(" "),r("el-form-item",{attrs:{label:"客户变更通知token"}},[r("el-input",{model:{value:e.form.customer_token,callback:function(t){e.$set(e.form,"customer_token",t)},expression:"form.customer_token"}})],1),e._v(" "),r("el-form-item",{attrs:{label:"客户变更通知aseKey"}},[r("el-input",{model:{value:e.form.customer_aes_key,callback:function(t){e.$set(e.form,"customer_aes_key",t)},expression:"form.customer_aes_key"}})],1),e._v(" "),r("el-form-item",{attrs:{label:"会话存档secret"}},[r("el-input",{model:{value:e.form.work_session_secret,callback:function(t){e.$set(e.form,"work_session_secret",t)},expression:"form.work_session_secret"}})],1),e._v(" "),r("el-form-item",{attrs:{label:"会话存档aes_key"}},[r("el-input",{attrs:{type:"textarea",rows:10},model:{value:e.form.work_session_aes_key,callback:function(t){e.$set(e.form,"work_session_aes_key",t)},expression:"form.work_session_aes_key"}}),e._v(" "),r("a",{staticClass:"link",attrs:{target:"_blank",href:"https://bbs.yunzmall.com/forum.php?mod=viewthread&tid=25016&fromuid=2"}},[e._v("aes_key配置参考")])],1),e._v(" "),r("el-form-item",{attrs:{label:"会话存档公钥版本"}},[r("el-input",{attrs:{rows:10},model:{value:e.form.work_session_aes_key_version,callback:function(t){e.$set(e.form,"work_session_aes_key_version",t)},expression:"form.work_session_aes_key_version"}})],1),e._v(" "),r("div",{staticStyle:{display:"flex",height:"17px","margin-bottom":"40px"}},[r("div",{staticClass:"message-top-title"}),e._v("\n        企业微信配置\n      ")]),e._v(" "),r("el-form-item",{attrs:{label:"通讯录"}},[r("div",{staticStyle:{display:"flex"}},[r("el-input",{ref:"contact_notice_url",model:{value:e.form.contact_notice_url,callback:function(t){e.$set(e.form,"contact_notice_url",t)},expression:"form.contact_notice_url"}}),e._v(" "),r("el-button",{attrs:{type:"primary"},on:{click:function(t){e.copyLink("contact_notice_url")}}},[e._v("复制")])],1)]),e._v(" "),r("el-form-item",{attrs:{label:"客户联系"}},[r("div",{staticStyle:{display:"flex"}},[r("el-input",{ref:"customer_notice_url",model:{value:e.form.customer_notice_url,callback:function(t){e.$set(e.form,"customer_notice_url",t)},expression:"form.customer_notice_url"}}),e._v(" "),r("el-button",{attrs:{type:"primary"},on:{click:function(t){e.copyLink("customer_notice_url")}}},[e._v("复制")])],1)])],1),e._v(" "),r("div",{staticClass:"buttonLis"},[r("el-button",{attrs:{type:"primary"},on:{click:function(t){e.checkForm("ruleForm")}}},[e._v("提交")]),e._v(" "),r("el-button",[e._v("返回")])],1)],1)],1)},[function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticStyle:{display:"flex",height:"17px","margin-bottom":"40px"}},[t("div",{staticClass:"message-top-title"}),this._v("\n      企业微信配置\n    ")])}],!1,null,"efb00586",null);a.options.__file="company_config.vue";t.default=a.exports}}]);