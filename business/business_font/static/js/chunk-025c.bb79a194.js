(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-025c"],{"4/qd":function(n,t,s){"use strict";var i=s("vuSM");s.n(i).a},"79xw":function(n,t,s){"use strict";var i=s("s6AK");s.n(i).a},Z4x1:function(n,t,s){"use strict";s.r(t);var i=s("t2rG"),a={name:"DragKanbanDemo",components:{draggable:s.n(i).a},props:{headerText:{type:String,default:"Header"},options:{type:Object,default:function(){return{}}},list:{type:Array,default:function(){return[]}}}},e=(s("4/qd"),s("KHd+")),o=Object(e.a)(a,function(){var n=this,t=n.$createElement,s=n._self._c||t;return s("div",{staticClass:"board-column"},[s("div",{staticClass:"board-column-header"},[n._v("\n    "+n._s(n.headerText)+"\n  ")]),n._v(" "),s("draggable",{staticClass:"board-column-content",attrs:{list:n.list,options:n.options}},n._l(n.list,function(t){return s("div",{key:t.id,staticClass:"board-item"},[n._v("\n      "+n._s(t.name)+" "+n._s(t.id)+"\n    ")])}))],1)},[],!1,null,"7dcb313b",null);o.options.__file="index.vue";var r={name:"DragKanbanDemo",components:{Kanban:o.exports},data:function(){return{options:{group:"mission"},list1:[{name:"Mission",id:1},{name:"Mission",id:2},{name:"Mission",id:3},{name:"Mission",id:4}],list2:[{name:"Mission",id:5},{name:"Mission",id:6},{name:"Mission",id:7}],list3:[{name:"Mission",id:8},{name:"Mission",id:9},{name:"Mission",id:10}]}}},l=(s("79xw"),Object(e.a)(r,function(){var n=this,t=n.$createElement,s=n._self._c||t;return s("div",{staticClass:"components-container board"},[s("Kanban",{key:1,staticClass:"kanban todo",attrs:{list:n.list1,options:n.options,"header-text":"Todo"}}),n._v(" "),s("Kanban",{key:2,staticClass:"kanban working",attrs:{list:n.list2,options:n.options,"header-text":"Working"}}),n._v(" "),s("Kanban",{key:3,staticClass:"kanban done",attrs:{list:n.list3,options:n.options,"header-text":"Done"}})],1)},[],!1,null,null,null));l.options.__file="dragKanban.vue";t.default=l.exports},s6AK:function(n,t,s){},vuSM:function(n,t,s){}}]);