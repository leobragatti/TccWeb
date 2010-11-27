function initTop()
{
	var msg = '';
	var hour = (new Date()).getHours();
	if (hour > 5 && hour <= 12){
		msg = 'Bom Dia';
	}else if (hour > 12 && hour <= 18){
		msg = 'Boa Tarde';
	}else{
		msg = 'Boa Noite';
	}
	
	//var nick = getCookiePropValue('SubmarinoP', 'Nick')
	var nick = getName();
	if (nick != "" && nick != null)
	{
		$('hello').innerHTML = msg + ', ' + nick;
		$('userInfo').className = $('userInfo').className + ' cooked';
	}
	else
	{
		$('hello').innerHTML = msg + ' , Visitante';
		$('userInfo').className = 'userInfo';
	}
};


function getCookie(str, name) {
 var start = str.indexOf(name+"=");
 var len = start+name.length+1;
 if ((!start) && (name != str.substring(0,name.length))) return null;
 if (start == -1) return null;
 var end = str.indexOf(";",len);
 if (end == -1) end = str.length;
 return str.substring(len,end);
};

function getCookiePropValue(cookieName, propertyName) {
 var str = document.cookie;

 var cookieStr = "";

 while ((cookieStr = getCookie(str, cookieName)) != null) {

 if (cookieStr.match(propertyName + '=') != null)
 break;
 str = str.substring(str.indexOf(cookieName+"=") + cookieName.length + 1, str.length);

 }

 if (cookieStr == null)
 return null;
 value = cookieStr.substring(cookieStr.indexOf(propertyName + '=') + propertyName.length + 1, cookieStr.length);

 if (value.match("&"))
 value = value.substring(0, value.indexOf("&"));

 return value;
};

function decodeTransposition(nick) {
 var result = new String();
 for (var i = 0; i < nick.length; i++) {
 var c = nick.charCodeAt(i);
 (c % 2 == 1) ? c++: c--;
 result += String.fromCharCode(c);
 }
 return result;
};

function getName() {
 var nick = getCookiePropValue("SubmarinoP","Nick",true);
 var name = nick;
 if (name == null || name.length == 0)
 name = getCookiePropValue("SubmarinoP","FnUsr",true);
 if (name == null || name.length == 0)
 return "";
 return decodeTransposition(unescape(name));
};

function getCustId() {
 var custId = getCookiePropValue("SubmarinoS","CI",false);
 //Caso o CI do SubmarinoS esteja errado, pega o valor do CI do cookie SubimarinoPCat
 if (custId == null || custId == "" || custId == "999848 P 1") {
	var ciInfoSubPCat = getCookiePropValue("SubmarinoPCat","CI",false);
	custId = ciInfoSubPCat;
 }
 return custId;
};

function isLogged(custId) {
 logged = false;
 for (i = 0; i < custId.length; i++) {
 // A linha comentada abaixo não funciona no IE7
 // if (((custId[i]>'A')&&(custId[i]<'Z'))||((custId[i]>'a')&&(custId[i]<'z'))) {
 if (((custId.charAt(i) > 'A') && (custId.charAt(i) < 'Z')) || ((custId.charAt(i) > 'a') && (custId.charAt(i) < 'z'))) {
 return true;
 }
 }
 return false;
};

function hideOption()
{
	if (document.all&&document.getElementById) {
		allSelects = document.getElementsByTagName('select');
		
		for (w=0; w<allSelects.length; w++) {
			allSelects[w].style.visibility = 'hidden';
		}
	}
};

function unhideOption()
{
	if (document.all&&document.getElementById) {
		allSelects = document.getElementsByTagName('select');
		
		for (w=0; w<allSelects.length; w++) {
			allSelects[w].style.visibility = 'visible';
		}
	}
};

function deleteSubmarinoPartnerId() {
	SubmarinoPartnerId = "SubmarinoPartnerId";
	domain = ".submarino.com.br";

	if (document.cookie.length>0) {
		pos = document.cookie.indexOf(SubmarinoPartnerId + "=");
		
		if (pos != -1) { 
			start = pos + SubmarinoPartnerId.length+1; 
			end = document.cookie.indexOf(";", start);
			
			if (end == -1) {
				end = document.cookie.length;
			}
			
			cookieValue = unescape(document.cookie.substring(start, end));
			
			if(cookieValue && cookieValue.indexOf("BooStore=1") != -1) {
				document.cookie = SubmarinoPartnerId + "=;path=/;domain=" + escape(domain);
			}
		} 
	}
};

deleteSubmarinoPartnerId();

/**
 * Global
 */
var hasProduct = false;
var validMyCartCookie = false;

function setCartHeader()
{
	var str = document.cookie;

	var ck = unescape( getCookie(str, 'cbasket') );
	
	if (ck == null || ck.length == 0 || ck.indexOf("^", 0) == -1)
	{
		$('cartQty').innerHTML = "0 produtos";
		hasProduct = false;
		showboxCart();
		return;
	}
	
	var nm = ck.substring(0, ck.indexOf("^", 0));
	
	var i = new Number(nm);
	if (isNaN(i))
	{
		$('cartQty').innerHTML = "0 produtos";
		hasProduct = false;
		showboxCart();
		return;
	}
	else
	{
		if (i == 1){
			$('cartQty').innerHTML = "1 produto";
			$('boxCart').className = $('boxCart').className + ' full';
			hasProduct = true;
		}else{
			$('cartQty').innerHTML = i + " produtos";
			$('boxCart').className = $('boxCart').className + ' full';
			hasProduct = true;
		}
	}
	
	showboxCart();
};

/**
 * Constants
 */
var URL_PRODUTO = 'http://www.submarino.com.br/produto/';

/* Metodos acessorios Layer Carrinho*/

/**
Calcula o subtotal
*/
function acountSubTotal(qtdProd, valorProd){
	return qtdProd * valorProd;
};

/**
Verifica se o nome tem menos de 35 caracteres
*/
function verifyNameProd(nameProd){
	
	var aux = null;
	
	if(nameProd.length > 35){
		aux = nameProd.substring(0, 35);
		nameProd = aux+'...';
	}

	return nameProd;
};

/**
Verifica se o cookie já está no novo formato com 5 campos.
*/
function verifyNewFieldsCookie(qtd){
	if(qtd == 3){
	  return false;
	}else{
	  return true;
	}
};

/**
Cria o link para o produto
*/
function productLink(depId, productId) {
	if(productId != null || productId != '') {
		var url = URL_PRODUTO;
		var params = depId +'/'+ productId;
		
		return url + params;
	}
};

/**
Cria uma lista com os elementos passados pelo cookie.
*/
function createProdList(htm, totProds, parts, totalItens, totalValue){
   
   //comeca em 1 porque a primeira linha guarda os totais.
   for(i=1; i < totProds +1; i++){
   
	   var newhtm = null;
	   var link = null;
	   var idProd = null;
	   var qtdProd = null;
	   var valorProd = null;
	   var nameProd = null;
	   var deptoProd = null;
	   
	   
	   var subparts = parts[i].split('^');
   	
		idProd    = subparts[0];
		qtdProd   = subparts[1];
		valorProd = subparts[2];
		nameProd  = subparts[3];
		deptoProd = subparts[4];
	   			
		link = productLink(deptoProd, idProd);
	   			
		var subTotal = acountSubTotal(qtdProd, valorProd);
				
		if(totProds >= 5){
					
			if(i == 5){
				htm += '<tr> <td> <a href="'+link+'">'+verifyNameProd(nameProd)+'</a> <span>('+qtdProd+')</span> </td> <td class="price">R$ '+formatCurrency(subTotal)+'</td> </tr>';
				htm += '<tr> <td class="seeAll" colspan="2"><a href="http://www2.submarino.com.br/Basket.aspx">+ Veja todos os produtos do carrinho</a> <span>('+totalItens+')</span> </td> </tr> </tbody>';
			}else{
				htm +='<tr> <td> <a href="'+link+'">'+verifyNameProd(nameProd)+'</a> <span>('+qtdProd+')</span> </td> <td class="price">R$ '+formatCurrency(subTotal)+'</td> </tr>';
			} 
			
		}else if(totProds < 5){
			
			if(i ==  totProds){
				htm += '<tr> <td> <a href="'+link+'">'+verifyNameProd(nameProd)+'</a> <span>('+qtdProd+')</span> </td> <td class="price">R$ '+formatCurrency(subTotal)+'</td> </tr> </tbody>';
			}else{
				htm = htm + '<tr> <td> <a href="'+link+'">'+verifyNameProd(nameProd)+'</a> <span>('+qtdProd+')</span> </td> <td class="price">R$ '+formatCurrency(subTotal)+'</td> </tr>';
			}
			
		}//fim-if(totProds)
				
		
	}//fim-for
	
	var patt1 = new RegExp("\\s<li><b>$");
	var result = patt1.exec(htm);
	
	if(result != null){
		newhtm = htm.replace(patt1, '');
	}else{
		newhtm = htm;
	}
	
	return newhtm;
};


/**
Exibe o layer com as informações do carrinho.
*/
function showOn(){

	if( hasProduct ){
		if( validMyCartCookie ){
			$('boxCart').className = 'boxCart full open';
		}
	}else{
		$('boxCart').className = 'boxCart open';
	}

};

/**
Oculta o layer com as informações do carrinho.
*/
function showOff(){
	if( hasProduct ){
		if( validMyCartCookie ){
			$('boxCart').className = 'boxCart full';
		}
	}else{
		$('boxCart').className = 'boxCart';
	}

};

/**
Converte o numero em formato de Moeda
*/
function formatCurrency(num) {
	num = num.toString().replace(/\$|\,/g,'');
	if(isNaN(num))
		num = "0";
		sign = (num == (num = Math.abs(num)));
		num = Math.floor(num*100+0.50000000001);
		cents = num%100;
		num = Math.floor(num/100).toString();
	if(cents<10)
		cents = "0" + cents;
		for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
			num = num.substring(0,num.length-(4*i+3))+'.'+num.substring(num.length-(4*i+3));
	return (((sign)?'':'-') + num + ',' + cents);
};

/**
Cria o layer com informações do carrinho.
*/
function showboxCart(){

	var str = document.cookie;
	
	var ck = unescape( getCookie(str, 'cbasket') );
	
	var patt1=/\+\+\+/g;
	var patt2=/\+/;
	var patt3=/\¬/g;
	
	//procura pelo padrao "+++"[equivalente a 'espaço'+'espaço'], e troca o '+' central por '¬'.
	while (patt1.test(ck)==true){
		ck = ck.replace("+++","+¬+");
	}
	
	//Retira o caracter de escape "+" da string ck.
	while (patt2.test(ck)==true){
		ck = ck.replace("+"," ");
	}
	
	// defaz a conversao '+'/'¬'
	while (patt3.test(ck)==true){
		ck = ck.replace("¬","+");
	}
	
	if(ck != null && ck.length != 0 && ck.indexOf("^", 0) != -1){
	
		var allparts = ck.split('|');
		var parts = new Array();
		
		for(i=0; i < allparts.length; i++){
			if(allparts[i] != ''){
				parts[i] = allparts[i];
			}
		}// fim - for
		
		var firstLine;
			firstLine = parts[0].split('^');
			
		var	totalItens = firstLine[0];
		var	totalValue = firstLine[1];
			
		var qtdSubParts = parts[1].split('^');
		
		if(parseInt(qtdSubParts.length) > parseInt('3')){
		
			validMyCartCookie = true;
		
			var headHtm = '<table> <caption>Produtos no Meu Carrinho:</caption> <tfoot> <tr> <td> <strong>Subtotal:</strong> </td> <td class="price"> <strong>R$ '+formatCurrency(totalValue)+'</strong> </td> </tr> </tfoot> <tbody>';
			
			var totProds;
			
			//Força a ter cinco itens. Testa "> 6" porque primeira linha não é considerada por trazer totais.
			if(parts.length > 6){
				totProds = 5;
			}else{
				//primeira linha não é considerada.
				if(parts.length > 1 && parts.length <= 6){
					totProds = parts.length -1;
				}else{
					totProds = 1;
				}
			}
			
			var dynamicHtml = createProdList(headHtm, totProds, parts, totalItens, totalValue);
			dynamicHtml += '</table> <a href="http://www2.submarino.com.br/Basket.aspx" class="linkLayer">Visualizar Meu Carrinho</a>';
			
			var docBox13B = document.getElementById( 'box13B' );
			docBox13B.innerHTML = dynamicHtml;
			
		}
	
	}else{
	
		if (ck == null || ck.length == 0 || ck.indexOf("^", 0) == -1)
		{
			var e = document.getElementById( 'box13B' );
			e.innerHTML = '<p id="warringCart">Seu carrinho est&aacute; vazio</p> ';

		}
	
	}//fim-if(ck != null)


};


/**
* Funcao que pega o cookie direto e nao a string com todos os cookies do browser 
* mais adequada para o IE6.
*/
function getCustIdThin(cookieValue, propertyName) {

	//var value = cookieValue.substring(cookieValue.indexOf(propertyName + '=') + propertyName.length + 1, cookieValue.length);
	//
	//if (value.match("&"))
	//	value = value.substring(0, value.indexOf("&"));
	
	return getCustId();
};



/* Funcao que trata as imagens .png no ie6 */

Element.addMethods({
  pngHack: function(el){
    var el = $(el);
    Prototype.Browser.IE6 = Prototype.Browser.IE && parseInt(navigator.userAgent.substring(navigator.userAgent.indexOf("MSIE")+5)) == 6;
	if (!Prototype.Browser.IE6) return el;
    var gif = 'http://img.submarino.com.br/img/1px.gif';
    if ((el.match('img')) && (el.src.include('png'))){
      var alphaImgSrc  = el.src;
     // var sizingMethod = 'scale';
      var sizingMethod = 'crop';
      el.src = gif;
    } else if (el.getStyle('backgroundImage').include('png')){
      var bgc = el.getStyle('backgroundColor') || '';
      var alphaImgSrc = el.getStyle('backgroundImage').gsub(/url\(|\)|'|"/, '');
      var sizingMethod = 'crop';
      el.setStyle({ background: [bgc, ' url(', gif, ') no-repeat'].join('') });
    } else {
      return el;
    }
    el.runtimeStyle.filter = 'progid:DXImageTransform.Microsoft.AlphaImageLoader(src="#{al}",sizingMethod="#{sz}")'.interpolate({ al: alphaImgSrc, sz: sizingMethod });
    return el;
  }
});

document.observe('dom:loaded', applyPNGHacks);
function applyPNGHacks () {
  $('userInfo').pngHack(); /* Trata o box - Login */
  $$('.logo img').invoke('pngHack'); /* Trata a logo */
}

