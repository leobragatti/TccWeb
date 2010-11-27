function listChoice( productId, form ){
	var id = productId;
	var i;
	var elements = new Array();
	if(!form.event.length)
		elements[0] = form.event;
	else
		elements =form.event;
	var choice;
	for ( i = 0; i < elements.length; i++){
		if (elements[i].checked){
			 choice = elements[i].value;
		}
	}
	var goTo = choice + id;
	location.href = goTo;		
}

function selectPic(img)
{
	var image = document.getElementsByClassName('picimgbig');
	if(image.length)
	{
		for (i= 0 ; i<image.length; i++)
		{
			image[i].src = img.src;
		}
	}else if (image)
	{	
		image.src = img.src;
	}
		
}

function changeMainImage(image)
{

}

function openPopUp(URL, NAME, OPTIONS)
{
	window.open(URL, NAME, OPTIONS);
}

function openPopd(URL, NAME)
{
	openPopUp(URL, NAME, 'width=446,height=400,status=no,scrollbars=no,top=80,left=80');
}

function enterLiveChat(chatId) {

		var url = "http://200.189.215.134/chat51/";
		var hWnd = window.open(url+"default.aspx?chat="+chatId+"&group=suporte&url="+window.location,"chat","width=400,height=470,resizable=no,toolbar=0,location=0,directories=0,status=no,menubar=0,scrollbars=0");
		if (hWnd != null) 
		{ 
			if (hWnd.opener == null) 
			{
				hWnd.opener = self; 
				hWnd.location.href=url; 
			} 
		}

}

function isImageOk(img) {
	// During the onload event, IE correctly identifies any images
	// that weren't downloaded as not complete. Others should too.
	// Gecko-based browsers act like NS4 in that they report this
	// incorrectly: they always return true.
	if (!img.complete) {
		return false;
	}
			    
	// However, they do have two very useful properties: naturalWidth
	// and naturalHeight. These give the true size of the image. If
	// it failed to load, either of these should be zero.
	if (typeof img.naturalWidth != "undefined" && img.naturalWidth == 0) {
		return false;
	}
				    
	// No other way of checking: assume it's ok.
	return true;
}

function mouseOver( id, index ){
	var obj = document.getElementById('btAddList'+id.toString()+index.toString());
	var resp = obj.className.search(/selected/);
	if(resp == -1 ){
		obj.className+= ' selected';
	}	
}

function mouseOut( id, index ){
	var obj = document.getElementById('btAddList'+id.toString()+ index.toString());
	var resp = obj.className.search(/selected/);
	if(resp != -1 ){
		obj.className = 'btAddList';
	}		
}

// divId - Id do div onde por o banner
// zoneId - Id da zona do banner
function subaAsyncBanner(divId, zoneId) { 

	var host = window.location.hostname;
	var page = '/openx/www/delivery/aajx.php';
					
	var m3_u = (location.protocol == 'https:' ? 'https://'+host+page : 'http://'+host+page);
	var m3_r = Math.floor(Math.random()*99999999999);

	if (!document.MAX_used) { document.MAX_used = ','; }
	
	m3_u = m3_u + "?zoneid="+zoneId+"&amp;block=1";
  	m3_u = m3_u + "&amp;cb=" + m3_r;
	
	if (document.MAX_used != ',') { m3_u = m3_u + "&amp;exclude=" + document.MAX_used; }
	m3_u = m3_u + "&amp;loc="+escape(window.location);
	if (document.referrer) { m3_u = m3_u + "&amp;referer=" + escape(document.referrer); }
	if (document.context) { m3_u = m3_u + "&context=" + escape(document.context); }
	if (document.mmm_fo) { m3_u = m3_u + "&amp;mmm_fo=1"; }	
	
	new Ajax.Updater( { success:divId }, m3_u, {evalScripts: true});
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

function handleLightBox() {
	$('baseImg').observe('click', function(){
		if ( ($('img4') == null || $('img4') == 'undefined') ) {
			selectPic($('baseImg'));
		} else {
			selectPic($('img4'));
			$('img4').observe('click', function(){
				selectPic($('img4'));
			});
		}
	});
	if ( $('img1') == null || $('img1') == 'undefined' ) {
		
	} else {
		$('img1').observe('click', function(){
			selectPic($('img1'));
		});
	}
	if ( $('img2') == null || $('img2') == 'undefined' ) {
		
	} else {
		$('img2').observe('click', function(){
			selectPic($('img2'));
		});
	}
	if ( $('img3') == null || $('img3') == 'undefined' ) {
		
	} else {
		$('img3').observe('click', function(){
			selectPic($('img3'));
		});
	}
	if ( $('img4') == null || $('img4') == 'undefined' ) {
		$('img1').observe('click', function(){
			selectPic($('baseImg'));
		});
	} else {
		$('img4').observe('click', function(){
			selectPic($('img4'));
		});
	}
	if ( $('img5') == null || $('img5') == 'undefined' ) {
		
	} else {
		$('img5').observe('click', function(){
			selectPic($('img5'));
		});
	}
	if ( $('img6') == null || $('img6') == 'undefined' ) {
		
	} else {
		$('img6').observe('click', function(){
			selectPic($('img6'));
		});
	}
	
}

/*
 * INICIO DAS FUNCOES PARA FUNCIONALIDADE ONE CLICK
 */

/**
 * @author Bruno Lacerda	
 * 
 * Obtem a URL a partir do valor da propriedade #{OCAddressUrlAjax} contida no arquivo de propriedades appconfig.properties 
 * Acessa a url que retorna um XML contendo a lista de enderecos do cliente via Ajax.
 * Caso o XML de retorno seja valido (cliente com 1 Click ativado), o select com os enderecos do cliente e montado e exibido.
 * Caso o xml seja invalido (cliente com 1 Click desativado) ou o cliente nao esteja logado, o link de ativacao 1 Click e exibido.
 *
 */
function readClientAddress(url){
	new Ajax.Request(url, {
		method : 'get', 
		onComplete: function (transport) {
			if (transport.status == 200) {
				var addressArray = transport.responseXML.getElementsByTagName('ADDRESS'); // Obtem os enderecos do xml
				if (addressArray == null || addressArray.length == 0) {
					showOneClick(false); // Se nao possuir enderecos exibe o link de ativacao
					return;
				} 
				var n = null;
				var selectElement = $('selectaddress');
				for (var x = 0; x < addressArray.length; x++ ) {
					var opt = document.createElement("option"); // cria um novo elemento option	
					opt.value = transport.responseXML.getElementsByTagName('ID')[x].childNodes[0].nodeValue; // atribui o id do endereco do usuario ao valor do option do select							
					opt.text = transport.responseXML.getElementsByTagName('NAME')[x].childNodes[0].nodeValue; // atribui o endereco do usuario ao option do select
					if (!n) {
						n = opt.value;
					}		
					addOption(selectElement, opt);
				}
				selectElement.appendChild($('newAddress')[0]); // Adiciona a opcao Novo Endereco ao form. NAO USAR A FUNCAO addOption PARA ESTE OPTION
				selectElement.value = n;	
				copyAddressList();

				showOneClick(true);	// exibe o select criado						
			}
		},
		onFailure : showOneClick(false)
	});
	
}

function copyAddressList() {
	var total = $('selectaddress').length;
	var itens = $('itensCount');

	if (itens == null)
		return;

	for (var k=0; k<itens.value; k++) {
		var selectElementList = $('selectaddress'+k);
		if (selectElementList != null) {
			for (var ij=0; ij<total; ij++) {
				var opt = document.createElement("option"); 
				opt.value = $('selectaddress')[ij].value;
				opt.text = $('selectaddress')[ij].text;
				addOption(selectElementList, opt);
				//selectElementList.appendChild($('selectaddress')[ij]);
			}
		}
	}
}
/**
 * @author Bruno Lacerda	
 *
 * Manipula a exibicao do texto tira duvidas do one click e do botao adicionar a lista 
 */
function handleTip(event, visibilityType) {
	$("moreInfo").style.display = event;
	document.getElementsByClassName('btAddList')[0].style.visibility = visibilityType;
}

/**
 * @author Bruno Lacerda	
 *
 * Adiciona opcoes a um determinado select
 */
function addOption(selectElement, opt) {
	try {
		selectElement.add(opt, null); // adiciona o option a lista de enderecos - Firefox
	} catch (e) {
		selectElement.add(opt); // adiciona o option a lista de enderecos - IE
				
	}
}

/**
 * @author Bruno Lacerda	
 *
 * Exibe o formulario com as opcoes de compra com 1 clique ou o link de ativação da funcionalidade.
 */		 
function showOneClick(flag) {
	if ($("1clickform") != null) {
		if (flag) {
			$("1clickform").style.display = "block";
			$("1clicklink").style.display = "none";
		} else {
			$("1clickform").style.display = "none";
			$("1clicklink").style.display = "block";
		}
	}
	else {
		showOneClickList(flag);
	}
}

function showOneClickList(logged, max) {
	//se vier da funcao antiga, quando pegar o endereco, faz a transformacao
	if (max == null && $('itensCount') != null) {
		var max = $('itensCount').value;
	}

	for (i = 0; i<max; i++) {
		var form = $("1clickform"+i);
		var link = $("1clicklink"+i);
		if (form != null && link != null) {
			if (logged) {
				form.style.display = "block";
				link.style.display = "none";
			}
			else {
				form.style.display = "none";
				link.style.display = "block";
			}
		}
	}
}

/**
 * @author Bruno Lacerda	
 * 
 * Redireciona o cliente para a pagina de login ou para a pagina de compra com 1 clique
 * dependendo do status do cliente e da configuracao da funcionalidade 1 Clique.
 * Esta funcao redireciona o cliente para a pagina de login ou para a pagina de compra com 1 clique
 * dependendo do status do cliente. 
 *
 * @param urlP 	 
 * Url ao qual o cliente sera direcionado ao clicar no link de ativacao ou no botao
 * comprar com 1 clique
 * 
 * @param isOCP
 * Parametro que informa para o checkout se o cliente esta dentro do processo 1 clique ou nao.
 * Para processo 1 Clique o valor do parametro isOCP sera 1 caso contrario o valor 0 e atribuido ao parametro
 * 
 * @param productId
 * ID do produto que esta sendo exibido na pagina de detalhe do produto
 *
 * @param index
 * se o request vier da lista de produtos, index vira com o indice do produto selecionado
 */
function performOneClickBuy(urlP, isOCP, productId, index ) {
	//Verifica se o produto tem mais de um SKU, e retorna o SKU selecionado
	
	var giftCheck = $("isGift");
	var addressSelect = $("selectaddress");
	if (index != null) {
		giftCheck = $("isGift" + index);
		addressSelect = $("selectaddress" + index);
	}

	var skuDiff = getSku('skuDiff',productId);
	if(skuDiff)
		productId = skuDiff;
	
	// informa ao checkout se o cliente escolheu a opcao de embalagem para presente
	var isGift = 0;
	if ( giftCheck != null && giftCheck.checked ) {
		isGift = 1;
	}	

	// informa ao checkout o id do endereco de entrega escolhido pelo cliente no momento da compra com 1 clique
	var addressId = 0;
	if (addressSelect.value != "") {
		addressId = addressSelect.value;
	}
	
	var params = "?IsOCP=" + isOCP;
	params = params + "&OcAtt=" + productId;
	params = params + "," + isGift;					
	params = params + "," + addressId;		
	var url = urlP + params;			
	document.location = url;
}

/**
 * @author Bruno Lacerda	
 * 
 * Redirecionamento do cliente para a pagina de inclusao 
 * de novo endereco para a funcionalidade one click
 *
 * @param index
 * se o request vier da lista de produtos, index vira com o indice do produto selecionado
 *
 */
function verifyAddAddress(url, index) {
	var selectAddress = $('selectaddress');
	if (index != null) {
		selectAddress = $('selectaddress' + index);
	}

	if ( selectAddress.value == "novoendereco" ) {
		document.location = url;
	}
}

/*
 * FINAL DAS FUNCOES PARA FUNCIONALIDADE ONE CLICK
 */
 
 /*  Tamanho da fonte da descricao do produto */
	var productDescriptionActualFontSize = 1.0
	var productDescriptionDefaultFontSize = 1.0 
	var productDescriptionMAXFontSize = 1.7
	var productDescriptionMINFontSize = 0.5
	var productDescriptionFontSizeOffset = 0.1

	function atualizaFonte (idBase, tabs) {
		for (var tb=1; tb<=tabs; tb++)
		{
			var id = idBase + tb;
			if (document.getElementById(id) != null)
			{
				var pObjs = document.getElementById(id).getElementsByTagName ('*');
				for (var i=0; i<pObjs.length; i++)
					if (pObjs[i].tagName.toLowerCase() == 'li' || pObjs[i].tagName.toLowerCase() == 'p')
						pObjs[i].style.fontSize = productDescriptionActualFontSize + 'em';
			}
		}
	}


	function reduzFonte (id,tabs) {
		var tempValue = productDescriptionActualFontSize - productDescriptionFontSizeOffset;
		var newValue = Math.max(productDescriptionMINFontSize, tempValue);

		productDescriptionActualFontSize = newValue;
		atualizaFonte(id,tabs);
	}

	function aumentaFonte (id,tabs) {
		var tempValue = productDescriptionActualFontSize + productDescriptionFontSizeOffset;
		var newValue = Math.min(productDescriptionMAXFontSize, tempValue);

		productDescriptionActualFontSize = newValue;
		atualizaFonte(id,tabs);
	}

	function resetaFonte (id,tabs) {
		productDescriptionActualFontSize = productDescriptionDefaultFontSize;
		atualizaFonte(id,tabs);
	}
 /*  END: Tamanho da fonte da descricao do produto */

/* Funcao para recuperar parametros de URL */
function gup( name ){
  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
  var regexS = "[\\?&]"+name+"=([^&#]*)";
  var regex = new RegExp( regexS );
  var results = regex.exec( window.location.href );
  if( results == null )
    return "";
  else
    return results[1];
}
