(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-56dc"],{"469F":function(t,i,e){},gqKe:function(t,i,e){"use strict";e.r(i);var n=e("rerW"),s=e.n(n),a=e("bS4n"),l=e.n(a),r=e("2kDQ"),o=e("8t5x"),c={data:function(){return{arrSp:[],timeSimp:!1,active:"1",type_list:[],plugin_list:{}}},computed:l()({},Object(o.b)(["globalData"])),mounted:function(){this.$refs.scrollMain.addEventListener("scroll",this.scrollEvent,!0)},created:function(){this.getApplicationList()},methods:{toUrl:function(t){var i=[];this.globalData.tab&&(i=this.globalData.tab.filter(function(i){return i.route===t})),i[0]&&i[0].child.length>1?this.$router.push(this.fun.getUrl(i[0].child[1].route)):this.$router.push(this.fun.getUrl(t))},scrollEvent:function(t){var i=this;if(!this.timeSimp){this.timeSimp=!0,setTimeout(function(){i.timeSimp=!1},100);var e=t.target.scrollTop,n=this.calcScroll(e);this.active="NaN"==String(n+1)?"1":String(n+1),console.log(this.active)}},calcScroll:function(t){for(var i=void 0,e=0;e<this.arrSp.length;e++){var n=document.getElementById(this.arrSp[e].jump_id).offsetTop;console.log(t,n,"各个距离子元素的高度"),t>n&&(i=e)}return i},getSonChild:function(t){this.$nextTick(function(){var i=document.getElementById(t),e={behavior:"smooth"};i&&setTimeout(function(){i.scrollIntoView(e)},200)})},getApplicationList:function(){var t=this;$http.pc_post("admin/getApplicationList",{},"loading").then(function(i){if(1===i.result){var e=[],n=[],a=!0,l=!1,r=void 0;try{for(var o,c=s()(i.data.type);!(a=(o=c.next()).done);a=!0){var u=o.value,d={category_id:u.key,category_title:u.name},p={category_id:u.key,category_title:u.name,jump_id:u.key,children:i.data.plugin_list[u.key]||[]};e.push(d),n.push(p)}}catch(t){l=!0,r=t}finally{try{!a&&c.return&&c.return()}finally{if(l)throw r}}t.type_list=e,t.arrSp=n,t.active=e[0].category_id}else i.msg&&t.$message.error(i.msg)}).catch(function(t){console.error(t)})}},components:{sign_side:r.a}},u=(e("t66q"),e("ZrdR")),d=Object(u.a)(c,function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("div",[e("sign_side",{attrs:{defaultActive:t.active,other_list:t.type_list,sideStyle:"jump"},on:{getterSet:t.getSonChild}}),t._v(" "),e("div",{ref:"scrollMain",staticClass:"minMain"},t._l(t.arrSp,function(i,n){return e("div",{key:n,staticStyle:{"border-radius":"10px"}},[e("transition",{attrs:{name:"fade"}},[i.children.length>0?e("div",{staticClass:"minScoll",staticStyle:{width:"100%"},attrs:{id:i.jump_id}},[e("h3",{staticClass:"panel-title"},[e("div",{staticClass:"nav-line"}),t._v("\n            "+t._s(i.category_title)+"\n          ")]),t._v(" "),e("el-row",{staticClass:"panelBox"},t._l(i.children,function(i,n){return e("el-col",{key:n,staticStyle:{margin:"0 15px"},attrs:{xs:8,sm:6,md:6,lg:5,xl:5}},[e("div",{staticClass:"panel-body plugin-a",on:{click:function(e){t.toUrl(i.route)}}},[e("div",{staticClass:"plugin-i-div",staticStyle:{flex:"0 0 50px"}},[e("i",{staticClass:"plugin-i",staticStyle:{"background-color":"#eb6f50"},style:{backgroundImage:"url("+i.icon+")"}})]),t._v(" "),e("div",{staticClass:"plugin-span"},[e("div",{staticStyle:{display:"flex"}},[e("span",{staticStyle:{overflow:"hidden","text-overflow":"ellipsis","white-space":"nowrap","max-width":"150px",display:"block"}},[t._v(t._s(i.title))])]),t._v(" "),e("div",{staticClass:"description"},[t._v(t._s(i.description))]),t._v(" "),e("span",{staticClass:"icon_detail"})])])])}))],1):t._e()])],1)}))],1)},[],!1,null,"26ea9abc",null);d.options.__file="index.vue";i.default=d.exports},t66q:function(t,i,e){"use strict";var n=e("469F");e.n(n).a}}]);