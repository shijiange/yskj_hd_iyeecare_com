(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-1fe7"],{"22dI":function(t,e,a){},"2pzy":function(t,e,a){"use strict";a.r(e);var o={name:"createPersonSeal",data:function(){return{seal:{},form:{name:"",color:"RED"}}},created:function(){this.$store.dispatch("GetUserInfo"),this.getData()},destroyed:function(){},methods:{getData:function(){var t=this;$http.get("plugin.yun-sign.frontend.person-seal.show-seal",{color:this.form.color},"loading").then(function(e){1===e.result?t.seal=e.data.pic_data:e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)})},createSeal:function(){var t=this;this.form.name?$http.get("plugin.yun-sign.frontend.person-seal.add-seal",this.form,"loading").then(function(e){1===e.result?t.$router.push(t.fun.getUrl("sealIndex")):e.msg&&t.$message.error(e.msg)}).catch(function(t){console.error(t)}):this.$message.error("请给印章取个名称")}}},s=(a("nAGX"),a("ZrdR")),r=Object(s.a)(o,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"right",attrs:{id:"create_seal"}},[a("div",{staticClass:"container"},[a("div",{staticClass:"seal-content"},[a("div",{staticClass:"seal-content-preview"},[a("img",{attrs:{src:"data:image/png;base64,"+t.seal,alt:""}})]),t._v(" "),a("p",{staticClass:"seal-preview-title"},[t._v("效果预览")]),t._v(" "),a("div",{staticClass:"container-footer"},[a("el-button",{staticStyle:{width:"150px"},attrs:{type:"primary"},on:{click:t.createSeal}},[t._v("提交")])],1)]),t._v(" "),a("div",{staticClass:"seal-content media"},[a("el-form",{ref:"form",attrs:{model:t.form,"label-position":"top","label-width":"80px"}},[a("el-form-item",{attrs:{label:"印章名称"}},[a("el-input",{model:{value:t.form.name,callback:function(e){t.$set(t.form,"name",e)},expression:"form.name"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"印章颜色"}},[a("el-radio-group",{on:{change:t.getData},model:{value:t.form.color,callback:function(e){t.$set(t.form,"color",e)},expression:"form.color"}},[a("div",{staticStyle:{display:"flex","flex-wrap":"wrap"}},[a("el-radio",{attrs:{label:"RED"}},[a("div",{staticClass:"color-box red"},["RED"==t.form.color?a("i",{staticClass:"iconfont icon-wancheng2"}):t._e()])]),t._v(" "),a("el-radio",{attrs:{label:"BLUE"}},[a("div",{staticClass:"color-box blue"},["BLUE"==t.form.color?a("i",{staticClass:"iconfont icon-wancheng2"}):t._e()])]),t._v(" "),a("el-radio",{attrs:{label:"BLACK"}},[a("div",{staticClass:"color-box black"},["BLACK"==t.form.color?a("i",{staticClass:"iconfont icon-wancheng2"}):t._e()])])],1)])],1)],1)],1)])])},[],!1,null,"134a2a81",null);r.options.__file="create_person_seal.vue";e.default=r.exports},nAGX:function(t,e,a){"use strict";var o=a("22dI");a.n(o).a}}]);