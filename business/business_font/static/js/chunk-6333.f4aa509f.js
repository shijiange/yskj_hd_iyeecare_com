(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-6333"],{GqOc:function(t,i,s){"use strict";var e=s("RpVS");s.n(e).a},RpVS:function(t,i,s){},nxmM:function(t,i,s){"use strict";s.r(i);var e={components:{},data:function(){return{search_input:"",final_plat_id:"",listArr:[]}},mounted:function(){this.getData()},methods:{toUrl:function(t,i){i?this.$router.push(this.fun.getUrl(t,{},{business_id:i.id})):this.$router.push(this.fun.getUrl(t))},toAdmin:function(t,i){var s=this,e=sessionStorage.getItem("yz_redirect");if("sign"===i&&!this.fun.isTextEmpty(e)&&e)return window.localStorage.setItem("identity_type",t.id?"2":"1"),window.location.href=e+"&fromLogin=1",void sessionStorage.removeItem("yz_redirect");var n={id:t.id};1==t.identity_type&&(n.identity_type=1),$http.pc_get("admin/manageBusiness",n,"loading").then(function(i){1===i.result?(window.localStorage.setItem("identity_type",t.identity_type||2),1==t.identity_type?s.toBusiness(t.id,"person"):s.toBusiness(t.id)):i.msg&&s.$message.error(i.msg)})},toBusiness:function(t,i){var s=this;this.$store.dispatch("delAllViews"),this.$store.dispatch("GenerateRoutes",{final_plat_id:t}).then(function(){"person"==i?s.toUrl("sign"):s.toUrl("overview")})},getData:function(){var t=this;$http.pc_get("admin/businessList",{name:this.search_input},"loading").then(function(i){if(1===i.result){if(t.final_plat_id=i.data.final_plat_id,"new"===t.$route.params.isFrom){if(window.localStorage.getItem("sign_cid"))return t.final_plat_id=window.localStorage.getItem("sign_cid"),"-1"==t.final_plat_id&&(t.final_plat_id=0),t.toAdmin({id:t.final_plat_id},"sign"),void window.localStorage.removeItem("sign_cid");if(t.final_plat_id)return void(2==(window.localStorage.getItem("identity_type")||2)?t.toBusiness(t.final_plat_id):t.toBusiness(t.final_plat_id,"person"))}t.listArr=i.data.platform_list||[],1===t.listArr.length&&"new"===t.$route.params.isFrom&&t.toBusiness(t.listArr[0].id)}})}}},n=(s("GqOc"),s("KHd+")),a=Object(n.a)(e,function(){var t=this,i=t.$createElement,s=t._self._c||i;return s("div",{staticClass:"business"},[s("el-header",{attrs:{height:"80px"}},[s("div",{staticClass:"headBox"},[s("div",{staticClass:"left"},[s("div",{staticClass:"leftBox"},[s("div",{staticStyle:{display:"flex",height:"17px"}},[s("div",{staticClass:"message-top-title"}),t._v("\n            企业管理\n          ")]),t._v(" "),s("el-button",{staticClass:"createBox",attrs:{size:"small",type:"primary",plain:""},on:{click:function(i){t.toUrl("businessCreate")}}},[t._v("+创建企业\n          ")])],1)]),t._v(" "),s("div",{staticStyle:{display:"flex"}},[s("el-input",{attrs:{placeholder:"请输入企业名称"},model:{value:t.search_input,callback:function(i){t.search_input=i},expression:"search_input"}}),t._v(" "),s("el-button",{attrs:{type:"primary",plain:""},on:{click:t.getData}},[t._v("搜索")])],1)])]),t._v(" "),s("el-main",[t.listArr.length>0?s("div",{staticClass:"ul"},t._l(t.listArr,function(i,e){return s("div",{key:e,staticClass:"list"},[s("div",{staticClass:"list-item"},[s("div",{staticClass:"avaimg"},[s("img",{attrs:{src:i.logo_img,alt:""}})]),t._v(" "),s("div",{staticClass:"userName"},[s("div",{staticClass:"userTop"},[s("span",[t._v(t._s(i.identity_desc))])]),t._v(" "),s("div",{staticClass:"userCompany"},[s("span",[t._v(t._s(i.name))])]),t._v(" "),s("div",{staticClass:"btn"},[i.identity>2&&(!i.identity_type||2==i.identity_type)?s("el-button",{staticClass:"createBox",attrs:{size:"small",type:"danger"},on:{click:function(s){t.toUrl("businessPeople",i)}}},[t._v("使用人\n              ")]):t._e(),t._v(" "),3!==i.identity_type?s("el-button",{staticClass:"createBox admin",attrs:{size:"small",type:"primary"},on:{click:function(s){t.toAdmin(i)}}},[t._v("管理")]):t._e()],1)])])])})):s("div",{staticClass:"noneul"},[s("span",[t._v("当前没有企业，赶紧创建一个吧！！ "),s("el-link",{staticStyle:{"font-size":"22px","vertical-align":"baseline"},attrs:{type:"primary"},on:{click:function(i){t.toUrl("businessCreate")}}},[t._v("立即创建 >")])],1)])])],1)},[],!1,null,"5bd5c131",null);a.options.__file="business_list.vue";i.default=a.exports}}]);