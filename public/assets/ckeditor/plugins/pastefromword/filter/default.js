/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
!function(){function e(e){var t,a,n,i,o=e.children,r=e.children.length,l=/list-style-type:(.*?)(?:;|$)/,s=CKEDITOR.plugins.pastefromword.filters.stylesFilter;if(a=e.attributes,!l.exec(a.style)){for(var d=0;r>d;d++)if(t=o[d],t.attributes.value&&Number(t.attributes.value)==d+1&&delete t.attributes.value,n=l.exec(t.attributes.style)){if(n[1]!=i&&i){i=null;break}i=n[1]}if(i){for(d=0;r>d;d++)a=o[d].attributes,a.style&&(a.style=s([["list-style-type"]])(a.style)||"");e.addStyle("list-style-type",i)}}}function t(e){e=e.toUpperCase();for(var t=h.length,a=0,n=0;t>n;++n)for(var i=h[n],o=i[1].length;e.substr(0,o)==i[1];e=e.substr(o))a+=i[0];return a}function a(e){e=e.toUpperCase();for(var t=g.length,a=1,n=1;e.length>0;n*=t)a+=g.indexOf(e.charAt(e.length-1))*n,e=e.substr(0,e.length-1);return a}var n=CKEDITOR.htmlParser.fragment.prototype,i=CKEDITOR.htmlParser.element.prototype;n.onlyChild=i.onlyChild=function(){var e=this.children,t=e.length,a=1==t&&e[0];return a||null},i.removeAnyChildWithName=function(e){for(var t,a=this.children,n=[],i=0;i<a.length;i++)t=a[i],t.name&&(t.name==e&&(n.push(t),a.splice(i--,1)),n=n.concat(t.removeAnyChildWithName(e)));return n},i.getAncestor=function(e){for(var t=this.parent;t&&(!t.name||!t.name.match(e));)t=t.parent;return t},n.firstChild=i.firstChild=function(e){for(var t,a=0;a<this.children.length;a++){if(t=this.children[a],e(t))return t;if(t.name&&(t=t.firstChild(e)))return t}return null},i.addStyle=function(e,t,a){var n,i=this,o="";if("string"==typeof t)o+=e+":"+t+";";else{if("object"==typeof e)for(var r in e)e.hasOwnProperty(r)&&(o+=r+":"+e[r]+";");else o+=e;a=t}i.attributes||(i.attributes={}),n=i.attributes.style||"",n=(a?[o,n]:[n,o]).join(";"),i.attributes.style=n.replace(/^;|;(?=;)/,"")},CKEDITOR.dtd.parentOf=function(e){var t={};for(var a in this)-1==a.indexOf("$")&&this[a][e]&&(t[a]=1);return t};var o,r=/^([.\d]*)+(em|ex|px|gd|rem|vw|vh|vm|ch|mm|cm|in|pt|pc|deg|rad|ms|s|hz|khz){1}?/i,l=/^(?:\b0[^\s]*\s*){1,4}$/,s="^m{0,4}(cm|cd|d?c{0,3})(xc|xl|l?x{0,3})(ix|iv|v?i{0,3})$",d=new RegExp(s),c=new RegExp(s.toUpperCase()),u={decimal:/\d+/,"lower-roman":d,"upper-roman":c,"lower-alpha":/^[a-z]+$/,"upper-alpha":/^[A-Z]+$/},p={disc:/[l\u00B7\u2002]/,circle:/[\u006F\u00D8]/,square:/[\u006E\u25C6]/},m={ol:u,ul:p},h=[[1e3,"M"],[900,"CM"],[500,"D"],[400,"CD"],[100,"C"],[90,"XC"],[50,"L"],[40,"XL"],[10,"X"],[9,"IX"],[5,"V"],[4,"IV"],[1,"I"]],g="ABCDEFGHIJKLMNOPQRSTUVWXYZ",f=0,b=null,v=CKEDITOR.plugins.pastefromword={utils:{createListBulletMarker:function(e,t){var a=new CKEDITOR.htmlParser.element("cke:listbullet");return a.attributes={"cke:listsymbol":e[0]},a.add(new CKEDITOR.htmlParser.text(t)),a},isListBulletIndicator:function(e){var t=e.attributes&&e.attributes.style;return/mso-list\s*:\s*Ignore/i.test(t)?!0:void 0},isContainingOnlySpaces:function(e){var t;return(t=e.onlyChild())&&/^(:?\s|&nbsp;)+$/.test(t.value)},resolveList:function(e){var t,a=e.attributes;return(t=e.removeAnyChildWithName("cke:listbullet"))&&t.length&&(t=t[0])?(e.name="cke:li",a.style&&(a.style=v.filters.stylesFilter([["text-indent"],["line-height"],[/^margin(:?-left)?$/,null,function(e){var t=e.split(" ");e=CKEDITOR.tools.convertToPx(t[3]||t[1]||t[0]),!f&&null!==b&&e>b&&(f=e-b),b=e,a["cke:indent"]=f&&Math.ceil(e/f)+1||1}],[/^mso-list$/,null,function(e){e=e.split(" ");var t=Number(e[0].match(/\d+/)),n=Number(e[1].match(/\d+/));1==n&&(t!==o&&(a["cke:reset"]=1),o=t),a["cke:indent"]=n}]])(a.style,e)||""),a["cke:indent"]||(b=0,a["cke:indent"]=1),CKEDITOR.tools.extend(a,t.attributes),!0):(o=b=f=null,!1)},getStyleComponents:function(){var e=CKEDITOR.dom.element.createFromHtml('<div style="position:absolute;left:-9999px;top:-9999px;"></div>',CKEDITOR.document);return CKEDITOR.document.getBody().append(e),function(t,a,n){e.setStyle(t,a);for(var i={},o=n.length,r=0;o>r;r++)i[n[r]]=e.getStyle(n[r]);return i}}(),listDtdParents:CKEDITOR.dtd.parentOf("ol")},filters:{flattenList:function(e,t){t="number"==typeof t?t:1;var a,n=e.attributes;switch(n.type){case"a":a="lower-alpha";break;case"1":a="decimal"}for(var i,l=e.children,s=0;s<l.length;s++)if(i=l[s],i.name in CKEDITOR.dtd.$listItem){var d=i.attributes,c=i.children,u=c.length,p=c[u-1];p.name in CKEDITOR.dtd.$list&&(e.add(p,s+1),--c.length||l.splice(s--,1)),i.name="cke:li",n.start&&!s&&(d.value=n.start),v.filters.stylesFilter([["tab-stops",null,function(e){var t=e.split(" ")[1].match(r);t&&(b=CKEDITOR.tools.convertToPx(t[0]))}],1==t?["mso-list",null,function(e){e=e.split(" ");var t=Number(e[0].match(/\d+/));t!==o&&(d["cke:reset"]=1),o=t}]:null])(d.style),d["cke:indent"]=t,d["cke:listtype"]=e.name,d["cke:list-style-type"]=a}else if(i.name in CKEDITOR.dtd.$list){arguments.callee.apply(this,[i,t+1]),l=l.slice(0,s).concat(i.children).concat(l.slice(s+1)),e.children=[];for(var m=0,h=l.length;h>m;m++)e.add(l[m])}delete e.name,n["cke:list"]=1},assembleList:function(n){for(var i,r,l,s,d,c,u,p,h,g,v,y,k,C=n.children,w=[],T=0;T<C.length;T++)if(i=C[T],"cke:li"==i.name){if(i.name="li",r=i,l=r.attributes,g=l["cke:listsymbol"],g=g&&g.match(/^(?:[(]?)([^\s]+?)([.)]?)$/),v=y=k=null,l["cke:ignored"]){C.splice(T--,1);continue}if(l["cke:reset"]&&(u=d=c=null),s=Number(l["cke:indent"]),s!=d&&(h=p=null),g){if(h&&m[h][p].test(g[1]))v=h,y=p;else for(var S in m)for(var A in m[S])if(m[S][A].test(g[1])){if("ol"!=S||!/alpha|roman/.test(A)){v=S,y=A;break}var x=/roman/.test(A)?t(g[1]):a(g[1]);(!k||k>x)&&(k=x,v=S,y=A)}!v&&(v=g[2]?"ol":"ul")}else v=l["cke:listtype"]||"ol",y=l["cke:list-style-type"];if(h=v,p=y||("ol"==v?"decimal":"disc"),y&&y!=("ol"==v?"decimal":"disc")&&r.addStyle("list-style-type",y),"ol"==v&&g){switch(y){case"decimal":k=Number(g[1]);break;case"lower-roman":case"upper-roman":k=t(g[1]);break;case"lower-alpha":case"upper-alpha":k=a(g[1])}r.attributes.value=k}if(u){if(s>d)w.push(u=new CKEDITOR.htmlParser.element(v)),u.add(r),c.add(u);else if(d>s){for(var _,E=d-s;E--&&(_=u.parent);)u=_.parent;u.add(r)}else u.add(r);C.splice(T--,1)}else w.push(u=new CKEDITOR.htmlParser.element(v)),u.add(r),C[T]=u;c=r,d=s}else u&&(u=d=c=null);for(T=0;T<w.length;T++)e(w[T]);u=d=c=o=b=f=null},falsyFilter:function(){return!1},stylesFilter:function(e,t){return function(a,n){var i=[];(a||"").replace(/&quot;/g,'"').replace(/\s*([^ :;]+)\s*:\s*([^;]+)\s*(?=;|$)/g,function(a,o,r){o=o.toLowerCase(),"font-family"==o&&(r=r.replace(/["']/g,""));for(var l,s,d,c,u=0;u<e.length;u++)if(e[u]&&(l=e[u][0],s=e[u][1],d=e[u][2],c=e[u][3],o.match(l)&&(!s||r.match(s))))return o=c||o,t&&(d=d||r),"function"==typeof d&&(d=d(r,n,o)),d&&d.push&&(o=d[0],d=d[1]),"string"==typeof d&&i.push([o,d]),void 0;!t&&i.push([o,r])});for(var o=0;o<i.length;o++)i[o]=i[o].join(":");return i.length?i.join(";")+";":!1}},elementMigrateFilter:function(e,t){return function(a){var n=t?new CKEDITOR.style(e,t)._.definition:e;a.name=n.element,CKEDITOR.tools.extend(a.attributes,CKEDITOR.tools.clone(n.attributes)),a.addStyle(CKEDITOR.style.getStyleText(n))}},styleMigrateFilter:function(e,t){var a=this.elementMigrateFilter;return function(n,i){var o=new CKEDITOR.htmlParser.element(null),r={};r[t]=n,a(e,r)(o),o.children=i.children,i.children=[o]}},bogusAttrFilter:function(e,t){return-1==t.name.indexOf("cke:")?!1:void 0},applyStyleFilter:null},getRules:function(e){var t=CKEDITOR.dtd,a=CKEDITOR.tools.extend({},t.$block,t.$listItem,t.$tableContent),n=e.config,i=this.filters,o=i.falsyFilter,r=i.stylesFilter,s=i.elementMigrateFilter,d=CKEDITOR.tools.bind(this.filters.styleMigrateFilter,this.filters),c=this.utils.createListBulletMarker,u=i.flattenList,p=i.assembleList,m=this.utils.isListBulletIndicator,h=this.utils.isContainingOnlySpaces,g=this.utils.resolveList,f=function(e){return e=CKEDITOR.tools.convertToPx(e),isNaN(e)?e:e+"px"},b=this.utils.getStyleComponents,v=this.utils.listDtdParents,y=n.pasteFromWordRemoveFontStyles!==!1,k=n.pasteFromWordRemoveStyles!==!1;return{elementNames:[[/meta|link|script/,""]],root:function(e){e.filterChildren(),p(e)},elements:{"^":function(e){var t;CKEDITOR.env.gecko&&(t=i.applyStyleFilter)&&t(e)},$:function(e){var i=e.name||"",o=e.attributes;if(i in a&&o.style&&(o.style=r([[/^(:?width|height)$/,null,f]])(o.style)||""),i.match(/h\d/)){if(e.filterChildren(),g(e))return;s(n["format_"+i])(e)}else if(i in t.$inline)e.filterChildren(),h(e)&&delete e.name;else if(-1!=i.indexOf(":")&&-1==i.indexOf("cke")){if(e.filterChildren(),"v:imagedata"==i){var l=e.attributes["o:href"];return l&&(e.attributes.src=l),e.name="img",void 0}delete e.name}i in v&&(e.filterChildren(),p(e))},style:function(e){if(CKEDITOR.env.gecko){var t=e.onlyChild().value.match(/\/\* Style Definitions \*\/([\s\S]*?)\/\*/),a=t&&t[1],n={};a&&(a.replace(/[\n\r]/g,"").replace(/(.+?)\{(.+?)\}/g,function(e,t,a){t=t.split(",");for(var i=t.length,o=0;i>o;o++)CKEDITOR.tools.trim(t[o]).replace(/^(\w+)(\.[\w-]+)?$/g,function(e,t,i){t=t||"*",i=i.substring(1,i.length),i.match(/MsoNormal/)||(n[t]||(n[t]={}),i?n[t][i]=a:n[t]=a)})}),i.applyStyleFilter=function(e){var t,a=n["*"]?"*":e.name,i=e.attributes&&e.attributes["class"];a in n&&(t=n[a],"object"==typeof t&&(t=t[i]),t&&e.addStyle(t,!0))})}return!1},p:function(e){if(/MsoListParagraph/.exec(e.attributes["class"])){var t=e.firstChild(function(e){return e.type==CKEDITOR.NODE_TEXT&&!h(e.parent)}),a=t&&t.parent,i=a&&a.attributes;i&&!i.style&&(i.style="mso-list: Ignore;")}e.filterChildren(),g(e)||(n.enterMode==CKEDITOR.ENTER_BR?(delete e.name,e.add(new CKEDITOR.htmlParser.element("br"))):s(n["format_"+(n.enterMode==CKEDITOR.ENTER_P?"p":"div")])(e))},div:function(e){var t=e.onlyChild();if(t&&"table"==t.name){var a=e.attributes;t.attributes=CKEDITOR.tools.extend(t.attributes,a),a.style&&t.addStyle(a.style);var n=new CKEDITOR.htmlParser.element("div");n.addStyle("clear","both"),e.add(n),delete e.name}},td:function(e){e.getAncestor("thead")&&(e.name="th")},ol:u,ul:u,dl:u,font:function(e){if(m(e.parent))return delete e.name,void 0;e.filterChildren();var t=e.attributes,a=t.style,n=e.parent;"font"==n.name?(CKEDITOR.tools.extend(n.attributes,e.attributes),a&&n.addStyle(a),delete e.name):(a=a||"",t.color&&("#000000"!=t.color&&(a+="color:"+t.color+";"),delete t.color),t.face&&(a+="font-family:"+t.face+";",delete t.face),t.size&&(a+="font-size:"+(t.size>3?"large":t.size<3?"small":"medium")+";",delete t.size),e.name="span",e.addStyle(a))},span:function(e){if(m(e.parent))return!1;if(e.filterChildren(),h(e))return delete e.name,null;if(m(e)){var t=e.firstChild(function(e){return e.value||"img"==e.name}),a=t&&(t.value||"l."),i=a&&a.match(/^(?:[(]?)([^\s]+?)([.)]?)$/);if(i){var o=c(i,a),l=e.getAncestor("span");return l&&/ mso-hide:\s*all|display:\s*none /.test(l.attributes.style)&&(o.attributes["cke:ignored"]=1),o}}var s=e.children,u=e.attributes,p=u&&u.style;return s&&s[0],p&&(u.style=r([["line-height"],[/^font-family$/,null,y?null:d(n.font_style,"family")],[/^font-size$/,null,y?null:d(n.fontSize_style,"size")],[/^color$/,null,y?null:d(n.colorButton_foreStyle,"color")],[/^background-color$/,null,y?null:d(n.colorButton_backStyle,"color")]])(p,e)||""),null},b:s(n.coreStyles_bold),i:s(n.coreStyles_italic),u:s(n.coreStyles_underline),s:s(n.coreStyles_strike),sup:s(n.coreStyles_superscript),sub:s(n.coreStyles_subscript),a:function(e){var t=e.attributes;t&&!t.href&&t.name?delete e.name:CKEDITOR.env.webkit&&t.href&&t.href.match(/file:\/\/\/[\S]+#/i)&&(t.href=t.href.replace(/file:\/\/\/[^#]+/i,""))},"cke:listbullet":function(e){e.getAncestor(/h\d/)&&!n.pasteFromWordNumberedHeadingToList&&delete e.name}},attributeNames:[[/^onmouse(:?out|over)/,""],[/^onload$/,""],[/(?:v|o):\w+/,""],[/^lang/,""]],attributes:{style:r(k?[[/^list-style-type$/,null],[/^margin$|^margin-(?!bottom|top)/,null,function(e,t,a){if(t.name in{p:1,div:1}){var i="ltr"==n.contentsLangDirection?"margin-left":"margin-right";if("margin"==a)e=b(a,e,[i])[i];else if(a!=i)return null;if(e&&!l.test(e))return[i,e]}return null}],[/^clear$/],[/^border.*|margin.*|vertical-align|float$/,null,function(e,t){return"img"==t.name?e:void 0}],[/^width|height$/,null,function(e,t){return t.name in{table:1,td:1,th:1,img:1}?e:void 0}]]:[[/^mso-/],[/-color$/,null,function(e){return"transparent"==e?!1:CKEDITOR.env.gecko?e.replace(/-moz-use-text-color/g,"transparent"):void 0}],[/^margin$/,l],["text-indent","0cm"],["page-break-before"],["tab-stops"],["display","none"],y?[/font-?/]:null],k),width:function(e,a){return a.name in t.$tableContent?!1:void 0},border:function(e,a){return a.name in t.$tableContent?!1:void 0},"class":o,bgcolor:o,valign:k?o:function(e,t){return t.addStyle("vertical-align",e),!1}},comment:CKEDITOR.env.ie?o:function(e,t){var a=e.match(/<img.*?>/),n=e.match(/^\[if !supportLists\]([\s\S]*?)\[endif\]$/);if(n){var i=n[1]||a&&"l.",o=i&&i.match(/>(?:[(]?)([^\s]+?)([.)]?)</);return c(o,i)}if(CKEDITOR.env.gecko&&a){var r=CKEDITOR.htmlParser.fragment.fromHtml(a[0]).children[0],l=t.previous,s=l&&l.value.match(/<v:imagedata[^>]*o:href=['"](.*?)['"]/),d=s&&s[1];return d&&(r.attributes.src=d),r}return!1}}}},y=function(){this.dataFilter=new CKEDITOR.htmlParser.filter};y.prototype={toHtml:function(e){var t=CKEDITOR.htmlParser.fragment.fromHtml(e,!1),a=new CKEDITOR.htmlParser.basicWriter;return t.writeHtml(a,this.dataFilter),a.getHtml(!0)}},CKEDITOR.cleanWord=function(e,t){CKEDITOR.env.gecko&&(e=e.replace(/(<!--\[if[^<]*?\])-->([\S\s]*?)<!--(\[endif\]-->)/gi,"$1$2$3"));var a=new y,n=a.dataFilter;n.addRules(CKEDITOR.plugins.pastefromword.getRules(t)),t.fire("beforeCleanWord",{filter:n});try{e=a.toHtml(e,!1)}catch(i){alert(t.lang.pastefromword.error)}return e=e.replace(/cke:.*?".*?"/g,""),e=e.replace(/style=""/g,""),e=e.replace(/<span>/g,"")}}();