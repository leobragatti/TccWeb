function initTop()
{
	var msg = '';
	var hour = (new Date()).getHours();
	if (hour > 5 && hour <= 12)
		msg = 'Bom Dia';
	else if (hour > 12 && hour <= 18)
		msg = 'Boa Tarde';
	else
		msg = 'Boa Noite';
	
	
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
}


function getCookie(str, name) {
 var start = str.indexOf(name+"=");
 var len = start+name.length+1;
 if ((!start) && (name != str.substring(0,name.length))) return null;
 if (start == -1) return null;
 var end = str.indexOf(";",len);
 if (end == -1) end = str.length;
 return str.substring(len,end);
}

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
}

function decodeTransposition(nick) {
 var result = new String();
 for (var i = 0; i < nick.length; i++) {
 var c = nick.charCodeAt(i);
 (c % 2 == 1) ? c++: c--;
 result += String.fromCharCode(c);
 }
 return result;
}

function getName() {
 var nick = getCookiePropValue("SubmarinoP","Nick",true);
 var name = nick;
 if (name == null || name.length == 0)
 name = getCookiePropValue("SubmarinoP","FnUsr",true);
 if (name == null || name.length == 0)
 return "";
 return decodeTransposition(unescape(name));
}

function getCustId() {
 var custId = getCookiePropValue("SubmarinoS","CI",false);
 return custId;
}

function isLogged(custId) {
 logged = false;
 for (i = 0; i < custId.length; i++) {
 if (((custId[i]>'A')&&(custId[i]<'Z'))||((custId[i]>'a')&&(custId[i]<'z'))) {
 return true;
 }
 }
 return false;
}

function hideOption()
{
	if (document.all&&document.getElementById) {
		allSelects = document.getElementsByTagName('select');
		
		for (w=0; w<allSelects.length; w++) {
			allSelects[w].style.visibility = 'hidden';
		}
	}
}

function unhideOption()
{
	if (document.all&&document.getElementById) {
		allSelects = document.getElementsByTagName('select');
		
		for (w=0; w<allSelects.length; w++) {
			allSelects[w].style.visibility = 'visible';
		}
	}
}

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
			
			cookieValue = unescape(document.cookie.substring(start, end))
			
			if(cookieValue && cookieValue.indexOf("BooStore=1") != -1) {
				document.cookie = SubmarinoPartnerId + "=;path=/;domain=" + escape(domain);
			}
		} 
	}
}

deleteSubmarinoPartnerId();

function setCartHeader()
{
	var str = document.cookie;
	var ck = unescape( getCookie(str, 'cbasket'));
	if (ck == null || ck.length == 0 || ck.indexOf("^", 0) == -1)
	{
		$('cartQty').innerHTML = "0 Produtos";
		return;
	}
	
	var nm = ck.substring(0, ck.indexOf("^", 0))
	
	var i = new Number(nm);
	if (isNaN(i))
	{
		$('cartQty').innerHTML = "0 Produtos";
		return;
	}
	else
	{
		if (i == 1)
			$('cartQty').innerHTML = "1 Produto";
		else
			$('cartQty').innerHTML = i + " Produtos";
	}
}
