(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-db02"],{"7BsA":function(t,e,a){t.exports=function(t){function e(n){if(a[n])return a[n].exports;var i=a[n]={i:n,l:!1,exports:{}};return t[n].call(i.exports,i,i.exports,e),i.l=!0,i.exports}var a={};return e.m=t,e.c=a,e.i=function(t){return t},e.d=function(t,a,n){e.o(t,a)||Object.defineProperty(t,a,{configurable:!1,enumerable:!0,get:n})},e.n=function(t){var a=t&&t.__esModule?function(){return t.default}:function(){return t};return e.d(a,"a",a),a},e.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},e.p="/dist/",e(e.s=2)}([function(t,e,a){var n=a(4)(a(1),a(5),null,null);t.exports=n.exports},function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var n=a(3);e.default={props:{startVal:{type:Number,required:!1,default:0},endVal:{type:Number,required:!1,default:2017},duration:{type:Number,required:!1,default:3e3},autoplay:{type:Boolean,required:!1,default:!0},decimals:{type:Number,required:!1,default:0,validator:function(t){return t>=0}},decimal:{type:String,required:!1,default:"."},separator:{type:String,required:!1,default:","},prefix:{type:String,required:!1,default:""},suffix:{type:String,required:!1,default:""},useEasing:{type:Boolean,required:!1,default:!0},easingFn:{type:Function,default:function(t,e,a,n){return a*(1-Math.pow(2,-10*t/n))*1024/1023+e}}},data:function(){return{localStartVal:this.startVal,displayValue:this.formatNumber(this.startVal),printVal:null,paused:!1,localDuration:this.duration,startTime:null,timestamp:null,remaining:null,rAF:null}},computed:{countDown:function(){return this.startVal>this.endVal}},watch:{startVal:function(){this.autoplay&&this.start()},endVal:function(){this.autoplay&&this.start()}},mounted:function(){this.autoplay&&this.start(),this.$emit("mountedCallback")},methods:{start:function(){this.localStartVal=this.startVal,this.startTime=null,this.localDuration=this.duration,this.paused=!1,this.rAF=(0,n.requestAnimationFrame)(this.count)},pauseResume:function(){this.paused?(this.resume(),this.paused=!1):(this.pause(),this.paused=!0)},pause:function(){(0,n.cancelAnimationFrame)(this.rAF)},resume:function(){this.startTime=null,this.localDuration=+this.remaining,this.localStartVal=+this.printVal,(0,n.requestAnimationFrame)(this.count)},reset:function(){this.startTime=null,(0,n.cancelAnimationFrame)(this.rAF),this.displayValue=this.formatNumber(this.startVal)},count:function(t){this.startTime||(this.startTime=t),this.timestamp=t;var e=t-this.startTime;this.remaining=this.localDuration-e,this.useEasing?this.countDown?this.printVal=this.localStartVal-this.easingFn(e,0,this.localStartVal-this.endVal,this.localDuration):this.printVal=this.easingFn(e,this.localStartVal,this.endVal-this.localStartVal,this.localDuration):this.countDown?this.printVal=this.localStartVal-(this.localStartVal-this.endVal)*(e/this.localDuration):this.printVal=this.localStartVal+(this.localStartVal-this.startVal)*(e/this.localDuration),this.countDown?this.printVal=this.printVal<this.endVal?this.endVal:this.printVal:this.printVal=this.printVal>this.endVal?this.endVal:this.printVal,this.displayValue=this.formatNumber(this.printVal),e<this.localDuration?this.rAF=(0,n.requestAnimationFrame)(this.count):this.$emit("callback")},isNumber:function(t){return!isNaN(parseFloat(t))},formatNumber:function(t){t=t.toFixed(this.decimals);var e=(t+="").split("."),a=e[0],n=e.length>1?this.decimal+e[1]:"",i=/(\d+)(\d{3})/;if(this.separator&&!this.isNumber(this.separator))for(;i.test(a);)a=a.replace(i,"$1"+this.separator+"$2");return this.prefix+a+n+this.suffix}},destroyed:function(){(0,n.cancelAnimationFrame)(this.rAF)}}},function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var n=a(0),i=function(t){return t&&t.__esModule?t:{default:t}}(n);e.default=i.default,"undefined"!=typeof window&&window.Vue&&window.Vue.component("count-to",i.default)},function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var n=0,i="webkit moz ms o".split(" "),r=void 0,s=void 0;if("undefined"==typeof window)e.requestAnimationFrame=r=function(){},e.cancelAnimationFrame=s=function(){};else{e.requestAnimationFrame=r=window.requestAnimationFrame,e.cancelAnimationFrame=s=window.cancelAnimationFrame;for(var o=void 0,u=0;u<i.length&&(!r||!s);u++)o=i[u],e.requestAnimationFrame=r=r||window[o+"RequestAnimationFrame"],e.cancelAnimationFrame=s=s||window[o+"CancelAnimationFrame"]||window[o+"CancelRequestAnimationFrame"];r&&s||(e.requestAnimationFrame=r=function(t){var e=(new Date).getTime(),a=Math.max(0,16-(e-n)),i=window.setTimeout(function(){t(e+a)},a);return n=e+a,i},e.cancelAnimationFrame=s=function(t){window.clearTimeout(t)})}e.requestAnimationFrame=r,e.cancelAnimationFrame=s},function(t,e){t.exports=function(t,e,a,n){var i,r=t=t||{},s=typeof t.default;"object"!==s&&"function"!==s||(i=t,r=t.default);var o="function"==typeof r?r.options:r;if(e&&(o.render=e.render,o.staticRenderFns=e.staticRenderFns),a&&(o._scopeId=a),n){var u=Object.create(o.computed||null);Object.keys(n).forEach(function(t){var e=n[t];u[t]=function(){return e}}),o.computed=u}return{esModule:i,exports:r,options:o}}},function(t,e){t.exports={render:function(){var t=this,e=t.$createElement;return(t._self._c||e)("span",[t._v("\n  "+t._s(t.displayValue)+"\n")])},staticRenderFns:[]}}])},LJBZ:function(t,e,a){"use strict";var n=a("OK7G");a.n(n).a},OK7G:function(t,e,a){},akSB:function(t,e,a){"use strict";a.r(e);var n=a("7BsA"),i={name:"CountToDemo",components:{countTo:a.n(n).a},data:function(){return{setStartVal:0,setEndVal:2017,setDuration:4e3,setDecimals:0,setSeparator:",",setSuffix:" rmb",setPrefix:"¥ "}},computed:{_startVal:function(){return this.setStartVal?this.setStartVal:0},_endVal:function(){return this.setEndVal?this.setEndVal:0},_duration:function(){return this.setDuration?this.setDuration:100},_decimals:function(){return this.setDecimals?this.setDecimals<0||this.setDecimals>20?(alert("digits argument must be between 0 and 20"),0):this.setDecimals:0},_separator:function(){return this.setSeparator},_suffix:function(){return this.setSuffix},_prefix:function(){return this.setPrefix}},methods:{start:function(){this.$refs.example.start()},pauseResume:function(){this.$refs.example.pauseResume()}}},r=(a("LJBZ"),a("KHd+")),s=Object(r.a)(i,function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"components-container"},[t._m(0),t._v(" "),a("count-to",{ref:"example",staticClass:"example",attrs:{"start-val":t._startVal,"end-val":t._endVal,duration:t._duration,decimals:t._decimals,separator:t._separator,prefix:t._prefix,suffix:t._suffix,autoplay:!1}}),t._v(" "),a("div",{staticStyle:{"margin-left":"25%","margin-top":"40px"}},[a("label",{staticClass:"label",attrs:{for:"startValInput"}},[t._v("startVal:\n      "),a("input",{directives:[{name:"model",rawName:"v-model.number",value:t.setStartVal,expression:"setStartVal",modifiers:{number:!0}}],attrs:{type:"number",name:"startValInput"},domProps:{value:t.setStartVal},on:{input:function(e){e.target.composing||(t.setStartVal=t._n(e.target.value))},blur:function(e){t.$forceUpdate()}}})]),t._v(" "),a("label",{staticClass:"label",attrs:{for:"endValInput"}},[t._v("endVal:\n      "),a("input",{directives:[{name:"model",rawName:"v-model.number",value:t.setEndVal,expression:"setEndVal",modifiers:{number:!0}}],attrs:{type:"number",name:"endVaInput"},domProps:{value:t.setEndVal},on:{input:function(e){e.target.composing||(t.setEndVal=t._n(e.target.value))},blur:function(e){t.$forceUpdate()}}})]),t._v(" "),a("label",{staticClass:"label",attrs:{for:"durationInput"}},[t._v("duration:\n      "),a("input",{directives:[{name:"model",rawName:"v-model.number",value:t.setDuration,expression:"setDuration",modifiers:{number:!0}}],attrs:{type:"number",name:"durationInput"},domProps:{value:t.setDuration},on:{input:function(e){e.target.composing||(t.setDuration=t._n(e.target.value))},blur:function(e){t.$forceUpdate()}}})]),t._v(" "),a("div",{staticClass:"startBtn example-btn",on:{click:t.start}},[t._v("开始")]),t._v(" "),a("div",{staticClass:"pause-resume-btn example-btn",on:{click:t.pauseResume}},[t._v("暂停/恢复")]),t._v(" "),a("br"),t._v(" "),a("label",{staticClass:"label",attrs:{for:"decimalsInput"}},[t._v("decimals:\n      "),a("input",{directives:[{name:"model",rawName:"v-model.number",value:t.setDecimals,expression:"setDecimals",modifiers:{number:!0}}],attrs:{type:"number",name:"decimalsInput"},domProps:{value:t.setDecimals},on:{input:function(e){e.target.composing||(t.setDecimals=t._n(e.target.value))},blur:function(e){t.$forceUpdate()}}})]),t._v(" "),a("label",{staticClass:"label",attrs:{for:"separatorInput"}},[t._v("separator:\n      "),a("input",{directives:[{name:"model",rawName:"v-model",value:t.setSeparator,expression:"setSeparator"}],attrs:{name:"separatorInput"},domProps:{value:t.setSeparator},on:{input:function(e){e.target.composing||(t.setSeparator=e.target.value)}}})]),t._v(" "),a("label",{staticClass:"label",attrs:{for:"prefixInput"}},[t._v("prefix:\n      "),a("input",{directives:[{name:"model",rawName:"v-model",value:t.setPrefix,expression:"setPrefix"}],attrs:{name:"prefixInput"},domProps:{value:t.setPrefix},on:{input:function(e){e.target.composing||(t.setPrefix=e.target.value)}}})]),t._v(" "),a("label",{staticClass:"label",attrs:{for:"suffixInput"}},[t._v("suffix:\n      "),a("input",{directives:[{name:"model",rawName:"v-model",value:t.setSuffix,expression:"setSuffix"}],attrs:{name:"suffixInput"},domProps:{value:t.setSuffix},on:{input:function(e){e.target.composing||(t.setSuffix=e.target.value)}}})])]),t._v(" "),a("code",[t._v("<count-to :start-val='"+t._s(t._startVal)+"' :end-val='"+t._s(t._endVal)+"' :duration='"+t._s(t._duration)+"'\n  :decimals='"+t._s(t._decimals)+"' :separator='"+t._s(t._separator)+"' :prefix='"+t._s(t._prefix)+"' :suffix='"+t._s(t._suffix)+"'\n  :autoplay=false>")])],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("p",{staticClass:"warn-content"},[e("a",{attrs:{href:"https://github.com/PanJiaChen/vue-countTo",target:"_blank"}},[this._v("countTo-component")])])}],!1,null,"28afc1bb",null);s.options.__file="countTo.vue";e.default=s.exports}}]);