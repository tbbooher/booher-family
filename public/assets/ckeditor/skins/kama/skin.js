/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.skins.add("kama",function(){var e="cke_ui_color";return{editor:{css:["editor.css"]},dialog:{css:["dialog.css"]},richcombo:{canGroup:!1},templates:{css:["templates.css"]},margins:[0,0,0,0],init:function(t){function a(t){var a=t.getById(e);return a||(a=t.getHead().append("style"),a.setAttribute("id",e),a.setAttribute("type","text/css")),a}function i(e,t,a){for(var i,n,o,r=0;r<e.length;r++)if(CKEDITOR.env.webkit)for(n=0;n<t.length;n++){for(o=t[n][1],i=0;i<a.length;i++)o=o.replace(a[i][0],a[i][1]);e[r].$.sheet.addRule(t[n][0],o)}else{for(o=t,i=0;i<a.length;i++)o=o.replace(a[i][0],a[i][1]);CKEDITOR.env.ie?e[r].$.styleSheet.cssText+=o:e[r].$.innerHTML+=o}}t.config.width&&!isNaN(t.config.width)&&(t.config.width-=12);var n=[],o="/* UI Color Support */.cke_skin_kama .cke_menuitem .cke_icon_wrapper{	background-color: $color !important;	border-color: $color !important;}.cke_skin_kama .cke_menuitem a:hover .cke_icon_wrapper,.cke_skin_kama .cke_menuitem a:focus .cke_icon_wrapper,.cke_skin_kama .cke_menuitem a:active .cke_icon_wrapper{	background-color: $color !important;	border-color: $color !important;}.cke_skin_kama .cke_menuitem a:hover .cke_label,.cke_skin_kama .cke_menuitem a:focus .cke_label,.cke_skin_kama .cke_menuitem a:active .cke_label{	background-color: $color !important;}.cke_skin_kama .cke_menuitem a.cke_disabled:hover .cke_label,.cke_skin_kama .cke_menuitem a.cke_disabled:focus .cke_label,.cke_skin_kama .cke_menuitem a.cke_disabled:active .cke_label{	background-color: transparent !important;}.cke_skin_kama .cke_menuitem a.cke_disabled:hover .cke_icon_wrapper,.cke_skin_kama .cke_menuitem a.cke_disabled:focus .cke_icon_wrapper,.cke_skin_kama .cke_menuitem a.cke_disabled:active .cke_icon_wrapper{	background-color: $color !important;	border-color: $color !important;}.cke_skin_kama .cke_menuitem a.cke_disabled .cke_icon_wrapper{	background-color: $color !important;	border-color: $color !important;}.cke_skin_kama .cke_menuseparator{	background-color: $color !important;}.cke_skin_kama .cke_menuitem a:hover,.cke_skin_kama .cke_menuitem a:focus,.cke_skin_kama .cke_menuitem a:active{	background-color: $color !important;}";if(CKEDITOR.env.webkit){o=o.split("}").slice(0,-1);for(var r=0;r<o.length;r++)o[r]=o[r].split("{")}var l=/\$color/g;CKEDITOR.tools.extend(t,{uiColor:null,getUiColor:function(){return this.uiColor},setUiColor:function(e){var r,s=a(CKEDITOR.document),d="."+t.id,c=[d+" .cke_wrapper",d+"_dialog .cke_dialog_contents",d+"_dialog a.cke_dialog_tab",d+"_dialog .cke_dialog_footer"].join(","),u="background-color: $color !important;";return r=CKEDITOR.env.webkit?[[c,u]]:c+"{"+u+"}",(this.setUiColor=function(e){var a=[[l,e]];t.uiColor=e,i([s],r,a),i(n,o,a)})(e)}}),t.on("menuShow",function(e){var r=e.data[0],s=r.element.getElementsByTag("iframe").getItem(0).getFrameDocument();if(!s.getById("cke_ui_color")){var d=a(s);n.push(d);var c=t.getUiColor();c&&i([d],o,[[l,c]])}}),t.config.uiColor&&t.setUiColor(t.config.uiColor)}}}()),function(){function e(){CKEDITOR.dialog.on("resize",function(e){var t=e.data,a=t.width,i=t.height,n=t.dialog,o=n.parts.contents;"kama"==t.skin&&o.setStyles({width:a+"px",height:i+"px"})})}CKEDITOR.dialog?e():CKEDITOR.on("dialogPluginReady",e)}();