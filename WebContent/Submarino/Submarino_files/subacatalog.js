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
new Ajax.Updater({success:divId} ,m3_u,{evalScripts:true, method:'get'});}


function IsNumeric(strString) {
   var strCaracteres = "0123456789.-";
   var Caracter;
   var isNumber = true;

   if (strString.length == 0) return false;

   for (i = 0; i < strString.length && isNumber == true; i++)
      {
      Caracter = strString.charAt(i);
      if (strCaracteres.indexOf(Caracter) == -1)
         {
         isNumber = false;
         }
      }
   return isNumber;
}

function inter(varLargura,varAltura,varTopo,urlArquivo,varId,varTagname) {

	function abre()
        {
var viewportwidth;
 var viewportheight;
 
 // the more standards compliant browsers (mozilla/netscape/opera/IE7) use window.innerWidth and window.innerHeight
 
 if (typeof window.innerWidth != 'undefined')
 {
      viewportwidth = window.innerWidth,
      viewportheight = window.innerHeight
 }
 
// IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)

 else if (typeof document.documentElement != 'undefined'
     && typeof document.documentElement.clientWidth !=
     'undefined' && document.documentElement.clientWidth != 0)
 {
       viewportwidth = document.documentElement.clientWidth,
       viewportheight = document.documentElement.clientHeight
 }
 
 // older versions of IE
 
 else
 {
       viewportwidth = document.getElementsByTagName('body')[0].clientWidth,
       viewportheight = document.getElementsByTagName('body')[0].clientHeight
 }

          e = Math.round((viewportwidth/2) - (varLargura/2));

          if(document.all)
          {
            document.getElementById('intermission').style.left = e;
          }

          else
          {
            if(urlArquivo.substr(urlArquivo.length-"/images/br/inter_novas_lojas_.swf".length,"/images/br/inter_novas_lojas_.swf".length)=="/images/br/inter_novas_lojas_.swf")
            {
              document.getElementById('intermission').style.marginLeft = "190px";
            }
			else{
              document.getElementById('intermission').style.marginLeft = e+"px";
            }
          }

        }


	onresize = function() {
		if (IsNumeric(varLargura))
			abre();
	}

	var xwidth="";

        if(!document.all){xwidth="left:0;";}else{
	xwidth="width:"+varLargura+";";
        }

	document.write("<div style='display:none'>.</div><div id='intermission' style='position:absolute;"+xwidth+"height:"+ varAltura +";z-index:1000;top:"+ varTopo +"px;'><object classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 codebase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0 width="+ varLargura +" height="+ varAltura +"><param name=movie value="+ urlArquivo +"?id="+ varId +"&tagname="+ varTagname +"><param name=quality value=high><param name=wmode value=transparent><param name=allowScriptAccess value=always><embed src="+ urlArquivo +"?id="+ varId +"&tagname="+ varTagname +" width="+ varLargura +" height="+ varAltura +" quality=high pluginspage=http://www.macromedia.com/go/getflashplayer type=application/x-shockwave-flash wmode=transparent allowScriptAccess=always></embed></object></div>");

	if (IsNumeric(varLargura)){		abre();}
}

function fecha() {
	document.getElementById('intermission').style.display = 'none';
}

function optionSelected(valueSelected) {	
	var lis = $('listColors').getElementsByTagName('li');
	for(var i = 0 ; i < lis.length ; i++ ) {
		lis[i].className='';
	}
	$(valueSelected).className='selected';
}

function setSku(valueSelected) {
	var sku = getSku('skuDiff', valueSelected);
	var src = document.getElementById('baseImg').src;
	var radical = '';
	
	rUri = src.split('/');
    for(i = 0; i < rUri.length - 2; i++) {
	    radical += rUri[i] + '/';
    }
    		    
    if (sku.split(' ').length > 0) {
    	sku = sku.split(' ')[0];
    }
    
    var digito = sku.substring(sku.length - 1, sku.length);
    
    for(i2 = 1; i2 <= 6; i2++) {
	    if (document.getElementById('img'+i2) != null) {
    		document.getElementById('img'+i2).src = radical + 'img' +  digito + '/' + sku + '_'+ i2 +'.jpg';
    	}
    	
    	if (document.getElementById('bigImg'+i2) != null) {
    		document.getElementById('bigImg'+i2).src = radical + 'img' +  digito + '/' + sku + '_'+ i2 +'.jpg';
    	}
    }
    
    
    document.getElementById('baseImg').src = radical + 'img' +  digito + '/' + sku + '.jpg';
    document.getElementById('small').innerHTML = 'Cod. do Produto: ' + sku;
}

function setSkuTitle( campo, texto ) {			
	document.getElementById(campo).innerHTML = '- ' + texto + ' ';
}

function mouseOutEvent( valueSelected ){
	$(valueSelected).className = $(valueSelected).className.replace(/over/, '');
}

function onChangeEvent() {
	var codigoProduto = document.getElementById('skuId').value;
	var sku = getSku('skuDiff', codigoProduto);
	if (sku.split(' ').length > 0) {
    	sku = sku.split(' ')[0];
    }
	document.getElementById('small').innerHTML = 'Cod. do Produto: ' + sku;
	
	setSkuNumber();
}

function setSkuNumber() {
	var x=document.getElementById("skuId");
	document.getElementById('sku2').innerHTML = '- ' + x.options[x.selectedIndex].text + ' ';
}	

function setSkuCombo(codigoProduto) 
{	
	var counter = document.getElementById('counter').value;
	var properties = new Array();
	var values = new Array();
	var texts = new Array();
	for (var x = 0; x < counter; x++)
	{	
		var prop = document.getElementById(x).value;
		var idx = prop.indexOf(',');
		values[x] = prop.substr(0,idx);
		texts[x] = prop.substr((idx + 1), prop.length);
	}
	
	codigoProduto = codigoProduto.split(' ');
	var propCount = 0;
	for (var w = 0; w < codigoProduto.length; w++) 
	{
		for (var m = 0; m < values.length; m++)
		{
			var arrayValuesSplit = values[m].split(' ');
		
			for (var t = 0; t < arrayValuesSplit.length; t++) 
			{
				if (codigoProduto[w] == arrayValuesSplit[t] )
				{
					properties[propCount] = new Option(texts[m],values[m]);	
					propCount++;
					break;					
				}
			}
		}
	}
	
	var comboSku = document.getElementById('skuId');
	
	// Limpa as propriedades
	var skuSize = (comboSku.options.length - 1);
	for (skuSize; skuSize >= 0; skuSize--)
	{
		comboSku.options[skuSize] = null;
	}
	
	// Popula novamente o select com os devidos valores
	for (var z = 0; z < properties.length; z++)
	{
		comboSku.options[z] = properties[z];
	}
	
	setSkuNumber();
}
