/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
!function(){CKEDITOR.plugins.add("ajax",{requires:["xml"]}),CKEDITOR.ajax=function(){var e=function(){if(!CKEDITOR.env.ie||"file:"!=location.protocol)try{return new XMLHttpRequest}catch(e){}try{return new ActiveXObject("Msxml2.XMLHTTP")}catch(t){}try{return new ActiveXObject("Microsoft.XMLHTTP")}catch(a){}return null},t=function(e){return 4==e.readyState&&(e.status>=200&&e.status<300||304==e.status||0===e.status||1223==e.status)},a=function(e){return t(e)?e.responseText:null},i=function(e){if(t(e)){var a=e.responseXML;return new CKEDITOR.xml(a&&a.firstChild?a:e.responseText)}return null},n=function(t,a,i){var n=!!a,o=e();return o?(o.open("GET",t,n),n&&(o.onreadystatechange=function(){4==o.readyState&&(a(i(o)),o=null)}),o.send(null),n?"":i(o)):null};return{load:function(e,t){return n(e,t,a)},loadXml:function(e,t){return n(e,t,i)}}}()}();