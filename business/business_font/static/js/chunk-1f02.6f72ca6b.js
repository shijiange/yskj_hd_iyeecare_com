(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-1f02"],{"+iKR":function(t,e,a){"use strict";var s=a("5mPo");a.n(s).a},"5mPo":function(t,e,a){},BIn4:function(t,e,a){},WTAx:function(t,e,a){"use strict";var s=a("BIn4");a.n(s).a},eE27:function(t,e,a){"use strict";a.r(e);var s=a("14Xm"),i=a.n(s),l=a("D3Ub"),n=a.n(l),o=a("QbLZ"),r=a.n(o),c=a("FyfS"),m=a.n(c),_={components:{},props:["welcomeContent"],watch:{},data:function(){return{news_show:!1}},created:function(){var t=!0,e=!1,a=void 0;try{for(var s,i=m()(this.welcomeContent.content);!(t=(s=i.next()).done);t=!0){var l=s.value;"text"==l.type&&(l.news=l.news.replace(/\">{{客户昵称}}</g,'">客户昵称<'))}}catch(t){e=!0,a=t}finally{try{!t&&i.return&&i.return()}finally{if(e)throw a}}this.news_show=!0},methods:{}},v=(a("+iKR"),a("KHd+")),u=Object(v.a)(_,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{attrs:{id:"welcome_dialog_card"}},t._l(t.welcomeContent.content,function(e,s){return a("div",{key:s},["text"==e.type?a("div",{staticClass:"show_item"},[a("div",{staticClass:"show_img"},[null!==t.welcomeContent.has_one_members?a("img",{attrs:{src:null!==t.welcomeContent.has_one_members?t.welcomeContent.has_one_members.avatar:"",alt:""}}):t._e()]),t._v(" "),a("div",{staticClass:"show_content"},[a("div",{staticClass:"triangle"}),t._v(" "),a("div",{staticClass:"test_msg"},[a("div",{staticClass:"link_list",staticStyle:{padding:"10px","line-height":"22px"}},[t.news_show?a("div",{staticStyle:{padding:"0px"},domProps:{innerHTML:t._s(e.news)}}):t._e()])])])]):t._e(),t._v(" "),"image"==e.type?a("div",{staticClass:"show_item"},[a("div",{staticClass:"show_img"},[a("img",{attrs:{"itemv-if":"welcomeContent.has_one_members !== null ? true : false ",src:null!==t.welcomeContent.has_one_members?t.welcomeContent.has_one_members.avatar:"",alt:""}})]),t._v(" "),a("div",{},[a("div",{}),t._v(" "),a("div",{},[a("img",{staticStyle:{padding:"0 10px 10px 10px",width:"200px",height:"200px"},attrs:{src:e.link_img,alt:""}})])])]):t._e(),t._v(",.\n    "),"link"==e.type?a("div",{staticClass:"show_item"},[a("div",{staticClass:"show_img"},[a("img",{attrs:{"itemv-if":"welcomeContent.has_one_members !== null ? true : false ",src:null!==t.welcomeContent.has_one_members?t.welcomeContent.has_one_members.avatar:"",alt:""}})]),t._v(" "),a("div",{staticClass:"type_show_content"},[a("div",{staticClass:"tyep_triangle"}),t._v(" "),a("div",{staticClass:"test_msg"},[a("div",{staticClass:"link_list"},[a("div",[t._v(t._s(e.title))]),t._v(" "),a("div",[t._v(t._s(e.link))]),t._v(" "),a("div",[t._v(t._s(e.describe))]),t._v(" "),a("img",{attrs:{src:e.link_img,alt:""}})])])])]):t._e(),t._v(" "),"applet"==e.type?a("div",{staticClass:"show_item"},[a("div",{staticClass:"show_img"},[a("img",{attrs:{"itemv-if":"welcomeContent.has_one_members !== null ? true : false ",src:null!==t.welcomeContent.has_one_members?t.welcomeContent.has_one_members.avatar:"",alt:""}})]),t._v(" "),a("div",{staticClass:"type_show_content"},[a("div",{staticClass:"tyep_triangle"}),t._v(" "),a("div",{staticClass:"test_msg"},[a("div",{staticClass:"link_list"},[a("div",[t._v(t._s(e.title))]),t._v(" "),a("img",{attrs:{src:e.link_img,alt:""}})])])])]):t._e(),t._v(" "),"video"==e.type?a("div",{staticStyle:{display:"flex"}},[a("div",{staticClass:"show_img"},[a("img",{attrs:{"itemv-if":"welcomeContent.has_one_members !== null ? true : false ",src:null!==t.welcomeContent.has_one_members?t.welcomeContent.has_one_members.avatar:"",alt:""}})]),t._v(" "),a("div",{staticClass:"type_show_content",staticStyle:{display:"flex"}},[a("div",{}),t._v(" "),a("div",{},[a("video",{staticStyle:{width:"100%"},attrs:{src:e.link_video,alt:"",controls:"controls"}})])])]):t._e(),t._v(" "),"file"==e.type?a("div",{staticClass:"show_item"},[a("div",{staticClass:"show_img"},[a("img",{attrs:{"itemv-if":"welcomeContent.has_one_members !== null ? true : false ",src:null!==t.welcomeContent.has_one_members?t.welcomeContent.has_one_members.avatar:"",alt:""}})]),t._v(" "),a("div",{staticClass:"type_show_content"},[a("div",{staticClass:"tyep_triangle"}),t._v(" "),a("div",{staticClass:"test_msg "},[a("div",{staticClass:"link_list check_card"},[a("a",[t._v(t._s(e.link_file))])])])])]):t._e()])}))},[],!1,null,"8eb5cf86",null);u.options.__file="welcome_dialog_card.vue";var d={data:function(){return{search:{member:"",type:"",staff_department:""},times:"",options:[{value:"text",label:"文本"},{value:"image",label:"图片"},{value:"link",label:"链接"},{value:"applet",label:"小程序"},{value:"video",label:"视频"},{value:"file",label:"文件"}],welcomeList:[],current_page:1,total:1,per_page:1,dialogVisible:!1,welcomeContent:null,titleStatus:0}},mounted:function(){this.getWelcomeData(1)},methods:{addWelcome:function(){this.$router.push(this.fun.getUrl("welcomeDeitor"))},btnSearch:function(t){this.getWelcomeData(t,r()({},this.search,{begin_time:this.times?this.times[0]:"",end_time:this.times?this.times[1]:""}))},getWelcomeData:function(t,e){var a=this;return n()(i.a.mark(function s(){var l;return i.a.wrap(function(s){for(;;)switch(s.prev=s.next){case 0:return s.next=2,$http.pc_post("plugin/WelcomeWords/getList",{page:t,search:e});case 2:1==(l=s.sent).result?(a.welcomeList=l.data.data,a.total=l.data.total,a.per_page=l.data.per_page,a.current_page=l.data.current_page):a.$message.error(l.msg);case 4:case"end":return s.stop()}},s,a)}))()},btnCheckk:function(t){this.welcomeContent=t,this.dialogVisible=!0},goEdit:function(t){this.$router.push(this.fun.getUrl("welcomeDeitor",{},{id:t}))},delWelcomeItem:function(t){var e=this;return n()(i.a.mark(function a(){return i.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:e.$confirm("此操作将删除该数据, 是否继续?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(n()(i.a.mark(function a(){var s;return i.a.wrap(function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,$http.pc_post("plugin/WelcomeWords/delete",{id:t});case 2:1==(s=a.sent).result?(e.$message.success(s.msg),location.reload()):e.$message.error(s.msg);case 4:case"end":return a.stop()}},a,e)}))).catch(function(){e.$message({type:"info",message:"已取消删除"})});case 1:case"end":return a.stop()}},a,e)}))()}},filters:{formatDate:function(t){var e=new Date(1e3*t);return e.getFullYear()+"-"+((e.getMonth()+1<10?"0"+(e.getMonth()+1):e.getMonth()+1)+"-")+(e.getDate()+" ")+(e.getHours()+":")+(e.getMinutes()<10?"0"+e.getMinutes()+":":e.getMinutes()+":")+e.getSeconds()}},components:{welcome_dialog_card:u.exports}},p=(a("WTAx"),Object(v.a)(d,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"all"},[a("div",{staticClass:"welcome_title"},[a("span",{class:[0==t.titleStatus?"welcome_title_detail":"active_welcome_title_detail"],on:{click:function(e){t.titleStatus=1}}},[t._v("欢迎语")])]),t._v(" "),a("div",{staticStyle:{"margin-top":"10px",width:"calc(100% - 150px)"},attrs:{id:"app"}},[a("div",{staticClass:"title_tag"},[t._v("欢迎语 > 欢迎语列表")]),t._v(" "),a("div",{staticClass:"vue-head"},[a("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[a("div",{staticClass:"vue-main-title-left"}),t._v(" "),a("div",{staticClass:"vue-main-title-content"},[t._v("欢迎语")]),t._v(" "),a("div",{staticClass:"vue-main-title-button"},[a("el-button",{attrs:{type:"primary",plain:"",icon:"el-icon-plus",size:"mini"},on:{click:t.addWelcome}},[t._v("新增欢迎语")])],1)]),t._v(" "),a("div",{staticClass:"vue-search"},[a("el-form",{staticClass:"demo-form-inline",attrs:{inline:!0,model:t.search}},[a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"添加人"},model:{value:t.search.member,callback:function(e){t.$set(t.search,"member",e)},expression:"search.member"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-input",{attrs:{placeholder:"适用成员/部门"},model:{value:t.search.staff_department,callback:function(e){t.$set(t.search,"staff_department",e)},expression:"search.staff_department"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-select",{attrs:{placeholder:"类型",clearable:"",filterable:""},model:{value:t.search.type,callback:function(e){t.$set(t.search,"type",e)},expression:"search.type"}},t._l(t.options,function(t){return a("el-option",{key:t.value,attrs:{label:t.label,value:t.value}})}))],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-date-picker",{staticStyle:{"margin-left":"5px"},attrs:{type:"datetimerange","value-format":"yyyy-MM-dd HH:mm:ss","range-separator":"至","start-placeholder":"开始时间","end-placeholder":"结束时间",align:"right"},model:{value:t.times,callback:function(e){t.times=e},expression:"times"}})],1),t._v(" "),a("el-form-item",{attrs:{label:""}},[a("el-button",{attrs:{type:"primary"},on:{click:function(e){t.btnSearch(1)}}},[t._v("搜索")])],1)],1)],1)]),t._v(" "),t._m(0),t._v(" "),a("div",{staticClass:"vue-main"},[a("div",{staticClass:"vue-main-form"},[t._m(1),t._v(" "),a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.welcomeList}},[a("el-table-column",{attrs:{label:"添加时间",align:"center",prop:"created_at"},scopedSlots:t._u([{key:"default",fn:function(e){return[t._v("\n              "+t._s(t._f("formatDate")(e.row.created_at))+"\n            ")]}}])}),t._v(" "),a("el-table-column",{attrs:{label:"添加人",align:"center",prop:"addPeople"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("div",{staticClass:"add_pepole"},[null!==e.row.has_one_members?a("img",{attrs:{src:e.row.has_one_members?e.row.has_one_members.avatar:"",alt:""}}):t._e(),t._v(" "),a("div",[t._v(t._s(null!==e.row.has_one_members&&e.row.has_one_members?e.row.has_one_members.nickname:""))])])]}}])}),t._v(" "),a("el-table-column",{attrs:{label:"欢迎语内容",align:"center",prop:"welcomeContent"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("span",{staticClass:"scope_edit",on:{click:function(a){t.btnCheckk(e.row)}}},[t._v("查看")])]}}])}),t._v(" "),a("el-table-column",{attrs:{label:"适用成员/部门",align:"center"},scopedSlots:t._u([{key:"default",fn:function(e){return[t._v("\n              "+t._s(1==e.row.type?"全体":"成员或部门")+"\n            ")]}}])}),t._v(" "),a("el-table-column",{attrs:{label:"欢迎语名称",align:"center",prop:"name"}}),t._v(" "),a("el-table-column",{attrs:{label:"欢迎语类型",align:"center",prop:"type",width:"280px"},scopedSlots:t._u([{key:"default",fn:function(e){return[t._v("\n              "+t._s(e.row.content_type)+"\n            ")]}}])}),t._v(" "),a("el-table-column",{attrs:{prop:"refund_time",label:"操作",align:"center"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("i",{staticClass:"el-icon-edit",staticStyle:{color:"#999999"},on:{click:function(a){t.goEdit(e.row.id)}}}),t._v(" "),a("i",{staticClass:"el-icon-delete",on:{click:function(a){t.delWelcomeItem(e.row.id)}}})]}}])})],1)],1)]),t._v(" "),a("el-dialog",{attrs:{title:"",visible:t.dialogVisible,width:"30%"},on:{"update:visible":function(e){t.dialogVisible=e}}},[a("welcome_dialog_card",{attrs:{welcomeContent:t.welcomeContent}})],1),t._v(" "),a("div",{staticClass:"vue-page"},[a("el-row",[a("el-col",{attrs:{align:"right"}},[a("el-pagination",{attrs:{layout:"prev, pager, next,jumper",total:t.total,"page-size":t.per_page,"current-page":t.current_page,background:""},on:{"current-change":t.btnSearch}})],1)],1)],1)],1)])},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"description_introduction"},[e("p",[this._v("1、欢迎语: 新好友添加后自动回复,可添加文字、图片、链接以及小程序，客户来了不用担心冷场!")]),this._v(" "),e("p",[this._v("2、每个企业成员均可以拥有不同的欢迎语。当部门欢迎语和个人专属的欢迎语并存的情况下，优化自动回复个人专属的欢迎语。另外，当同一员工归属于两个部门时，随机推送某部门的欢迎语。")]),this._v(" "),e("p",[this._v("3、如果企业在企业微信后台为相关成员配置了可用的欢迎语，使用第三方系统配置欢迎语，则均不起效，推送的还是企业微信官方的。")])])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"vue-main-title",staticStyle:{"margin-bottom":"20px"}},[e("div",{staticClass:"vue-main-title-left"}),this._v(" "),e("div",{staticClass:"vue-main-title-content",staticStyle:{flex:"0 0 130px"}},[this._v("欢迎语")])])}],!1,null,"15af2cb7",null));p.options.__file="welcome_list.vue";e.default=p.exports}}]);