(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-bf4e"],{"9AGD":function(e,t,s){"use strict";var a=s("szSH");s.n(a).a},ereV:function(e,t,s){"use strict";s.r(t);var a={name:"PlatformManage",data:function(){var e=this,t=function(e,t,s){t.length<6?s(new Error("密码长度不能少于6")):s()};return{is_agree:0,active:1,version:"",form:{set:{DB_HOST:"localhost",DB_PORT:3306,DB_PREFIX:"ims_"},user:{}},sysytem_environment:[],server_info:[],check_function:[],file_list:[],rules:{set:{DB_HOST:{required:!0,message:"请输入数据库服务器"},DB_DATABASE:{required:!0,message:"请输入数据库名"},DB_USERNAME:{required:!0,message:"请输入数据库用户名"},DB_PASSWORD:{required:!0,message:"请输入数据库密码"},DB_PREFIX:{required:!0,message:"请输入数据库前缀"},DB_PORT:{required:!0,message:"请输入数据库端口"}},user:{name:{required:!0,message:"请输入站点名称"},username:{required:!0,message:"请输入管理员账号"},password:[{required:!0,message:"请输入管理员密码"},{validator:t}],repassword:[{required:!0,message:"请输入重复密码"},{validator:function(t,s,a){s!=e.form.user.password?a(new Error("两次密码输入不一致")):a()}},{validator:t}],mobile:[{required:!0,message:"请输入手机号"},{validator:function(e,t,s){/^1\d{10}$/.test(t)?s():s(new Error("请输入正确的手机格式"))}}]}}}},created:function(){this.getVersion()},destroyed:function(){},methods:{getVersion:function(){var e=this;$http.post("/admin/install/agreement",{},"加载中").then(function(t){e.version=t.data.version}).catch(function(){console.log("获取数据失败！")})},getDetectionData:function(){var e=this;$http.post("/admin/install/check",{},"加载中").then(function(t){e.sysytem_environment=t.data.sysytem_environment,e.check_function=t.data.check_function,e.server_info=t.data.server_info}).catch(function(){console.log("获取数据失败！")})},getFileData:function(){var e=this;$http.post("/admin/install/file_power",{},"加载中...").then(function(t){e.file_list=t.data}).catch(function(){console.log("获取数据失败！")})},submit:function(e){var t=this;this.$refs[e].validate(function(e){if(!e)return console.log("error submit!!"),t.active=3,!1;$http.post("/admin/install/set_info",{set:t.form.set,user:t.form.user},"提交中...").then(function(e){1===e.result?t.$message.success("创建数据成功"):(t.$message.error(e.msg),t.active=3)}).catch(function(){t.$message.error(response.msg),t.active=3})})},agree:function(){this.is_agree=1,this.getDetectionData()},change:function(e){var t=this;1===e&&(this.active++,2==this.active&&(this.sysytem_environment.map(function(e,s){if(0==e.check)return t.active=1,t.$message.error("当前环境不支持安装！"),!1}),this.file_list!=[]&&this.file_list&&void 0!=this.file_list&&0!=this.file_list.length||this.getFileData()),4==this.active&&this.submit("form"),this.active>5&&(this.active=5)),0===e&&(this.active--,this.active<1&&(this.active=1))},install:function(){var e=this;$http.post("/admin/install/create_data",{},"安装中...").then(function(t){1===t.result?(e.active++,e.delete()):e.$message.error(t.msg)}).catch(function(){e.$message.error(response.msg)})},delete:function(){var e=this;$http.post("/admin/install/delete",{},"").then(function(t){1===t.result||e.$message.error(t.msg)}).catch(function(){e.$message.error(response.msg)})}}},i=(s("9AGD"),s("KHd+")),r=Object(i.a)(a,function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"right"},[s("div",{staticClass:"right-head"},[s("el-row",[s("el-col",{attrs:{span:16}},[s("div",{staticClass:"right-head-con"},[e._v("系统安装向导")])]),e._v(" "),s("el-col",{attrs:{span:7}},[s("div",{staticClass:"right-head-con1",attrs:{align:"right"}},[e._v("版本："+e._s(e.version))])])],1)],1),e._v(" "),0===e.is_agree?s("div",[e._m(0),e._v(" "),s("div",{staticClass:"right-content-btn"},[s("el-button",{attrs:{type:"primary"},on:{click:function(t){e.agree()}}},[e._v("同意协议进入安装")]),e._v(" "),s("el-button",{attrs:{type:"info"}},[e._v("取消")])],1)]):e._e(),e._v(" "),1===e.is_agree?s("div",[s("div",{staticClass:"step-head"},[s("div",{directives:[{name:"show",rawName:"v-show",value:1==e.active,expression:"active == 1"}]},[e._v("Step.1 运行环境检测")]),e._v(" "),s("div",{directives:[{name:"show",rawName:"v-show",value:2==e.active,expression:"active == 2"}]},[e._v("Step.2 文件权限设置")]),e._v(" "),s("div",{directives:[{name:"show",rawName:"v-show",value:3==e.active,expression:"active == 3"}]},[e._v("Step.3 创建数据")]),e._v(" "),s("div",{directives:[{name:"show",rawName:"v-show",value:4==e.active,expression:"active == 4"}]},[e._v("Step.4 账号设置")]),e._v(" "),s("div",{directives:[{name:"show",rawName:"v-show",value:5==e.active,expression:"active == 5"}]},[e._v("Step.5 安装完成")])]),e._v(" "),s("div",{staticClass:"right-content1"},[s("el-steps",{attrs:{active:e.active,"align-center":""}},[s("el-step",{attrs:{title:"运行环境检测",icon:"el-icon-menu"}}),e._v(" "),s("el-step",{attrs:{title:"文件权限设置",icon:"el-icon-setting"}}),e._v(" "),s("el-step",{attrs:{title:"账号设置",icon:"el-icon-news"}}),e._v(" "),s("el-step",{attrs:{title:"创建数据",icon:"el-icon-edit"}}),e._v(" "),s("el-step",{attrs:{title:"安装完成",icon:"el-icon-success"}})],1),e._v(" "),s("div",{directives:[{name:"show",rawName:"v-show",value:1==e.active,expression:"active == 1"}]},[s("h5",{staticClass:"rightlist-head"},[e._v("\n            环境检查\n          ")]),e._v(" "),s("el-table",{staticStyle:{width:"100%"},attrs:{data:e.sysytem_environment,border:""}},[s("el-table-column",{attrs:{prop:"name",label:"项目",align:"center"}}),e._v(" "),s("el-table-column",{attrs:{prop:"need",label:"程序所需",align:"center"}}),e._v(" "),s("el-table-column",{attrs:{prop:"optimum",label:"最佳配置推荐",align:"center"}}),e._v(" "),s("el-table-column",{attrs:{label:"当前服务器",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("span",{directives:[{name:"show",rawName:"v-show",value:1==t.row.check,expression:"scope.row.check == true"}]},[s("i",{staticClass:"el-icon-success",staticStyle:{color:"#409eff"}})]),e._v(" "),s("span",{directives:[{name:"show",rawName:"v-show",value:0==t.row.check,expression:"scope.row.check == false"}]},[s("i",{staticClass:"el-icon-error",staticStyle:{color:"red"}})]),e._v(" "),s("span",[e._v(e._s(t.row.value))])]}}])})],1),e._v(" "),s("h5",{staticClass:"rightlist-head"},[e._v("\n            函数检查\n          ")]),e._v(" "),s("el-table",{staticStyle:{width:"100%"},attrs:{data:e.check_function,border:""}},[s("el-table-column",{attrs:{prop:"name",label:"目录文件",align:"center"}}),e._v(" "),s("el-table-column",{attrs:{prop:"need",label:"所需状态",align:"center"}}),e._v(" "),s("el-table-column",{attrs:{prop:"value",label:"当前状态",align:"center"}})],1),e._v(" "),s("h5",{staticClass:"rightlist-head"},[e._v("\n            服务器信息\n          ")]),e._v(" "),s("el-table",{staticStyle:{width:"100%"},attrs:{data:e.server_info,border:""}},[s("el-table-column",{attrs:{prop:"name",label:"参数","min-width":"200"}}),e._v(" "),s("el-table-column",{attrs:{prop:"value",label:"值","min-width":"600"}})],1)],1),e._v(" "),s("div",{directives:[{name:"show",rawName:"v-show",value:2==e.active,expression:"active == 2"}]},[s("h5",{staticClass:"rightlist-head"},[e._v("\n            目录、文件权限检查\n          ")]),e._v(" "),s("el-table",{staticStyle:{width:"100%"},attrs:{data:e.file_list,border:""}},[s("el-table-column",{attrs:{prop:"name",label:"目录文件",align:"center"}}),e._v(" "),s("el-table-column",{attrs:{prop:"need",label:"所需状态",align:"center"}}),e._v(" "),s("el-table-column",{attrs:{prop:"value",label:"当前状态",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[1==t.row.value?s("span",[e._v("可写")]):s("span",[e._v("不可写")])]}}])})],1)],1),e._v(" "),s("div",{directives:[{name:"show",rawName:"v-show",value:3==e.active,expression:"active == 3"}]},[s("el-form",{ref:"form",attrs:{model:e.form,rules:e.rules,"label-width":"15%"}},[s("h5",{staticClass:"rightlist-head"},[e._v("\n            数据库信息\n          ")]),e._v(" "),s("el-form-item",{attrs:{label:"数据库服务器",prop:"set.DB_HOST"}},[s("el-input",{staticStyle:{width:"70%"},model:{value:e.form.set.DB_HOST,callback:function(t){e.$set(e.form.set,"DB_HOST",t)},expression:"form.set.DB_HOST"}}),e._v(" "),s("div",{staticClass:"tip"},[e._v("数据库服务器地址，一般为localhost")])],1),e._v(" "),s("el-form-item",{attrs:{label:"数据库名",prop:"set.DB_DATABASE"}},[s("el-input",{staticStyle:{width:"70%"},model:{value:e.form.set.DB_DATABASE,callback:function(t){e.$set(e.form.set,"DB_DATABASE",t)},expression:"form.set.DB_DATABASE"}})],1),e._v(" "),s("el-form-item",{attrs:{label:"数据库用户名",prop:"set.DB_USERNAME"}},[s("el-input",{staticStyle:{width:"70%"},model:{value:e.form.set.DB_USERNAME,callback:function(t){e.$set(e.form.set,"DB_USERNAME",t)},expression:"form.set.DB_USERNAME"}})],1),e._v(" "),s("el-form-item",{attrs:{label:"数据库密码",prop:"set.DB_PASSWORD"}},[s("el-input",{staticStyle:{width:"70%"},attrs:{type:"password"},model:{value:e.form.set.DB_PASSWORD,callback:function(t){e.$set(e.form.set,"DB_PASSWORD",t)},expression:"form.set.DB_PASSWORD"}})],1),e._v(" "),s("el-form-item",{attrs:{label:"数据库表前缀",prop:"set.DB_PREFIX"}},[s("el-input",{staticStyle:{width:"70%"},model:{value:e.form.set.DB_PREFIX,callback:function(t){e.$set(e.form.set,"DB_PREFIX",t)},expression:"form.set.DB_PREFIX"}}),e._v(" "),s("div",{staticClass:"tip"},[e._v("同一数据库表运行多个程序时，请修改前缀")])],1),e._v(" "),s("el-form-item",{attrs:{label:"数据库端口",prop:"set.DB_PORT"}},[s("el-input",{staticStyle:{width:"70%"},model:{value:e.form.set.DB_PORT,callback:function(t){e.$set(e.form.set,"DB_PORT",t)},expression:"form.set.DB_PORT"}}),e._v(" "),s("div",{staticClass:"tip"},[e._v("数据库默认端口一般为3306")])],1),e._v(" "),s("h5",{staticClass:"rightlist-head"},[e._v("\n            网站信息\n          ")]),e._v(" "),s("el-form-item",{attrs:{label:"站点名称",prop:"user.name"}},[s("el-input",{staticStyle:{width:"70%"},model:{value:e.form.user.name,callback:function(t){e.$set(e.form.user,"name",t)},expression:"form.user.name"}}),e._v(" "),s("div",{staticClass:"tip"},[e._v("\n              输入站点名称，安装后可以在平台设置中进行修改\n            ")])],1),e._v(" "),s("el-form-item",{attrs:{label:"管理员账号",prop:"user.username"}},[s("el-input",{staticStyle:{width:"70%"},model:{value:e.form.user.username,callback:function(t){e.$set(e.form.user,"username",t)},expression:"form.user.username"}})],1),e._v(" "),s("el-form-item",{attrs:{label:"管理员密码",prop:"user.password"}},[s("el-input",{staticStyle:{width:"70%"},attrs:{type:"password"},model:{value:e.form.user.password,callback:function(t){e.$set(e.form.user,"password",t)},expression:"form.user.password"}}),e._v(" "),s("div",{staticClass:"tip"},[e._v("管理员密码不少于6个字符")])],1),e._v(" "),s("el-form-item",{attrs:{label:"重复密码",prop:"user.repassword"}},[s("el-input",{staticStyle:{width:"70%"},attrs:{type:"password"},model:{value:e.form.user.repassword,callback:function(t){e.$set(e.form.user,"repassword",t)},expression:"form.user.repassword"}}),e._v(" "),s("div",{staticClass:"tip"},[e._v("确保两次输入的密码一致")])],1),e._v(" "),s("el-form-item",{attrs:{label:"手机号",prop:"user.mobile"}},[s("el-input",{staticStyle:{width:"70%"},attrs:{type:"text"},model:{value:e.form.user.mobile,callback:function(t){e.$set(e.form.user,"mobile",t)},expression:"form.user.mobile"}})],1)],1)],1),e._v(" "),s("div",{directives:[{name:"show",rawName:"v-show",value:4==e.active,expression:"active == 4"}]},[e._v("\n        创建数据...\n      ")]),e._v(" "),s("div",{directives:[{name:"show",rawName:"v-show",value:5==e.active,expression:"active == 5"}]},[e._m(1),e._v(" "),s("router-link",{attrs:{to:"/login"}},[s("el-button",{attrs:{type:"primary"}},[e._v("跳到登录页面")])],1)],1),e._v(" "),s("div",{staticClass:"right-content-btn"},[s("el-button",{directives:[{name:"show",rawName:"v-show",value:1!=e.active&5!=e.active,expression:"(active != 1) & (active != 5)"}],attrs:{type:"primary"},on:{click:function(t){e.change(0)}}},[e._v("上一步")]),e._v(" "),s("el-button",{directives:[{name:"show",rawName:"v-show",value:4!=e.active&&5!=e.active,expression:"active != 4 && active != 5"}],attrs:{type:"primary"},on:{click:function(t){e.change(1)}}},[e._v("下一步")]),e._v(" "),s("el-button",{directives:[{name:"show",rawName:"v-show",value:4==e.active,expression:"active == 4"}],attrs:{type:"primary"},on:{click:function(t){e.install()}}},[e._v("确认安装")])],1)],1)]):e._e()])},[function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"panel panel-default",staticStyle:{width:"80%",margin:"0 auto"}},[s("div",{staticClass:"panel-heading text-center",staticStyle:{"font-size":"20px","font-weight":"900",padding:"10px 0"}},[e._v("芸众商城系统安装协议")]),e._v(" "),s("div",{staticClass:"panel-body",staticStyle:{"overflow-y":"scroll","max-height":"700px","line-height":"20px"}},[s("h3",[e._v("版权所有 (c) 2019-2029，广州市芸众信息科技有限公司（以下简称芸众公司）保留所有权利。")]),e._v(" "),s("p",{staticStyle:{"line-height":"32px"}},[e._v("\n          感谢您选择芸众产品。希望我们的努力能为您提供一个高效快速、强大的站点解决方案，和强大的电商系统解决方案。芸众公司网址为"),s("a",{attrs:{href:"https://bbs.yunzmall.com/",target:"_blank"}},[e._v("https://bbs.yunzmall.com/")]),e._v("，产品官方讨论区网址为 "),s("a",{attrs:{href:"https://bbs.yunzmall.com/forum.php",target:"_blank"}},[e._v("https://bbs.yunzmall.com/forum.php")]),e._v("。\n        ")]),e._v(" "),s("p",{staticStyle:{"line-height":"32px"}},[e._v("\n          用户须知：本协议是您与芸众公司之间关于您使用芸众公司提供的各种软件产品及服务的法律协议。无论您是个人或组织、盈利与否、用途如何（包括以学习和研究为目的），均需仔细阅读本协议，包括免除或者限制芸众责任的免责条款及对您的权利限制。请您审阅并接受或不接受本服务条款。如您不同意本服务条款及/或芸众随时对其的修改，您应不使用或主动取消芸众公司提供的芸众产品。否则，您的任何对芸众产品中的相关服务的注册、登陆、下载、查看等使用行为将被视为您对本服务条款全部的完全接受，包括接受芸众对服务条款随时所做的任何修改。\n        ")]),e._v(" "),s("p",{staticStyle:{"line-height":"32px"}},[e._v("\n          本服务条款一旦发生变更, 芸众将在网页上公布修改内容。修改后的服务条款一旦在网站管理后台或者芸众官网上公布即有效代替原来的服务条款。您可随时登陆芸众官方论坛查阅最新版服务条款。如果您选择接受本条款，即表示您同意接受协议各项条件的约束。如果您不同意本服务条款，则不能获得使用本服务的权利。您若有违反本条款规定，芸众公司有权随时中止或终止您对芸众产品的使用资格并保留追究相关法律责任的权利。\n        ")]),e._v(" "),s("p",{staticStyle:{"line-height":"32px"}},[e._v("\n          在理解、同意、并遵守本协议的全部条款后，方可开始使用芸众产品。您可能与芸众公司直接签订另一书面协议，以补充或者取代本协议的全部或者任何部分。\n        ")]),e._v(" "),s("p",{staticStyle:{"line-height":"32px"}},[e._v("\n          芸众拥有本软件的全部知识产权。本软件只供许可协议，并非出售。芸众只允许您在遵守本协议各项条款的情况下复制、下载、安装、使用或者以其他方式受益于本软件的功能或者知识产权。\n        ")]),e._v(" "),s("p",[s("strong",[e._v("I. 协议许可的权利")]),e._v(" "),s("ol",{staticStyle:{"line-height":"32px"}},[s("li",[e._v("您可以在完全遵守本许可协议的基础上，将本软件应用于非商业用途，而不必支付软件版权许可费用。")]),e._v(" "),s("li",[e._v("您可以在协议规定的约束和限制范围内修改芸众产品源代码(如果被提供的话)或界面风格以适应您的网站要求。")]),e._v(" "),s("li",[e._v("您拥有使用本软件构建的网站中全部会员资料、文章及相关信息的所有权，并独立承担与使用本软件构建的网站内容的审核、注意义务，确保其不侵犯任何人的合法权益，独立承担因使用芸众软件和服务带来的全部责任，若造成芸众公司或用户损失的，您应予以全部赔偿。")]),e._v(" "),s("li",[e._v("若您需将芸众软件或服务用户商业用途，必须另行获得芸众的书面许可，您在获得商业授权之后，您可以将本软件应用于商业用途，同时依据所购买的授权类型中确定的技术支持期限、技术支持方式和技术支持内容，自购买时刻起，在技术支持期限内拥有通过指定的方式获得指定范围内的技术支持服务。商业授权用户享有反映和提出意见的权力，相关意见将被作为首要考虑，但没有一定被采纳的承诺或保证。")]),e._v(" "),s("li",[e._v("您可以从芸众提供的应用中心服务中下载适合您网站的应用程序，但应向应用程序开发者/所有者支付相应的费用。")])])]),e._v(" "),s("p",[s("strong",[e._v("II. 协议规定的约束和限制 ")]),e._v(" "),s("ol",{staticStyle:{"line-height":"32px"}},[s("li",[e._v("未获芸众公司书面商业授权之前，不得将本软件用于商业用途（包括但不限于企业网站、经营性网站、以营利为目或实现盈利的网站）。购买商业授权请登陆"),s("a",{attrs:{href:"https://www.yunzshop.com/",target:"_blank"}},[e._v("https://www.yunzshop.com/")]),e._v("参考相关说明，也可以致电020-29887215了解详情。")]),e._v(" "),s("li",[e._v("未经芸众许可，不得对本软件或与之关联的商业授权进行出租、出售、抵押或发放子许可证。")]),e._v(" "),s("li",[e._v("禁止在芸众产品的整体或任何部分基础上以发展任何派生版本、修改版本或第三方版本用于重新分发。")]),e._v(" "),s("li",[e._v("您从应用中心下载的应用程序，未经应用程序开发者/所有者的书面许可，不得对其进行反向工程、反向汇编、反向编译等，不得擅自复制、修改、链接、转载、汇编、发表、出版、发展与之有关的衍生产品、作品等。")]),e._v(" "),s("li",[e._v("如果您未能遵守本协议的条款，您的授权将被终止，所许可的权利将被收回，同时您应承担相应法律责任。")])])]),e._v(" "),s("p",[s("strong",[e._v("III. 有限担保和免责声明")]),e._v(" "),s("ol",{staticStyle:{"line-height":"32px"}},[s("li",[e._v("本软件及所附带的文件是作为不提供任何明确的或隐含的赔偿或担保的形式提供的。")]),e._v(" "),s("li",[e._v("用户出于自愿而使用本软件，您必须了解使用本软件的风险，在尚未购买产品技术服务之前，我们不承诺提供任何形式的技术支持、使用担保，也不承担任何因使用本软件而产生问题的相关责任。")]),e._v(" "),s("li",[e._v("芸众公司不对使用本软件构建的网站中的商品或信息承担责任，全部责任由您自行承担。")]),e._v(" "),s("li",[e._v("芸众公司无法全面监控由第三方上传至应用中心的应用程序，因此不保证应用程序的合法性、安全性、完整性、真实性或品质等；您从应用中心下载应用程序时，同意自行判断并承担所有风险，而不依赖于芸众公司。但在任何情况下，芸众公司有权依法停止应用中心服务并采取相应行动，包括但不限于对于相关应用程序进行卸载，暂停服务的全部或部分，保存有关记录，并向有关机关报告。由此对您及第三人可能造成的损失，芸众公司不承担任何直接、间接或者连带的责任。")]),e._v(" "),s("li",[e._v("芸众公司对芸众提供的软件和服务之及时性、安全性、准确性不作担保，由于不可抗力因素、芸众公司无法控制的因素（包括黑客攻击、停断电等）等造成软件使用和服务中止或终止，而给您造成损失的，您同意放弃追究芸众公司责任的全部权利。")]),e._v(" "),s("li",[e._v("芸众公司特别提请您注意，芸众公司为了保障公司业务发展和调整的自主权，芸众公司拥有随时经或未经事先通知而修改服务内容、中止或终止部分或全部软件使用和服务的权利，修改会公布于芸众公司网站相关页面上，一经公布视为通知。 芸众公司行使修改或中止、终止部分或全部软件使用和服务的权利而造成损失的，芸众公司不需对您或任何第三方负责。")]),e._v(" "),s("li",[e._v("有关芸众产品最终用户授权协议、商业授权与技术服务的详细内容，均由芸众公司独家提供。芸众公司拥有在不事先通知的情况下，修改授权协议和服务价目表的权利，修改后的协议或价目表对自改变之日起的新授权用户生效。")])])]),e._v(" "),s("p",[e._v("\n          一旦您开始安装芸众产品，即被视为完全理解并接受本协议的各项条款，在享有上述条款授予的权利的同时，受到相关的约束和限制。协议许可范围以外的行为，将直接违反本授权协议并构成侵权，我们有权随时终止授权，责令停止损害，并保留追究相关责任的权力。\n        ")]),e._v(" "),s("p",[e._v("\n          本许可协议条款的解释，效力及纠纷的解决，适用于中华人民共和国大陆法律。\n        ")]),e._v(" "),s("p",[e._v("\n          若您和芸众之间发生任何纠纷或争议，首先应友好协商解决，协商不成的，您在此完全同意将纠纷或争议提交芸众所在地广州市白云区人民法院管辖。芸众公司拥有对以上各项条款内容的解释权及修改权。\n        ")]),e._v(" "),s("p",[e._v("\n          （正文完）\n        ")]),e._v(" "),s("p",[e._v("\n          芸众公司\n        ")])])])},function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticStyle:{"font-size":"50px","text-align":"center",color:"#409eff",padding:"100px 0","font-weight":"900"}},[t("i",{staticClass:"el-icon-success"},[this._v(" 安装完成")])])}],!1,null,"0c64d1d3",null);r.options.__file="wizard.vue";t.default=r.exports},szSH:function(e,t,s){}}]);