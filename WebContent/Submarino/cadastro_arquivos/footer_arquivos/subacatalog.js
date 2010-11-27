function listChoice(productId,form){var id=productId;var i;var elements=new Array();if(!form.event.length)
elements[0]=form.event;else
elements=form.event;var choice;for(i=0;i<elements.length;i++){if(elements[i].checked){choice=elements[i].value;}}
var goTo=choice+id;location.href=goTo;}
function selectPic(img)
{var image=document.getElementsByClassName('picimgbig');if(image.length)
{for(i=0;i<image.length;i++)
{image[i].src=img.src;}}else if(image)
{image.src=img.src;}}
function changeMainImage(image)
{}
function openPopUp(URL,NAME,OPTIONS)
{window.open(URL,NAME,OPTIONS);}
function openPopd(URL,NAME)
{openPopUp(URL,NAME,'width=446,height=400,status=no,scrollbars=no,top=80,left=80');}
function enterLiveChat(chatId){var url="http://200.189.215.134/chat51/";var hWnd=window.open(url+"default.aspx?chat="+chatId+"&group=suporte&url="+window.location,"chat","width=400,height=470,resizable=no,toolbar=0,location=0,directories=0,status=no,menubar=0,scrollbars=0");if(hWnd!=null)
{if(hWnd.opener==null)
{hWnd.opener=self;hWnd.location.href=url;}}}
function isImageOk(img){if(!img.complete){return false;}
if(typeof img.naturalWidth!="undefined"&&img.naturalWidth==0){return false;}
return true;}
function mouseOver(id,index){var obj=document.getElementById('btAddList'+id.toString()+index.toString());var resp=obj.className.search(/selected/);if(resp==-1){obj.className+=' selected';}}
function mouseOut(id,index){var obj=document.getElementById('btAddList'+id.toString()+index.toString());var resp=obj.className.search(/selected/);if(resp!=-1){obj.className='btAddList';}}
function subaAsyncBanner(divId,zoneId){var host='www.submarino.com.br';var page='/openx/www/delivery/aajx.php';var m3_u=(location.protocol=='https:'?'https://'+host+page:'http://'+host+page);var m3_r=1;if(!document.MAX_used){document.MAX_used=',';}
m3_u=m3_u+"?zoneid="+zoneId+"&amp;block=1";m3_u=m3_u+"&amp;cb="+m3_r;if(document.MAX_used!=','){m3_u=m3_u+"&amp;exclude="+document.MAX_used;}
m3_u=m3_u+"&amp;loc="+escape(window.location);if(document.referrer){m3_u=m3_u+"&amp;referer="+escape(document.referrer);}
if(document.context){m3_u=m3_u+"&context="+escape(document.context);}
if(document.mmm_fo){m3_u=m3_u+"&amp;mmm_fo=1";}
new Ajax.Updater(divId,m3_u,{evalScripts:true, method:'get'});}
