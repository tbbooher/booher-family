/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
!function(){function e(e){return CKEDITOR.env.ie?e.$.clientWidth:parseInt(e.getComputedStyle("width"),10)}function t(e,t){var a=e.getComputedStyle("border-"+t+"-width"),i={thin:"0px",medium:"1px",thick:"2px"};return a.indexOf("px")<0&&(a=a in i&&"none"!=e.getComputedStyle("border-style")?i[a]:0),parseInt(a,10)}function a(e){for(var t,a,i,n=e.$.rows,o=0,r=0,l=n.length;l>r;r++)i=n[r],t=i.cells.length,t>o&&(o=t,a=i);return a}function i(e){for(var i=[],n=-1,o="rtl"==e.getComputedStyle("direction"),r=a(e),l=new CKEDITOR.dom.element(e.$.tBodies[0]),s=l.getDocumentPosition(),d=0,c=r.cells.length;c>d;d++){var u=new CKEDITOR.dom.element(r.cells[d]),p=r.cells[d+1]&&new CKEDITOR.dom.element(r.cells[d+1]);n+=u.$.colSpan||1;var m,h,g,f=u.getDocumentPosition().x;o?h=f+t(u,"left"):m=f+u.$.offsetWidth-t(u,"right"),p?(f=p.getDocumentPosition().x,o?m=f+p.$.offsetWidth-t(p,"right"):h=f+t(p,"left")):(f=e.getDocumentPosition().x,o?m=f:h=f+e.$.offsetWidth),g=Math.max(h-m,3),i.push({table:e,index:n,x:m,y:s.y,width:g,height:l.$.offsetHeight,rtl:o})}return i}function n(e,t){for(var a=0,i=e.length;i>a;a++){var n=e[a];if(t>=n.x&&t<=n.x+n.width)return n}return null}function o(e){(e.data||e).preventDefault()}function r(a){function i(){m=null,v=0,f=0,h.removeListener("mouseup",u),g.removeListener("mousedown",c),g.removeListener("mousemove",p),h.getBody().setStyle("cursor","auto"),d?g.remove():g.hide()}function n(){for(var t=m.index,a=CKEDITOR.tools.buildTableMap(m.table),i=[],n=[],r=Number.MAX_VALUE,l=r,s=m.rtl,d=0,c=a.length;c>d;d++){var u=a[d],T=u[t+(s?1:0)],S=u[t+(s?0:1)];T=T&&new CKEDITOR.dom.element(T),S=S&&new CKEDITOR.dom.element(S),T&&S&&T.equals(S)||(T&&(r=Math.min(r,e(T))),S&&(l=Math.min(l,e(S))),i.push(T),n.push(S))}y=i,k=n,C=m.x-r,w=m.x+l,g.setOpacity(.5),b=parseInt(g.getStyle("left"),10),v=0,f=1,g.on("mousemove",p),h.on("dragstart",o)}function r(){f=0,g.setOpacity(0),v&&l();var e=m.table;setTimeout(function(){e.removeCustomData("_cke_table_pillars")},0),h.removeListener("dragstart",o)}function l(){for(var a=m.rtl,i=a?k.length:y.length,n=0;i>n;n++){var o=y[n],r=k[n],l=m.table;CKEDITOR.tools.setTimeout(function(e,t,i,n,o,r){e&&e.setStyle("width",s(Math.max(t+r,0))),i&&i.setStyle("width",s(Math.max(n-r,0))),o&&l.setStyle("width",s(o+r*(a?-1:1)))},0,this,[o,o&&e(o),r,r&&e(r),(!o||!r)&&e(l)+t(l,"left")+t(l,"right"),v])}}function c(e){o(e),n(),h.on("mouseup",u,this)}function u(e){e.removeListener(),r()}function p(e){T(e.data.$.clientX)}var m,h,g,f,b,v,y,k,C,w;h=a.document,g=CKEDITOR.dom.element.createFromHtml('<div data-cke-temp=1 contenteditable=false unselectable=on style="position:absolute;cursor:col-resize;filter:alpha(opacity=0);opacity:0;padding:0;background-color:#004;background-image:none;border:0px none;z-index:10"></div>',h),d||h.getDocumentElement().append(g),this.attachTo=function(e){f||(d&&(h.getBody().append(g),v=0),m=e,g.setStyles({width:s(e.width),height:s(e.height),left:s(e.x),top:s(e.y)}),d&&g.setOpacity(.25),g.on("mousedown",c,this),h.getBody().setStyle("cursor","col-resize"),g.show())};var T=this.move=function(e){if(!m)return 0;if(!f&&(e<m.x||e>m.x+m.width))return i(),0;var t=e-Math.round(g.$.offsetWidth/2);if(f){if(t==C||t==w)return 1;t=Math.max(t,C),t=Math.min(t,w),v=t-b}return g.setStyle("left",s(t)),1}}function l(e){var t=e.data.getTarget();if("mouseout"==e.name){if(!t.is("table"))return;for(var a=new CKEDITOR.dom.element(e.data.$.relatedTarget||e.data.$.toElement);a&&a.$&&!a.equals(t)&&!a.is("body");)a=a.getParent();if(!a||a.equals(t))return}t.getAscendant("table",1).removeCustomData("_cke_table_pillars"),e.removeListener()}var s=CKEDITOR.tools.cssLength,d=CKEDITOR.env.ie&&(CKEDITOR.env.ie7Compat||CKEDITOR.env.quirks||CKEDITOR.env.version<7);CKEDITOR.plugins.add("tableresize",{requires:["tabletools"],init:function(e){e.on("contentDom",function(){var t;e.document.getBody().on("mousemove",function(a){if(a=a.data,t&&t.move(a.$.clientX))return o(a),void 0;var s,d,c=a.getTarget();if(c.is("table")||c.getAscendant("tbody",1)){s=c.getAscendant("table",1),(d=s.getCustomData("_cke_table_pillars"))||(s.setCustomData("_cke_table_pillars",d=i(s)),s.on("mouseout",l),s.on("mousedown",l));var u=n(d,a.$.clientX);u&&(!t&&(t=new r(e)),t.attachTo(u))}})})}})}();