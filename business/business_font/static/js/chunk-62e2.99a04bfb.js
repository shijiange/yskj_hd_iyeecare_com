(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-62e2"],{"06Ue":function(t,s,e){"use strict";var n=e("255p");e.n(n).a},"255p":function(t,s,e){},"5Sd4":function(t,s,e){"use strict";var n=e("q9e0");e.n(n).a},"8vK8":function(t,s,e){"use strict";var n=e("Ubme");e.n(n).a},KuU0:function(t,s,e){"use strict";var n=e("mTPN");e.n(n).a},LmOT:function(t,s,e){"use strict";var n={props:{ischeck:{type:Boolean,default:!1},datas:{type:null,default:!1},keyOrder:{type:null,default:!1}},data:function(){return{info:{},order:[],orderSn:""}},methods:{addColorMethod:function(t){return this.goodSelect==t?"addS":"addM"},colorMethod:function(t){return this.goodSelect==t?"sBg":"mBg"}},watch:{datas:function(t,s){this.ischeck?(this.order=t,this.orderSn=this.keyOrder.order_sn):(this.info=t,this.order=t.orders[0])}},computed:{getMember:function(){return this.$store.getters.getPosMember}}},i=(e("06Ue"),e("KHd+")),o=Object(i.a)(n,function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",{attrs:{id:"orderLeft"}},[e("div",{staticClass:"userLeft"},[t._m(0),t._v(" "),e("span",{staticClass:"nameId"},[t._v(t._s(t.getMember.uid?t.getMember.nickname+"(ID:"+t.getMember.uid+")":"游客"))])]),t._v(" "),t.ischeck?e("div",{staticClass:"orderSn"},[e("span",[t._v("订单编号："+t._s(t.orderSn))])]):t._e(),t._v(" "),t._m(1),t._v(" "),t._m(2),t._v(" "),t.ischeck?e("div",{staticClass:"list"},t._l(t.order,function(s,n){return e("div",{key:n,staticClass:"goodsListHead",class:t.colorMethod(n)},[[e("div",{staticStyle:{flex:"2"}},[e("span",[t._v(t._s(s.title))])]),t._v(" "),e("div",[t._v(t._s(s.price))]),t._v(" "),e("div",[t._v("\n          "+t._s(0==s.goods_option_id?"/":s.goods_option_title)+"\n        ")]),t._v(" "),e("div",{staticClass:"totalMun",staticStyle:{flex:"0.6"}},[e("div",[t._v(t._s(s.total))])])]],2)})):e("div",{staticClass:"list"},t._l(t.order.order_goods,function(s,n){return e("div",{key:n,staticClass:"goodsListHead",class:t.colorMethod(n)},[[e("div",{staticStyle:{flex:"2"}},[e("span",[t._v(t._s(s.title))])]),t._v(" "),e("div",[t._v(t._s(s.price))]),t._v(" "),e("div",[t._v("\n          "+t._s(0==s.goods_option_id?"/":s.goods_option_title)+"\n        ")]),t._v(" "),e("div",{staticClass:"totalMun",staticStyle:{flex:"0.6"}},[e("div",[t._v(t._s(s.total))])])]],2)}))])},[function(){var t=this.$createElement,s=this._self._c||t;return s("div",{staticClass:"iconCircle"},[s("i",{staticClass:"iconfont icon-fontclass-rengezhongxin"})])},function(){var t=this.$createElement,s=this._self._c||t;return s("div",{staticClass:"orderTopTitle"},[s("div",{staticClass:"line"}),this._v("\n    订单商品信息\n  ")])},function(){var t=this.$createElement,s=this._self._c||t;return s("div",{staticClass:"onelist"},[s("div",{staticClass:"goodsListHead"},[s("div",{staticStyle:{flex:"2"}},[this._v("商品名称")]),this._v(" "),s("div",[this._v("单价(￥)")]),this._v(" "),s("div",[this._v("规格")]),this._v(" "),s("div",{staticStyle:{flex:"0.6"}},[this._v("数量")])])])}],!1,null,"5fbfb734",null);o.options.__file="orderLeft.vue";s.a=o.exports},NW0I:function(t,s,e){"use strict";var n={props:["datas"],data:function(){return{couponArr:[],couponInd:[],couponShow:!1}},watch:{datas:function(t,s){this.couponArr=t}},methods:{checkarrIndex:function(t){return"-1"!=this.couponInd.findIndex(function(s){return s==t})?"usableSelect":"usable"},tapSubmit:function(t){this.$emit("changeShow",this.couponInd),this.couponShow=!1},tapSelectCoupon:function(t){if(!t.valid)return this.$message({message:"优惠券不可用",type:"warning"});var s=this.couponInd.findIndex(function(s){return s==t.id});console.log(s),"-1"!=s?(this.couponInd.splice(s,1),this.$emit("updateCoupon",this.couponInd)):(this.couponInd.push(t.id),this.$emit("updateCoupon",this.couponInd)),this.couponInd=indArr}}},i=(e("5Sd4"),e("KHd+")),o=Object(i.a)(n,function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",{attrs:{id:"couponPopve"}},[e("el-dialog",{attrs:{width:"80vw","show-close":!1,visible:t.couponShow},on:{"update:visible":function(s){t.couponShow=s}}},[e("div",{staticClass:"popveBox"},[e("div",{staticClass:"popveTxt"},[e("span",{staticClass:"popveTxt_t"},[t._v("选择优惠券")]),t._v(" "),t.couponInd.length>0?e("span",[t._v("(已选"+t._s(t.couponInd.length)+"张)")]):t._e()]),t._v(" "),e("div",{staticClass:"contenBox"},t._l(t.couponArr,function(s,n){return e("div",{key:n,staticClass:"couponList",class:t.checkarrIndex(s.id),on:{click:function(e){t.tapSelectCoupon(s,n)}}},[1==s.belongs_to_coupon.coupon_method?e("div",{staticClass:"left"},[e("div",{staticClass:"leftTop"},[e("span",{staticClass:"price"},[e("span",{staticStyle:{"font-size":"18px"}},[t._v("￥")]),t._v(t._s(s.belongs_to_coupon.discount))])]),t._v(" "),e("div",{staticClass:"leftBottom"},[t._v("\n              满"+t._s(s.belongs_to_coupon.enough)+"立减\n            ")])]):e("div",{staticClass:"left"},[e("div",{staticClass:"leftTop"},[e("span",{staticClass:"price"},[t._v("\n                "+t._s(s.belongs_to_coupon.discount)+"折")])]),t._v(" "),e("div",{staticClass:"leftBottom"},[t._v("\n              满"+t._s(s.belongs_to_coupon.enough)+"立享\n            ")])]),t._v(" "),e("div",{staticClass:"right"},[e("div",{staticClass:"rightTxt"},[t._v(t._s(s.belongs_to_coupon.name))]),t._v(" "),e("div",{staticClass:"time"},[t._v(t._s(s.belongs_to_coupon.created_at))]),t._v(" "),s.valid?t._e():e("div",{staticClass:"imgPos"},[e("img",{attrs:{src:"https://www.yunzmall.com/min_img/coupon3.png",alt:""}})])])])})),t._v(" "),e("div",{staticClass:"sureBtn",on:{click:t.tapSubmit}},[t._v("确定")])])])],1)},[],!1,null,"85bc2f66",null);o.options.__file="coupon.vue";var a=o.exports,c={props:{ischeck:{type:Boolean,default:!1},datas:{type:null,default:!1}},data:function(){return{value:!0,info:{},order:[],deduction_lang:"",isShowCoupon:!1,is_coupon_SELE:!1,coupon_size:0,couponArr:[],useSize:[],total_items:[],order_deductions:""}},computed:{getMember:function(){return this.$store.getters.getPosMember}},methods:{placeOrderTap:function(){this.$emit("placePrderTap")},discountHandle:function(t,s,e){this.$emit("updatePoint",{item:t,value:s})},couponShowTap:function(){this.$refs.couponPovo.couponShow=!0},bindChange:function(t){this.useSize=t,console.log(this.useSize,"优惠券确认按钮")},updateCoupon:function(t){this.$emit("couponUpdate",t)},goHome:function(){this.$router.push(this.fun.getUrl("checkstand",{},{}))},initCoupon:function(t){t.deduction_lang&&(this.deduction_lang=t.deduction_lang),t&&(this.coupon_size=t.member_coupons.length,this.couponArr=t.member_coupons)}},watch:{datas:function(t,s){this.ischeck?console.log(t):(this.info=t,this.order=t.orders[0],this.initCoupon(t.discount),this.total_items=t.amount_items)}},components:{coupon:a}},l=(e("8vK8"),Object(i.a)(c,function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",{attrs:{id:"orderRight"}},[e("div",{staticClass:"orderCoupon"},[t.ischeck?t._e():[e("div",{staticClass:"cellbox"},[e("div",{staticClass:"cell"},[e("span",[t._v("商品金额")]),t._v(" "),e("span",{staticClass:"priceC"},[t._v("¥"+t._s(t.order.order_goods_price))])]),t._v(" "),t._l(t.order.order_deductions,function(s,n){return e("div",{key:n,staticClass:"cell"},[e("span",[t._v("可用"+t._s(parseFloat(s.coin).toFixed(2))+t._s(s.name||t.integral)+"，"+t._s(t.deduction_lang?t.deduction_lang:"抵扣")+t._s(s.amount)+t._s(t.$i18n.t("元")))]),t._v(" "),e("el-switch",{attrs:{"active-color":"#13ce66","inactive-color":"#ff4949"},on:{change:function(e){t.discountHandle(t.order,s,"discount")}},model:{value:s.checked,callback:function(e){t.$set(s,"checked",e)},expression:"d.checked"}})],1)}),t._v(" "),e("div",{staticClass:"cell",on:{click:t.couponShowTap}},[e("span",[t._v("优惠券"+t._s(t.coupon_size)+"张可用")]),t._v(" "),t.useSize.length>0?e("span",{staticClass:"priceC"},[t._v(t._s("已使用"+t.useSize.length+"张"))]):e("span",{staticClass:"priceC"},[t._v("未使用")])])],2),t._v(" "),t._l(t.total_items,function(s,n){return e("div",{key:n,staticClass:"cell"},[e("span",[t._v(t._s(s.name))]),t._v(" "),e("span",[t._v(t._s("total_deduction_price"==s.code?"-":"")+"¥"+t._s(s.amount))])])}),t._v(" "),t._l(t.info.discount_amount_items,function(s){return e("div",{key:s.code,staticClass:"cell"},[e("span",[t._v(t._s(s.name))]),t._v(" "),e("span",[t._v("-¥"+t._s(s.amount))])])})],t._v(" "),t.ischeck?[t._m(0),t._v(" "),e("div",{staticClass:"cell"},[e("span",[t._v("商品小计")]),t._v(" "),e("span",[t._v("¥"+t._s(t.datas.order_goods_price))])]),t._v(" "),t._l(t.datas.order_discount,function(s){return e("div",{key:s,staticClass:"cell"},[e("span",[t._v(t._s(s.name))]),t._v(" "),e("span",[t._v("¥"+t._s(s.amount))])])}),t._v(" "),t._l(t.datas.order_fees,function(s){return e("div",{key:s,staticClass:"cell"},[e("span",[t._v(t._s(s.name))]),t._v(" "),e("span",[t._v("¥"+t._s(s.amount))])])}),t._v(" "),t._l(t.datas.order_deduction,function(s){return e("div",{key:s,staticClass:"cell"},[e("span",[t._v(t._s(s.name)+"抵扣")]),t._v(" "),e("span",[t._v("¥"+t._s(s.amount))])])}),t._v(" "),e("div",{staticClass:"cell"},[e("span",[t._v("应收款")]),t._v(" "),e("span",[t._v("¥"+t._s(t.datas.price))])])]:t._e()],2),t._v(" "),t.ischeck?e("div",{staticClass:"placeOrder"},[e("div",{staticClass:"btns"},[e("div",{staticClass:"cancel",on:{click:t.goHome}},[t._v("完成收银")])])]):t._e(),t._v(" "),t.ischeck?t._e():e("div",{staticClass:"placeOrder"},[e("div",{staticClass:"totalPrice"},[e("span",{staticClass:"txt"},[t._v("合计")]),t._v(" "),e("div",{staticClass:"price"},[t._v("￥"+t._s(t.info.total_price))])]),t._v(" "),e("div",{staticClass:"btn"},[e("div",{staticClass:"cancel",on:{click:t.goHome}},[t._v("取消订单")]),t._v(" "),e("div",{staticClass:"confirm",staticStyle:{background:"#ffb83d"},on:{click:t.placeOrderTap}},[t._v("立即下单")])])]),t._v(" "),e("coupon",{ref:"couponPovo",attrs:{datas:t.couponArr},on:{changeShow:t.bindChange,updateCoupon:t.updateCoupon}})],1)},[function(){var t=this.$createElement,s=this._self._c||t;return s("div",{staticClass:"cellTop"},[s("span",[this._v("订单金额")])])}],!1,null,"4f01709c",null));l.options.__file="orderRight.vue";s.a=l.exports},Ubme:function(t,s,e){},mTPN:function(t,s,e){},pMXA:function(t,s,e){"use strict";var n={props:[],data:function(){return{user:this.$store.getters.getPosUser}},methods:{closeBtn:function(){window.location.href="about:blank",window.close()}},mounted:function(){console.log(this.user)}},i=(e("KuU0"),e("KHd+")),o=Object(i.a)(n,function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",{staticClass:"checkstandhead"},[e("div",{staticClass:"flexA"},[t._m(0),t._v(" "),e("div",{staticClass:"storeName"},[t._v(t._s(t.user.business_name))])]),t._v(" "),e("div",{staticClass:"flexA"},[e("div",{staticClass:"userName"},[t._v("\n      用户名："+t._s(t.user.member_name)+"\n      "),e("span",{staticClass:"escBtn",on:{click:t.closeBtn}},[t._v("退出")])])])])},[function(){var t=this.$createElement,s=this._self._c||t;return s("div",{staticClass:"standTxt"},[this._v("零售"),s("span",{staticClass:"dtxt"},[this._v("收银台")])])}],!1,null,null,null);o.options.__file="headTop.vue";s.a=o.exports},q9e0:function(t,s,e){}}]);