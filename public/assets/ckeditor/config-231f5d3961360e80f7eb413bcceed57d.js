/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.editorConfig=function(e){e.filebrowserBrowseUrl="/ckeditor/attachment_files",e.filebrowserFlashBrowseUrl="/ckeditor/attachment_files",e.filebrowserFlashUploadUrl="/ckeditor/attachment_files",e.filebrowserImageBrowseLinkUrl="/ckeditor/pictures",e.filebrowserImageBrowseUrl="/ckeditor/pictures",e.filebrowserImageUploadUrl="/ckeditor/pictures",e.filebrowserUploadUrl="/ckeditor/attachment_files",e.filebrowserParams=function(){for(var e,t,n,i=document.getElementsByTagName("meta"),r=new Object,o=0;o<i.length;o++)switch(n=i[o],n.name){case"csrf-token":e=n.content;break;case"csrf-param":t=n.content;break;default:continue}return void 0!==t&&void 0!==e&&(r[t]=e),r},e.addQueryString=function(e,t){var n=[];if(!t)return e;for(var i in t)n.push(i+"="+encodeURIComponent(t[i]));return e+(-1!=e.indexOf("?")?"&":"?")+n.join("&")},CKEDITOR.on("dialogDefinition",function(t){var n,i,r=t.data.name,o=t.data.definition;CKEDITOR.tools.indexOf(["link","image","attachment","flash"],r)>-1&&(n=o.getContents("Upload")||o.getContents("upload"),i=null==n?null:n.get("upload"),i&&null==i.filebrowser.params&&(i.filebrowser.params=e.filebrowserParams(),i.action=e.addQueryString(i.action,i.filebrowser.params)))}),e.extraPlugins="embed,attachment",e.toolbar="Easy",e.toolbar_Easy=[["Source","-","Preview"],["Cut","Copy","Paste","PasteText","PasteFromWord"],["Undo","Redo","-","SelectAll","RemoveFormat"],["Styles","Format"],["Subscript","Superscript","TextColor"],["Maximize","-","About"],"/",["Bold","Italic","Underline","Strike"],["NumberedList","BulletedList","-","Outdent","Indent","Blockquote"],["JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"],["Link","Unlink","Anchor"],["Image","Attachment","Flash","Embed"],["Table","HorizontalRule","Smiley","SpecialChar","PageBreak"]]};