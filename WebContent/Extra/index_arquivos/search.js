function checkEnter(b){var a;if(b&&b.which){b=b;a=b.which}else{b=event;a=b.keyCode}if(a==13){return true}else{return false}}function submitSliSearch(d){var a=getSearchURL()+d;try{var g=getCookieSLI("cview");if(g){a+="&view="+g}}catch(b){}var f=qs();if(f.cnt){a+="&cnt="+f.cnt}if(getCookie("Parceiro")){a+="&utm_source="+getCookie("Parceiro")}if(getCookie("Midia")){a+="&utm_medium="+getCookie("Midia")}if(getCookie("Campanha")){a+="&utm_campaign="+getCookie("Campanha")}document.location=a;return false}function getSearchURL(){var b=(("https:"==document.location.protocol)?"https://":"http://");var a=b+"buscando.extra.com.br/search?w=";if((document.location.href.indexOf(".local/")>0)){a=document.location.href.match(/http:\/\/[^\/]+\//)+"search?w="}return a}function getUrlParam(b){b=b.replace(/[\[]/,"\\[").replace(/[\]]/,"\\]");var a="[\\?&]"+b+"=([^&#]*)";var d=new RegExp(a);var c=d.exec(window.location.href);if(c==null){return""}else{return c[1]}}function qs(){var a=new Array();var e=window.location.search.substring(1);var d=e.split("&");for(var c=0;c<d.length;c++){var g=d[c].indexOf("=");if(g>0){var b=d[c].substring(0,g);var f=d[c].substring(g+1);a[b]=f}}return a}function getCookie(b){var e="IPS-PontoFrio.com";var a=undefined;if(document.cookie.length>0){c_start=document.cookie.indexOf(e+"=");if(c_start!=-1){c_start=c_start+e.length+1;c_end=document.cookie.indexOf(";",c_start);if(c_end==-1){c_end=document.cookie.length}var d=unescape(document.cookie.substring(c_start,c_end)).split("&");for(var c=0;c<d.length;c++){c_start=d[c].indexOf(b+"=");if(c_start!=-1){c_start=c_start+b.length+1;c_end=d[c].length;a=d[c].substring(c_start,c_end);return a}}}}return false};