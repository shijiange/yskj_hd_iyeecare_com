(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-9277"],{"/NHj":function(t,e,i){"use strict";var o=i("cVB4");i.n(o).a},"A/dI":function(t,e,i){},IzHx:function(t,e,i){"use strict";var o=i("M2PI");i.n(o).a},JTK5:function(t,e,i){"use strict";var o=i("A/dI");i.n(o).a},M2PI:function(t,e,i){},cVB4:function(t,e,i){},ntYl:function(t,e,i){"use strict";i.r(e);var o=i("omC7"),a=i.n(o);var s=i("ETGp"),n={name:"SocialSignin",methods:{wechatHandleClick:function(t){alert("ok")},tencentHandleClick:function(t){alert("ok")}}},r=(i("JTK5"),i("ZrdR")),l=Object(r.a)(n,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"social-signup-container"},[i("div",{staticClass:"sign-btn",on:{click:function(e){t.wechatHandleClick("wechat")}}},[i("span",{staticClass:"wx-svg-container"},[i("svg-icon",{staticClass:"icon",attrs:{"icon-class":"wechat"}})],1),t._v(" 微信\n  ")]),t._v(" "),i("div",{staticClass:"sign-btn",on:{click:function(e){t.tencentHandleClick("tencent")}}},[i("span",{staticClass:"qq-svg-container"},[i("svg-icon",{staticClass:"icon",attrs:{"icon-class":"qq"}})],1),t._v(" QQ\n  ")])])},[],!1,null,"1267af6f",null);l.options.__file="socialsignin.vue";var c=l.exports,m=(i("LKdb"),i("AMdk"),{name:"Login",components:{LangSelect:s.a,SocialSign:c},data:function(){return{ys_short_url_redirect_url:"",ys_short_url_redirect_tel:"",activeName:"5",login_info:{},site:{},loginData:{},remember_pwd:!1,loginForm:{password:"",mobile:""},passwordType:"password",captcha:"",sms:{},captcha_text:"获取验证码",isDisabled:1,t:60,loading:!1,showDialog:!1,redirect:void 0,rules:{code:[{required:!0,trigger:"blur",message:"请输入验证码"}],password:[{required:!0,trigger:"blur",message:"请输入密码"}],mobile:[{required:!0,message:"请输入手机号",trigger:"blur"},{validator:function(t,e,i){/^1\d{10}$/.test(e)?i():i(new Error("手机号格式不正确"))},trigger:"blur"}]}}},watch:{$route:{handler:function(t){this.redirect=t.query&&t.query.redirect},immediate:!0}},created:function(){this.getLoginData(),this.getGlobalData()},mounted:function(){this.getlocalStorage()},destroyed:function(){},methods:{getGlobalData:function(){var t=this;$http.get("plugin.business-pc.frontend.setting.index").then(function(e){1===e.result&&(t.site=e.data,t.fun.setTitle(t.$store.getters.globalData.pc_title||""),t.fun.setIcon(t.site.pc_favorite_icon_url),localStorage.setItem("setPublicSetting",a()(t.site)))}).catch(function(t){console.log(t)})},getLoginData:function(){var t=this;$http.get("member.login.login-mode").then(function(e){1===e.result&&(t.loginData=e.data,t.activeName=1==t.loginData.mobile_login_code?"10":"5",e.data.sms&&"1"==e.data.sms.captcha.status&&(t.captcha=e.data.sms.captcha.img),e.data.yun_sign&&(t.loginForm.mobile=e.data.yun_sign.tel))}).catch(function(t){console.log(t)})},getimgdata:function(){var t=this;$http.get("home-page.getCaptcha").then(function(e){e.data.captcha&&(t.captcha=e.data.captcha.img)}).catch(function(t){console.log(t)})},is_tips:function(){this.$store.dispatch("IsOpenPwd",!0)},getIndex:function(){var t=this;this.remember_pwd?this.loginForm.remember=1:this.loginForm.remember=0,$http.post("member.login.index",{login_type:this.activeName,is_sms:"10"==this.activeName?1:0,password:this.loginForm.password,captcha:this.loginForm.captcha,mobile:this.loginForm.mobile,code:this.loginForm.code,remember:this.loginForm.remember},"loading").then(function(e){if(1===e.result){if(t.loading=!1,localStorage.setItem("siteMobile",t.loginForm.mobile),t.remember_pwd?(t.loginForm.remember=1,t.setlocalStorage(t.loginForm.mobile)):t.setlocalStorage(""),t.ys_short_url_redirect_url)return void(window.location.href=t.ys_short_url_redirect_url+"&from=mobile");t.loginData.redirect_url?window.location.href=t.loginData.redirect_url:t.$router.push(t.fun.getUrl("businessIndex",{isFrom:"new"}))}else t.$message.error(e.msg),t.captcha&&t.getimgdata(),t.loading=!1}).catch(function(){t.loading=!1})},showPwd:function(){"password"===this.passwordType?this.passwordType="":this.passwordType="password"},handleLogin:function(){var t=this;this.$refs.loginForm.validate(function(e){if(!e)return console.log("error submit!!"),!1;t.loading=!0,t.getIndex()})},setlocalStorage:function(t){localStorage.setItem("siteName",a()(t))},getlocalStorage:function(){this.ys_short_url_redirect_url=this.fun.getCookie("ys_short_url_redirect_url"),this.loginForm.mobile=JSON.parse(localStorage.getItem("siteName"))},sendSms:function(){var t=this,e=this,i=e.t;if(!e.loginForm.mobile||!/^1\d{10}$/.test(e.loginForm.mobile))return e.$refs.loginForm.validateField("mobile",function(t){}),!1;this.fun.isTextEmpty(this.loginForm.captcha)&&this.captcha?this.$message({message:"请先填图形验证码",type:"error"}):$http.post("member.register.alySendCode",{mobile:this.loginForm.mobile,captcha:this.loginForm.captcha,sms_type:1}).then(function(o){if(1==o.result){t.$message.success(o.msg);var a=window.setInterval(function(){--e.t<=0?(e.t=i,e.isDisabled=1,e.captcha_text="获取验证码",window.clearInterval(a)):(e.isDisabled=0,e.captcha_text=e.t+"s后重新获取")},1e3)}else t.loginForm.captcha="",t.getimgdata(),t.$message({message:o.msg,type:"error"})},function(t){console.log(t)})},gotoRegister:function(){this.$router.push(this.fun.getUrl("register"))}}}),g=(i("IzHx"),i("/NHj"),Object(r.a)(m,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"login-container"},[i("div",{staticClass:"login-container-con"},[i("div",{staticClass:"head"},[i("el-col",{staticStyle:{width:"36px",height:"36px",overflow:"hidden","margin-right":"10px"},attrs:{xs:8,sm:8,md:4,lg:1}},[i("div",{staticStyle:{width:"36px",height:"36px"}},[i("img",{staticStyle:{width:"100%",height:"100%","margin-left":"9%","border-radius":"50%"},attrs:{src:t.site.pc_logo_url}})])]),t._v(" "),i("el-col",{attrs:{span:15}},[i("div",{staticStyle:{color:"#666","font-size":"24px","font-weight":"900","line-height":"36px"}},[t._v("\n          "+t._s(t.site.pc_title)+"\n        ")])])],1),t._v(" "),i("el-row",{staticClass:"content_info"},[i("el-col",{attrs:{span:14}},[i("div",{staticClass:"login_img"},[i("img",{attrs:{src:t.site.pc_login_left_banner_url,alt:""}})])]),t._v(" "),i("el-col",{attrs:{span:1}}),t._v(" "),i("el-col",{staticClass:"login_input",attrs:{span:9}},[i("el-form",{ref:"loginForm",staticClass:"login-form",attrs:{model:t.loginForm,rules:t.rules,"label-position":"left"}},[i("div",{staticClass:"title-container"},[i("h3",{staticClass:"title"},[t._v("\n              "+t._s(t.$t("login.title"))+"\n            ")])]),t._v(" "),5==t.activeName?i("el-form-item",{attrs:{prop:"mobile"}},[i("i",{staticClass:"iconfont icon-verification_member svg-container",staticStyle:{"font-size":"24px"}}),t._v(" "),i("el-input",{attrs:{placeholder:t.$t("login.username"),name:"name",type:"text","auto-complete":"on"},model:{value:t.loginForm.mobile,callback:function(e){t.$set(t.loginForm,"mobile","string"==typeof e?e.trim():e)},expression:"loginForm.mobile"}})],1):t._e(),t._v(" "),5==t.activeName?i("el-form-item",{attrs:{prop:"password"}},[i("i",{staticClass:"iconfont icon-verification_psw svg-container",staticStyle:{"font-size":"24px"}}),t._v(" "),i("el-input",{attrs:{type:t.passwordType,placeholder:t.$t("login.password"),name:"password","auto-complete":"on"},nativeOn:{keyup:function(e){return"button"in e||!t._k(e.keyCode,"enter",13,e.key,"Enter")?t.handleLogin(e):null}},model:{value:t.loginForm.password,callback:function(e){t.$set(t.loginForm,"password","string"==typeof e?e.trim():e)},expression:"loginForm.password"}}),t._v(" "),i("span",{staticClass:"show-pwd",on:{click:t.showPwd}},[i("svg-icon",{attrs:{"icon-class":"password"===t.passwordType?"eye":"eye-open"}})],1)],1):t._e(),t._v(" "),10==t.activeName?i("el-form-item",{attrs:{prop:"mobile"}},[i("i",{staticClass:"iconfont icon-verification_phone svg-container",staticStyle:{"font-size":"24px"}}),t._v(" "),i("el-input",{staticStyle:{width:"calc(100% - 200px)"},attrs:{placeholder:"请输入手机号",name:"name",type:"text","auto-complete":"on"},model:{value:t.loginForm.mobile,callback:function(e){t.$set(t.loginForm,"mobile","string"==typeof e?e.trim():e)},expression:"loginForm.mobile"}}),t._v(" "),i("el-button",{attrs:{type:"primary",disabled:0==t.isDisabled},on:{click:function(e){t.sendSms()}}},[t._v(t._s(t.captcha_text))])],1):t._e(),t._v(" "),t.captcha&&10==t.activeName?i("el-form-item",{staticStyle:{position:"relative"},attrs:{prop:"captcha"}},[i("i",{staticClass:"iconfont icon-verification_code svg-container",staticStyle:{"font-size":"24px"}}),t._v(" "),i("el-input",{staticStyle:{width:"calc(100% - 180px)"},attrs:{placeholder:"请输入图形验证码",name:"name",type:"text","auto-complete":"on"},model:{value:t.loginForm.captcha,callback:function(e){t.$set(t.loginForm,"captcha","string"==typeof e?e.trim():e)},expression:"loginForm.captcha"}}),t._v(" "),i("img",{staticStyle:{cursor:"pointer",position:"absolute",top:"5px"},attrs:{src:t.captcha,title:"点击刷新验证码"},on:{click:t.getimgdata}})],1):t._e(),t._v(" "),10==t.activeName?i("el-form-item",{attrs:{prop:"code"}},[i("i",{staticClass:"iconfont icon-verification_code1 svg-container",staticStyle:{"font-size":"24px"}}),t._v(" "),i("el-input",{attrs:{placeholder:"请输入手机验证码",name:"name",type:"text","auto-complete":"on"},model:{value:t.loginForm.code,callback:function(e){t.$set(t.loginForm,"code","string"==typeof e?e.trim():e)},expression:"loginForm.code"}})],1):t._e(),t._v(" "),i("div",{staticStyle:{display:"flex"}},[i("el-checkbox",{staticStyle:{color:"#999"},attrs:{"true-label":1,"false-label":0,label:1},model:{value:t.remember_pwd,callback:function(e){t.remember_pwd=e},expression:"remember_pwd"}},[t._v("记住用户名\n            ")]),t._v(" "),t._e(),t._v(" "),i("router-link",{attrs:{to:t.fun.getUrl("forget")}},[i("span",{staticClass:"forget"},[t._v("忘记密码？")])])],1),t._v(" "),i("el-button",{staticStyle:{width:"100%",margin:"30px 0",padding:"12px 20px","font-size":"18px"},attrs:{loading:t.loading,type:"primary"},nativeOn:{click:function(e){return e.preventDefault(),t.handleLogin(e)}}},[t._v("\n            登录\n          ")]),t._v(" "),i("div",{staticStyle:{position:"relative"}})],1)],1)],1),t._v(" "),i("el-row",{staticStyle:{"margin-top":"40px"}},[i("el-col",{staticStyle:{padding:"30px 0"},attrs:{align:"center"}},[i("p",{domProps:{innerHTML:t._s(t.site.copyright)}})])],1)],1),t._v(" "),i("el-popover",{attrs:{placement:"left-end",width:"220",height:"200",trigger:"hover"}},[i("div",{staticClass:"code"},[i("img",{attrs:{src:t.site.customer_qrcode,alt:""}})]),t._v(" "),i("div",{staticClass:"service",attrs:{slot:"reference"},slot:"reference"},[i("i",{staticClass:"iconfont icon-all_service"})])])],1)},[],!1,null,"4ee7265c",null));g.options.__file="index.vue";e.default=g.exports}}]);