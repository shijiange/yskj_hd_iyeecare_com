(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-bc3a"],{"14Xm":function(t,e,r){t.exports=r("u938")},D3Ub:function(t,e,r){"use strict";e.__esModule=!0;var a=function(t){return t&&t.__esModule?t:{default:t}}(r("4d7F"));e.default=function(t){return function(){var e=t.apply(this,arguments);return new a.default(function(t,r){return function s(i,n){try{var o=e[i](n),l=o.value}catch(t){return void r(t)}if(!o.done)return a.default.resolve(l).then(function(t){s("next",t)},function(t){s("throw",t)});t(l)}("next")})}}},ereV:function(t,e,r){"use strict";r.r(e);var a=r("14Xm"),s=r.n(a),i=r("D3Ub"),n=r.n(i),o=r("Y55Z"),l={name:"PlatformManage",data:function(){var t=this,e=function(t,e,r){e.length<6?r(new Error("密码长度不能少于6")):r()};return{is_agree:0,active:1,version:"",form:{set:{DB_HOST:"127.0.0.1",DB_PORT:3306,DB_PREFIX:"ims_"},user:{username:"",password:""},redis:{host:"127.0.0.1",port:"6379",database:"0",cache_database:"1",password:""}},sysytem_environment:[],server_info:[],check_function:[],file_list:[],rules:{set:{DB_HOST:{required:!0,message:"请输入数据库服务器"},DB_DATABASE:{required:!0,message:"请输入数据库名"},DB_USERNAME:{required:!0,message:"请输入数据库用户名"},DB_PASSWORD:{required:!0,message:"请输入数据库密码"},DB_PREFIX:{required:!0,message:"请输入数据库前缀"},DB_PORT:{required:!0,message:"请输入数据库端口"}},user:{name:{required:!0,message:"请输入站点名称"},username:{required:!0,message:"请输入管理员账号"},password:[{required:!0,message:"请输入管理员密码"},{validator:e}],repassword:[{required:!0,message:"请输入重复密码"},{validator:function(e,r,a){r!=t.form.user.password?a(new Error("两次密码输入不一致")):a()}},{validator:e}],mobile:[{required:!0,message:"请输入手机号"},{validator:function(t,e,r){/^1\d{10}$/.test(e)?r():r(new Error("请输入正确的手机格式"))}}]}},is_show_repassword:!0}},created:function(){this.getVersion()},destroyed:function(){},methods:{getVersion:function(){var t=this;$http.post("/admin/install/agreement",{},"加载中").then(function(e){console.log(e),-1==e.data.status&&(e.msg&&""!=e.msg&&t.$message.error(e.msg),window.location.href=o.a.getSiteRootAdmin()),t.version=e.data.version}).catch(function(){console.log("获取数据失败！")})},getDetectionData:function(){var t=this;$http.post("/admin/install/check",{},"加载中").then(function(e){-1==e.data.status&&(e.msg&&""!=e.msg&&t.$message.error(e.msg),window.location.href=o.a.getSiteRootAdmin()),t.sysytem_environment=e.data.sysytem_environment,t.check_function=e.data.check_function,t.server_info=e.data.server_info}).catch(function(){console.log("获取数据失败！")})},getFileData:function(){var t=this;$http.post("/admin/install/file_power",{},"加载中...").then(function(e){-1==e.data.status&&(e.msg&&""!=e.msg&&t.$message.error(e.msg),window.location.href=o.a.getSiteRootAdmin()),t.file_list=e.data}).catch(function(){console.log("获取数据失败！")})},submit:function(t){var e=this;this.$refs[t].validate(function(t){if(!t)return console.log("error submit!!"),e.active=3,!1;e.is_show_repassword||(e.form.user.repassword=e.form.user.password),$http.post("/admin/install/set_info",{set:e.form.set,user:e.form.user,redis:e.form.redis},"提交中...").then(function(t){1===t.result?t.msg&&""!=t.msg&&e.$message.success("创建数据成功"):(-1==t.data.status&&(window.location.href=o.a.getSiteRootAdmin()),t.msg&&""!=t.msg&&e.$message.error(t.msg),e.active=3)}).catch(function(){e.active=3})})},agree:function(){this.is_agree=1,this.getDetectionData()},change:function(t){var e=this;1===t&&(this.active++,2==this.active&&(this.sysytem_environment.map(function(t,r){if(0==t.check)return e.active=1,e.$message.error("当前环境不支持安装！"),!1}),this.file_list!=[]&&this.file_list&&void 0!=this.file_list&&0!=this.file_list.length||this.getFileData()),4==this.active&&this.submit("form"),this.active>5&&(this.active=5)),0===t&&(this.active--,this.active<1&&(this.active=1))},install:function(){var t=this;$http.post("/admin/install/create_data",{},"安装中...").then(function(e){1===e.result?(t.active++,t.delete()):e.msg&&""!=e.msg&&t.$message.error(e.msg)}).catch(function(){})},delete:function(){var t=this;$http.post("/admin/install/delete",{},"").then(function(e){1===e.result||(-1==e.data.status&&(window.location.href=o.a.getSiteRootAdmin()),e.msg&&""!=e.msg&&t.$message.error(e.msg))}).catch(function(){})},randomUser:function(){var t=this;return n()(s.a.mark(function e(){var r;return s.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,$http.post("/admin/install/random_user",{},"生成中...");case 2:if((r=e.sent).result){e.next=6;break}return t.$message.error(r.msg),e.abrupt("return");case 6:t.form.user.username=r.data,t.$message.success("生成随机账号成功");case 8:case"end":return e.stop()}},e,t)}))()},randomPass:function(){var t=this;return n()(s.a.mark(function e(){var r;return s.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,$http.post("/admin/install/random_psw",{},"生成中...");case 2:if((r=e.sent).result){e.next=6;break}return t.$message.error(r.msg),e.abrupt("return");case 6:t.form.user.password=r.data,t.form.user.repassword=r.data,t.rules.repassword=[],t.is_show_repassword=!1,t.$message.success("生成随机密码成功");case 11:case"end":return e.stop()}},e,t)}))()}}},c=(r("klx6"),r("KHd+")),u=Object(c.a)(l,function(){var t=this,e=t.$createElement,r=t._self._c||e;return r("div",{staticClass:"right"},[r("div",{staticClass:"right-head"},[r("el-row",[r("el-col",{attrs:{span:16}},[r("div",{staticClass:"right-head-con"},[t._v("系统安装向导")])]),t._v(" "),r("el-col",{attrs:{span:7}},[r("div",{staticClass:"right-head-con1",attrs:{align:"right"}},[t._v("版本："+t._s(t.version))])])],1)],1),t._v(" "),0===t.is_agree?r("div",[t._m(0),t._v(" "),r("div",{staticClass:"right-content-btn"},[r("el-button",{attrs:{type:"primary"},on:{click:function(e){t.agree()}}},[t._v("同意协议进入安装")]),t._v(" "),r("el-button",{attrs:{type:"info"}},[t._v("取消")])],1)]):t._e(),t._v(" "),1===t.is_agree?r("div",[r("div",{staticClass:"step-head"},[r("div",{directives:[{name:"show",rawName:"v-show",value:1==t.active,expression:"active == 1"}]},[t._v("Step.1 运行环境检测")]),t._v(" "),r("div",{directives:[{name:"show",rawName:"v-show",value:2==t.active,expression:"active == 2"}]},[t._v("Step.2 文件权限设置")]),t._v(" "),r("div",{directives:[{name:"show",rawName:"v-show",value:3==t.active,expression:"active == 3"}]},[t._v("Step.3 创建数据")]),t._v(" "),r("div",{directives:[{name:"show",rawName:"v-show",value:4==t.active,expression:"active == 4"}]},[t._v("Step.4 账号设置")]),t._v(" "),r("div",{directives:[{name:"show",rawName:"v-show",value:5==t.active,expression:"active == 5"}]},[t._v("Step.5 安装完成")])]),t._v(" "),r("div",{staticClass:"right-content1"},[r("el-steps",{attrs:{active:t.active,"align-center":""}},[r("el-step",{attrs:{title:"运行环境检测",icon:"el-icon-menu"}}),t._v(" "),r("el-step",{attrs:{title:"文件权限设置",icon:"el-icon-setting"}}),t._v(" "),r("el-step",{attrs:{title:"账号设置",icon:"el-icon-news"}}),t._v(" "),r("el-step",{attrs:{title:"创建数据",icon:"el-icon-edit"}}),t._v(" "),r("el-step",{attrs:{title:"安装完成",icon:"el-icon-success"}})],1),t._v(" "),r("div",{directives:[{name:"show",rawName:"v-show",value:1==t.active,expression:"active == 1"}]},[r("h5",{staticClass:"rightlist-head"},[t._v("\n            环境检查\n          ")]),t._v(" "),r("el-table",{staticStyle:{width:"100%"},attrs:{data:t.sysytem_environment,border:""}},[r("el-table-column",{attrs:{prop:"name",label:"项目",align:"center"}}),t._v(" "),r("el-table-column",{attrs:{prop:"need",label:"程序所需",align:"center"}}),t._v(" "),r("el-table-column",{attrs:{prop:"optimum",label:"最佳配置推荐",align:"center"}}),t._v(" "),r("el-table-column",{attrs:{label:"当前服务器",align:"center"},scopedSlots:t._u([{key:"default",fn:function(e){return[r("span",{directives:[{name:"show",rawName:"v-show",value:1==e.row.check,expression:"scope.row.check == true"}]},[r("i",{staticClass:"el-icon-success",staticStyle:{color:"#409eff"}})]),t._v(" "),r("span",{directives:[{name:"show",rawName:"v-show",value:0==e.row.check,expression:"scope.row.check == false"}]},[r("i",{staticClass:"el-icon-error",staticStyle:{color:"red"}})]),t._v(" "),r("span",[t._v(t._s(e.row.value))])]}}])})],1),t._v(" "),r("h5",{staticClass:"rightlist-head"},[t._v("\n            函数检查\n          ")]),t._v(" "),r("el-table",{staticStyle:{width:"100%"},attrs:{data:t.check_function,border:""}},[r("el-table-column",{attrs:{prop:"name",label:"目录文件",align:"center"}}),t._v(" "),r("el-table-column",{attrs:{prop:"need",label:"所需状态",align:"center"}}),t._v(" "),r("el-table-column",{attrs:{prop:"value",label:"当前状态",align:"center"}})],1),t._v(" "),r("h5",{staticClass:"rightlist-head"},[t._v("\n            服务器信息\n          ")]),t._v(" "),r("el-table",{staticStyle:{width:"100%"},attrs:{data:t.server_info,border:""}},[r("el-table-column",{attrs:{prop:"name",label:"参数","min-width":"200"}}),t._v(" "),r("el-table-column",{attrs:{prop:"value",label:"值","min-width":"600"}})],1)],1),t._v(" "),r("div",{directives:[{name:"show",rawName:"v-show",value:2==t.active,expression:"active == 2"}]},[r("h5",{staticClass:"rightlist-head"},[t._v("\n            目录、文件权限检查\n          ")]),t._v(" "),r("el-table",{staticStyle:{width:"100%"},attrs:{data:t.file_list,border:""}},[r("el-table-column",{attrs:{prop:"name",label:"目录文件",align:"center"}}),t._v(" "),r("el-table-column",{attrs:{prop:"need",label:"所需状态",align:"center"}}),t._v(" "),r("el-table-column",{attrs:{prop:"value",label:"当前状态",align:"center"},scopedSlots:t._u([{key:"default",fn:function(e){return[1==e.row.value?r("span",[t._v("可写")]):r("span",[t._v("不可写")])]}}])})],1)],1),t._v(" "),r("div",{directives:[{name:"show",rawName:"v-show",value:3==t.active,expression:"active == 3"}]},[r("el-form",{ref:"form",attrs:{model:t.form,rules:t.rules,"label-width":"15%"}},[r("h5",{staticClass:"rightlist-head"},[t._v("\n            数据库信息\n          ")]),t._v(" "),r("el-form-item",{attrs:{label:"数据库服务器",prop:"set.DB_HOST"}},[r("el-input",{staticStyle:{width:"70%"},model:{value:t.form.set.DB_HOST,callback:function(e){t.$set(t.form.set,"DB_HOST",e)},expression:"form.set.DB_HOST"}}),t._v(" "),r("div",{staticClass:"tip"},[t._v("数据库服务器地址，一般为127.0.0.1或localhost")])],1),t._v(" "),r("el-form-item",{attrs:{label:"数据库名",prop:"set.DB_DATABASE"}},[r("el-input",{staticStyle:{width:"70%"},model:{value:t.form.set.DB_DATABASE,callback:function(e){t.$set(t.form.set,"DB_DATABASE",e)},expression:"form.set.DB_DATABASE"}})],1),t._v(" "),r("el-form-item",{attrs:{label:"数据库用户名",prop:"set.DB_USERNAME"}},[r("el-input",{staticStyle:{width:"70%"},model:{value:t.form.set.DB_USERNAME,callback:function(e){t.$set(t.form.set,"DB_USERNAME",e)},expression:"form.set.DB_USERNAME"}})],1),t._v(" "),r("el-form-item",{attrs:{label:"数据库密码",prop:"set.DB_PASSWORD"}},[r("el-input",{staticStyle:{width:"70%"},attrs:{type:"password"},model:{value:t.form.set.DB_PASSWORD,callback:function(e){t.$set(t.form.set,"DB_PASSWORD",e)},expression:"form.set.DB_PASSWORD"}})],1),t._v(" "),r("el-form-item",{attrs:{label:"数据库表前缀",prop:"set.DB_PREFIX"}},[r("el-input",{staticStyle:{width:"70%"},model:{value:t.form.set.DB_PREFIX,callback:function(e){t.$set(t.form.set,"DB_PREFIX",e)},expression:"form.set.DB_PREFIX"}}),t._v(" "),r("div",{staticClass:"tip"},[t._v("同一数据库表运行多个程序时，请修改前缀")])],1),t._v(" "),r("el-form-item",{attrs:{label:"数据库端口",prop:"set.DB_PORT"}},[r("el-input",{staticStyle:{width:"70%"},model:{value:t.form.set.DB_PORT,callback:function(e){t.$set(t.form.set,"DB_PORT",e)},expression:"form.set.DB_PORT"}}),t._v(" "),r("div",{staticClass:"tip"},[t._v("数据库默认端口一般为3306")])],1),t._v(" "),r("h5",{staticClass:"rightlist-head"},[t._v("\n            REDIS设置\n          ")]),t._v(" "),r("el-form-item",{attrs:{label:"域名（redis_host）",prop:"redis.host"}},[r("el-input",{staticStyle:{width:"70%"},model:{value:t.form.redis.host,callback:function(e){t.$set(t.form.redis,"host",e)},expression:"form.redis.host"}}),t._v(" "),r("div",{staticClass:"tip"},[t._v("\n              为空时默认为127.0.0.1\n            ")])],1),t._v(" "),r("el-form-item",{attrs:{label:"密码（redis_password）",prop:"redis.password"}},[r("el-input",{staticStyle:{width:"70%"},attrs:{type:"password"},model:{value:t.form.redis.password,callback:function(e){t.$set(t.form.redis,"password",e)},expression:"form.redis.password"}}),t._v(" "),r("div",{staticClass:"tip"},[t._v("redis没设置密码时此行不用填写，为空时默认为NULL")])],1),t._v(" "),r("el-form-item",{attrs:{label:"端口（port）",prop:"redis.port"}},[r("el-input",{staticStyle:{width:"70%"},attrs:{type:"text"},model:{value:t.form.redis.port,callback:function(e){t.$set(t.form.redis,"port",e)},expression:"form.redis.port"}}),t._v(" "),r("div",{staticClass:"tip"},[t._v("为空时默认为6379")])],1),t._v(" "),r("el-form-item",{attrs:{label:"库（database）",prop:"redis.database"}},[r("el-input",{staticStyle:{width:"70%"},attrs:{type:"text"},model:{value:t.form.redis.database,callback:function(e){t.$set(t.form.redis,"database",e)},expression:"form.redis.database"}}),t._v(" "),r("div",{staticClass:"tip"},[t._v("为空时默认为0")])],1),t._v(" "),r("el-form-item",{attrs:{label:"cache库（cache_database）",prop:"redis.cache_database"}},[r("el-input",{staticStyle:{width:"70%"},attrs:{type:"text"},model:{value:t.form.redis.cache_database,callback:function(e){t.$set(t.form.redis,"cache_database",e)},expression:"form.redis.cache_database"}}),t._v(" "),r("div",{staticClass:"tip"},[t._v("为空时默认为1")])],1),t._v(" "),r("h5",{staticClass:"rightlist-head"},[t._v("\n            网站信息\n          ")]),t._v(" "),r("el-form-item",{attrs:{label:"站点名称",prop:"user.name"}},[r("el-input",{staticStyle:{width:"70%"},model:{value:t.form.user.name,callback:function(e){t.$set(t.form.user,"name",e)},expression:"form.user.name"}}),t._v(" "),r("div",{staticClass:"tip"},[t._v("\n              输入站点名称，安装后可以在平台设置中进行修改\n            ")])],1),t._v(" "),r("el-form-item",{attrs:{label:"管理员账号",prop:"user.username"}},[r("el-input",{staticStyle:{width:"70%"},model:{value:t.form.user.username,callback:function(e){t.$set(t.form.user,"username",e)},expression:"form.user.username"}}),t._v(" "),r("el-button",{attrs:{type:"primary"},on:{click:t.randomUser}},[t._v("随机账号")])],1),t._v(" "),r("el-form-item",{attrs:{label:"管理员密码",prop:"user.password"}},[r("el-input",{staticStyle:{width:"70%"},attrs:{type:t.is_show_repassword?"password":"text"},model:{value:t.form.user.password,callback:function(e){t.$set(t.form.user,"password",e)},expression:"form.user.password"}}),t._v(" "),r("el-button",{attrs:{type:"primary"},on:{click:t.randomPass}},[t._v("随机密码")]),t._v(" "),r("div",{staticClass:"tip"},[t._v("管理员密码不少于6个字符")])],1),t._v(" "),t.is_show_repassword?r("el-form-item",{attrs:{label:"重复密码",prop:"user.repassword"}},[r("el-input",{staticStyle:{width:"70%"},attrs:{type:"password"},model:{value:t.form.user.repassword,callback:function(e){t.$set(t.form.user,"repassword",e)},expression:"form.user.repassword"}}),t._v(" "),r("div",{staticClass:"tip"},[t._v("确保两次输入的密码一致")])],1):t._e(),t._v(" "),r("el-form-item",{attrs:{label:"手机号",prop:"user.mobile"}},[r("el-input",{staticStyle:{width:"70%"},attrs:{type:"text"},model:{value:t.form.user.mobile,callback:function(e){t.$set(t.form.user,"mobile",e)},expression:"form.user.mobile"}})],1)],1)],1),t._v(" "),r("div",{directives:[{name:"show",rawName:"v-show",value:4==t.active,expression:"active == 4"}]},[t._v("\n        创建数据...\n      ")]),t._v(" "),r("div",{directives:[{name:"show",rawName:"v-show",value:5==t.active,expression:"active == 5"}]},[t._m(1),t._v(" "),r("router-link",{attrs:{to:"/login"}},[r("el-button",{attrs:{type:"primary"}},[t._v("跳到登录页面")])],1)],1),t._v(" "),r("div",{staticClass:"right-content-btn"},[r("el-button",{directives:[{name:"show",rawName:"v-show",value:1!=t.active&5!=t.active,expression:"(active != 1) & (active != 5)"}],attrs:{type:"primary"},on:{click:function(e){t.change(0)}}},[t._v("上一步")]),t._v(" "),r("el-button",{directives:[{name:"show",rawName:"v-show",value:4!=t.active&&5!=t.active,expression:"active != 4 && active != 5"}],attrs:{type:"primary"},on:{click:function(e){t.change(1)}}},[t._v("下一步")]),t._v(" "),r("el-button",{directives:[{name:"show",rawName:"v-show",value:4==t.active,expression:"active == 4"}],attrs:{type:"primary"},on:{click:function(e){t.install()}}},[t._v("确认安装")])],1)],1)]):t._e()])},[function(){var t=this,e=t.$createElement,r=t._self._c||e;return r("div",{staticClass:"panel panel-default",staticStyle:{width:"80%",margin:"0 auto"}},[r("div",{staticClass:"panel-heading text-center",staticStyle:{"font-size":"20px","font-weight":"900",padding:"10px 0"}},[t._v("芸众商城系统安装协议")]),t._v(" "),r("div",{staticClass:"panel-body",staticStyle:{"overflow-y":"scroll","max-height":"700px","line-height":"20px"}},[r("h3",[t._v("版权所有 (c) 2019-2029，广州市芸众信息科技有限公司（以下简称芸众公司）保留所有权利。")]),t._v(" "),r("p",{staticStyle:{"line-height":"32px"}},[t._v("\n          感谢您选择芸众产品。希望我们的努力能为您提供一个高效快速、强大的站点解决方案，和强大的电商系统解决方案。芸众公司网址为"),r("a",{attrs:{href:"https://www.yunzmall.com",target:"_blank"}},[t._v("https://www.yunzmall.com")]),t._v("，产品官方讨论区网址为 "),r("a",{attrs:{href:"https://bbs.yunzmall.com/forum.php",target:"_blank"}},[t._v("https://bbs.yunzmall.com/forum.php")]),t._v("。\n        ")]),t._v(" "),r("p",{staticStyle:{"line-height":"32px"}},[t._v("\n          用户须知：本协议是您与芸众公司之间关于您使用芸众公司提供的各种软件产品及服务的法律协议。无论您是个人或组织、盈利与否、用途如何（包括以学习和研究为目的），均需仔细阅读本协议，包括免除或者限制芸众责任的免责条款及对您的权利限制。请您审阅并接受或不接受本服务条款。如您不同意本服务条款及/或芸众随时对其的修改，您应不使用或主动取消芸众公司提供的芸众产品。否则，您的任何对芸众产品中的相关服务的注册、登陆、下载、查看等使用行为将被视为您对本服务条款全部的完全接受，包括接受芸众对服务条款随时所做的任何修改。\n        ")]),t._v(" "),r("p",{staticStyle:{"line-height":"32px"}},[t._v("\n          本服务条款一旦发生变更, 芸众将在网页上公布修改内容。修改后的服务条款一旦在网站管理后台或者芸众官网上公布即有效代替原来的服务条款。您可随时登陆芸众官方论坛查阅最新版服务条款。如果您选择接受本条款，即表示您同意接受协议各项条件的约束。如果您不同意本服务条款，则不能获得使用本服务的权利。您若有违反本条款规定，芸众公司有权随时中止或终止您对芸众产品的使用资格并保留追究相关法律责任的权利。\n        ")]),t._v(" "),r("p",{staticStyle:{"line-height":"32px"}},[t._v("\n          在理解、同意、并遵守本协议的全部条款后，方可开始使用芸众产品。您可能与芸众公司直接签订另一书面协议，以补充或者取代本协议的全部或者任何部分。\n        ")]),t._v(" "),r("p",{staticStyle:{"line-height":"32px"}},[t._v("\n          芸众拥有本软件的全部知识产权。本软件只供许可协议，并非出售。芸众只允许您在遵守本协议各项条款的情况下复制、下载、安装、使用或者以其他方式受益于本软件的功能或者知识产权。\n        ")]),t._v(" "),r("p",[r("strong",[t._v("I. 协议许可的权利")]),t._v(" "),r("ol",{staticStyle:{"line-height":"32px"}},[r("li",[t._v("您可以在完全遵守本许可协议的基础上，将本软件应用于非商业用途，而不必支付软件版权许可费用。")]),t._v(" "),r("li",[t._v("您可以在协议规定的约束和限制范围内修改芸众产品源代码(如果被提供的话)或界面风格以适应您的网站要求。")]),t._v(" "),r("li",[t._v("您拥有使用本软件构建的网站中全部会员资料、文章及相关信息的所有权，并独立承担与使用本软件构建的网站内容的审核、注意义务，确保其不侵犯任何人的合法权益，独立承担因使用芸众软件和服务带来的全部责任，若造成芸众公司或用户损失的，您应予以全部赔偿。")]),t._v(" "),r("li",[t._v("若您需将芸众软件或服务用户商业用途，必须另行获得芸众的书面许可，您在获得商业授权之后，您可以将本软件应用于商业用途，同时依据所购买的授权类型中确定的技术支持期限、技术支持方式和技术支持内容，自购买时刻起，在技术支持期限内拥有通过指定的方式获得指定范围内的技术支持服务。商业授权用户享有反映和提出意见的权力，相关意见将被作为首要考虑，但没有一定被采纳的承诺或保证。")]),t._v(" "),r("li",[t._v("您可以从芸众提供的应用中心服务中下载适合您网站的应用程序，但应向应用程序开发者/所有者支付相应的费用。")])])]),t._v(" "),r("p",[r("strong",[t._v("II. 协议规定的约束和限制 ")]),t._v(" "),r("ol",{staticStyle:{"line-height":"32px"}},[r("li",[t._v("未获芸众公司书面商业授权之前，不得将本软件用于商业用途（包括但不限于企业网站、经营性网站、以营利为目或实现盈利的网站）。购买商业授权请登陆"),r("a",{attrs:{href:"https://www.yunzmall.com/",target:"_blank"}},[t._v("https://www.yunzmall.com/")]),t._v("参考相关说明，也可以致电020-29887215了解详情。")]),t._v(" "),r("li",[t._v("未经芸众许可，不得对本软件或与之关联的商业授权进行出租、出售、抵押或发放子许可证。")]),t._v(" "),r("li",[t._v("禁止在芸众产品的整体或任何部分基础上以发展任何派生版本、修改版本或第三方版本用于重新分发。")]),t._v(" "),r("li",[t._v("您从应用中心下载的应用程序，未经应用程序开发者/所有者的书面许可，不得对其进行反向工程、反向汇编、反向编译等，不得擅自复制、修改、链接、转载、汇编、发表、出版、发展与之有关的衍生产品、作品等。")]),t._v(" "),r("li",[t._v("如果您未能遵守本协议的条款，您的授权将被终止，所许可的权利将被收回，同时您应承担相应法律责任。")])])]),t._v(" "),r("p",[r("strong",[t._v("III. 有限担保和免责声明")]),t._v(" "),r("ol",{staticStyle:{"line-height":"32px"}},[r("li",[t._v("本软件及所附带的文件是作为不提供任何明确的或隐含的赔偿或担保的形式提供的。")]),t._v(" "),r("li",[t._v("用户出于自愿而使用本软件，您必须了解使用本软件的风险，在尚未购买产品技术服务之前，我们不承诺提供任何形式的技术支持、使用担保，也不承担任何因使用本软件而产生问题的相关责任。")]),t._v(" "),r("li",[t._v("芸众公司不对使用本软件构建的网站中的商品或信息承担责任，全部责任由您自行承担。")]),t._v(" "),r("li",[t._v("芸众公司无法全面监控由第三方上传至应用中心的应用程序，因此不保证应用程序的合法性、安全性、完整性、真实性或品质等；您从应用中心下载应用程序时，同意自行判断并承担所有风险，而不依赖于芸众公司。但在任何情况下，芸众公司有权依法停止应用中心服务并采取相应行动，包括但不限于对于相关应用程序进行卸载，暂停服务的全部或部分，保存有关记录，并向有关机关报告。由此对您及第三人可能造成的损失，芸众公司不承担任何直接、间接或者连带的责任。")]),t._v(" "),r("li",[t._v("芸众公司对芸众提供的软件和服务之及时性、安全性、准确性不作担保，由于不可抗力因素、芸众公司无法控制的因素（包括黑客攻击、停断电等）等造成软件使用和服务中止或终止，而给您造成损失的，您同意放弃追究芸众公司责任的全部权利。")]),t._v(" "),r("li",[t._v("芸众公司特别提请您注意，芸众公司为了保障公司业务发展和调整的自主权，芸众公司拥有随时经或未经事先通知而修改服务内容、中止或终止部分或全部软件使用和服务的权利，修改会公布于芸众公司网站相关页面上，一经公布视为通知。 芸众公司行使修改或中止、终止部分或全部软件使用和服务的权利而造成损失的，芸众公司不需对您或任何第三方负责。")]),t._v(" "),r("li",[t._v("有关芸众产品最终用户授权协议、商业授权与技术服务的详细内容，均由芸众公司独家提供。芸众公司拥有在不事先通知的情况下，修改授权协议和服务价目表的权利，修改后的协议或价目表对自改变之日起的新授权用户生效。")])])]),t._v(" "),r("p",[t._v("\n          一旦您开始安装芸众产品，即被视为完全理解并接受本协议的各项条款，在享有上述条款授予的权利的同时，受到相关的约束和限制。协议许可范围以外的行为，将直接违反本授权协议并构成侵权，我们有权随时终止授权，责令停止损害，并保留追究相关责任的权力。\n        ")]),t._v(" "),r("p",[t._v("\n          本许可协议条款的解释，效力及纠纷的解决，适用于中华人民共和国大陆法律。\n        ")]),t._v(" "),r("p",[t._v("\n          若您和芸众之间发生任何纠纷或争议，首先应友好协商解决，协商不成的，您在此完全同意将纠纷或争议提交芸众所在地广州市白云区人民法院管辖。芸众公司拥有对以上各项条款内容的解释权及修改权。\n        ")]),t._v(" "),r("p",[t._v("\n          （正文完）\n        ")]),t._v(" "),r("p",[t._v("\n          芸众公司\n        ")])])])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticStyle:{"font-size":"50px","text-align":"center",color:"#409eff",padding:"100px 0","font-weight":"900"}},[e("i",{staticClass:"el-icon-success"},[this._v(" 安装完成")])])}],!1,null,null,null);u.options.__file="wizard.vue";e.default=u.exports},klx6:function(t,e,r){"use strict";var a=r("tN1b");r.n(a).a},ls82:function(t,e){!function(e){"use strict";var r,a=Object.prototype,s=a.hasOwnProperty,i="function"==typeof Symbol?Symbol:{},n=i.iterator||"@@iterator",o=i.asyncIterator||"@@asyncIterator",l=i.toStringTag||"@@toStringTag",c="object"==typeof t,u=e.regeneratorRuntime;if(u)c&&(t.exports=u);else{(u=e.regeneratorRuntime=c?t.exports:{}).wrap=y;var v="suspendedStart",p="suspendedYield",h="executing",m="completed",f={},d={};d[n]=function(){return this};var _=Object.getPrototypeOf,w=_&&_(_(C([])));w&&w!==a&&s.call(w,n)&&(d=w);var g=k.prototype=x.prototype=Object.create(d);S.prototype=g.constructor=k,k.constructor=S,k[l]=S.displayName="GeneratorFunction",u.isGeneratorFunction=function(t){var e="function"==typeof t&&t.constructor;return!!e&&(e===S||"GeneratorFunction"===(e.displayName||e.name))},u.mark=function(t){return Object.setPrototypeOf?Object.setPrototypeOf(t,k):(t.__proto__=k,l in t||(t[l]="GeneratorFunction")),t.prototype=Object.create(g),t},u.awrap=function(t){return{__await:t}},D(E.prototype),E.prototype[o]=function(){return this},u.AsyncIterator=E,u.async=function(t,e,r,a){var s=new E(y(t,e,r,a));return u.isGeneratorFunction(e)?s:s.next().then(function(t){return t.done?t.value:s.next()})},D(g),g[l]="Generator",g[n]=function(){return this},g.toString=function(){return"[object Generator]"},u.keys=function(t){var e=[];for(var r in t)e.push(r);return e.reverse(),function r(){for(;e.length;){var a=e.pop();if(a in t)return r.value=a,r.done=!1,r}return r.done=!0,r}},u.values=C,A.prototype={constructor:A,reset:function(t){if(this.prev=0,this.next=0,this.sent=this._sent=r,this.done=!1,this.delegate=null,this.method="next",this.arg=r,this.tryEntries.forEach(R),!t)for(var e in this)"t"===e.charAt(0)&&s.call(this,e)&&!isNaN(+e.slice(1))&&(this[e]=r)},stop:function(){this.done=!0;var t=this.tryEntries[0].completion;if("throw"===t.type)throw t.arg;return this.rval},dispatchException:function(t){if(this.done)throw t;var e=this;function a(a,s){return o.type="throw",o.arg=t,e.next=a,s&&(e.method="next",e.arg=r),!!s}for(var i=this.tryEntries.length-1;i>=0;--i){var n=this.tryEntries[i],o=n.completion;if("root"===n.tryLoc)return a("end");if(n.tryLoc<=this.prev){var l=s.call(n,"catchLoc"),c=s.call(n,"finallyLoc");if(l&&c){if(this.prev<n.catchLoc)return a(n.catchLoc,!0);if(this.prev<n.finallyLoc)return a(n.finallyLoc)}else if(l){if(this.prev<n.catchLoc)return a(n.catchLoc,!0)}else{if(!c)throw new Error("try statement without catch or finally");if(this.prev<n.finallyLoc)return a(n.finallyLoc)}}}},abrupt:function(t,e){for(var r=this.tryEntries.length-1;r>=0;--r){var a=this.tryEntries[r];if(a.tryLoc<=this.prev&&s.call(a,"finallyLoc")&&this.prev<a.finallyLoc){var i=a;break}}i&&("break"===t||"continue"===t)&&i.tryLoc<=e&&e<=i.finallyLoc&&(i=null);var n=i?i.completion:{};return n.type=t,n.arg=e,i?(this.method="next",this.next=i.finallyLoc,f):this.complete(n)},complete:function(t,e){if("throw"===t.type)throw t.arg;return"break"===t.type||"continue"===t.type?this.next=t.arg:"return"===t.type?(this.rval=this.arg=t.arg,this.method="return",this.next="end"):"normal"===t.type&&e&&(this.next=e),f},finish:function(t){for(var e=this.tryEntries.length-1;e>=0;--e){var r=this.tryEntries[e];if(r.finallyLoc===t)return this.complete(r.completion,r.afterLoc),R(r),f}},catch:function(t){for(var e=this.tryEntries.length-1;e>=0;--e){var r=this.tryEntries[e];if(r.tryLoc===t){var a=r.completion;if("throw"===a.type){var s=a.arg;R(r)}return s}}throw new Error("illegal catch attempt")},delegateYield:function(t,e,a){return this.delegate={iterator:C(t),resultName:e,nextLoc:a},"next"===this.method&&(this.arg=r),f}}}function y(t,e,r,a){var s=e&&e.prototype instanceof x?e:x,i=Object.create(s.prototype),n=new A(a||[]);return i._invoke=function(t,e,r){var a=v;return function(s,i){if(a===h)throw new Error("Generator is already running");if(a===m){if("throw"===s)throw i;return N()}for(r.method=s,r.arg=i;;){var n=r.delegate;if(n){var o=$(n,r);if(o){if(o===f)continue;return o}}if("next"===r.method)r.sent=r._sent=r.arg;else if("throw"===r.method){if(a===v)throw a=m,r.arg;r.dispatchException(r.arg)}else"return"===r.method&&r.abrupt("return",r.arg);a=h;var l=b(t,e,r);if("normal"===l.type){if(a=r.done?m:p,l.arg===f)continue;return{value:l.arg,done:r.done}}"throw"===l.type&&(a=m,r.method="throw",r.arg=l.arg)}}}(t,r,n),i}function b(t,e,r){try{return{type:"normal",arg:t.call(e,r)}}catch(t){return{type:"throw",arg:t}}}function x(){}function S(){}function k(){}function D(t){["next","throw","return"].forEach(function(e){t[e]=function(t){return this._invoke(e,t)}})}function E(t){var e;this._invoke=function(r,a){function i(){return new Promise(function(e,i){!function e(r,a,i,n){var o=b(t[r],t,a);if("throw"!==o.type){var l=o.arg,c=l.value;return c&&"object"==typeof c&&s.call(c,"__await")?Promise.resolve(c.__await).then(function(t){e("next",t,i,n)},function(t){e("throw",t,i,n)}):Promise.resolve(c).then(function(t){l.value=t,i(l)},n)}n(o.arg)}(r,a,e,i)})}return e=e?e.then(i,i):i()}}function $(t,e){var a=t.iterator[e.method];if(a===r){if(e.delegate=null,"throw"===e.method){if(t.iterator.return&&(e.method="return",e.arg=r,$(t,e),"throw"===e.method))return f;e.method="throw",e.arg=new TypeError("The iterator does not provide a 'throw' method")}return f}var s=b(a,t.iterator,e.arg);if("throw"===s.type)return e.method="throw",e.arg=s.arg,e.delegate=null,f;var i=s.arg;return i?i.done?(e[t.resultName]=i.value,e.next=t.nextLoc,"return"!==e.method&&(e.method="next",e.arg=r),e.delegate=null,f):i:(e.method="throw",e.arg=new TypeError("iterator result is not an object"),e.delegate=null,f)}function B(t){var e={tryLoc:t[0]};1 in t&&(e.catchLoc=t[1]),2 in t&&(e.finallyLoc=t[2],e.afterLoc=t[3]),this.tryEntries.push(e)}function R(t){var e=t.completion||{};e.type="normal",delete e.arg,t.completion=e}function A(t){this.tryEntries=[{tryLoc:"root"}],t.forEach(B,this),this.reset(!0)}function C(t){if(t){var e=t[n];if(e)return e.call(t);if("function"==typeof t.next)return t;if(!isNaN(t.length)){var a=-1,i=function e(){for(;++a<t.length;)if(s.call(t,a))return e.value=t[a],e.done=!1,e;return e.value=r,e.done=!0,e};return i.next=i}}return{next:N}}function N(){return{value:r,done:!0}}}(function(){return this}()||Function("return this")())},tN1b:function(t,e,r){},u938:function(t,e,r){var a=function(){return this}()||Function("return this")(),s=a.regeneratorRuntime&&Object.getOwnPropertyNames(a).indexOf("regeneratorRuntime")>=0,i=s&&a.regeneratorRuntime;if(a.regeneratorRuntime=void 0,t.exports=r("ls82"),s)a.regeneratorRuntime=i;else try{delete a.regeneratorRuntime}catch(t){a.regeneratorRuntime=void 0}}}]);