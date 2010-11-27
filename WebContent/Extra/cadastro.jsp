<%@ page import="org.apache.axis.client.*,
				 org.apache.axis.encoding.XMLType,
				 org.apache.axis.utils.Options,
				 javax.xml.rpc.ParameterMode,java.net.URL,
				 java.util.*,
				 java.security.*,
				 br.com.fiap.pessoa.*,
				 br.com.fiap.certificado.*" %>
<%
String idPessoa  = request.getParameter("idPessoa");
ArrayList ret = null;

if(idPessoa != null){
	
	//Pega o certificado
	Certificado c =  new Certificado("c:/cert/bragatti.jks"); 
	PrivateKey chavePrivada = c.getPrivateFromFile("bragatti", "voices");
	byte[] assinado = c.createSignature(chavePrivada, "81".getBytes());
	
	String endpointString = "http://localhost:8080/TccWeb/services/PessoaWS?wsdl"; 
	Service service1 = new Service();
	
	Call callOne = (Call)service1.createCall();
	
	URL endpoint = new URL(endpointString);
	
	callOne.setTargetEndpointAddress(endpoint);
	
	callOne.setOperationName("getInformacoes");
	//callOne.
	callOne.setReturnType(XMLType.XSD_STRING);
	callOne.addParameter("autenticacao",XMLType.XSD_HEXBIN,ParameterMode.IN);
	callOne.addParameter("idPessoa_Empresa",XMLType.XSD_LONG,ParameterMode.IN);
	callOne.addParameter("idPessoa",XMLType.XSD_LONG,ParameterMode.IN);
	callOne.addParameter("campos",XMLType.XSD_STRING,ParameterMode.IN);
	
	String[] parametro = {"nome", "cpf", "endereco", "email", "cep"}; 
	
	try{
		ret = (ArrayList)callOne.invoke(new Object[]{assinado, 81, Integer.parseInt(idPessoa), parametro});
	}
	catch(Exception e){
		out.println(e.getMessage());
		return;
	}
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0045)https://carrinho.extra.com.br/Site/Login.aspx -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD id=ctl00_headMaster><TITLE>Faça seu login no Extra.com.br</TITLE>
<META content=text/html;charset=utf-8 http-equiv=Content-Type>
<META name=language content=pt-br>
<META name=resource-type content=document>
<META content=no-cache http-equiv=pragma>
<META name=revisit-after content=1>
<META name=robots content=ALL>
<META name=distribution content=Global>
<META name=rating content=General>
<META name=author content=Extra.com.br>
<META name=title content="Faça seu login no Extra.com.br">
<META name=description 
content="Aqui tem as melhores ofertas da internet. Confira Refrigerador, iPod, Notebook, Computador, Câmera Digital, TV LCD, DVD, Celulares, Cama Box e muito mais.">
<META name=Abstract 
content="Aqui tem as melhores ofertas da internet. Confira Refrigerador, iPod, Notebook, Computador, Câmera Digital, TV LCD, DVD, Celulares, Cama Box e muito mais.">
<META name=keywords 
content="computadores, notebooks, netbooks, câmeras digitais, filmadoras, pneu, piscina, cadeira para escritório, móveis, brinquedos, bebês e muito mais você encontra no Extra.com.br">
<link type="text/css" href="css/smoothness/jquery-ui-1.8.5.custom.css" rel="stylesheet" />
<LINK rel=stylesheet type=text/css href="cadastro_arquivos/components.css"><!--[if lte IE 7]><link rel="stylesheet" type="text/css" href="https://carrinho.extra.com.br/App_Themes/Extra/css/components_IE.css" /><![endif]--><LINK 
id=ctl00_lnkRelShortCutIcon rel="shortcut icon" 
href="https://carrinho.extra.com.br/App_Themes/Extra/Images/favicon.ico"><LINK 
id=ctl00_lnkRelAppleShortCutIcon rel=apple-touch-icon 
href="https://carrinho.extra.com.br/App_Themes/Extra/Images/applefavicon.ico"><LINK 
id=ctl00_cssCheckout rel=stylesheet type=text/css 
href="cadastro_arquivos/checkout.css"><!--[if lte IE 7]><link rel="stylesheet" type="text/css" href="https://carrinho.extra.com.br/App_Themes/Extra/css/checkout_IE.css" /><![endif]-->
<SCRIPT type=text/javascript src="cadastro_arquivos/utils.js"></SCRIPT>

<SCRIPT type=text/javascript src="cadastro_arquivos/jsExtra.js"></SCRIPT>

<SCRIPT type=text/javascript src="cadastro_arquivos/search.js"></SCRIPT>

<script type=text/javascript src="script/jQuery.js"></script>
<script type=text/javascript src="script/jQuery-ui.js"></script>
<script type=text/javascript>
	function ativarAutenticacao(url){
		$('#registroDigital').dialog({
			autoOpen: true,
			width: 600,
			height: 300,
			modal: true,
			open:function(){
				var url = 'http://localhost:8080/TccWeb/autenticacao';
				$.get(url, function(data){
					$('#registroDigital').html(data);
				});
			},
			buttons: {
				"OK":function(){
					var idPessoa = $('#idPessoa').val();
					if(idPessoa == undefined){
						alert('Faça a autenticação primeiro');
						return false;
					}
					document.location.href("cadastro.jsp?idPessoa=" + idPessoa); 
				} 
			}
		});
	}		
</script>

<META name=GENERATOR content="MSHTML 8.00.6001.18975"></HEAD>
<BODY id=ctl00_home class="checkout login"><!-- START COREMETRICS -->
<SCRIPT type=text/javascript src="cadastro_arquivos/metrics.js"></SCRIPT>

<SCRIPT type=text/javascript>
	if (window.location && window.location.href.indexOf('extra.com.br') != -1) 
	{
		cmSetProduction('extra.com.br');
	}
	
</SCRIPT>

<!-- END COREMETRICS -->
<FORM id=aspnetForm onsubmit="javascript:return WebForm_OnSubmit();" method=post 
name=aspnetForm action=/Site/Login.aspx>
<DIV><INPUT id=__EVENTTARGET type=hidden name=__EVENTTARGET> <INPUT 
id=__EVENTARGUMENT type=hidden name=__EVENTARGUMENT> <INPUT id=__LASTFOCUS 
type=hidden name=__LASTFOCUS> <INPUT id=__VIEWSTATE 
value=/wEPDwUKLTM5Mjc1NDI1OA9kFgJmD2QWBAIBD2QWBAISDxYCHgRocmVmBUFodHRwczovL2NhcnJpbmhvLmV4dHJhLmNvbS5ici9BcHBfVGhlbWVzL0V4dHJhL0ltYWdlcy9mYXZpY29uLmljb2QCEw8WAh8ABUZodHRwczovL2NhcnJpbmhvLmV4dHJhLmNvbS5ici9BcHBfVGhlbWVzL0V4dHJhL0ltYWdlcy9hcHBsZWZhdmljb24uaWNvZAIDDxYCHgVjbGFzcwUOY2hlY2tvdXQgbG9naW4WBAIBD2QWAmYPFgIeBFRleHQFnQEKPHNjcmlwdCB0eXBlPSJ0ZXh0L2phdmFzY3JpcHQiPgppZiAod2luZG93LmxvY2F0aW9uICYmIHdpbmRvdy5sb2NhdGlvbi5ocmVmLmluZGV4T2YoJ2V4dHJhLmNvbS5icicpICE9IC0xKSAKewoJY21TZXRQcm9kdWN0aW9uKCdleHRyYS5jb20uYnInKTsKfQo8L3NjcmlwdD4KZAIJDxYCHghvbnN1Ym1pdAUlamF2YXNjcmlwdDpyZXR1cm4gV2ViRm9ybV9PblN1Ym1pdCgpOxYCAgkPZBYEAgEPZBYCZg8WAh8CBXc8bGkgY2xhc3M9ImF0aXZvIj5JZGVudGlmaWNhw6fDo288L2xpPjxsaT5FbnRyZWdhIGUgZW1iYWxhZ2VtPC9saT48bGk+UGFnYW1lbnRvPC9saT48bGkgY2xhc3M9Imxhc3QiPkNvbmZpcm1hw6fDo288L2xpPmQCBw9kFgICAQ9kFgJmD2QWNgIEDxAPFgIeB0NoZWNrZWRoZGRkZAIJDxYCHwIFSTxkaXYgY2xhc3M9ImF2aXNvLWVycm8iPjxwPk8gY2FkYXN0cm8gZm9pIGFsdGVyYWRvIGNvbSBzdWNlc3NvLjwvcD48L2Rpdj5kAgoPFgIeB1Zpc2libGVoFhYCEQ8PZBYGHgpvbmtleXByZXNzBRNtYXNjYXJhKHRoaXMsY25waik7HgZvbmJsdXIFE21hc2NhcmEodGhpcyxjbnBqKTseB29ua2V5dXAFeFNhbHRhQ2FtcG8oY3RsMDBfQ29udGV1ZG9fY3RybENhZGFzdHJvQ2xpZW50ZV90eHRDbnBqLGN0bDAwX0NvbnRldWRvX2N0cmxDYWRhc3Ryb0NsaWVudGVfdHh0SW5zY3JpY2FvRXN0YWR1YWwsMTgsZXZlbnQpO2QCFw8PFgIeDEVycm9yTWVzc2FnZQUPQ05QSiBpbnbDoWxpZG8uZGQCGw8PFgIeCU1heExlbmd0aAISFgIfBgUYbWFzY2FyYSh0aGlzLHNvTnVtZXJvcyk7ZAIdDxAPFgIfAgUGSXNlbnRvZGRkZAIhDxYCHwVoZAIjDw8WAh8FaBYCHwgFcFNhbHRhQ2FtcG8oY3RsMDBfQ29udGV1ZG9fY3RybENhZGFzdHJvQ2xpZW50ZV90eHRDZXAxQ29tLGN0bDAwX0NvbnRldWRvX2N0cmxDYWRhc3Ryb0NsaWVudGVfdHh0Q2VwMkNvbSw1LGV2ZW50KTtkAiUPDxYCHwVoFgIfCAVvU2FsdGFDYW1wbyhjdGwwMF9Db250ZXVkb19jdHJsQ2FkYXN0cm9DbGllbnRlX3R4dENlcDJDb20sY3RsMDBfQ29udGV1ZG9fY3RybENhZGFzdHJvQ2xpZW50ZV90eHRERERDb20sMyxldmVudCk7ZAIxD2QWAmYPZBYEAgMPDxYCHwJlZGQCBQ8PFgIeB1Rvb2xUaXBkZGQCMw8PFgIfCQUmTsO6bWVybyBkbyBDYXJ0w6NvIEJvbWNsdWJlIGludsOhbGlkby5kZAI3Dw9kFgQfBgUYbWFzY2FyYSh0aGlzLHNvTnVtZXJvcyk7HwgFblNhbHRhQ2FtcG8oY3RsMDBfQ29udGV1ZG9fY3RybENhZGFzdHJvQ2xpZW50ZV90eHRERERDb20sY3RsMDBfQ29udGV1ZG9fY3RybENhZGFzdHJvQ2xpZW50ZV90eHRUZWxDb20sMixldmVudCk7ZAI5Dw9kFgQfBgUYbWFzY2FyYSh0aGlzLHNvTnVtZXJvcyk7HwgFbFNhbHRhQ2FtcG8oY3RsMDBfQ29udGV1ZG9fY3RybENhZGFzdHJvQ2xpZW50ZV90eHRUZWxDb20sY3RsMDBfQ29udGV1ZG9fY3RybENhZGFzdHJvQ2xpZW50ZV90eHRTaXRlLDgsZXZlbnQpO2QCFA9kFggCAQ9kFgJmDxYCHwIFHkNQRjxzcGFuIGNsYXNzPSdvYnInPio8L3NwYW4+OmQCAw8PZBYKHwYFEm1hc2NhcmEodGhpcyxjcGYpOx8HBRJtYXNjYXJhKHRoaXMsY3BmKTsfCAV0U2FsdGFDYW1wbyhjdGwwMF9Db250ZXVkb19jdHJsQ2FkYXN0cm9DbGllbnRlX3R4dENwZiwgY3RsMDBfQ29udGV1ZG9fY3RybENhZGFzdHJvQ2xpZW50ZV90eHREYXRhTmFzY0RpYSwgMTQsIGV2ZW50KTseB29uZm9jdXMFDHJldHVybiB0cnVlOx4MYXV0b2NvbXBsZXRlBQNvZmZkAgUPDxYCHwsFGFBvciBxdWUgcGVkaW1vcyBzZXUgQ1BGP2RkAgsPDxYCHwkFDkNQRiBpbnbDoWxpZG8uZGQCFg8PZBYGHwcFF1JlZnJlc2hEYXRhTmFzY2ltZW50bygpHwYFGG1hc2NhcmEodGhpcyxzb051bWVyb3MpOx8IBXtTYWx0YUNhbXBvKGN0bDAwX0NvbnRldWRvX2N0cmxDYWRhc3Ryb0NsaWVudGVfdHh0RGF0YU5hc2NEaWEsIGN0bDAwX0NvbnRldWRvX2N0cmxDYWRhc3Ryb0NsaWVudGVfdHh0RGF0YU5hc2NNZXMsIDIsIGV2ZW50KTtkAhcPD2QWBh8HBRdSZWZyZXNoRGF0YU5hc2NpbWVudG8oKR8GBRhtYXNjYXJhKHRoaXMsc29OdW1lcm9zKTsfCAV4U2FsdGFDYW1wbyhjdGwwMF9Db250ZXVkb19jdHJsQ2FkYXN0cm9DbGllbnRlX3R4dERhdGFOYXNjTWVzLGN0bDAwX0NvbnRldWRvX2N0cmxDYWRhc3Ryb0NsaWVudGVfdHh0RGF0YU5hc2NBbm8sMixldmVudCk7ZAIYDw9kFgYfBwUXUmVmcmVzaERhdGFOYXNjaW1lbnRvKCkfBgUYbWFzY2FyYSh0aGlzLHNvTnVtZXJvcyk7HwgFdFNhbHRhQ2FtcG8oY3RsMDBfQ29udGV1ZG9fY3RybENhZGFzdHJvQ2xpZW50ZV90eHREYXRhTmFzY0FubyxjdGwwMF9Db250ZXVkb19jdHJsQ2FkYXN0cm9DbGllbnRlX3JhZGlvU2V4b00sNCxldmVudCk7ZAIbDw8WAh8JBQ9EYXRhIGludsOhbGlkYS5kZAIfDxYCHgdvbmNsaWNrBVdkb2N1bWVudC5nZXRFbGVtZW50QnlJZCgnY3RsMDBfQ29udGV1ZG9fY3RybENhZGFzdHJvQ2xpZW50ZV90eHRTZXhvJykudmFsdWU9IHRoaXMudmFsdWVkAiEPFgIfDgVXZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoJ2N0bDAwX0NvbnRldWRvX2N0cmxDYWRhc3Ryb0NsaWVudGVfdHh0U2V4bycpLnZhbHVlPSB0aGlzLnZhbHVlZAIlD2QWAgIBDxYCHwIFHkNFUDxzcGFuIGNsYXNzPSdvYnInPio8L3NwYW4+OmQCJg9kFgJmD2QWBAIDDw9kFgIfBgUYbWFzY2FyYSh0aGlzLHNvTnVtZXJvcyk7ZAIFDw8WAh8LBQ5PIHF1ZSDDqSBpc3RvP2RkAicPDxYCHwkFJk7Dum1lcm8gZG8gQ2FydMOjbyBCb21jbHViZSBpbnbDoWxpZG8uZGQCKA8WAh8CBRFUZWxlZm9uZSBmaXhvIDEqOmQCKQ8PZBYEHwYFGG1hc2NhcmEodGhpcyxzb051bWVyb3MpOx8IBXFTYWx0YUNhbXBvKGN0bDAwX0NvbnRldWRvX2N0cmxDYWRhc3Ryb0NsaWVudGVfdHh0VGVsUmVzRERELGN0bDAwX0NvbnRldWRvX2N0cmxDYWRhc3Ryb0NsaWVudGVfdHh0VGVsUmVzLDIsZXZlbnQpO2QCKg8PZBYEHwYFGG1hc2NhcmEodGhpcyxzb051bWVyb3MpOx8IBXJTYWx0YUNhbXBvKGN0bDAwX0NvbnRldWRvX2N0cmxDYWRhc3Ryb0NsaWVudGVfdHh0VGVsUmVzLGN0bDAwX0NvbnRldWRvX2N0cmxDYWRhc3Ryb0NsaWVudGVfdHh0REREQ29tX1BGICw4LGV2ZW50KTtkAjEPD2QWBB8GBRhtYXNjYXJhKHRoaXMsc29OdW1lcm9zKTsfCAVrU2FsdGFDYW1wbyhjdGwwMF9Db250ZXVkb19jdHJsQ2FkYXN0cm9DbGllbnRlX3R4dENlbERERCxjdGwwMF9Db250ZXVkb19jdHJsQ2FkYXN0cm9DbGllbnRlX3R4dENlbCwyLGV2ZW50KTtkAjIPD2QWBB8GBRhtYXNjYXJhKHRoaXMsc29OdW1lcm9zKTsfCAVqU2FsdGFDYW1wbyhjdGwwMF9Db250ZXVkb19jdHJsQ2FkYXN0cm9DbGllbnRlX3R4dENlbCxjdGwwMF9Db250ZXVkb19jdHJsQ2FkYXN0cm9DbGllbnRlX3R4dEVtYWlsLDgsZXZlbnQpO2QCNQ8PFgIfCQUiREREIGRvIHRlbGVmb25lIGNlbHVsYXIgaW52w6FsaWRvLmRkAjkPD2QWBB4Jb25rZXlkb3duBRZmb3JiaWRQYXN0ZURvd24oZXZlbnQpHwgFFGZvcmJpZFBhc3RlVXAoZXZlbnQpZAI+Dw9kFgQfDwUWZm9yYmlkUGFzdGVEb3duKGV2ZW50KR8IBRRmb3JiaWRQYXN0ZVVwKGV2ZW50KWQCPw8PFgIfCwUuUG9yIHF1ZSBwZWRpbW9zIGEgY29uZmlybWHDp8OjbyBkbyBzZXUgZS1tYWlsP2RkAkUPD2QWBB8PBRZmb3JiaWRQYXN0ZURvd24oZXZlbnQpHwgFFGZvcmJpZFBhc3RlVXAoZXZlbnQpZAJJDw9kFgQfDwUWZm9yYmlkUGFzdGVEb3duKGV2ZW50KR8IBRRmb3JiaWRQYXN0ZVVwKGV2ZW50KWQCTQ8PFgIfBWhkFhACFw8PZBYCHwYFGW1hc2NhcmEodGhpcywgc29OdW1lcm9zKTtkAh0PD2QWAh8GBRltYXNjYXJhKHRoaXMsIHNvTnVtZXJvcyk7ZAIjDw9kFgIfBgUZbWFzY2FyYSh0aGlzLCBzb051bWVyb3MpO2QCLw9kFgJmDxAPFgIeC18hRGF0YUJvdW5kZ2QQFW8aMDAxIC0gQmFuY28gZG8gQnJhc2lsIFMuQS4dMDAzIC0gQmFuY28gZGEgQW1hesO0bmlhIFMuQS4mMDA0IC0gQmFuY28gZG8gTm9yZGVzdGUgZG8gQnJhc2lsIFMuQS42MDIxIC0gQkFORVNURVMgUy5BLiBCYW5jbyBkbyBFc3RhZG8gZG8gRXNww61yaXRvIFNhbnRvKDAyNCAtIEJhbmNvIGRlIFBlcm5hbWJ1Y28gUy5BLiAtIEJBTkRFUEUVMDI1IC0gQmFuY28gQWxmYSBTLkEuLDAyNyAtIEJhbmNvIGRvIEVzdGFkbyBkZSBTYW50YSBDYXRhcmluYSBTLkEuFzAyOSAtIEJhbmNvIEJhbmVyaiBTLkEuFDAzMSAtIEJhbmNvIEJlZyBTLkEuGjAzMyAtIEJhbmNvIFNhbnRhbmRlciBTLkEuHTAzNiAtIEJhbmNvIEJyYWRlc2NvIEJCSSBTLkEuIzAzNyAtIEJhbmNvIGRvIEVzdGFkbyBkbyBQYXLDoSBTLkEuGjAzOCAtIEJhbmNvIEJhbmVzdGFkbyBTLkEuGDA0MCAtIEJhbmNvIENhcmdpbGwgUy5BLi8wNDEgLSBCYW5jbyBkbyBFc3RhZG8gZG8gUmlvIEdyYW5kZSBkbyBTdWwgUy5BLhQwNDQgLSBCYW5jbyBCVkEgUy5BLhwwNDUgLSBCYW5jbyBPcHBvcnR1bml0eSBTLkEuJTA0NyAtIEJhbmNvIGRvIEVzdGFkbyBkZSBTZXJnaXBlIFMuQS4kMDYyIC0gSGlwZXJjYXJkIEJhbmNvIE3Dumx0aXBsbyBTLkEuJDA2MyAtIEJhbmNvIEliaSBTLkEuIEJhbmNvIE3Dumx0aXBsbyUwNjUgLSBMZW1vbiBCYW5rIEJhbmNvIE3Dumx0aXBsbyBTLkEuJDA2OSAtIEJQTiBCcmFzaWwgQmFuY28gTcO6dGlwbG8gUy5BLiMwNzAgLSBCUkIgLSBCYW5jbyBkZSBCcmFzw61saWEgUy5BLhswNzIgLSBCYW5jbyBSdXJhbCBNYWlzIFMuQS4lMDczIC0gQkIgQmFuY28gUG9wdWxhciBkbyBCcmFzaWwgUy5BLhkwNzQgLSBCYW5jbyBKLiBTYWZyYSBTLkEuPTA5NiAtIEJhbmNvIEJNJkYgZGUgU2VydmnDp29zIGRlIExpcXVpZGHDp8OjbyBlIEN1c3TDs2RpYSBTLkEeMTA0IC0gQ2FpeGEgRWNvbsO0bWljYSBGZWRlcmFsFDEwNyAtIEJhbmNvIEJCTSBTLkEuFzExNiAtIEJhbmNvIMOabmljbyBTLkEuHDE1MSAtIEJhbmNvIE5vc3NhIENhaXhhIFMuQS4XMTc1IC0gQmFuY28gRmluYXNhIFMuQS4aMTg0IC0gQmFuY28gSXRhw7ogQkJBIFMuQS4hMjA0IC0gQmFua3BhciBCYW5jbyBNdWx0aXBsbyBTLkEuHDIwOCAtIEJhbmNvIFVCUyBQYWN0dWFsIFMuQS4XMjE0IC0gQmFuY28gRGliZW5zIFMuQS42MjE1IC0gQmFuY28gQ29tZXJjaWFsIGUgZGUgSW52ZXN0aW1lbnRvIFN1ZGFtZXJpcyBTLkEuHjIyMiAtIEJhbmNvIENhbHlvbiBCcmFzaWwgUy5BLhYyMjQgLSBCYW5jbyBGaWJyYSBTLkEuGDIyNSAtIEJhbmNvIEJyYXNjYW4gUy5BLiAyMjkgLSBCYW5jbyBDcnV6ZWlybyBkbyBTdWwgUy5BLiIyMzAgLSBVbmljYXJkIEJhbmNvIE3Dumx0aXBsbyBTLkEuGzIzMyAtIEJhbmNvIEdFIENhcGl0YWwgUy5BLhkyMzcgLSBCYW5jbyBCcmFkZXNjbyBTLkEuGzI0NiAtIEJhbmNvIEFCQyBCcmFzaWwgUy5BLikyNDggLSBCYW5jbyBCb2F2aXN0YSBJbnRlcmF0bMOibnRpY28gUy5BLiQyNDkgLSBCYW5jbyBJbnZlc3RjcmVkIFVuaWJhbmNvIFMuQS4YMjUwIC0gQmFuY28gU2NoYWhpbiBTLkEuGjI1MiAtIEJhbmNvIEZpbmludmVzdCBTLkEuGDI2MyAtIEJhbmNvIENhY2lxdWUgUy5BLhYyNjUgLSBCYW5jbyBGYXRvciBTLkEuFDMxOCAtIEJhbmNvIEJNRyBTLkEuJzMyMCAtIEJhbmNvIEluZHVzdHJpYWwgZSBDb21lcmNpYWwgUy5BLhYzNDEgLSBCYW5jbyBJdGHDuiBTLkEuFTM1NiAtIEJhbmNvIFJlYWwgUy5BLiwzNjYgLSBCYW5jbyBTb2Npw6l0w6kgR8OpbsOpcmFsZSBCcmFzaWwgUy5BLiEzNzAgLSBCYW5jbyBXZXN0TEIgZG8gQnJhc2lsIFMuQS4dMzc2IC0gQmFuY28gSi4gUC4gTW9yZ2FuIFMuQS4kMzg5IC0gQmFuY28gTWVyY2FudGlsIGRvIEJyYXNpbCBTLkEuFDM5NCAtIEJhbmNvIEJNQyBTLkEuLTM5OSAtIEhTQkMgQmFuayBCcmFzaWwgUy5BLiAtIEJhbmNvIE3Dumx0aXBsbzI0MDkgLSBVTklCQU5DTyAtIFVuacOjbyBkZSBCYW5jb3MgQnJhc2lsZWlyb3MgUy5BLhY0MjIgLSBCYW5jbyBTYWZyYSBTLkEuFjQ1MyAtIEJhbmNvIFJ1cmFsIFMuQS4vNDU2IC0gQmFuY28gZGUgVG9reW8tTWl0c3ViaXNoaSBVRkogQnJhc2lsIFMuQS4rNDY0IC0gQmFuY28gU3VtaXRvbW8gTWl0c3VpIEJyYXNpbGVpcm8gUy5BLhM0NzcgLSBDaXRpYmFuayBOLkEuGTQ3OSAtIEJhbmNvIEl0YcO6QmFuayBTLkEoNDg3IC0gRGV1dHNjaGUgQmFuayBTLkEuIC0gQmFuY28gQWxlbcOjbxk0ODggLSBKUE1vcmdhbiBDaGFzZSBCYW5rEzQ5MiAtIElORyBCYW5rIE4uVi4nNTA1IC0gQmFuY28gQ3JlZGl0IFN1aXNzZSAoQnJhc2lsKSBTLkEuIDYwMCAtIEJhbmNvIEx1c28gQnJhc2lsZWlybyBTLkEuJTYwNCAtIEJhbmNvIEluZHVzdHJpYWwgZG8gQnJhc2lsIFMuQS4TNjEwIC0gQmFuY28gVlIgUy5BLhk2MTEgLSBCYW5jbyBQYXVsaXN0YSBTLkEuGyA2MTIgLSBCYW5jbyBHdWFuYWJhcmEgUy5BLh02MjMgLSBCYW5jbyBQYW5hbWVyaWNhbm8gUy5BLhY2MjYgLSBCYW5jbyBGaWNzYSBTLkEuGTYzMCAtIEJhbmNvIEludGVyY2FwIFMuQS4bNjMzIC0gQmFuY28gUmVuZGltZW50byBTLkEuGzYzNCAtIEJhbmNvIFRyacOibmd1bG8gUy5BLhc2MzcgLSBCYW5jbyBTb2Zpc2EgUy5BLhg2MzggLSBCYW5jbyBQcm9zcGVyIFMuQS4ZNjQxIC0gQmFuY28gQWx2b3JhZGEgUy5BLhU2NDMgLSBCYW5jbyBQaW5lIFMuQS4pNjUyIC0gQmFuY28gSXRhw7ogSG9sZGluZyBGaW5hbmNlaXJhIFMuQS4ZNjUzIC0gQmFuY28gSW5kdXN2YWwgUy5BLhs2NTUgLSBCYW5jbyBWb3RvcmFudGltIFMuQS4ZNzA3IC0gQmFuY28gRGF5Y292YWwgUy5BLjc3MTkgLSBCYW5pZi1CYW5jbyBJbnRlcm5hY2lvbmFsIGRvIEZ1bmNoYWwgKEJyYXNpbClTLkEuFzczNCAtIEJhbmNvIEdlcmRhdSBTLkEuGTc0MCAtIEJhbmNvIEJhcmNsYXlzIFMuQS4aIDc0NSAtIEJhbmNvIENpdGliYW5rIFMuQS4WNzQ2IC0gQmFuY28gTW9kYWwgUy5BLi43NDcgLSBCYW5jbyBSYWJvYmFuayBJbnRlcm5hdGlvbmFsIEJyYXNpbCBTLkEuJDc0OCAtIEJhbmNvIENvb3BlcmF0aXZvIFNpY3JlZGkgUy5BLhg3NDkgLSBCYW5jbyBTaW1wbGVzIFMuQS4xNzUxIC0gRHJlc2RuZXIgQmFuayBCcmFzaWwgUy5BLiAtIEJhbmNvIE3Dumx0aXBsbyM3NTIgLSBCYW5jbyBCTlAgUGFyaWJhcyBCcmFzaWwgUy5BLi83NTUgLSBCYW5jbyBNZXJyaWxsIEx5bmNoIGRlIEludmVzdGltZW50b3MgUy5BLjEgNzU2IC0gQmFuY28gQ29vcGVyYXRpdm8gZG8gQnJhc2lsIFMuQS4gLSBCQU5DT09CGC0tLSAtIEJhbmNvIEJhbmtwYXIgUy5BLhUtLS0gLSBCYW5jbyBGaWF0IFMuQS47LS0tIC0gQkVTIEludmVzdGltZW50byBkbyBCcmFzaWwgUy5BLi1CYW5jbyBkZSBJbnZlc3RpbWVudG8mLS0tIC0gQmFuY28gZGUgTGFnZSBMYW5kZW4gQnJhc2lsIFMuQS4VLS0tIC0gQmFuY28gR01BQyBTLkEuGS0tLSAtIEJhbmNvIENpdGljYXJkIFMuQS4oLS0tIC0gQmFuY28gSXRhdWNyZWQgRmluYW5jaWFtZW50b3MgUy5BLhQtLS0gLSBCYW5jbyBJQk0gUy5BLhstLS0gLSBCYW5jbyBWb2xrc3dhZ2VuIFMuQS4VbxowMDEgLSBCYW5jbyBkbyBCcmFzaWwgUy5BLh0wMDMgLSBCYW5jbyBkYSBBbWF6w7RuaWEgUy5BLiYwMDQgLSBCYW5jbyBkbyBOb3JkZXN0ZSBkbyBCcmFzaWwgUy5BLjYwMjEgLSBCQU5FU1RFUyBTLkEuIEJhbmNvIGRvIEVzdGFkbyBkbyBFc3DDrXJpdG8gU2FudG8oMDI0IC0gQmFuY28gZGUgUGVybmFtYnVjbyBTLkEuIC0gQkFOREVQRRUwMjUgLSBCYW5jbyBBbGZhIFMuQS4sMDI3IC0gQmFuY28gZG8gRXN0YWRvIGRlIFNhbnRhIENhdGFyaW5hIFMuQS4XMDI5IC0gQmFuY28gQmFuZXJqIFMuQS4UMDMxIC0gQmFuY28gQmVnIFMuQS4aMDMzIC0gQmFuY28gU2FudGFuZGVyIFMuQS4dMDM2IC0gQmFuY28gQnJhZGVzY28gQkJJIFMuQS4jMDM3IC0gQmFuY28gZG8gRXN0YWRvIGRvIFBhcsOhIFMuQS4aMDM4IC0gQmFuY28gQmFuZXN0YWRvIFMuQS4YMDQwIC0gQmFuY28gQ2FyZ2lsbCBTLkEuLzA0MSAtIEJhbmNvIGRvIEVzdGFkbyBkbyBSaW8gR3JhbmRlIGRvIFN1bCBTLkEuFDA0NCAtIEJhbmNvIEJWQSBTLkEuHDA0NSAtIEJhbmNvIE9wcG9ydHVuaXR5IFMuQS4lMDQ3IC0gQmFuY28gZG8gRXN0YWRvIGRlIFNlcmdpcGUgUy5BLiQwNjIgLSBIaXBlcmNhcmQgQmFuY28gTcO6bHRpcGxvIFMuQS4kMDYzIC0gQmFuY28gSWJpIFMuQS4gQmFuY28gTcO6bHRpcGxvJTA2NSAtIExlbW9uIEJhbmsgQmFuY28gTcO6bHRpcGxvIFMuQS4kMDY5IC0gQlBOIEJyYXNpbCBCYW5jbyBNw7p0aXBsbyBTLkEuIzA3MCAtIEJSQiAtIEJhbmNvIGRlIEJyYXPDrWxpYSBTLkEuGzA3MiAtIEJhbmNvIFJ1cmFsIE1haXMgUy5BLiUwNzMgLSBCQiBCYW5jbyBQb3B1bGFyIGRvIEJyYXNpbCBTLkEuGTA3NCAtIEJhbmNvIEouIFNhZnJhIFMuQS49MDk2IC0gQmFuY28gQk0mRiBkZSBTZXJ2acOnb3MgZGUgTGlxdWlkYcOnw6NvIGUgQ3VzdMOzZGlhIFMuQR4xMDQgLSBDYWl4YSBFY29uw7RtaWNhIEZlZGVyYWwUMTA3IC0gQmFuY28gQkJNIFMuQS4XMTE2IC0gQmFuY28gw5puaWNvIFMuQS4cMTUxIC0gQmFuY28gTm9zc2EgQ2FpeGEgUy5BLhcxNzUgLSBCYW5jbyBGaW5hc2EgUy5BLhoxODQgLSBCYW5jbyBJdGHDuiBCQkEgUy5BLiEyMDQgLSBCYW5rcGFyIEJhbmNvIE11bHRpcGxvIFMuQS4cMjA4IC0gQmFuY28gVUJTIFBhY3R1YWwgUy5BLhcyMTQgLSBCYW5jbyBEaWJlbnMgUy5BLjYyMTUgLSBCYW5jbyBDb21lcmNpYWwgZSBkZSBJbnZlc3RpbWVudG8gU3VkYW1lcmlzIFMuQS4eMjIyIC0gQmFuY28gQ2FseW9uIEJyYXNpbCBTLkEuFjIyNCAtIEJhbmNvIEZpYnJhIFMuQS4YMjI1IC0gQmFuY28gQnJhc2NhbiBTLkEuIDIyOSAtIEJhbmNvIENydXplaXJvIGRvIFN1bCBTLkEuIjIzMCAtIFVuaWNhcmQgQmFuY28gTcO6bHRpcGxvIFMuQS4bMjMzIC0gQmFuY28gR0UgQ2FwaXRhbCBTLkEuGTIzNyAtIEJhbmNvIEJyYWRlc2NvIFMuQS4bMjQ2IC0gQmFuY28gQUJDIEJyYXNpbCBTLkEuKTI0OCAtIEJhbmNvIEJvYXZpc3RhIEludGVyYXRsw6JudGljbyBTLkEuJDI0OSAtIEJhbmNvIEludmVzdGNyZWQgVW5pYmFuY28gUy5BLhgyNTAgLSBCYW5jbyBTY2hhaGluIFMuQS4aMjUyIC0gQmFuY28gRmluaW52ZXN0IFMuQS4YMjYzIC0gQmFuY28gQ2FjaXF1ZSBTLkEuFjI2NSAtIEJhbmNvIEZhdG9yIFMuQS4UMzE4IC0gQmFuY28gQk1HIFMuQS4nMzIwIC0gQmFuY28gSW5kdXN0cmlhbCBlIENvbWVyY2lhbCBTLkEuFjM0MSAtIEJhbmNvIEl0YcO6IFMuQS4VMzU2IC0gQmFuY28gUmVhbCBTLkEuLDM2NiAtIEJhbmNvIFNvY2nDqXTDqSBHw6luw6lyYWxlIEJyYXNpbCBTLkEuITM3MCAtIEJhbmNvIFdlc3RMQiBkbyBCcmFzaWwgUy5BLh0zNzYgLSBCYW5jbyBKLiBQLiBNb3JnYW4gUy5BLiQzODkgLSBCYW5jbyBNZXJjYW50aWwgZG8gQnJhc2lsIFMuQS4UMzk0IC0gQmFuY28gQk1DIFMuQS4tMzk5IC0gSFNCQyBCYW5rIEJyYXNpbCBTLkEuIC0gQmFuY28gTcO6bHRpcGxvMjQwOSAtIFVOSUJBTkNPIC0gVW5pw6NvIGRlIEJhbmNvcyBCcmFzaWxlaXJvcyBTLkEuFjQyMiAtIEJhbmNvIFNhZnJhIFMuQS4WNDUzIC0gQmFuY28gUnVyYWwgUy5BLi80NTYgLSBCYW5jbyBkZSBUb2t5by1NaXRzdWJpc2hpIFVGSiBCcmFzaWwgUy5BLis0NjQgLSBCYW5jbyBTdW1pdG9tbyBNaXRzdWkgQnJhc2lsZWlybyBTLkEuEzQ3NyAtIENpdGliYW5rIE4uQS4ZNDc5IC0gQmFuY28gSXRhw7pCYW5rIFMuQSg0ODcgLSBEZXV0c2NoZSBCYW5rIFMuQS4gLSBCYW5jbyBBbGVtw6NvGTQ4OCAtIEpQTW9yZ2FuIENoYXNlIEJhbmsTNDkyIC0gSU5HIEJhbmsgTi5WLic1MDUgLSBCYW5jbyBDcmVkaXQgU3Vpc3NlIChCcmFzaWwpIFMuQS4gNjAwIC0gQmFuY28gTHVzbyBCcmFzaWxlaXJvIFMuQS4lNjA0IC0gQmFuY28gSW5kdXN0cmlhbCBkbyBCcmFzaWwgUy5BLhM2MTAgLSBCYW5jbyBWUiBTLkEuGTYxMSAtIEJhbmNvIFBhdWxpc3RhIFMuQS4bIDYxMiAtIEJhbmNvIEd1YW5hYmFyYSBTLkEuHTYyMyAtIEJhbmNvIFBhbmFtZXJpY2FubyBTLkEuFjYyNiAtIEJhbmNvIEZpY3NhIFMuQS4ZNjMwIC0gQmFuY28gSW50ZXJjYXAgUy5BLhs2MzMgLSBCYW5jbyBSZW5kaW1lbnRvIFMuQS4bNjM0IC0gQmFuY28gVHJpw6JuZ3VsbyBTLkEuFzYzNyAtIEJhbmNvIFNvZmlzYSBTLkEuGDYzOCAtIEJhbmNvIFByb3NwZXIgUy5BLhk2NDEgLSBCYW5jbyBBbHZvcmFkYSBTLkEuFTY0MyAtIEJhbmNvIFBpbmUgUy5BLik2NTIgLSBCYW5jbyBJdGHDuiBIb2xkaW5nIEZpbmFuY2VpcmEgUy5BLhk2NTMgLSBCYW5jbyBJbmR1c3ZhbCBTLkEuGzY1NSAtIEJhbmNvIFZvdG9yYW50aW0gUy5BLhk3MDcgLSBCYW5jbyBEYXljb3ZhbCBTLkEuNzcxOSAtIEJhbmlmLUJhbmNvIEludGVybmFjaW9uYWwgZG8gRnVuY2hhbCAoQnJhc2lsKVMuQS4XNzM0IC0gQmFuY28gR2VyZGF1IFMuQS4ZNzQwIC0gQmFuY28gQmFyY2xheXMgUy5BLhogNzQ1IC0gQmFuY28gQ2l0aWJhbmsgUy5BLhY3NDYgLSBCYW5jbyBNb2RhbCBTLkEuLjc0NyAtIEJhbmNvIFJhYm9iYW5rIEludGVybmF0aW9uYWwgQnJhc2lsIFMuQS4kNzQ4IC0gQmFuY28gQ29vcGVyYXRpdm8gU2ljcmVkaSBTLkEuGDc0OSAtIEJhbmNvIFNpbXBsZXMgUy5BLjE3NTEgLSBEcmVzZG5lciBCYW5rIEJyYXNpbCBTLkEuIC0gQmFuY28gTcO6bHRpcGxvIzc1MiAtIEJhbmNvIEJOUCBQYXJpYmFzIEJyYXNpbCBTLkEuLzc1NSAtIEJhbmNvIE1lcnJpbGwgTHluY2ggZGUgSW52ZXN0aW1lbnRvcyBTLkEuMSA3NTYgLSBCYW5jbyBDb29wZXJhdGl2byBkbyBCcmFzaWwgUy5BLiAtIEJBTkNPT0IYLS0tIC0gQmFuY28gQmFua3BhciBTLkEuFS0tLSAtIEJhbmNvIEZpYXQgUy5BLjstLS0gLSBCRVMgSW52ZXN0aW1lbnRvIGRvIEJyYXNpbCBTLkEuLUJhbmNvIGRlIEludmVzdGltZW50byYtLS0gLSBCYW5jbyBkZSBMYWdlIExhbmRlbiBCcmFzaWwgUy5BLhUtLS0gLSBCYW5jbyBHTUFDIFMuQS4ZLS0tIC0gQmFuY28gQ2l0aWNhcmQgUy5BLigtLS0gLSBCYW5jbyBJdGF1Y3JlZCBGaW5hbmNpYW1lbnRvcyBTLkEuFC0tLSAtIEJhbmNvIElCTSBTLkEuGy0tLSAtIEJhbmNvIFZvbGtzd2FnZW4gUy5BLhQrA29nZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2cWAWZkAjMPD2QWAh8GBRltYXNjYXJhKHRoaXMsIHNvTnVtZXJvcyk7ZAI5Dw9kFgIfBgUZbWFzY2FyYSh0aGlzLCBzb051bWVyb3MpO2QCRw8PFgIfCgIOFgIfBgUSbWFzY2FyYSh0aGlzLGNwZik7ZAJLDw8WAh8JBQ1DUEYgaW52w6FsaWRvZGQCTg8WAh8BBQhjaGVja2JveGQCUg8PFgQfAgUGR3JhdmFyHwsFBkdyYXZhcmRkGAEFHl9fQ29udHJvbHNSZXF1aXJlUG9zdEJhY2tLZXlfXxYHBTRjdGwwMCRDb250ZXVkbyRjdHJsQ2FkYXN0cm9DbGllbnRlJHJhZGlvUGVzc29hRmlzaWNhBTZjdGwwMCRDb250ZXVkbyRjdHJsQ2FkYXN0cm9DbGllbnRlJHJhZGlvUGVzc29hSnVyaWRpY2EFNmN0bDAwJENvbnRldWRvJGN0cmxDYWRhc3Ryb0NsaWVudGUkcmFkaW9QZXNzb2FKdXJpZGljYQUtY3RsMDAkQ29udGV1ZG8kY3RybENhZGFzdHJvQ2xpZW50ZSRyYWRpb1NleG9NBS1jdGwwMCRDb250ZXVkbyRjdHJsQ2FkYXN0cm9DbGllbnRlJHJhZGlvU2V4b0YFKmN0bDAwJENvbnRldWRvJGN0cmxDYWRhc3Ryb0NsaWVudGUkY2tiTmV3cwUpY3RsMDAkQ29udGV1ZG8kY3RybENhZGFzdHJvQ2xpZW50ZSRja2JTTVPnI8hoyvaX6jBtOtlA6FoI1hfv0A== 
type=hidden name=__VIEWSTATE> </DIV>
<SCRIPT type=text/javascript>
//<![CDATA[
var theForm = document.forms['aspnetForm'];
if (!theForm) {
    theForm = document.aspnetForm;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</SCRIPT>

<SCRIPT type=text/javascript src="cadastro_arquivos/WebResource.axd"></SCRIPT>

<SCRIPT type=text/javascript 
src="cadastro_arquivos/ScriptResource.axd"></SCRIPT>

<SCRIPT type=text/javascript>
//<![CDATA[
var __cultureInfo = '{"name":"pt-BR","numberFormat":{"CurrencyDecimalDigits":2,"CurrencyDecimalSeparator":",","IsReadOnly":true,"CurrencyGroupSizes":[3],"NumberGroupSizes":[3],"PercentGroupSizes":[3],"CurrencyGroupSeparator":".","CurrencySymbol":"R$","NaNSymbol":"NaN (Não é um número)","CurrencyNegativePattern":9,"NumberNegativePattern":1,"PercentPositivePattern":1,"PercentNegativePattern":1,"NegativeInfinitySymbol":"-Infinito","NegativeSign":"-","NumberDecimalDigits":2,"NumberDecimalSeparator":",","NumberGroupSeparator":".","CurrencyPositivePattern":2,"PositiveInfinitySymbol":"+Infinito","PositiveSign":"+","PercentDecimalDigits":2,"PercentDecimalSeparator":",","PercentGroupSeparator":".","PercentSymbol":"%","PerMilleSymbol":"‰","NativeDigits":["0","1","2","3","4","5","6","7","8","9"],"DigitSubstitution":1},"dateTimeFormat":{"AMDesignator":"","Calendar":{"MinSupportedDateTime":"\/Date(-62135589600000)\/","MaxSupportedDateTime":"\/Date(253402300799999)\/","AlgorithmType":1,"CalendarType":1,"Eras":[1],"TwoDigitYearMax":2029,"IsReadOnly":true},"DateSeparator":"/","FirstDayOfWeek":0,"CalendarWeekRule":0,"FullDateTimePattern":"dddd, d\u0027 de \u0027MMMM\u0027 de \u0027yyyy HH:mm:ss","LongDatePattern":"dddd, d\u0027 de \u0027MMMM\u0027 de \u0027yyyy","LongTimePattern":"HH:mm:ss","MonthDayPattern":"dd\u0027 de \u0027MMMM","PMDesignator":"","RFC1123Pattern":"ddd, dd MMM yyyy HH\u0027:\u0027mm\u0027:\u0027ss \u0027GMT\u0027","ShortDatePattern":"dd/MM/yyyy","ShortTimePattern":"H:mm","SortableDateTimePattern":"yyyy\u0027-\u0027MM\u0027-\u0027dd\u0027T\u0027HH\u0027:\u0027mm\u0027:\u0027ss","TimeSeparator":":","UniversalSortableDateTimePattern":"yyyy\u0027-\u0027MM\u0027-\u0027dd HH\u0027:\u0027mm\u0027:\u0027ss\u0027Z\u0027","YearMonthPattern":"MMMM\u0027 de \u0027yyyy","AbbreviatedDayNames":["dom","seg","ter","qua","qui","sex","sáb"],"ShortestDayNames":["dom","seg","ter","qua","qui","sex","sáb"],"DayNames":["domingo","segunda-feira","terça-feira","quarta-feira","quinta-feira","sexta-feira","sábado"],"AbbreviatedMonthNames":["jan","fev","mar","abr","mai","jun","jul","ago","set","out","nov","dez",""],"MonthNames":["janeiro","fevereiro","março","abril","maio","junho","julho","agosto","setembro","outubro","novembro","dezembro",""],"IsReadOnly":true,"NativeCalendarName":"Calendário gregoriano","AbbreviatedMonthGenitiveNames":["jan","fev","mar","abr","mai","jun","jul","ago","set","out","nov","dez",""],"MonthGenitiveNames":["janeiro","fevereiro","março","abril","maio","junho","julho","agosto","setembro","outubro","novembro","dezembro",""]}}';//]]>
</SCRIPT>

<SCRIPT type=text/javascript src="cadastro_arquivos/MicrosoftAjax.js"></SCRIPT>

<SCRIPT type=text/javascript 
src="cadastro_arquivos/MicrosoftAjaxWebForms.js"></SCRIPT>

<SCRIPT type=text/javascript>
//<![CDATA[
function WebForm_OnSubmit() {
checkFormValidation('ctl00_Conteudo_lblErro','', 'LogIn');checkFormValidation('ctl00_Conteudo_ctrlCadastroCliente_lblErroCad','ctl00_Conteudo_ctrlCadastroCliente_txtSexo|ctl00_Conteudo_ctrlCadastroCliente_spanSexM#ctl00_Conteudo_ctrlCadastroCliente_txtSexo|ctl00_Conteudo_ctrlCadastroCliente_spanSexF#ctl00_Conteudo_ctrlCadastroCliente_txtDataNasc|ctl00_Conteudo_ctrlCadastroCliente_txtDataNascDia#ctl00_Conteudo_ctrlCadastroCliente_txtDataNasc|ctl00_Conteudo_ctrlCadastroCliente_txtDataNascMes#ctl00_Conteudo_ctrlCadastroCliente_txtDataNasc|ctl00_Conteudo_ctrlCadastroCliente_txtDataNascAno#', 'cadCliente');if (typeof(ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) return false;
return true;
}
//]]>
</SCRIPT>

<DIV><INPUT id=__EVENTVALIDATION 
value=/wEWIAL9xLTFDAKq66BdApeJicAIAsfo1LQGAoeCra0LAuPi9/QMAuyJntgMAuK/pqUJApuutpcMApyP3qEBAuW5wogJAuCGhjYC2KvJ1goC5tjTvQYCzPXJkg0CzPW1kg0CsqLj8goCio++nQgCio+6nQgCh+vYvQ0Cs+Cykw8Cr6m9lAEClqeH+AgCw8n6gw8Clo+CnAgCiP+l4wICt8f7+g4CoquQ2g8Cyu6Y6Q0C0YfKzw8CjqDLzA4CmYe+2wY947PPGRWXHKSvd3FPWZkKWNugHQ== 
type=hidden name=__EVENTVALIDATION> </DIV>
<SCRIPT type=text/javascript>
//<![CDATA[
Sys.WebForms.PageRequestManager._initialize('ctl00$MasterPageScriptManager', document.getElementById('aspnetForm'));
Sys.WebForms.PageRequestManager.getInstance()._updateControls(['tctl00$Conteudo$ctrlCadastroCliente$upnlBanco'], [], [], 90);
//]]>
</SCRIPT>

<DIV id=header>
<DIV id=ctl00_TopBar_TopBar1_outerHeader class=header>
<DIV id=ctl00_TopBar_TopBar1_divHeader>
<DIV class=topHeader><A class=logo title=Extra.com.br 
href="http://www.extra.com.br/">Extra.com.br</A> 
<DIV class=ident>
<DIV id=ctl00_TopBar_TopBar1_divMenuWelcome class=welcome></DIV>
<P class=meuCadastro></P></DIV>
<UL class=servicos>
  <LI class=listaCasamento><A title="Lista de Casamento" 
  href="http://www.extra.com.br/Site/ListaGerenciadaCasamentoWelCome.aspx">Lista 
  de Casamento</A></LI>
  <LI class=cartao><A 
  href="http://www.extra.com.br/Institucional/CartaoExtra.aspx"><SPAN 
  class=pedidoCartao><STRONG class=nomeCartao>Cartão Extra</STRONG> <SPAN>Peça 
  já o seu</SPAN></SPAN></A></LI>
  <LI class=seguro><A title="Verisign Secured" 
  onclick="window.open('https://seal.verisign.com/splash?form_file=fdf/splash.fdf&amp;dn=CARRINHO.EXTRA.COM.BR&amp;lang=pt','verisign','location=yes,status=yes,resizable=yes,scrollbars=yes,width=560,height=500');" 
  href="https://carrinho.extra.com.br/Site/Login.aspx#">100% seguro</A></LI>
  <LI class=atendimento><A title="Ajuda Online" 
  onclick="return pop('http://189.89.195.169/chat/dados.php',400,450, true)" 
  href="javascript: void(0);">Ajuda Online</A></LI>
  <LI class=atendimento><A title=Atendimento 
  href="http://www.extra.com.br/Atendimento/Atendimento.aspx">Atendimento: 
  4003-3383</A></LI>
  <LI class=pedido><A title="Meus pedidos" 
  href="https://carrinho.extra.com.br/Site/MeusPedidos.aspx">Meus 
  Pedidos</A></LI>
  <LI class=lojas><A title="Nossas Lojas" 
  href="http://www.extra.com.br/Atendimento/LocalizadorLojas.aspx">Nossas 
  Lojas</A></LI></UL>
<UL class=menuUsuario>
  <LI class=televendas><A id=ctl00_TopBar_TopBar1_popupDetalhes class="lnkPop " 
  title="" 
  href="https://carrinho.extra.com.br/Site/PopUpMensagem.aspx?XmlTitulo=TituloPopupHelpTelevendas&amp;XmlConteudo=ConteudoPopupHelpTelevendas&amp;KeepThis=true&amp;TB_iframe=true&amp;height=380&amp;width=610">TeleVendas 
  PontoFrio.com: <STRONG>4002 3050</STRONG></A> </LI></UL>
<DIV class=cesta>
<DIV id=spnCarrinho><A id=ctl00_TopBar_TopBar1_lnkCarrinho title="Meu carrinho" 
href="http://carrinho.extra.com.br/Site/Carrinho.aspx"><SPAN>Meu carrinho</SPAN> 
<SPAN id=itensCarrinho class=itensCarrinho></SPAN></A></DIV></DIV>
<HR>
</DIV><!-- Menu -->
<DIV id=ctl00_TopBar_TopBar1_lblMenuSuperior class=menuWrap>
<UL id=menu01 class=headerMenu>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl00_liDepartamento 
  class="  mn-informatica"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl00_lnkDepartamento 
  title=Informática 
  href="http://www.extra.com.br/Informatica/?Filtro=C56"><B>Informática</B></A></LI>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl01_liDepartamento 
  class="  mn-eletronicos"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl01_lnkDepartamento 
  title=Eletrônicos 
  href="http://www.extra.com.br/Eletronicos/?Filtro=C1"><B>Eletrônicos</B></A></LI>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl02_liDepartamento 
  class="  mn-moveis"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl02_lnkDepartamento title=Móveis 
  href="http://www.extra.com.br/Moveis/?Filtro=C93"><B>Móveis</B></A></LI>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl03_liDepartamento 
  class="  mn-eletrodomesticos"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl03_lnkDepartamento 
  title=Eletrodomésticos 
  href="http://www.extra.com.br/eletrodomesticos/?Filtro=C13"><B>Eletrodomésticos</B></A></LI>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl04_liDepartamento 
  class="  mn-eletroportateis"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl04_lnkDepartamento 
  title=Eletroportáteis 
  href="http://www.extra.com.br/Eletroportateis/?Filtro=C73"><B>Eletroportáteis</B></A></LI>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl05_liDepartamento 
  class=" type1 mn-telefones---celulares"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl05_lnkDepartamento 
  title="Telefones &amp; Celulares" 
  href="http://www.extra.com.br/TelefoneseCelulares/?Filtro=C38"><B>Telefones 
  &amp; Celulares</B></A></LI>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl06_liDepartamento 
  class="  mn-cine---foto"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl06_lnkDepartamento 
  title="Cine &amp; Foto" 
  href="http://www.extra.com.br/CineFoto/?Filtro=C29"><B>Cine &amp; 
  Foto</B></A></LI>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl07_liDepartamento 
  class="  mn-games"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl07_lnkDepartamento title=Games 
  href="http://www.extra.com.br/Games/?Filtro=C336"><B>Games</B></A></LI>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl08_liDepartamento 
  class=" type1 mn-esporte---lazer"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl08_lnkDepartamento 
  title="Esporte &amp; Lazer" 
  href="http://www.extra.com.br/EsporteLazer/?Filtro=C418"><B>Esporte &amp; 
  Lazer</B></A></LI>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl09_liDepartamento 
  class="  mn-ferramentas"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl09_lnkDepartamento 
  title=Ferramentas 
  href="http://www.extra.com.br/Ferramentas/?Filtro=C827"><B>Ferramentas</B></A></LI>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl10_liDepartamento 
  class=" type1 mn-utilidades-domesticas"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl10_lnkDepartamento 
  title="Utilidades Domésticas" 
  href="http://www.extra.com.br/UtilidadesDomesticas/?Filtro=C371"><B>Utilidades 
  Domésticas</B></A></LI>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl11_liDepartamento 
  class="  mn-livros"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl11_lnkDepartamento title=Livros 
  href="http://www.extra.com.br/livros/?Filtro=C484"><B>Livros</B></A></LI>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl12_liDepartamento 
  class=" type1 mn-dvds-e-blu-ray"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl12_lnkDepartamento 
  title="DVDs e Blu-Ray" 
  href="http://www.extra.com.br/dvdsebluray/?Filtro=C833"><B>DVDs e 
  Blu-Ray</B></A></LI>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl13_liDepartamento 
  class="  mn-bebes"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl13_lnkDepartamento title=Bebês 
  href="http://www.extra.com.br/bebes/?Filtro=C983"><B>Bebês</B></A></LI>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl14_liDepartamento 
  class="  mn-brinquedos"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl14_lnkDepartamento title=Brinquedos 
  href="http://www.extra.com.br/brinquedos/?Filtro=C977"><B>Brinquedos</B></A></LI>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl15_liDepartamento 
  class=" type1 mn-beleza---saude"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl15_lnkDepartamento 
  title="Beleza &amp; Saúde" 
  href="http://www.extra.com.br/BelezaSaude/?Filtro=C102"><B>Beleza &amp; 
  Saúde</B></A></LI>
  <LI id=ctl00_TopBar_TopBar1_rptDepartamento_ctl16_liDepartamento 
  class="  mn-automotivo"><A 
  id=ctl00_TopBar_TopBar1_rptDepartamento_ctl16_lnkDepartamento title=Automotivo 
  href="http://www.extra.com.br/automotivo/?Filtro=C836"><B>Automotivo</B></A></LI></UL>
<DIV id=ctl00_TopBar_TopBar1_pnlSubMenu></DIV></DIV></DIV>
<HR>
</DIV></DIV>
<DIV class=conteudo>
<H1 class=tit>Identificação</H1>
<DIV id=ctl00_Conteudo_divLogin class="areaLogin box half first">
<H2 class=top>Já sou cliente do Extra.com.br</H2>
<DIV style="DISPLAY: none" id=ctl00_Conteudo_lblErro class=erro 
validationGroup="LogIn">
<P><STRONG>Atenção:</STRONG> Os campos marcados em vermelho apresentaram 
problemas no preenchimento.</P>
<DIV style="DISPLAY: none; COLOR: red" id=ctl00_Conteudo_vldSummary></DIV></DIV>
<DIV class=login>
<P class=info>Para acessar sua conta, por favor, preencha os campos abaixo:</P>
<TABLE style="BORDER-COLLAPSE: collapse" id=ctl00_Conteudo_ctrLogin border=0 
cellSpacing=0 cellPadding=0>
  <TBODY>
  <TR>
    <TD>
      <FIELDSET>
      <UL>
        <LI class=iGrupo><LABEL class=email>Informe seu e-mail:</LABEL> <INPUT 
        id=ctl00_Conteudo_ctrLogin_UserName tabIndex=1 type=text 
        name=ctl00$Conteudo$ctrLogin$UserName> <SPAN 
        style="DISPLAY: none; COLOR: red" 
        id=ctl00_Conteudo_ctrLogin_UserNameRequired></SPAN><SPAN 
        style="DISPLAY: none; COLOR: red" 
        id=ctl00_Conteudo_ctrLogin_RgxEmailValidator></SPAN><SPAN 
        style="DISPLAY: none; COLOR: red" 
        id=ctl00_Conteudo_ctrLogin_cstLoginValidation></SPAN><SPAN 
        class="ind emailMudar"><A id=ctl00_Conteudo_ctrLogin_lnkMudancaEmail 
        class=lnkMudancaEmail title="Meu e-mail mudou" 
        href="https://carrinho.extra.com.br/Site/MeuEmailMudou.aspx">Meu e-mail 
        mudou</A></SPAN> <SPAN class="ind emailRecuperar"><A 
        id=ctl00_Conteudo_ctrLogin_lnkEsqueciEmail class=lnkEsqueciEmail 
        title="Esqueci meu e-mail" 
        href="https://carrinho.extra.com.br/Site/EsqueciMeuEmail.aspx">Esqueci 
        meu e-mail</A></SPAN> </LI>
        <LI class=iGrupo><LABEL class=senha>Informe sua senha:</LABEL> <INPUT 
        id=ctl00_Conteudo_ctrLogin_Password tabIndex=2 maxLength=15 
        type=password name=ctl00$Conteudo$ctrLogin$Password> <SPAN 
        style="DISPLAY: none; COLOR: red" 
        id=ctl00_Conteudo_ctrLogin_PasswordRequired></SPAN><SPAN class=ind><A 
        id=ctl00_Conteudo_ctrLogin_lnkEsqueciMinhaSenha class=lnkEsqueciSenha 
        title="Esqueci minha senha" 
        href="https://carrinho.extra.com.br/Site/EsqueciMinhaSenha.aspx">Esqueci 
        minha senha</A></SPAN> </LI></UL>
      <DIV class="iGrupo efetuarLogin"><INPUT id=ctl00_Conteudo_ctrLogin_Login class=bt title=Continuar onclick='javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("ctl00$Conteudo$ctrLogin$Login", "", true, "LogIn", "", false, false))' value=Continuar type=submit name=ctl00$Conteudo$ctrLogin$Login> 
      </DIV></FIELDSET> </TD></TR></TBODY></TABLE>
<DIV class=problemas><STRONG>Problemas para acessar a sua conta?</STRONG> 
<UL class=ind>
  <LI><A id=ctl00_Conteudo_lnkCentralAtendimento title=Atendimento 
  href="http://www.extra.com.br/Atendimento/Atendimento.aspx">Atendimento</A></LI></UL></DIV></DIV></DIV>
<SCRIPT type=text/javascript>
    function OpenPopUpCorreios() {
        var urlCorreios = 'http://www.correios.com.br/servicos/cep/cep_loc_log.cfm/';
        window.open(urlCorreios, 'Correios', 'left=50,top=20,height=650,width=900')
    }
</SCRIPT>

<DIV id=mainContent class="areaCadastro half second">
<DIV id=ctl00_Conteudo_ctrlCadastroCliente_upnlBanco>
<DIV class=box>
<H2 class=top>Quero ser cliente do Extra.com.br</H2>
<DIV class=identificacao>
<DIV style="DISPLAY: none" id=ctl00_Conteudo_ctrlCadastroCliente_lblErroCad 
class=erro validationGroup="cadCliente">
<P><STRONG>Atenção:</STRONG> Os campos marcados em vermelho apresentaram 
problemas no preenchimento.</P>
<DIV style="DISPLAY: none; COLOR: red" 
id=ctl00_Conteudo_ctrlCadastroCliente_vldSummary></DIV></DIV>
<P class=info>Por favor, preencha os dados para criar sua conta no 
Extra.com.<BR>Os campos com * são obrigatórios.</P>
<p class=info><a href="#" onclick="return ativarAutenticacao();"><strong>Caso j&aacute; tenha um cadastro no Registro Digital, clique aqui<strong></a></p>
<div id="registroDigital" title="Autentica&ccedil;&atilde;o"></div>
<FIELDSET class=frmTipoPessoa><LABEL class=pessoaFisica><SPAN class=radio><INPUT 
id=ctl00_Conteudo_ctrlCadastroCliente_radioPessoaFisica value=radioPessoaFisica 
CHECKED type=radio name=ctl00$Conteudo$ctrlCadastroCliente$TipoPessoa></SPAN> 
<SPAN>Pessoa Física</SPAN> </LABEL><LABEL class=pessoaJuridica><SPAN 
class=radio><INPUT id=ctl00_Conteudo_ctrlCadastroCliente_radioPessoaJuridica 
onclick="javascript:setTimeout('__doPostBack(\'ctl00$Conteudo$ctrlCadastroCliente$radioPessoaJuridica\',\'\')', 0)" 
value=radioPessoaJuridica type=radio 
name=ctl00$Conteudo$ctrlCadastroCliente$TipoPessoa></SPAN> <SPAN>Pessoa 
Jurídica</SPAN> </LABEL></FIELDSET> 
<FIELDSET class=frmPessoaFisica><LEGEND>Seus dados pessoais:</LEGEND>
<UL>
  <LI class="grp fNome"><LABEL class=nome>Nome:<SPAN class=obr>*</SPAN>:</LABEL> 
  <INPUT id=ctl00_Conteudo_ctrlCadastroCliente_txtNome maxLength=40 type=text name=ctl00$Conteudo$ctrlCadastroCliente$txtNome value="<%=(ret==null?"":ret.get(0)) %>"> <SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_ReqNomeValidator></SPAN></LI>
  <LI class="grp fSobrenome"><LABEL>Sobrenome<SPAN class=obr>*</SPAN>:</LABEL> 
  <INPUT id=ctl00_Conteudo_ctrlCadastroCliente_txtSobrenome type=text 
  name=ctl00$Conteudo$ctrlCadastroCliente$txtSobrenome> <SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_ReqSobreNomeValidator></SPAN></LI>
  <LI class="grp fApelido"><LABEL><SPAN>Apelido:</SPAN></LABEL> <INPUT 
  id=ctl00_Conteudo_ctrlCadastroCliente_txtApelido type=text 
  name=ctl00$Conteudo$ctrlCadastroCliente$txtApelido> </LI>
  <LI id=ctl00_Conteudo_ctrlCadastroCliente_pHtmlCpf class="grp fCpf"><LABEL 
  id=ctl00_Conteudo_ctrlCadastroCliente_lblCPF class=cpf>CPF<SPAN 
  class=obr>*</SPAN>:</LABEL> <INPUT onblur=mascara(this,cpf); 
  id=ctl00_Conteudo_ctrlCadastroCliente_txtCpf onfocus="return true;" 
  onkeypress=mascara(this,cpf); 
  onkeyup="SaltaCampo(ctl00_Conteudo_ctrlCadastroCliente_txtCpf, ctl00_Conteudo_ctrlCadastroCliente_txtDataNascDia, 14, event);" 
  maxLength=14 size=14 type=text name=ctl00$Conteudo$ctrlCadastroCliente$txtCpf 
  autocomplete="off" value="<%=(ret==null?"":ret.get(1)) %>" > <SPAN class=ind><A 
  id=ctl00_Conteudo_ctrlCadastroCliente_lnkDuvidaCNPJ class="lnkPop cpf" 
  title="Por que pedimos seu CPF?" 
  href="https://carrinho.extra.com.br/Site/PopUpMensagem.aspx?IdMensagem=1&amp;KeepThis=true&amp;TB_iframe=true&amp;height=400&amp;width=610">Por 
  que pedimos seu CPF?</A></SPAN> <SPAN style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_ReqCPFValidator></SPAN><SPAN 
  style="VISIBILITY: hidden; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator2></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator class=erros></SPAN></LI>
  <LI class="grp fData fDataNasc"><LABEL class=nascimentoDia>Data de 
  nascimento<SPAN class=obr>*</SPAN>:</LABEL> <INPUT 
  onblur=RefreshDataNascimento() style="WIDTH: 20px" 
  id=ctl00_Conteudo_ctrlCadastroCliente_txtDataNascDia class=dia 
  onkeypress=mascara(this,soNumeros); 
  onkeyup="SaltaCampo(ctl00_Conteudo_ctrlCadastroCliente_txtDataNascDia, ctl00_Conteudo_ctrlCadastroCliente_txtDataNascMes, 2, event);" 
  maxLength=2 type=text name=ctl00$Conteudo$ctrlCadastroCliente$txtDataNascDia> 
  <INPUT onblur=RefreshDataNascimento() style="WIDTH: 20px" 
  id=ctl00_Conteudo_ctrlCadastroCliente_txtDataNascMes class=mes 
  onkeypress=mascara(this,soNumeros); 
  onkeyup=SaltaCampo(ctl00_Conteudo_ctrlCadastroCliente_txtDataNascMes,ctl00_Conteudo_ctrlCadastroCliente_txtDataNascAno,2,event); 
  maxLength=2 type=text name=ctl00$Conteudo$ctrlCadastroCliente$txtDataNascMes> 
  <INPUT onblur=RefreshDataNascimento() style="WIDTH: 40px" 
  id=ctl00_Conteudo_ctrlCadastroCliente_txtDataNascAno class=ano 
  onkeypress=mascara(this,soNumeros); 
  onkeyup=SaltaCampo(ctl00_Conteudo_ctrlCadastroCliente_txtDataNascAno,ctl00_Conteudo_ctrlCadastroCliente_radioSexoM,4,event); 
  maxLength=4 type=text name=ctl00$Conteudo$ctrlCadastroCliente$txtDataNascAno> 
  <INPUT style="DISPLAY: none" id=ctl00_Conteudo_ctrlCadastroCliente_txtDataNasc 
  type=text name=ctl00$Conteudo$ctrlCadastroCliente$txtDataNasc> <SPAN 
  class=formato>dd/mm/aaaa</SPAN> <SPAN style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_CstDataNascValidator></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_ReqDataNascValidator></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_RanDataNascAno></SPAN></LI>
  <LI class="grp fRadio fSexo"><LABEL for=ctl00_Conteudo_radioSexoM>Sexo<SPAN 
  class=obr>*</SPAN>:</LABEL> <LABEL class=sexoM><INPUT 
  id=ctl00_Conteudo_ctrlCadastroCliente_radioSexoM class="masc radio" 
  onclick="document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_txtSexo').value= this.value" 
  value=radioSexoM type=radio name=ctl00$Conteudo$ctrlCadastroCliente$ 
  groupname="radioSexo"> <SPAN id=ctl00_Conteudo_ctrlCadastroCliente_spanSexM 
  class=sex-m>Masculino</SPAN> </LABEL><LABEL class=sexoF><INPUT 
  id=ctl00_Conteudo_ctrlCadastroCliente_radioSexoF class="fem radio" 
  onclick="document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_txtSexo').value= this.value" 
  value=radioSexoF type=radio name=ctl00$Conteudo$ctrlCadastroCliente$ 
  groupname="radioSexo"> <SPAN id=ctl00_Conteudo_ctrlCadastroCliente_spanSexF 
  class=sex-f>Feminino</SPAN> </LABEL><INPUT style="DISPLAY: none" 
  id=ctl00_Conteudo_ctrlCadastroCliente_txtSexo type=text 
  name=ctl00$Conteudo$ctrlCadastroCliente$txtSexo> <SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_reqSexoValidator></SPAN></LI>
  <LI id=ctl00_Conteudo_ctrlCadastroCliente_pHtmlCep 
  class="grp fMulti fCep"><LABEL class=prefixo>CEP<SPAN 
  class=obr>*</SPAN>:</LABEL> <SPAN class=cepWrapper><SPAN 
  id=ctl00_Conteudo_ctrlCadastroCliente_lblCepPjPrefixo class=prefixo>
  <INPUT id=ctl00_Conteudo_ctrlCadastroCliente_txtCep1 class=postal1 
  onkeypress=mascara(this,soNumeros); 
  onkeyup=SaltaCampo(ctl00_Conteudo_ctrlCadastroCliente_txtCep1,ctl00_Conteudo_ctrlCadastroCliente_txtCep2,5,event); 
  maxLength=5
  value="<%=ret.get(4) %>"
  type=text name=ctl00$Conteudo$ctrlCadastroCliente$txtCep1></SPAN> 
  <SPAN id=ctl00_Conteudo_ctrlCadastroCliente_lblCepPjSufixo class=sufixo><INPUT 
  id=ctl00_Conteudo_ctrlCadastroCliente_txtCep2 class=postal2 
  onkeyup=SaltaCampo(ctl00_Conteudo_ctrlCadastroCliente_txtCep2,ctl00_Conteudo_ctrlCadastroCliente_txtTelResDDD,3,event); 
  maxLength=3 type=text name=ctl00$Conteudo$ctrlCadastroCliente$txtCep2></SPAN> 
  </SPAN><SPAN class=ind><A id=ctl00_Conteudo_ctrlCadastroCliente_lnkDuvidaCepPF 
  title="Não sei o CEP" onclick="return " 
  href="javascript:OpenPopUpCorreios();">Não sei o CEP</A> </SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_RgxCEPValidator></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_RgxCEPDigValidator></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_ReqCEPValidator></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_ReqCEPDigValidator></SPAN></LI>
  <LI><SPAN style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_cstNumBomClubeValidatorPF></SPAN></LI>
  <LI class="grp fMulti fTel fTelRes"><LABEL class=lblTlefones>Telefone fixo 
  1*:</LABEL> <INPUT style="WIDTH: 20px" 
  id=ctl00_Conteudo_ctrlCadastroCliente_txtTelResDDD class=DDD 
  onkeypress=mascara(this,soNumeros); 
  onkeyup=SaltaCampo(ctl00_Conteudo_ctrlCadastroCliente_txtTelResDDD,ctl00_Conteudo_ctrlCadastroCliente_txtTelRes,2,event); 
  maxLength=2 type=text name=ctl00$Conteudo$ctrlCadastroCliente$txtTelResDDD> 
  <INPUT id=ctl00_Conteudo_ctrlCadastroCliente_txtTelRes class=telefone 
  onkeypress=mascara(this,soNumeros); 
  onkeyup="SaltaCampo(ctl00_Conteudo_ctrlCadastroCliente_txtTelRes,ctl00_Conteudo_ctrlCadastroCliente_txtDDDCom_PF ,8,event);" 
  maxLength=8 size=9 type=text 
  name=ctl00$Conteudo$ctrlCadastroCliente$txtTelRes> <SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_ReqDDDValidator></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_ReqTelValidator></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_RngDDDRes></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_RngTelRes></SPAN></LI>
  <LI id=ctl00_Conteudo_ctrlCadastroCliente_pHtmlTelCom 
  class="grp fMulti fTel fTelCom"><LABEL>Telefone fixo 2:</LABEL> <SPAN 
  id=ctl00_Conteudo_ctrlCadastroCliente_lblDDDComPF class=lbl-telefones><INPUT 
  style="WIDTH: 20px" id=ctl00_Conteudo_ctrlCadastroCliente_txtDDDCom_PF 
  class=DDD onkeypress=mascara(this,soNumeros); 
  onkeyup=SaltaCampo(ctl00_Conteudo_ctrlCadastroCliente_txtDDDCom_PF,ctl00_Conteudo_ctrlCadastroCliente_txtTelCom_PF,2,event); 
  maxLength=2 type=text 
  name=ctl00$Conteudo$ctrlCadastroCliente$txtDDDCom_PF></SPAN> <SPAN 
  id=ctl00_Conteudo_ctrlCadastroCliente_lblTelComPF><INPUT 
  id=ctl00_Conteudo_ctrlCadastroCliente_txtTelCom_PF class=telefone 
  onkeypress=mascara(this,soNumeros); 
  onkeyup="SaltaCampo(ctl00_Conteudo_ctrlCadastroCliente_txtTelCom_PF,ctl00_Conteudo_ctrlCadastroCliente_txtCelDDD ,8,event);" 
  maxLength=8 size=9 type=text 
  name=ctl00$Conteudo$ctrlCadastroCliente$txtTelCom_PF></SPAN> </LI>
  <LI class="grp fMulti fTel fTelCel"><LABEL class=lblTelefones>Celular:</LABEL> 
  <INPUT style="WIDTH: 20px" id=ctl00_Conteudo_ctrlCadastroCliente_txtCelDDD 
  class=DDD onkeypress=mascara(this,soNumeros); 
  onkeyup=SaltaCampo(ctl00_Conteudo_ctrlCadastroCliente_txtCelDDD,ctl00_Conteudo_ctrlCadastroCliente_txtCel,2,event); 
  maxLength=2 type=text name=ctl00$Conteudo$ctrlCadastroCliente$txtCelDDD> 
  <INPUT id=ctl00_Conteudo_ctrlCadastroCliente_txtCel class=telefone 
  onkeypress=mascara(this,soNumeros); 
  onkeyup=SaltaCampo(ctl00_Conteudo_ctrlCadastroCliente_txtCel,ctl00_Conteudo_ctrlCadastroCliente_txtEmail,8,event); 
  maxLength=8 size=9 type=text name=ctl00$Conteudo$ctrlCadastroCliente$txtCel> 
  <SPAN style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_reqDDDCelPF></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_reqNumCelPF></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_RngDDDCel></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_RngNumCel></SPAN></LI></UL></FIELDSET> 
<FIELDSET class=frmPessoaDadosAcesso><LEGEND>Dados de acesso ao 
Extra.com:</LEGEND>
<UL>
  <LI class="grp fEmail"><LABEL class=dadosEmail>E-mail<SPAN 
  class=obr>*</SPAN>:</LABEL> <INPUT onkeydown=forbidPasteDown(event) 
  id=ctl00_Conteudo_ctrlCadastroCliente_txtEmail class=email 
  onkeyup=forbidPasteUp(event) type=text 
  name=ctl00$Conteudo$ctrlCadastroCliente$txtEmail value="<%=(ret==null?"":ret.get(3)) %>" > <SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_ReqEmailValidator></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_RgxEmailValidator></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidator></SPAN></LI>
  <LI class="grp fEmailConf"><LABEL class=confirma-email>Confirme o e-mail<SPAN 
  class=obr>*</SPAN>:</LABEL> <INPUT onkeydown=forbidPasteDown(event) 
  id=ctl00_Conteudo_ctrlCadastroCliente_txtEmailConfirmacao class=email 
  onkeyup=forbidPasteUp(event) type=text 
  name=ctl00$Conteudo$ctrlCadastroCliente$txtEmailConfirmacao value="<%=(ret==null?"":ret.get(3)) %>" > <SPAN 
  class=ind><A id=ctl00_Conteudo_ctrlCadastroCliente_lnkDuvidaEmail 
  class="lnkPop " title="Por que pedimos a confirmação do seu e-mail?" 
  href="https://carrinho.extra.com.br/Site/PopUpMensagem.aspx?IdMensagem=2&amp;KeepThis=true&amp;TB_iframe=true&amp;height=400&amp;width=610">Por 
  que pedimos a confirmação do seu e-mail?</A> </SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_ReqEmailConfirmacao></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_RgxEmailConfirmacao></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_cmpEmailValidacao></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidatorConfirmacao></SPAN></LI>
  <LI class="grp fSenha"><LABEL class=senha>Senha<SPAN 
  class=obr>*</SPAN>:</LABEL> <INPUT onkeydown=forbidPasteDown(event) 
  id=ctl00_Conteudo_ctrlCadastroCliente_txtSenha onkeyup=forbidPasteUp(event) 
  maxLength=8 type=password name=ctl00$Conteudo$ctrlCadastroCliente$txtSenha> 
  <SPAN class=ind>A senha deve ter de 4 a 8 caracteres</SPAN> <SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaValidator></SPAN></LI>
  <LI class="grp fSenhaConf"><LABEL class=senha>Confirme a senha<SPAN 
  class=obr>*</SPAN>:</LABEL> <INPUT onkeydown=forbidPasteDown(event) 
  id=ctl00_Conteudo_ctrlCadastroCliente_txtConfirmacaoSenha 
  onkeyup=forbidPasteUp(event) maxLength=8 type=password 
  name=ctl00$Conteudo$ctrlCadastroCliente$txtConfirmacaoSenha> <SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaConfValidator></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_CmpSenhaValidator></SPAN><SPAN 
  style="DISPLAY: none; COLOR: red" 
  id=ctl00_Conteudo_ctrlCadastroCliente_RgxSenhaLengthValidator></SPAN></LI></UL></FIELDSET> 

<FIELDSET class=areaAvisos>
<DIV class="grp fAvisos"><SPAN class="grp fCheck"><LABEL><INPUT 
id=ctl00_Conteudo_ctrlCadastroCliente_ckbNews class=checkbox CHECKED 
type=checkbox name=ctl00$Conteudo$ctrlCadastroCliente$ckbNews> <SPAN>Desejo 
receber avisos de ofertas por e-mail</SPAN> </LABEL><LABEL><INPUT 
id=ctl00_Conteudo_ctrlCadastroCliente_ckbSMS class=checkbox CHECKED 
type=checkbox name=ctl00$Conteudo$ctrlCadastroCliente$ckbSMS> <SPAN>Desejo 
receber avisos de ofertas por SMS grátis no celular</SPAN> 
</LABEL></SPAN></DIV></FIELDSET> </DIV>
<UL class=bts>
  <LI class=continuar><INPUT id=ctl00_Conteudo_ctrlCadastroCliente_bntNewUserAdd class=bt title=Gravar onclick='javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("ctl00$Conteudo$ctrlCadastroCliente$bntNewUserAdd", "", true, "cadCliente", "", false, false))' value=Gravar type=submit name=ctl00$Conteudo$ctrlCadastroCliente$bntNewUserAdd> 
  </LI></UL></DIV>
<DIV 
id=ctl00_Conteudo_ctrlCadastroCliente_PaginaSistemaArea1_pnlPanel></DIV></DIV></DIV></DIV>
<DIV id=ctl00_Conteudo_PaginaSistemaArea1_pnlPanel></DIV>
<DIV class=bg-footer>
<DIV class=footer>
<UL class=navegacao>
  <LI class=intitucional>
  <H3 class=title3>Institucional</H3>
  <UL class=list4><!-- li><a href="http://www.extra.com.br/Atendimento/SobreoExtra.aspx" title="Sobre o Extra">Sobre o Extra</a></li -->
    <LI><A title="Sobre o Extra" 
    href="http://www.extra.com.br/Atendimento/Institucional.aspx">Sobre o 
    Extra</A></LI>
    <LI><A title="Localizador de Lojas" 
    href="http://www.extra.com.br/Atendimento/LocalizadorLojas.aspx">Localizador 
    de Lojas</A></LI>
    <LI><A title="Marcas Recomendadas" 
    href="http://www.extra.com.br/hotsite/marcas-recomendadas.aspx">Marcas 
    Recomendadas</A></LI>
    <LI><A title="Cartão Extra" 
    href="http://www.extra.com.br/Institucional/CartaoExtra.aspx">Cartão 
    Extra</A></LI>
    <LI><A title="Trabalhe com a gente" 
    href="http://www.grupopaodeacucar.com.br/nossagente/default.asp" 
    target=_blank>Trabalhe com a gente</A></LI>
    <LI><A title="Palavras mais buscadas" 
    href="http://buscando.extra.com.br/">Palavras mais buscadas</A></LI><!-- li><a href="http://www.extra.com.br/Atendimento/Seguranca.aspx" title="Política de Privacidade">Privacidade e Segurança</a></li --></UL></LI>
  <LI class=servicos>
  <H3 class=title3>Serviços</H3>
  <UL class=list4>
    <LI><A title="Lista de Casamento" 
    href="http://www.extra.com.br/listadecasamento">Lista de Casamento</A></LI>
    <LI><A title="Pão de Açúcar Delivery" 
    href="http://www.paodeacucar.com.br/home.asp?Verfi=cep&amp;txtCep=00000000&amp;tudo=1" 
    target=_blank>Pão de Açúcar Delivery</A></LI>
    <LI><A title="Revelação Digital" href="http://www.extrafotos.com.br/" 
    target=_blank>Revelação Digital</A></LI><!--li><a href="http://www.extra.com.br/Tutorial/GarantiaEstendida.aspx" title="Garantia Estendida">Garantia Estendida</a></li>
					<li><a href="#" title="Entrega Extra Rápida">Entrega Extra Rápida</a></li-->
    <LI><A title="Entrega Agendada" 
    href="http://www.extra.com.br/Atendimento/EntregaAgendada.aspx">Entrega 
    Agendada</A></LI>
    <LI><A title="Extra Soluções" 
    href="http://www.extra.com.br/ExtraSolucoes/ExtraSolucoes.aspx">Extra 
    Soluções</A></LI>
    <LI><A title="Resultados de Promoções" 
    href="http://www.extra.com.br/Hotsite/DiadosnamoradosGanhadores.aspx">Resultados 
    de Promoções</A></LI>
    <LI><A title="Cartão Presente" 
    href="http://www.extra.com.br/CartaoPresente/home.aspx">Cartão 
    Presente</A></LI></UL></LI>
  <LI class=atendimento>
  <H3 class=title3>Atendimento</H3>
  <UL class=list4>
    <LI><A title="Meus Pedidos" 
    href="https://carrinho.extra.com.br/Site/MeusPedidos.aspx">Meus 
    Pedidos</A></LI>
    <LI><A title="Para Internet ou Televendas" 
    href="http://www.extra.com.br/Atendimento/Cadastro.aspx">Para Internet ou 
    Televendas</A></LI>
    <LI><A title="Para Loja Física" 
    href="http://www.extra.com.br/Atendimento/PagamentosLoja.aspx">Para Loja 
    Física</A></LI><!--li><a href="http://www.extra.com.br/Atendimento/LojasFisicas.aspx" title="Para Loja Física">Para Loja Física</a></li-->
    <LI><A title="Como Pagar" 
    href="http://www.extra.com.br/Atendimento/Pagamentos.aspx">Como 
    Pagar</A></LI>
    <LI><A title="Sobre Entrega" 
    href="http://www.extra.com.br/Atendimento/Entregas.aspx">Sobre 
    Entrega</A></LI>
    <LI><A title="Trocas e Devoluções" 
    href="http://www.extra.com.br/Atendimento/TrocasDevolucoes.aspx">Trocas e 
    Devoluções</A></LI>
    <LI><A title="Política de Privacidade" 
    href="http://www.extra.com.br/Atendimento/Seguranca.aspx">Política de 
    Privacidade</A></LI></UL></LI>
  <LI class=formasPagamento>
  <H3 class=title3>Formas de pagamento</H3>
  <UL>
    <LI class=gpa>
    <H4>Cartões Grupo Pão de Açúcar</H4><SPAN>Cartões do Grupo Pão de Açúcar 
    (Extra, Sendas, Compre Bem, Pão de Açúcar)</SPAN> </LI>
    <LI class=cc>
    <H4>Crédito</H4><SPAN>Cartões de crédito Ponto Frio, Visa, Mastercard, 
    American Express, Diners e Aura</SPAN> </LI>
    <LI class=bl>
    <H4>Boleto</H4><SPAN>Boleto bancário</SPAN> </LI>
    <LI class=db>
    <H4>Débito</H4><SPAN>Cartões de débito Itaú, Bradesco e Unibanco; BB 
    Crediário;</SPAN> </LI>
    <LI class=outrasFormas>
    <H4>Outras Formas</H4><SPAN>outras formas de pagamento</SPAN> </LI></UL></LI>
  <LI class=selos>
  <DIV class=seguranca>
  <H3 class=title3>Segurança</H3>
  <UL>
    <LI class=blindado><A title="Site Blindado" 
    href="https://selo.siteblindado.com.br/verificar?url=www.extra.com.br" 
    target=_blank><IMG 
    oncontextmenu="alert('Cópia Proibida por Lei - Site Blindado® é marca registrada da Site Blindado S.A.'); return false;" 
    alt="Visualizou o selo Site Blindado? Navegue tranquilamente, esse site está PROTEGIDO CONTRA HACKERS. Realizamos diariamente milhares de testes para garantir sua navegação segura. Clique no selo e confira a certificação." 
    src="cadastro_arquivos/siteblindado.gif"></A></LI>
    <LI class=internetSegura><A 
    href="http://www.internetsegura.org/"><SPAN>Internet Segura</SPAN></A></LI>
    <LI class=certisign><A title=CertiSign 
    href="https://carrinho.extra.com.br/Site/Login.aspx#"><SPAN>certisign</SPAN></A></LI>
    <LI class=microsoft><A title=microsoft 
    href="https://carrinho.extra.com.br/Site/Login.aspx#"><SPAN>microsoft</SPAN></A></LI>
    <LI class=notafiscal><A title="nota fiscal paulista" 
    href="http://www.extra.com.br/Atendimento/NotaFiscalPaulista.aspx" 
    target=_blank><SPAN>Nota Fiscal Paulista</SPAN></A></LI></UL></DIV>
  <UL class=powHos>
    <LI class=powered>
    <H3>Powered by</H3><A class=e-Plataforma title="Powered by e-Plataforma" 
    href="http://www.e-plataforma.com.br/">e-Plataforma</A></LI>
    <LI class=hosted>
    <H3>Hospedagem</H3><A class=dh-c title="Hospedagem DH-C" 
    href="http://www.dh-c.com.br/">DH-C</A></LI></UL></LI></UL>
<DIV class=bottomLine>
<P class=text><SMALL>Preços e condições exclusivos para o extra.com.br e para o 
televendas, podendo sofrer alterações sem prévia notificação.</SMALL></P>
<DIV class=gpa>
<H3>Site do </H3><A href="http://www.grupopaodeacucar.com.br/" 
target=_blank>Grupo Pão de Açúcar</A></DIV></DIV></DIV></DIV>
<DIV id=wrapperTodasCategorias class=wrapperTodasCategorias>
<DIV id=lnkTodasCategorias class=lnkTodasCategorias><A 
title="Ver todos os Departamentos" 
href="https://carrinho.extra.com.br/Site/Login.aspx#">Ver todos os 
Departamentos</A></DIV>
<DIV id=todasCategorias class=todasCategorias>
<DIV class=todosDept>
<H5 class=tit>DEPARTAMENTOS</H5>
<UL class=grp01>
  <LI><A title=Automotivo 
  href="http://www.extra.com.br/automotivo/?Filtro=C836">Automotivo</A></LI>
  <LI><A title=Bebês 
  href="http://www.extra.com.br/bebes/?Filtro=C983">Bebês</A></LI>
  <LI><A title="Beleza e Saúde" 
  href="http://www.extra.com.br/belezasaude/?Filtro=C102">Beleza e 
Saúde</A></LI>
  <LI><A title=Brinquedos 
  href="http://www.extra.com.br/brinquedos/?Filtro=C977">Brinquedos</A></LI>
  <LI><A title="Cine e Foto" 
  href="http://www.extra.com.br/cinefoto/?Filtro=C29">Cine e Foto</A></LI>
  <LI><A title="DVDs e Blu-Ray" 
  href="http://www.extra.com.br/dvdsebluray/?Filtro=C833">DVDs e 
Blu-Ray</A></LI></UL>
<UL class=grp02>
  <LI><A title=Eletrodomésticos 
  href="http://www.extra.com.br/eletrodomesticos/?Filtro=C13">Eletrodomésticos</A></LI>
  <LI><A title=Eletroportáteis 
  href="http://www.extra.com.br/eletroportateis/?Filtro=C73">Eletroportáteis</A></LI>
  <LI><A title=Eletrônicos 
  href="http://www.extra.com.br/eletronicos/?Filtro=C1">Eletrônicos</A></LI>
  <LI><A title="Esporte e Lazer" 
  href="http://www.extra.com.br/esportelazer/?Filtro=C418">Esporte e 
  Lazer</A></LI>
  <LI><A title=Ferramentas 
  href="http://www.extra.com.br/ferramentas/?Filtro=C827">Ferramentas</A></LI>
  <LI><A title=Games 
  href="http://www.extra.com.br/games/?Filtro=C336">Games</A></LI></UL>
<UL class=grp03>
  <LI><A title=Informática 
  href="http://www.extra.com.br/informatica/?Filtro=C56">Informática</A></LI>
  <LI><A title="Telefones e Celulares" 
  href="http://www.extra.com.br/telefonesecelulares/?Filtro=C38">Telefones &amp; 
  Celulares</A></LI>
  <LI><A title=Livros 
  href="http://www.extra.com.br/livros/?Filtro=C484">Livros</A></LI>
  <LI><A title=Móveis 
  href="http://www.extra.com.br/moveis/?Filtro=C93">Móveis</A></LI>
  <LI><A title="Utilidades Domésticas" 
  href="http://www.extra.com.br/utilidadesdomesticas/?Filtro=C371">Utilidades 
  Domésticas</A></LI></UL></DIV>
<DIV class=todosServ>
<H5 class=tit>SERVIÇOS</H5>
<UL class=grp04>
  <LI><A title="Lista de Casamento" 
  href="http://www.extra.com.br/Site/ListaGerenciadaCasamentoWelCome.aspx">Lista 
  de Casamento</A></LI>
  <LI><A title="Pão de Açúcar Delivery" 
  href="http://www.paodeacucar.com.br/home.asp?Verfi=cep&amp;txtCep=00000000&amp;tudo=1" 
  target=_blank>Pão de Açúcar Delivery</A></LI>
  <LI><A title="Entrega Agendada" 
  href="http://www.extra.com.br/Servicos/EntregaAgendada.aspx">Entrega 
  Agendada</A></LI>
  <LI><A title="Cartão Extra" 
  href="http://www.extra.com.br/Institucional/CartaoExtra.aspx">Cartões 
  Extra</A></LI></UL>
<UL class=grp05><!--li><a title="" href="#">Garantia Estendida</a></li-->
  <LI><A title="Extra Soluções" 
  href="http://www.extra.com.br/ExtraSolucoes/ExtraSolucoes.aspx">Extra 
  Soluções</A></LI>
  <LI><A title="Solução Empresarial" 
  href="http://busca.extra.com.br/?Filtro=D29">Solução Empresarial</A></LI>
  <LI><A title=Institucional 
  href="http://www.extra.com.br/Atendimento/Institucional.aspx">Institucional</A></LI></UL></DIV></DIV></DIV><SPAN 
id=ctl00_BottomBar_BottomBar_lblDataProcessamento 
title="15/11/2010 10:26:22"></SPAN><SPAN 
id=ctl00_BottomBar_BottomBar_lblIdProcessamento title=1></SPAN>
<SCRIPT type=text/javascript>
//<![CDATA[
var Page_ValidationSummaries =  new Array(document.getElementById("ctl00_Conteudo_vldSummary"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_vldSummary"));
var Page_Validators =  new Array(document.getElementById("ctl00_Conteudo_ctrLogin_UserNameRequired"), document.getElementById("ctl00_Conteudo_ctrLogin_RgxEmailValidator"), document.getElementById("ctl00_Conteudo_ctrLogin_cstLoginValidation"), document.getElementById("ctl00_Conteudo_ctrLogin_PasswordRequired"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqNomeValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqSobreNomeValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqCPFValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator2"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_CstDataNascValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqDataNascValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RanDataNascAno"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_reqSexoValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RgxCEPValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RgxCEPDigValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqCEPValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqCEPDigValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_cstNumBomClubeValidatorPF"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqDDDValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqTelValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RngDDDRes"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RngTelRes"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_reqDDDCelPF"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_reqNumCelPF"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RngDDDCel"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RngNumCel"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqEmailValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RgxEmailValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqEmailConfirmacao"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RgxEmailConfirmacao"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_cmpEmailValidacao"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidatorConfirmacao"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaConfValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_CmpSenhaValidator"), document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RgxSenhaLengthValidator"));
//]]>
</SCRIPT>

<SCRIPT type=text/javascript>
//<![CDATA[
var ctl00_Conteudo_vldSummary = document.all ? document.all["ctl00_Conteudo_vldSummary"] : document.getElementById("ctl00_Conteudo_vldSummary");
ctl00_Conteudo_vldSummary.validationGroup = "LogIn";
var ctl00_Conteudo_ctrLogin_UserNameRequired = document.all ? document.all["ctl00_Conteudo_ctrLogin_UserNameRequired"] : document.getElementById("ctl00_Conteudo_ctrLogin_UserNameRequired");
ctl00_Conteudo_ctrLogin_UserNameRequired.controltovalidate = "ctl00_Conteudo_ctrLogin_UserName";
ctl00_Conteudo_ctrLogin_UserNameRequired.errormessage = "O endereço de e-mail deve ser informado.";
ctl00_Conteudo_ctrLogin_UserNameRequired.display = "None";
ctl00_Conteudo_ctrLogin_UserNameRequired.validationGroup = "LogIn";
ctl00_Conteudo_ctrLogin_UserNameRequired.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrLogin_UserNameRequired.initialvalue = "";
var ctl00_Conteudo_ctrLogin_RgxEmailValidator = document.all ? document.all["ctl00_Conteudo_ctrLogin_RgxEmailValidator"] : document.getElementById("ctl00_Conteudo_ctrLogin_RgxEmailValidator");
ctl00_Conteudo_ctrLogin_RgxEmailValidator.controltovalidate = "ctl00_Conteudo_ctrLogin_UserName";
ctl00_Conteudo_ctrLogin_RgxEmailValidator.focusOnError = "t";
ctl00_Conteudo_ctrLogin_RgxEmailValidator.errormessage = "O endereço de e-mail informado é inválido.";
ctl00_Conteudo_ctrLogin_RgxEmailValidator.display = "None";
ctl00_Conteudo_ctrLogin_RgxEmailValidator.validationGroup = "LogIn";
ctl00_Conteudo_ctrLogin_RgxEmailValidator.evaluationfunction = "RegularExpressionValidatorEvaluateIsValid";
ctl00_Conteudo_ctrLogin_RgxEmailValidator.validationexpression = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
var ctl00_Conteudo_ctrLogin_cstLoginValidation = document.all ? document.all["ctl00_Conteudo_ctrLogin_cstLoginValidation"] : document.getElementById("ctl00_Conteudo_ctrLogin_cstLoginValidation");
ctl00_Conteudo_ctrLogin_cstLoginValidation.controltovalidate = "ctl00_Conteudo_ctrLogin_UserName";
ctl00_Conteudo_ctrLogin_cstLoginValidation.display = "None";
ctl00_Conteudo_ctrLogin_cstLoginValidation.validationGroup = "LogIn";
ctl00_Conteudo_ctrLogin_cstLoginValidation.evaluationfunction = "CustomValidatorEvaluateIsValid";
var ctl00_Conteudo_ctrLogin_PasswordRequired = document.all ? document.all["ctl00_Conteudo_ctrLogin_PasswordRequired"] : document.getElementById("ctl00_Conteudo_ctrLogin_PasswordRequired");
ctl00_Conteudo_ctrLogin_PasswordRequired.controltovalidate = "ctl00_Conteudo_ctrLogin_Password";
ctl00_Conteudo_ctrLogin_PasswordRequired.errormessage = "A senha deve ser informada.";
ctl00_Conteudo_ctrLogin_PasswordRequired.display = "None";
ctl00_Conteudo_ctrLogin_PasswordRequired.validationGroup = "LogIn";
ctl00_Conteudo_ctrLogin_PasswordRequired.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrLogin_PasswordRequired.initialvalue = "";
var ctl00_Conteudo_ctrlCadastroCliente_vldSummary = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_vldSummary"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_vldSummary");
ctl00_Conteudo_ctrlCadastroCliente_vldSummary.validationGroup = "cadCliente";
var ctl00_Conteudo_ctrlCadastroCliente_ReqNomeValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_ReqNomeValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqNomeValidator");
ctl00_Conteudo_ctrlCadastroCliente_ReqNomeValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtNome";
ctl00_Conteudo_ctrlCadastroCliente_ReqNomeValidator.focusOnError = "t";
ctl00_Conteudo_ctrlCadastroCliente_ReqNomeValidator.errormessage = "Nome é um campo obrigatório.";
ctl00_Conteudo_ctrlCadastroCliente_ReqNomeValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_ReqNomeValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_ReqNomeValidator.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_ReqNomeValidator.initialvalue = "";
var ctl00_Conteudo_ctrlCadastroCliente_ReqSobreNomeValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_ReqSobreNomeValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqSobreNomeValidator");
ctl00_Conteudo_ctrlCadastroCliente_ReqSobreNomeValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtSobrenome";
ctl00_Conteudo_ctrlCadastroCliente_ReqSobreNomeValidator.focusOnError = "t";
ctl00_Conteudo_ctrlCadastroCliente_ReqSobreNomeValidator.errormessage = "Sobrenome é um campo obrigatório.";
ctl00_Conteudo_ctrlCadastroCliente_ReqSobreNomeValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_ReqSobreNomeValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_ReqSobreNomeValidator.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_ReqSobreNomeValidator.initialvalue = "";
var ctl00_Conteudo_ctrlCadastroCliente_ReqCPFValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_ReqCPFValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqCPFValidator");
ctl00_Conteudo_ctrlCadastroCliente_ReqCPFValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtCpf";
ctl00_Conteudo_ctrlCadastroCliente_ReqCPFValidator.focusOnError = "t";
ctl00_Conteudo_ctrlCadastroCliente_ReqCPFValidator.errormessage = "CPF é um campo obrigatório.";
ctl00_Conteudo_ctrlCadastroCliente_ReqCPFValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_ReqCPFValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_ReqCPFValidator.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_ReqCPFValidator.initialvalue = "";
var ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator2 = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator2"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator2");
ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator2.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtCpf";
ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator2.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator2.evaluationfunction = "CustomValidatorEvaluateIsValid";
var ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator");
ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtCpf";
ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator.focusOnError = "t";
ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator.errormessage = "CPF inválido.";
ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator.evaluationfunction = "CustomValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator.clientvalidationfunction = "valida_CPFCNPJ";
var ctl00_Conteudo_ctrlCadastroCliente_CstDataNascValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_CstDataNascValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_CstDataNascValidator");
ctl00_Conteudo_ctrlCadastroCliente_CstDataNascValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtDataNasc";
ctl00_Conteudo_ctrlCadastroCliente_CstDataNascValidator.errormessage = "Data inválida.";
ctl00_Conteudo_ctrlCadastroCliente_CstDataNascValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_CstDataNascValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_CstDataNascValidator.evaluationfunction = "CustomValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_CstDataNascValidator.clientvalidationfunction = "validaData";
var ctl00_Conteudo_ctrlCadastroCliente_ReqDataNascValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_ReqDataNascValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqDataNascValidator");
ctl00_Conteudo_ctrlCadastroCliente_ReqDataNascValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtDataNasc";
ctl00_Conteudo_ctrlCadastroCliente_ReqDataNascValidator.errormessage = "Data de Nascimento é um campo obrigatório.";
ctl00_Conteudo_ctrlCadastroCliente_ReqDataNascValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_ReqDataNascValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_ReqDataNascValidator.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_ReqDataNascValidator.initialvalue = "";
var ctl00_Conteudo_ctrlCadastroCliente_RanDataNascAno = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_RanDataNascAno"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RanDataNascAno");
ctl00_Conteudo_ctrlCadastroCliente_RanDataNascAno.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtDataNascAno";
ctl00_Conteudo_ctrlCadastroCliente_RanDataNascAno.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_RanDataNascAno.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_RanDataNascAno.type = "Integer";
ctl00_Conteudo_ctrlCadastroCliente_RanDataNascAno.evaluationfunction = "RangeValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_RanDataNascAno.maximumvalue = "2100";
ctl00_Conteudo_ctrlCadastroCliente_RanDataNascAno.minimumvalue = "1900";
var ctl00_Conteudo_ctrlCadastroCliente_reqSexoValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_reqSexoValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_reqSexoValidator");
ctl00_Conteudo_ctrlCadastroCliente_reqSexoValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtSexo";
ctl00_Conteudo_ctrlCadastroCliente_reqSexoValidator.errormessage = "É necessário definir-se o sexo.";
ctl00_Conteudo_ctrlCadastroCliente_reqSexoValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_reqSexoValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_reqSexoValidator.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_reqSexoValidator.initialvalue = "";
var ctl00_Conteudo_ctrlCadastroCliente_RgxCEPValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_RgxCEPValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RgxCEPValidator");
ctl00_Conteudo_ctrlCadastroCliente_RgxCEPValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtCep1";
ctl00_Conteudo_ctrlCadastroCliente_RgxCEPValidator.errormessage = "CEP inválido.";
ctl00_Conteudo_ctrlCadastroCliente_RgxCEPValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_RgxCEPValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_RgxCEPValidator.evaluationfunction = "RegularExpressionValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_RgxCEPValidator.validationexpression = "\\d{5}";
var ctl00_Conteudo_ctrlCadastroCliente_RgxCEPDigValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_RgxCEPDigValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RgxCEPDigValidator");
ctl00_Conteudo_ctrlCadastroCliente_RgxCEPDigValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtCep2";
ctl00_Conteudo_ctrlCadastroCliente_RgxCEPDigValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_RgxCEPDigValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_RgxCEPDigValidator.evaluationfunction = "RegularExpressionValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_RgxCEPDigValidator.validationexpression = "\\d{3}";
var ctl00_Conteudo_ctrlCadastroCliente_ReqCEPValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_ReqCEPValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqCEPValidator");
ctl00_Conteudo_ctrlCadastroCliente_ReqCEPValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtCep1";
ctl00_Conteudo_ctrlCadastroCliente_ReqCEPValidator.errormessage = "O CEP deve ser informado.";
ctl00_Conteudo_ctrlCadastroCliente_ReqCEPValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_ReqCEPValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_ReqCEPValidator.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_ReqCEPValidator.initialvalue = "";
var ctl00_Conteudo_ctrlCadastroCliente_ReqCEPDigValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_ReqCEPDigValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqCEPDigValidator");
ctl00_Conteudo_ctrlCadastroCliente_ReqCEPDigValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtCep2";
ctl00_Conteudo_ctrlCadastroCliente_ReqCEPDigValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_ReqCEPDigValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_ReqCEPDigValidator.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_ReqCEPDigValidator.initialvalue = "";
var ctl00_Conteudo_ctrlCadastroCliente_cstNumBomClubeValidatorPF = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_cstNumBomClubeValidatorPF"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_cstNumBomClubeValidatorPF");
ctl00_Conteudo_ctrlCadastroCliente_cstNumBomClubeValidatorPF.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtCodBomClubePF";
ctl00_Conteudo_ctrlCadastroCliente_cstNumBomClubeValidatorPF.errormessage = "Número do Cartão Bomclube inválido.";
ctl00_Conteudo_ctrlCadastroCliente_cstNumBomClubeValidatorPF.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_cstNumBomClubeValidatorPF.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_cstNumBomClubeValidatorPF.evaluationfunction = "CustomValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_cstNumBomClubeValidatorPF.clientvalidationfunction = "valida_CartaoBomClube";
var ctl00_Conteudo_ctrlCadastroCliente_ReqDDDValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_ReqDDDValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqDDDValidator");
ctl00_Conteudo_ctrlCadastroCliente_ReqDDDValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtTelResDDD";
ctl00_Conteudo_ctrlCadastroCliente_ReqDDDValidator.errormessage = "DDD é um campo obrigatório.";
ctl00_Conteudo_ctrlCadastroCliente_ReqDDDValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_ReqDDDValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_ReqDDDValidator.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_ReqDDDValidator.initialvalue = "";
var ctl00_Conteudo_ctrlCadastroCliente_ReqTelValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_ReqTelValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqTelValidator");
ctl00_Conteudo_ctrlCadastroCliente_ReqTelValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtTelRes";
ctl00_Conteudo_ctrlCadastroCliente_ReqTelValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_ReqTelValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_ReqTelValidator.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_ReqTelValidator.initialvalue = "";
var ctl00_Conteudo_ctrlCadastroCliente_RngDDDRes = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_RngDDDRes"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RngDDDRes");
ctl00_Conteudo_ctrlCadastroCliente_RngDDDRes.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtTelResDDD";
ctl00_Conteudo_ctrlCadastroCliente_RngDDDRes.errormessage = "DDD do telefone residencial inválido.";
ctl00_Conteudo_ctrlCadastroCliente_RngDDDRes.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_RngDDDRes.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_RngDDDRes.type = "Integer";
ctl00_Conteudo_ctrlCadastroCliente_RngDDDRes.evaluationfunction = "RangeValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_RngDDDRes.maximumvalue = "99";
ctl00_Conteudo_ctrlCadastroCliente_RngDDDRes.minimumvalue = "10";
var ctl00_Conteudo_ctrlCadastroCliente_RngTelRes = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_RngTelRes"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RngTelRes");
ctl00_Conteudo_ctrlCadastroCliente_RngTelRes.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtTelRes";
ctl00_Conteudo_ctrlCadastroCliente_RngTelRes.errormessage = "Telefone Residencial inválido.";
ctl00_Conteudo_ctrlCadastroCliente_RngTelRes.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_RngTelRes.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_RngTelRes.type = "Integer";
ctl00_Conteudo_ctrlCadastroCliente_RngTelRes.evaluationfunction = "RangeValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_RngTelRes.maximumvalue = "69999999";
ctl00_Conteudo_ctrlCadastroCliente_RngTelRes.minimumvalue = "10000000";
var ctl00_Conteudo_ctrlCadastroCliente_reqDDDCelPF = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_reqDDDCelPF"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_reqDDDCelPF");
ctl00_Conteudo_ctrlCadastroCliente_reqDDDCelPF.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtCelDDD";
ctl00_Conteudo_ctrlCadastroCliente_reqDDDCelPF.errormessage = "DDD do telefone celular é um campo obrigatório.";
ctl00_Conteudo_ctrlCadastroCliente_reqDDDCelPF.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_reqDDDCelPF.enabled = "False";
ctl00_Conteudo_ctrlCadastroCliente_reqDDDCelPF.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_reqDDDCelPF.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_reqDDDCelPF.initialvalue = "";
var ctl00_Conteudo_ctrlCadastroCliente_reqNumCelPF = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_reqNumCelPF"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_reqNumCelPF");
ctl00_Conteudo_ctrlCadastroCliente_reqNumCelPF.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtCel";
ctl00_Conteudo_ctrlCadastroCliente_reqNumCelPF.errormessage = "Telefone celular é um campo obrigatório.";
ctl00_Conteudo_ctrlCadastroCliente_reqNumCelPF.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_reqNumCelPF.enabled = "False";
ctl00_Conteudo_ctrlCadastroCliente_reqNumCelPF.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_reqNumCelPF.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_reqNumCelPF.initialvalue = "";
var ctl00_Conteudo_ctrlCadastroCliente_RngDDDCel = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_RngDDDCel"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RngDDDCel");
ctl00_Conteudo_ctrlCadastroCliente_RngDDDCel.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtCelDDD";
ctl00_Conteudo_ctrlCadastroCliente_RngDDDCel.errormessage = "DDD do telefone celular inválido.";
ctl00_Conteudo_ctrlCadastroCliente_RngDDDCel.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_RngDDDCel.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_RngDDDCel.type = "Integer";
ctl00_Conteudo_ctrlCadastroCliente_RngDDDCel.evaluationfunction = "RangeValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_RngDDDCel.maximumvalue = "99";
ctl00_Conteudo_ctrlCadastroCliente_RngDDDCel.minimumvalue = "10";
var ctl00_Conteudo_ctrlCadastroCliente_RngNumCel = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_RngNumCel"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RngNumCel");
ctl00_Conteudo_ctrlCadastroCliente_RngNumCel.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtCel";
ctl00_Conteudo_ctrlCadastroCliente_RngNumCel.errormessage = "Telefone celular inválido";
ctl00_Conteudo_ctrlCadastroCliente_RngNumCel.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_RngNumCel.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_RngNumCel.type = "Integer";
ctl00_Conteudo_ctrlCadastroCliente_RngNumCel.evaluationfunction = "RangeValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_RngNumCel.maximumvalue = "99999999";
ctl00_Conteudo_ctrlCadastroCliente_RngNumCel.minimumvalue = "60000000";
var ctl00_Conteudo_ctrlCadastroCliente_ReqEmailValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_ReqEmailValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqEmailValidator");
ctl00_Conteudo_ctrlCadastroCliente_ReqEmailValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtEmail";
ctl00_Conteudo_ctrlCadastroCliente_ReqEmailValidator.focusOnError = "t";
ctl00_Conteudo_ctrlCadastroCliente_ReqEmailValidator.errormessage = "O endereço de e-mail deve ser informado.";
ctl00_Conteudo_ctrlCadastroCliente_ReqEmailValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_ReqEmailValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_ReqEmailValidator.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_ReqEmailValidator.initialvalue = "";
var ctl00_Conteudo_ctrlCadastroCliente_RgxEmailValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_RgxEmailValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RgxEmailValidator");
ctl00_Conteudo_ctrlCadastroCliente_RgxEmailValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtEmail";
ctl00_Conteudo_ctrlCadastroCliente_RgxEmailValidator.focusOnError = "t";
ctl00_Conteudo_ctrlCadastroCliente_RgxEmailValidator.errormessage = "O endereço de e-mail informado é inválido.";
ctl00_Conteudo_ctrlCadastroCliente_RgxEmailValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_RgxEmailValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_RgxEmailValidator.evaluationfunction = "RegularExpressionValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_RgxEmailValidator.validationexpression = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
var ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidator");
ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtEmail";
ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidator.evaluationfunction = "CustomValidatorEvaluateIsValid";
var ctl00_Conteudo_ctrlCadastroCliente_ReqEmailConfirmacao = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_ReqEmailConfirmacao"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqEmailConfirmacao");
ctl00_Conteudo_ctrlCadastroCliente_ReqEmailConfirmacao.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtEmailConfirmacao";
ctl00_Conteudo_ctrlCadastroCliente_ReqEmailConfirmacao.focusOnError = "t";
ctl00_Conteudo_ctrlCadastroCliente_ReqEmailConfirmacao.errormessage = "É necessário confirmar o e-mail informado.";
ctl00_Conteudo_ctrlCadastroCliente_ReqEmailConfirmacao.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_ReqEmailConfirmacao.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_ReqEmailConfirmacao.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_ReqEmailConfirmacao.initialvalue = "";
var ctl00_Conteudo_ctrlCadastroCliente_RgxEmailConfirmacao = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_RgxEmailConfirmacao"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RgxEmailConfirmacao");
ctl00_Conteudo_ctrlCadastroCliente_RgxEmailConfirmacao.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtEmailConfirmacao";
ctl00_Conteudo_ctrlCadastroCliente_RgxEmailConfirmacao.focusOnError = "t";
ctl00_Conteudo_ctrlCadastroCliente_RgxEmailConfirmacao.errormessage = "O e-mail de confirmação não é válido.";
ctl00_Conteudo_ctrlCadastroCliente_RgxEmailConfirmacao.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_RgxEmailConfirmacao.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_RgxEmailConfirmacao.evaluationfunction = "RegularExpressionValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_RgxEmailConfirmacao.validationexpression = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
var ctl00_Conteudo_ctrlCadastroCliente_cmpEmailValidacao = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_cmpEmailValidacao"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_cmpEmailValidacao");
ctl00_Conteudo_ctrlCadastroCliente_cmpEmailValidacao.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtEmailConfirmacao";
ctl00_Conteudo_ctrlCadastroCliente_cmpEmailValidacao.errormessage = "O endereço de e-mail informado é diferente do endereço para confirmação.";
ctl00_Conteudo_ctrlCadastroCliente_cmpEmailValidacao.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_cmpEmailValidacao.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_cmpEmailValidacao.evaluationfunction = "CompareValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_cmpEmailValidacao.controltocompare = "ctl00_Conteudo_ctrlCadastroCliente_txtEmail";
ctl00_Conteudo_ctrlCadastroCliente_cmpEmailValidacao.controlhookup = "ctl00_Conteudo_ctrlCadastroCliente_txtEmail";
var ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidatorConfirmacao = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidatorConfirmacao"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidatorConfirmacao");
ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidatorConfirmacao.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtEmailConfirmacao";
ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidatorConfirmacao.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidatorConfirmacao.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidatorConfirmacao.evaluationfunction = "CustomValidatorEvaluateIsValid";
var ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaValidator");
ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtSenha";
ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaValidator.errormessage = "A senha deve ser informada.";
ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaValidator.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaValidator.initialvalue = "";
var ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaConfValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaConfValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaConfValidator");
ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaConfValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtConfirmacaoSenha";
ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaConfValidator.errormessage = "A confirmação da senha deve ser realizada.";
ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaConfValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaConfValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaConfValidator.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaConfValidator.initialvalue = "";
var ctl00_Conteudo_ctrlCadastroCliente_CmpSenhaValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_CmpSenhaValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_CmpSenhaValidator");
ctl00_Conteudo_ctrlCadastroCliente_CmpSenhaValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtConfirmacaoSenha";
ctl00_Conteudo_ctrlCadastroCliente_CmpSenhaValidator.errormessage = "A senha informada difere da senha de confirmação.";
ctl00_Conteudo_ctrlCadastroCliente_CmpSenhaValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_CmpSenhaValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_CmpSenhaValidator.evaluationfunction = "CompareValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_CmpSenhaValidator.controltocompare = "ctl00_Conteudo_ctrlCadastroCliente_txtSenha";
ctl00_Conteudo_ctrlCadastroCliente_CmpSenhaValidator.controlhookup = "ctl00_Conteudo_ctrlCadastroCliente_txtSenha";
var ctl00_Conteudo_ctrlCadastroCliente_RgxSenhaLengthValidator = document.all ? document.all["ctl00_Conteudo_ctrlCadastroCliente_RgxSenhaLengthValidator"] : document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_RgxSenhaLengthValidator");
ctl00_Conteudo_ctrlCadastroCliente_RgxSenhaLengthValidator.controltovalidate = "ctl00_Conteudo_ctrlCadastroCliente_txtSenha";
ctl00_Conteudo_ctrlCadastroCliente_RgxSenhaLengthValidator.errormessage = "A senha deve ter de 4 a 8 caracteres";
ctl00_Conteudo_ctrlCadastroCliente_RgxSenhaLengthValidator.display = "None";
ctl00_Conteudo_ctrlCadastroCliente_RgxSenhaLengthValidator.validationGroup = "cadCliente";
ctl00_Conteudo_ctrlCadastroCliente_RgxSenhaLengthValidator.evaluationfunction = "RegularExpressionValidatorEvaluateIsValid";
ctl00_Conteudo_ctrlCadastroCliente_RgxSenhaLengthValidator.validationexpression = "[^\\s]{4,}";
//]]>
</SCRIPT>

<SCRIPT type=text/javascript>
//<![CDATA[
var __nomeSite = 'Extra.com';var __QtdMaximaProdutosComparacao = '3';var __urlCarrinho = 'http://carrinho.extra.com.br';AtualizaItensCookie(null);updatePanelJQuery('ctl00_TopBar_TopBar1_divMenuWelcome','/Control/TopBar_Saudacao.aspx');
document.getElementById('ctl00_Conteudo_vldSummary').dispose = function() {
    Array.remove(Page_ValidationSummaries, document.getElementById('ctl00_Conteudo_vldSummary'));
}

var Page_ValidationActive = false;
if (typeof(ValidatorOnLoad) == "function") {
    ValidatorOnLoad();
}

function ValidatorOnSubmit() {
    if (Page_ValidationActive) {
        return ValidatorCommonOnSubmit();
    }
    else {
        return true;
    }
}
        
document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_vldSummary').dispose = function() {
    Array.remove(Page_ValidationSummaries, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_vldSummary'));
}
Sys.Application.initialize();

document.getElementById('ctl00_Conteudo_ctrLogin_UserNameRequired').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrLogin_UserNameRequired'));
}

document.getElementById('ctl00_Conteudo_ctrLogin_RgxEmailValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrLogin_RgxEmailValidator'));
}

document.getElementById('ctl00_Conteudo_ctrLogin_cstLoginValidation').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrLogin_cstLoginValidation'));
}

document.getElementById('ctl00_Conteudo_ctrLogin_PasswordRequired').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrLogin_PasswordRequired'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqNomeValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqNomeValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqSobreNomeValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqSobreNomeValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqCPFValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqCPFValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator2').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator2'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_CstCPFValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_CstDataNascValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_CstDataNascValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqDataNascValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqDataNascValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RanDataNascAno').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RanDataNascAno'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_reqSexoValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_reqSexoValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RgxCEPValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RgxCEPValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RgxCEPDigValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RgxCEPDigValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqCEPValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqCEPValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqCEPDigValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqCEPDigValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_cstNumBomClubeValidatorPF').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_cstNumBomClubeValidatorPF'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqDDDValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqDDDValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqTelValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqTelValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RngDDDRes').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RngDDDRes'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RngTelRes').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RngTelRes'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_reqDDDCelPF').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_reqDDDCelPF'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_reqNumCelPF').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_reqNumCelPF'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RngDDDCel').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RngDDDCel'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RngNumCel').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RngNumCel'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqEmailValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqEmailValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RgxEmailValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RgxEmailValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqEmailConfirmacao').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqEmailConfirmacao'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RgxEmailConfirmacao').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RgxEmailConfirmacao'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_cmpEmailValidacao').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_cmpEmailValidacao'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidatorConfirmacao').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_cstEmailValidatorConfirmacao'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaConfValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_ReqSenhaConfValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_CmpSenhaValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_CmpSenhaValidator'));
}

document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RgxSenhaLengthValidator').dispose = function() {
    Array.remove(Page_Validators, document.getElementById('ctl00_Conteudo_ctrlCadastroCliente_RgxSenhaLengthValidator'));
}
//]]>
</SCRIPT>
</FORM>
<SCRIPT type=text/javascript>
/* <![CDATA[ */
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
/* ]]> */
</SCRIPT>

<SCRIPT type=text/javascript>
/* <![CDATA[ */
var pageTracker = _gat._getTracker("UA-1582435-1");
pageTracker._trackPageview();
/* ]]> */
</SCRIPT>
<!-- START COREMETRICS -->
<SCRIPT type=text/javascript> 
/* <![CDATA[ */
var cookieValue = GetCookie('ckOrganic'); 
if (cookieValue) {
cmFakeRf = cookieValue;
DeleteCookie('ckOrganic', '/', '');
}
cmCreatePageviewTag("Login","Login","","");
/* ]]> */
</SCRIPT>
<!-- End COREMETRICS --></BODY></HTML>
