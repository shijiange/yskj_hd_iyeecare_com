(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-783d"],{"0xm/":function(t,e,i){},AMdk:function(t,e,i){(function(e){t.exports=function(t){if("undefined"==typeof window)return new e(t).toString("base64");if(void 0!==window.btoa)return window.btoa(decodeURIComponent(encodeURIComponent(t)));var i,n,o,s,a,r="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",l=0,c=0,m="",d=[];if(!t)return t;t=decodeURIComponent(encodeURIComponent(t));do{i=(a=t.charCodeAt(l++)<<16|t.charCodeAt(l++)<<8|t.charCodeAt(l++))>>18&63,n=a>>12&63,o=a>>6&63,s=63&a,d[c++]=r.charAt(i)+r.charAt(n)+r.charAt(o)+r.charAt(s)}while(l<t.length);m=d.join("");var g=t.length%3;return(g?m.slice(0,g-3):m)+"===".slice(g||3)}}).call(this,i("tjlA").Buffer)},JTK5:function(t,e,i){"use strict";var n=i("0xm/");i.n(n).a},c11S:function(t,e,i){"use strict";var n=i("gTgX");i.n(n).a},gTgX:function(t,e,i){},ntYl:function(t,e,i){"use strict";i.r(e);var n=i("gDS+"),o=i.n(n);var s=i("ETGp"),a={name:"SocialSignin",methods:{wechatHandleClick:function(t){alert("ok")},tencentHandleClick:function(t){alert("ok")}}},r=(i("JTK5"),i("KHd+")),l=Object(r.a)(a,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"social-signup-container"},[i("div",{staticClass:"sign-btn",on:{click:function(e){t.wechatHandleClick("wechat")}}},[i("span",{staticClass:"wx-svg-container"},[i("svg-icon",{staticClass:"icon",attrs:{"icon-class":"wechat"}})],1),t._v(" 微信\n  ")]),t._v(" "),i("div",{staticClass:"sign-btn",on:{click:function(e){t.tencentHandleClick("tencent")}}},[i("span",{staticClass:"qq-svg-container"},[i("svg-icon",{staticClass:"icon",attrs:{"icon-class":"qq"}})],1),t._v(" QQ\n  ")])])},[],!1,null,"1267af6f",null);l.options.__file="socialsignin.vue";var c=l.exports,m=i("XJYT"),d=i("AMdk"),g=i.n(d),p={name:"Login",components:{LangSelect:s.a,SocialSign:c},data:function(){return{login_info:{},site:{},remember_pwd:!1,loginForm:{username:"",password:"",mobile:""},passwordType:"password",captcha:{},sms:{},captcha_text:"获取验证码",isDisabled:1,t:60,loading:!1,showDialog:!1,redirect:void 0,rules:{username:[{required:!0,trigger:"blur",message:"请输入账号"}],password:[{required:!0,trigger:"blur",message:"请输入密码"}],mobile:[{required:!0,message:"请输入手机号",trigger:"blur"},{validator:function(t,e,i){/^1\d{10}$/.test(e)?i():i(new Error("手机号格式不正确"))},trigger:"blur"}]}}},watch:{$route:{handler:function(t){this.redirect=t.query&&t.query.redirect},immediate:!0}},created:function(){this.getLoginSite()},mounted:function(){this.getlocalStorage()},destroyed:function(){},methods:{is_tips:function(){this.$store.dispatch("IsOpenPwd",!0)},getLoginSite:function(){var t=this;$http.get("/admin/login/site",{}).then(function(e){1===e.result?(t.site=e.data,t.fun.setIcon(t.site.title_icon),t.captcha=t.site.captcha,t.sms=t.site.sms,t.fun.setTitle(t.site.name+"-登录")):e.msg&&""!=e.msg&&m.MessageBox.alert(e.msg)}).catch(function(t){console.log(t)})},getIndex:function(){var t=this;this.remember_pwd?this.loginForm.remember=1:this.loginForm.remember=0,$http.post("/admin/login",{username:this.loginForm.username,password:g()(this.loginForm.password),captcha:this.loginForm.captcha,mobile:this.loginForm.mobile,code:this.loginForm.code,remember:this.loginForm.remember}).then(function(e){if(1===e.result){if(t.loading=!1,!t.fun.isTextEmpty(e.data)&&-5===e.data.status)return void(e.msg&&""!=e.msg&&m.Message.error(e.msg));if(!t.fun.isTextEmpty(e.data)&&1==e.data.pwd_remind)return t.$store.dispatch("IsOpenPwd",!0),void t.$store.dispatch("tips_word",e.data.msg);if(!t.fun.isTextEmpty(e.data)&&e.data.url)return void(window.location.href=e.data.url);t.$store.dispatch("GenerateRoutes",0),t.remember_pwd?(t.loginForm.remember=1,t.setlocalStorage(t.loginForm.username)):t.setlocalStorage(""),t.$router.push(t.fun.getUrl("Manage"))}else e.msg&&""!=e.msg&&m.MessageBox.alert(e.msg),1==t.captcha.status&&t.freshCode(),t.loading=!1}).catch(function(){t.loading=!1})},showPwd:function(){"password"===this.passwordType?this.passwordType="":this.passwordType="password"},handleLogin:function(){var t=this;this.$refs.loginForm.validate(function(e){if(!e)return console.log("error submit!!"),!1;t.loading=!0,t.getIndex()})},setlocalStorage:function(t){localStorage.setItem("siteName",o()(t))},getlocalStorage:function(){this.loginForm.username=JSON.parse(localStorage.getItem("siteName"))},sendSms:function(){var t=this,e=this,i=e.t;return""!=e.loginForm.username&&e.loginForm.username?e.loginForm.mobile&&/^1\d{10}$/.test(e.loginForm.mobile)?void $http.post("/admin/login/login_code",{mobile:this.loginForm.mobile,username:this.loginForm.username}).then(function(n){if(1==n.result){n.msg&&""!=n.msg&&t.$message.success(n.msg);var o=window.setInterval(function(){--e.t<=0?(e.t=i,e.isDisabled=1,e.captcha_text="获取验证码",window.clearInterval(o)):(e.isDisabled=0,e.captcha_text="("+e.t+"s)后重新获取")},1e3)}else n.msg&&""!=n.msg&&t.$message.error(n.msg)},function(t){console.log(t)}):(e.$refs.loginForm.validateField("mobile",function(t){}),!1):(e.$refs.loginForm.validateField("username",function(t){}),!1)},freshCode:function(){var t=this;$http.post("/admin/login/refresh_pic",{}).then(function(e){1===e.result?t.captcha.img=e.data:(e.msg&&""!=e.msg&&t.$message.error(e.msg),t.loading=!1)}).catch(function(){t.loading=!1})}}},u=(i("c11S"),i("tDgZ"),Object(r.a)(p,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"login-container"},[i("div",{staticClass:"login-container-con"},[i("div",{staticClass:"head"},[i("el-col",{staticStyle:{width:"36px",height:"36px",overflow:"hidden","margin-right":"10px"},attrs:{xs:8,sm:8,md:4,lg:1}},[i("img",{staticStyle:{width:"100%"},attrs:{src:t.site.site_logo,alt:""}})]),t._v(" "),i("el-col",{attrs:{span:15}},[i("div",{staticStyle:{color:"#666","font-size":"24px","font-weight":"900","line-height":"36px"}},[t._v("\n          "+t._s(t.site.name)+"\n        ")])])],1),t._v(" "),i("el-row",{staticClass:"content_info"},[i("el-col",{attrs:{span:15}},[i("div",{staticClass:"login_img"},[i("img",{attrs:{src:t.site.advertisement,alt:""}})])]),t._v(" "),i("el-col",{attrs:{span:1}}),t._v(" "),i("el-col",{staticClass:"login_input",attrs:{span:8}},[i("el-form",{ref:"loginForm",staticClass:"login-form",attrs:{model:t.loginForm,rules:t.rules,"label-position":"left"}},[i("div",{staticClass:"title-container"},[i("h3",{staticClass:"title"},[t._v("\n              "+t._s(t.$t("login.title"))+"\n            ")])]),t._v(" "),i("el-form-item",{attrs:{prop:"username"}},[i("i",{staticClass:"iconfont icon-verification_member svg-container",staticStyle:{"font-size":"24px"}}),t._v(" "),i("el-input",{attrs:{placeholder:t.$t("login.username"),name:"name",type:"text","auto-complete":"on"},model:{value:t.loginForm.username,callback:function(e){t.$set(t.loginForm,"username",e)},expression:"loginForm.username"}})],1),t._v(" "),i("el-form-item",{attrs:{prop:"password"}},[i("i",{staticClass:"iconfont icon-verification_psw svg-container",staticStyle:{"font-size":"24px"}}),t._v(" "),i("el-input",{attrs:{type:t.passwordType,placeholder:t.$t("login.password"),name:"password","auto-complete":"on"},nativeOn:{keyup:function(e){return"button"in e||!t._k(e.keyCode,"enter",13,e.key,"Enter")?t.handleLogin(e):null}},model:{value:t.loginForm.password,callback:function(e){t.$set(t.loginForm,"password",e)},expression:"loginForm.password"}}),t._v(" "),i("span",{staticClass:"show-pwd",on:{click:t.showPwd}},[i("svg-icon",{attrs:{"icon-class":"password"===t.passwordType?"eye":"eye-open"}})],1)],1),t._v(" "),1==t.captcha.status?i("el-form-item",{attrs:{prop:"name"}},[i("i",{staticClass:"iconfont icon-verification_code svg-container",staticStyle:{"font-size":"24px"}}),t._v(" "),i("el-input",{staticStyle:{width:"calc(100% - 180px)"},attrs:{placeholder:"请输入图形验证码",name:"name",type:"text","auto-complete":"on"},model:{value:t.loginForm.captcha,callback:function(e){t.$set(t.loginForm,"captcha",e)},expression:"loginForm.captcha"}}),t._v(" "),i("img",{staticStyle:{cursor:"pointer"},attrs:{src:t.captcha.img,title:"点击刷新验证码"},on:{click:t.freshCode}})],1):t._e(),t._v(" "),1==t.sms.status?i("el-form-item",{attrs:{prop:"mobile"}},[i("i",{staticClass:"iconfont icon-verification_phone svg-container",staticStyle:{"font-size":"24px"}}),t._v(" "),i("el-input",{staticStyle:{width:"calc(100% - 200px)"},attrs:{placeholder:"请输入手机号",name:"name",type:"text","auto-complete":"on"},model:{value:t.loginForm.mobile,callback:function(e){t.$set(t.loginForm,"mobile",e)},expression:"loginForm.mobile"}}),t._v(" "),i("el-button",{attrs:{type:"primary",disabled:0==t.isDisabled},on:{click:function(e){t.sendSms()}}},[t._v(t._s(t.captcha_text))])],1):t._e(),t._v(" "),1==t.sms.status?i("el-form-item",{attrs:{prop:"name"}},[i("i",{staticClass:"iconfont icon-verification_code1 svg-container",staticStyle:{"font-size":"24px"}}),t._v(" "),i("el-input",{attrs:{placeholder:"请输入手机验证码",name:"name",type:"text","auto-complete":"on"},model:{value:t.loginForm.code,callback:function(e){t.$set(t.loginForm,"code",e)},expression:"loginForm.code"}})],1):t._e(),t._v(" "),i("el-checkbox",{staticStyle:{color:"#999"},attrs:{"true-label":1,"false-label":0,label:1},model:{value:t.remember_pwd,callback:function(e){t.remember_pwd=e},expression:"remember_pwd"}},[t._v("记住用户名\n          ")]),t._v(" "),i("router-link",{attrs:{to:"/forget"}},[i("span",{staticClass:"forget"},[t._v("忘记密码？")])]),t._v(" "),i("el-button",{staticStyle:{width:"100%",margin:"30px 0",padding:"12px 20px","font-size":"18px"},attrs:{loading:t.loading,type:"primary"},nativeOn:{click:function(e){return e.preventDefault(),t.handleLogin(e)}}},[t._v("\n            登录\n          ")]),t._v(" "),i("div",{staticStyle:{position:"relative"}})],1)],1)],1),t._v(" "),i("el-row",{staticStyle:{"margin-top":"40px"}},[i("el-col",{staticStyle:{color:"#999",padding:"30px 0"},attrs:{align:"center"}},[i("p",{domProps:{innerHTML:t._s(t.site.information)}})])],1)],1)])},[],!1,null,"0735b4dd",null));u.options.__file="index.vue";e.default=u.exports},tDgZ:function(t,e,i){"use strict";var n=i("yiHU");i.n(n).a},yiHU:function(t,e,i){}}]);