(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-5b1a"],{"/u1q":function(t,s,e){"use strict";e.r(s);var i=e("gDS+"),o=e.n(i),a=e("14Xm"),n=e.n(a),c=e("D3Ub"),r=e.n(c),d=e("pMXA"),l=e("LmOT"),_=e("NW0I"),p={directives:{focus:function(t,s,e){var i=s.value,o=e.context;i&&o.$nextTick(function(){t.focus()})}},data:function(){return{bgColor:{aside_bg_color:"#fff",bg_color:"#31374e",min_bg_color:"#ffb83d",font_s_color:"#fff",font_m_colo:"#000"},payArr:[],payInd:"",payOption:!1,setPriceShow:!1,input:"",infoData:[],checkDeductionList:[],member_coupon_ids:[],order_ids:"",payInfo:[],order_goods_model:[],order_model:[],actually:0,nowPrice_show:"",moneyRece:"",codeUser:"",isclick:!1,payStatus_fail:!1,payStatus_succ:!1,asideIndex:0}},components:{headTop:d.a,orderLeft:l.a,orderRight:_.a},computed:{getMember:function(){return this.$store.getters.getPosMember},moneyReceComputed:function(){if(0!=this.moneyRece)return(Number(this.moneyRece)-Number(this.infoData.total_price)).toFixed(2)},mimputedPrice:function(){var t=this.order_model.price,s=0;return this.order_goods_model.forEach(function(t){t.nowPrice&&(s+=Number(t.nowPrice))}),isNaN(Number(t)+Number(s))?0:(this.nowPrice_show=s,this.actually=(Number(t)+Number(s)).toFixed(2))}},mounted:function(){this.asideIndex=this.$route.params.asideIndex,this.initJson()},methods:{imputedPrice:function(){var t=0;return this.order_goods_model.forEach(function(s){s.nowPrice&&(t+=Number(s.nowPrice))}),isNaN(t)?0:t},payShowHide:function(){(this.payStatus_fail||this.payStatus_succ)&&0==this.asideIndex&&this.$store.commit("hangTag"),this.$router.push(this.fun.getUrl("checkstand",{},{}))},tryTap:function(){this.payStatus_fail=!1,this.payStatus_succ=!1},payIndMethod:function(){if(this.isclick)this.$message.error("还在请求支付，请等待~");else if(this.isclick=!0,"73"==this.payInd||29==this.payInd){var t=void 0;t="73"==this.payInd?"plugin.shop-pos.frontend.merge-pay.wechatMicroPay":"87"==this.payInd?"plugin.shop-pos.frontend.merge-pay.leshuaPos":"plugin.shop-pos.frontend.merge-pay.alipay-pay-hj",this.payPostMethod(t,this.payInfo.order_pay.id)}else"3"==this.payInd?this.balancePay():"-1"==this.payInd&&this.cashPayBtn()},codeCreatOrder:function(){var t=this,s={price:this.$route.params.price,store_id:0,member_coupon_ids:[],orders:[],mobile:"",realname:"",goods_id:this.$store.getters.getPosUser.pos_goods_id,is_shop_pos:1,dispatch_type_id:14};$http.post("plugin.sweep-buy.frontend.controllers.create.index",s,"loading").then(function(s){1===s.result?(t.order_ids=s.data.order_ids,t.mergePay()):t.$message.error(s.msg),t.isclick=!1}).catch(function(t){console.log(t)})},cashPayBtn:function(){var t=this;if(this.moneyReceComputed<0)return this.$message.error("还差"+parseInt(this.moneyReceComputed)),void(this.isclick=!1);$http.post("plugin.shop-pos.frontend.merge-pay.cashPay",{order_pay_id:this.payInfo.order_pay.id},"loading").then(function(s){1===s.result?(t.$message.success("交易成功"),t.goHome()):(t.payStatus_fail=!1,t.$message.error(s.msg)),t.isclick=!1}).catch(function(t){console.log(t)})},balancePay:function(){var t=this,s={order_pay_id:this.payInfo.order_pay.id};$http.post("plugin.shop-pos.frontend.credit-merge-pay.credit2",s,"loading").then(function(s){1===s.result?t.payStatus_succ=!0:(t.payStatus_fail=!1,t.$message.error(s.msg)),t.isclick=!1}).catch(function(t){console.log(t)})},payPostMethod:function(t,s){var e=this;$http.post(t,{auth_code:this.codeUser,order_pay_id:s},"loading").then(function(t){1===t.result?e.payStatus_succ=!0:(e.payStatus_fail=!1,e.$message.error(t.msg)),e.isclick=!1}).catch(function(t){console.log(t)})},sureConfirm:function(){this.actually<0?this.$message.error("改价后价格不能少于0元"):(this.infoData.total_price=this.actually,this.updateOrderPrice(),this.setPriceShow=!1)},nowEditPrice:function(t){t.nowPrice},updateOrderPrice:function(){var t=this;return r()(n.a.mark(function s(){var e,i;return n.a.wrap(function(s){for(;;)switch(s.prev=s.next){case 0:e={order_goods_id:"",change_price:""},i={order_id:Number(t.order_ids),dispatch_price:"0.00",order_goods:[{change_price:0,order_goods_id:5451}]},t.order_goods_model.forEach(function(t,s){(e={order_goods_id:"",change_price:""}).order_goods_id=t.id,e.change_price=t.nowPrice?t.nowPrice:0,i.order_goods[s]=e}),$http.post("plugin.shop-pos.frontend.order.changeOrderPrice",i,"loading").then(function(s){1===s.result?(t.$message.success(s.msg),t.mergePay()):t.$message.error(s.msg)}).catch(function(t){console.log(t)});case 4:case"end":return s.stop()}},s,t)}))()},setPriceShow_open:function(){var t=this;$http.post("plugin.shop-pos.frontend.order.getOrderPrice",{order_id:this.order_ids},"loading").then(function(s){1===s.result?(t.order_goods_model=s.data.order_goods_model,t.order_model=s.data.order_model):t.$message.error(s.msg)}).catch(function(t){console.log(t)})},payIcon:function(t){t[0].value&&(this.payInd=t[0].value),t.forEach(function(t){"posCash"==t.code?t.icon="icon-pm_auction_paying":"balance"==t.code?t.icon="icon-fontclass-fanli":"wechatMicroPay"==t.code?t.icon="icon-card_weixin":"convergePayAlipay"==t.code?t.icon="icon-all_alipay":"leshuaPos"==t.code&&(t.icon="icon-fontclass-saomajilu")}),this.payArr=t},tapOrder:function(){0==this.asideIndex?this.createOrder():this.codeCreatOrder()},createOrder:function(){var t=this,s={address:"",goods:this.assembleGoods(),member_coupon_ids:o()(this.member_coupon_ids),orders:o()(this.assembleDeduction()),invoice_type:0,rise_type:0,call:"",email:"",company_number:"",mark:0,dispatch_type_id:14,is_shop_pos:1};$http.post("plugin.shop-pos.frontend.create",s,"loading").then(function(s){1===s.result?(t.order_ids=s.data.order_ids,t.mergePay()):t.$message.error(s.msg)}).catch(function(t){console.log(t)})},mergePay:function(){var t=this,s={order_ids:this.order_ids,is_shop_pos:1};$http.get("plugin.shop-pos.frontend.merge-pay.index",s,"loading").then(function(s){1===s.result?(console.log(s.data),t.payOption=!0,t.payInfo=s.data,t.payIcon(s.data.buttons)):t.$message.error(s.msg)}).catch(function(t){console.log(t)})},discountHandle:function(t){var s=t.item,e=t.value;this.checkDeductionList.length>0?(console.log(e,"抵扣更新"),this.checkDeductionList.forEach(function(t,s){t&&t.pre_id&&(e&&e.checked?(console.log("选中的时候检查是否有对应的code"),t.deduction_ids&&-1==t.deduction_ids.indexOf(e.code)&&t.deduction_ids.push(e.code)):e&&!e.checked&&(console.log("取消选中的时候检查去掉对应的code"),t.deduction_ids&&t.deduction_ids.indexOf(e.code)>-1&&t.deduction_ids.splice(t.deduction_ids.indexOf(e.code),1)))})):this.checkDeductionList.push({deduction_ids:e&&e.code&&e.checked?[e.code]:[],pre_id:s.pre_id}),this.initJson()},couponUpdateMethod:function(t){var s=t;this.member_coupon_ids=s,this.initJson()},assembleDeduction:function(){for(var t=[],s=0;s<this.checkDeductionList.length;s++)t.push(this.checkDeductionList[s]);return t},initJson:function(){var t={};0==this.asideIndex?(t={goods_arr:this.assembleGoods(),address:"",dispatch_type_id:14,mark:0,member_coupon_ids:[],orders:o()(this.assembleDeduction()),total:"",is_shop_pos:1},this.member_coupon_ids&&(t.member_coupon_ids=this.member_coupon_ids),this.getData(t)):(t={price:"",goods_id:"",member_coupon_ids:[],orders:o()(this.assembleDeduction())},this.member_coupon_ids&&(t.member_coupon_ids=this.member_coupon_ids),this.getData(t))},assembleGoods:function(){var t=[],s={};return this.$store.getters.getGodds.forEach(function(e){(s={}).goods_id=e.id,s.total=e.stockNum,s.option_id=0==e.has_option?"0":e.hasOption.id,t.push(s)}),o()(t)},getData:function(t){var s=this,e=void 0;0==this.asideIndex?e="plugin.shop-pos.frontend.goods-buy":(t.price=this.$route.params.price,t.goods_id=this.$store.getters.getPosUser.pos_goods_id,e="plugin.sweep-buy.frontend.controllers.goods-buy.index"),$http.post(e,t,"loading").then(function(t){1===t.result?s.infoData=t.data:(s.$router.push(s.fun.getUrl("checkstand",{},{})),s.$message.error(t.msg))}).catch(function(t){console.log(t)})},goCheck:function(){this.$router.push(this.fun.getUrl("checkOrder",{id:this.order_ids},{}))},goHome:function(){0==this.asideIndex&&this.$store.commit("hangTag"),this.$router.push(this.fun.getUrl("checkstand",{},{}))},tapSelectInd:function(t){this.payInd=t,this.codeUser=""}}},u=(e("k94n"),e("ftby"),e("KHd+")),v=Object(u.a)(p,function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",{style:{"--bg_color":t.bgColor.bg_color,"--min_bg_color":t.bgColor.min_bg_color,"--font_s_color":t.bgColor.font_s_color,"--font_m_colo":t.bgColor.font_m_colo,"--aside_bg_color":t.bgColor.aside_bg_color},attrs:{id:"preOrder"}},[e("headTop"),t._v(" "),e("div",{staticClass:"mainBox"},[e("orderLeft",{attrs:{datas:t.infoData}}),t._v(" "),e("orderRight",{attrs:{datas:t.infoData},on:{couponUpdate:t.couponUpdateMethod,updatePoint:t.discountHandle,placePrderTap:t.tapOrder}})],1),t._v(" "),e("el-dialog",{attrs:{width:"840px","show-close":!1,visible:t.payOption},on:{"update:visible":function(s){t.payOption=s},close:t.payShowHide}},[e("div",{staticClass:"optionBox"},t._l(t.payArr,function(s,i){return e("div",{key:i,staticClass:"optionBoxlist",on:{click:function(e){t.tapSelectInd(s.value)}}},[e("i",{staticClass:"iconfont",class:s.icon}),t._v(" "),e("span",[t._v(t._s(s.name))]),t._v(" "),s.intro?e("span",{staticClass:"smallFace"},[t._v("("+t._s(s.intro)+")")]):t._e(),t._v(" "),t.payInd==s.value?e("div",{staticClass:"triangle"}):t._e()])})),t._v(" "),e("div",{staticClass:"ddBox"},[e("div",{staticClass:"orderDetail"},[e("div",{staticClass:"cell"},[e("span",[t._v("下单会员：")]),t._v(" "),e("div",{staticClass:"user"},[t.getMember.avatar?e("img",{attrs:{src:t.getMember.avatar,alt:""}}):t._e(),t._v(" "),e("span",[t._v(t._s(t.getMember.uid?t.getMember.nickname+"(ID:"+t.getMember.uid+")":"游客"))])])]),t._v(" "),t.payInfo.order_pay?e("div",{staticClass:"cell"},[e("span",[t._v("订单编号：")]),t._v(" "),e("div",{staticClass:"user"},[e("span",[t._v(t._s(t.payInfo.order_pay.pay_sn))])])]):t._e(),t._v(" "),t.payInfo.order_pay?e("div",{staticClass:"cell"},[e("span",[t._v("订单总金额：")]),t._v(" "),e("div",{staticClass:"user"},[e("span",[t._v("￥"+t._s(t.payInfo.order_pay.amount))])])]):t._e(),t._v(" "),t._l(t.infoData.amount_items,function(s){return e("div",{key:s.name,staticClass:"cell"},[e("span",[t._v(t._s(s.name)+"：")]),t._v(" "),e("div",{staticClass:"user"},[e("span",[t._v("￥"+t._s(s.amount))])])])}),t._v(" "),t._l(t.infoData.discount_amount_items,function(s){return e("div",{key:s.name,staticClass:"cell"},[e("span",[t._v(t._s(s.name)+"：")]),t._v(" "),e("div",{staticClass:"user"},[e("span",[t._v("￥"+t._s(s.amount))])])])}),t._v(" "),0!=t.nowPrice_show?e("div",{staticClass:"cell"},[e("span",[t._v("修改总和：")]),t._v(" "),e("div",{staticClass:"user"},[e("span",[t._v(t._s(t.nowPrice_show))])])]):t._e(),t._v(" "),e("div",{staticClass:"cell",staticStyle:{"justify-content":"space-between"}},[e("div",{staticClass:"cellLeft"},[e("span",[t._v("合计：")]),t._v(" "),e("div",{staticClass:"user"},[e("span",[t._v("￥"+t._s(t.infoData.total_price))])])]),t._v(" "),0!=t.asideIndex||t.payStatus_fail||t.payStatus_succ?t._e():e("div",{staticClass:"cellRight",on:{click:function(s){t.setPriceShow=!0}}},[t._v("\n            修改价格\n          ")])])],2),t._v(" "),e("div",{staticClass:"optionConten"},[t.payStatus_fail||t.payStatus_succ?t._e():["-1"==t.payInd?e("div",{staticClass:"cashBox"},[e("div",{staticClass:"cell"},[e("div",{staticClass:"cellLeft"},[t._v("实收现金")]),t._v(" "),e("div",{staticClass:"cellRight"},[e("el-input",{attrs:{placeholder:"请输入实收金额"},model:{value:t.moneyRece,callback:function(s){t.moneyRece=s},expression:"moneyRece"}})],1)]),t._v(" "),e("div",{staticClass:"cell"},[e("div",{staticClass:"cellLeft"},[t._v("找零")]),t._v(" "),e("div",{staticClass:"cellRight cellRightColor"},[t._v("\n                ￥"+t._s(t.moneyReceComputed)+"\n              ")])]),t._v(" "),e("div",{staticClass:"cell"},[e("div",{staticClass:"cellLeft_btn",on:{click:t.payIndMethod}},[t._v("确认")])])]):t._e(),t._v(" "),73==t.payInd||29==t.payInd?e("div",{staticClass:"wxPay"},[e("div",[t._v("\n              "+t._s(73==t.payInd?"请打开微信，点击右上角+号--收付款，向收银员展示微信付款码！":"请打开支付宝，点击付钱，向收银员展示微信付款码！")+"\n            ")]),t._v(" "),e("input",{directives:[{name:"model",rawName:"v-model",value:t.codeUser,expression:"codeUser"},{name:"show",rawName:"v-show",value:73==t.payInd||29==t.payInd,expression:"payInd == 73 || payInd == 29"},{name:"focus",rawName:"v-focus",value:73==t.payInd||29==t.payInd,expression:"payInd == 73 || payInd == 29"}],staticStyle:{opacity:"0",position:"absolute",bottom:"-40px",left:"0"},attrs:{type:"text",name:"",id:""},domProps:{value:t.codeUser},on:{keyup:function(s){return"button"in s||!t._k(s.keyCode,"enter",13,s.key,"Enter")?t.payIndMethod(s):null},input:function(s){s.target.composing||(t.codeUser=s.target.value)}}})]):t._e(),t._v(" "),87==t.payInd?e("div",{staticClass:"wxPay"},[e("div",[t._v(t._s("请出示付款码，向收银员展示微信付款码！")+"\n            ")]),t._v(" "),e("input",{directives:[{name:"model",rawName:"v-model",value:t.codeUser,expression:"codeUser"},{name:"show",rawName:"v-show",value:87==t.payInd,expression:"payInd == 87"},{name:"focus",rawName:"v-focus",value:87==t.payInd,expression:"payInd == 87"}],staticStyle:{opacity:"0",position:"absolute",bottom:"-40px",left:"0"},attrs:{type:"text",name:"",id:""},domProps:{value:t.codeUser},on:{keyup:function(s){return"button"in s||!t._k(s.keyCode,"enter",13,s.key,"Enter")?t.payIndMethod(s):null},input:function(s){s.target.composing||(t.codeUser=s.target.value)}}})]):t._e(),t._v(" "),3==t.payInd?e("div",{staticClass:"balance"},[e("div",{staticClass:"btn",on:{click:t.payIndMethod}},[t._v("确认支付")])]):t._e()],t._v(" "),t.payStatus_fail?e("div",{staticClass:"failBox"},[e("div",{staticClass:"failTxt"},[e("i",{staticClass:"iconfont icon-adsystem_icon_cancle"}),t._v(" "),e("span",[t._v("支付失败")])]),t._v(" "),e("div",{staticClass:"failTips"},[t._v("请重试或者返回使用其他支付方式！")]),t._v(" "),e("div",{staticClass:"failBtnBox"},[e("div",{staticClass:"tryBtn",on:{click:t.tryTap}},[t._v("再试一次")]),t._v(" "),e("div",{staticClass:"backBtn",on:{click:t.goHome}},[t._v("返回")])])]):t._e(),t._v(" "),t.payStatus_succ?e("div",{staticClass:"failBox"},[e("div",{staticClass:"failTxt"},[e("i",{staticClass:"iconfont icon-all_select_active"}),t._v(" "),e("span",[t._v("支付成功")])]),t._v(" "),e("div",{staticClass:"failBtnBox"},[e("div",{staticClass:"tryBtn",on:{click:t.goCheck}},[t._v("查看订单")]),t._v(" "),e("div",{staticClass:"backBtn",on:{click:t.goHome}},[t._v("返回")])])]):t._e()],2)])]),t._v(" "),e("el-dialog",{attrs:{width:"70vw","show-close":!1,visible:t.setPriceShow},on:{"update:visible":function(s){t.setPriceShow=s},open:t.setPriceShow_open}},[e("div",{staticClass:"setPovopBox"},[e("div",{staticClass:"title"},[t._v("修改价格")]),t._v(" "),e("div",{staticClass:"trList"},[e("div",{staticClass:"td",staticStyle:{flex:"2"}},[t._v("商品名称")]),t._v(" "),e("div",{staticClass:"td",staticStyle:{flex:"0.5"}},[t._v("规格")]),t._v(" "),e("div",{staticClass:"td",staticStyle:{flex:"0.5"}},[t._v("单价")]),t._v(" "),e("div",{staticClass:"td",staticStyle:{flex:"0.5"}},[t._v("数量")]),t._v(" "),e("div",{staticClass:"td",staticStyle:{flex:"1"}},[t._v("小计")]),t._v(" "),e("div",{staticClass:"td",staticStyle:{flex:"1.2","text-align":"center"}},[t._v("加价或减价")])]),t._v(" "),e("div",{staticClass:"listGoodBox"},[t._l(t.order_goods_model,function(s,i){return e("div",{key:i,staticClass:"setList"},[e("div",{staticClass:"td",staticStyle:{flex:"2"}},[t._v(t._s(s.title))]),t._v(" "),e("div",{staticClass:"td",staticStyle:{flex:"0.5"}},[t._v("\n            "+t._s(0==s.goods_option_id?"":s.goods_option_title)+"\n          ")]),t._v(" "),e("div",{staticClass:"td",staticStyle:{flex:"0.5"}},[t._v("\n            "+t._s((s.price/s.total).toFixed(2))+"\n          ")]),t._v(" "),e("div",{staticClass:"td",staticStyle:{flex:"0.5"}},[t._v(t._s(s.total))]),t._v(" "),e("div",{staticClass:"td changeTD",staticStyle:{flex:"1"}},[e("div",[t._v(t._s(s.price))]),t._v(" "),0!=s.change_price?e("div",{staticClass:"changeTdBOX"},[t._v("改价")]):t._e()]),t._v(" "),e("div",{staticClass:"td",staticStyle:{flex:"1.2","text-align":"center"}},[e("el-input",{attrs:{placeholder:"请输入"},on:{input:function(e){t.nowEditPrice(s)}},model:{value:s.nowPrice,callback:function(e){t.$set(s,"nowPrice",e)},expression:"item.nowPrice"}})],1)])}),t._v(" "),e("div",{staticClass:"tips"},[t._v("提示：改价后价格不能少于0元")])],2),t._v(" "),e("div",{staticClass:"countBox"},[e("div",{staticClass:"countBox_min"},[e("div",{staticClass:"original"},[e("span",{staticClass:"txt"},[t._v("原价")]),t._v(" "),e("span",[t._v("￥"+t._s(t.order_model.price))])]),t._v("\n          +\n          "),e("div",{staticClass:"original"},[e("span",{staticClass:"txt"},[t._v("价格修改")]),t._v(" "),e("span",[t._v("￥"+t._s(t.imputedPrice()))])]),t._v("\n          =\n          "),e("div",{staticClass:"original"},[e("span",{staticClass:"txt"},[t._v("买家实付")]),t._v(" "),e("span",{staticClass:"deColor"},[t._v("￥"+t._s(t.mimputedPrice))])])]),t._v(" "),e("div",{staticClass:"btn"},[e("div",{staticClass:"cancel",on:{click:function(s){t.setPriceShow=!1}}},[t._v("取消")]),t._v(" "),e("div",{staticClass:"confirmBtn",on:{click:function(s){return s.stopPropagation(),t.sureConfirm(s)}}},[t._v("确认改价")])])])])])],1)},[],!1,null,"01dc5aff",null);v.options.__file="preOrder.vue";s.default=v.exports},"W+oE":function(t,s,e){},YsOu:function(t,s,e){},ftby:function(t,s,e){"use strict";var i=e("YsOu");e.n(i).a},k94n:function(t,s,e){"use strict";var i=e("W+oE");e.n(i).a}}]);