(window.webpackJsonp=window.webpackJsonp||[]).push([["I6Tl"],{I6Tl:function(e,n,a){"use strict";a.r(n);var t={data:function(){return{loading:"加载中"}},created:function(){this.currentChange(1)},methods:{currentChange:function(e){var n=this;$http.post("/admin/application",{page:e},"加载中").then(function(e){1===e.result?n.$router.push(n.fun.getUrl("Manage")):(n.list=[],-1===e.data.status&&n.currentChange(1),e.msg&&""!=e.msg&&n.$message.error(e.msg))}).catch(function(e){console.error(e)})}}},i=a("KHd+"),l=Object(i.a)(t,function(){var e=this.$createElement;return(this._self._c||e)("div",{directives:[{name:"loading",rawName:"v-loading",value:this.loading,expression:"loading"},{name:"loading",rawName:"v-loading.fullscreen.lock",value:this.loading,expression:"loading",modifiers:{fullscreen:!0,lock:!0}}],attrs:{"element-loading-text":"加载中","element-loading-spinner":"el-icon-loading","element-loading-background":"rgba(255, 255, 255, 1)"}})},[],!1,null,null,null);l.options.__file="loading.vue";n.default=l.exports}}]);