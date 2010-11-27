// Valida se o valor passado é numérico
// AMartins : 09/01/2006
// Returns Boolean
function isNumber ( pStrExp ){
	var bolReturn = false;
	if ( trim( pStrExp ) != '' ){ // se foi passado algum valor
		var oRegNumber = /\D/;
		bolReturn = !oRegNumber.test( pStrExp );
	}
	return bolReturn;
}

// Remove os espaços no começo e fim da string passada
// AMartins : 09/01/2006
// Returns String
function trim( pStrExp )
{
   return pStrExp.replace(/^\s*|\s*$/g, '');
}

// Valida se o email passado está correto
// AMartins : 09/01/2006
// Returns Boolean
function isEmail ( pStrExp ){
	var bolReturn = false;
	if ( trim( pStrExp ) != '' ){ // se foi passado algum valor
		var oRegEmail = /^[a-z0-9\._\-]+\@[a-z0-9\._\-]+\.[a-z]{2,3}$/i;
		bolReturn = oRegEmail.test( pStrExp );
	}
	return bolReturn;
}

// binda os dados do cep passado nos controles passados
// Usado em conjundo com a classe de data que retorna cep
// AMartins : 10/01/2006
// Returns Nothing
// Carlos Brito : 29/03/2007
// Incluído o tratamento para os campos tbxAddressNumber, tbxAddrComplement
function fBindCep( tbxZipCode, ddlCountry, tbxAddress, tbxCityRegion, tbxCity, ddlState, tbxAddressNumber, tbxAddrComplement, tbxCityZipValidation, tbxStateZipValidation, formName ){

	var pStrCep = tbxZipCode.value;
	
	// transforma as váriaveis passadas em objetos
	ddlCountry = document.getElementById( ddlCountry );
	tbxAddress = document.getElementById( tbxAddress );
	tbxCityRegion = document.getElementById( tbxCityRegion );
	tbxCity = document.getElementById( tbxCity );
	ddlState = document.getElementById( ddlState );
	tbxAddressNumber = document.getElementById( tbxAddressNumber );
	tbxAddrComplement = document.getElementById( tbxAddrComplement );
	tbxCityZipValidation = document.getElementById( tbxCityZipValidation );
	tbxStateZipValidation = document.getElementById( tbxStateZipValidation );
	
	if ( ddlCountry[ ddlCountry.selectedIndex ].value == 'BR' ){ // verifica se o país selecionado é brasil
		pStrCep = trim( pStrCep.replace('-', '').replace('/', '').replace('\\', '') );
		if( pStrCep != '' ){
		
			if ( isNumber( pStrCep ) ){ // o CEP tem que possuir 8 digítos e precisa ser numérico
			
				// Busca o cep através de AJAX
				var objReturn = eval(formName + '.GetCEPAddress( pStrCep )');
				
				if ( objReturn.value != null )
				{
					with( objReturn.value )
					{
						if (!((pStrCep.substring(5) == "000") && (Address == City)))
						{
							tbxAddress.value = Address;	
						}
						else
						{
							tbxAddress.value = "";
						}
						
					
						//tbxAddress.value = Address;
						tbxCityRegion.value = CityRegion;
						tbxCity.value = City;
						tbxCityZipValidation.value = City;
						ddlState.value = StateAbbreviation;
						tbxStateZipValidation.value = StateAbbreviation;
						//limpa o conteúdo para atualização
						tbxAddressNumber.value = ''; 
						tbxAddrComplement.value = '';
					}
				}
				else
				{
					tbxAddress.value = '';
					tbxCityRegion.value = '';
					tbxCity.value = '';
					tbxCityZipValidation.value = '';
					tbxStateZipValidation.value = '';
					tbxAddressNumber.value = ''; 
					tbxAddrComplement.value = '';
					vShowCepMessage( 'Cep não encontrado. Deseja confirmar este CEP?', tbxZipCode, false, false, true);
				}
			
			}else{
				vShowCepMessage( 'Cep Inválido', tbxZipCode, true, true, false);
			}

		}
	}

}

// Mostra mensagem de erro de cep para o cliente 
// AMartins : 10/01/2006
// Returns Nothing
function vShowCepMessage( pStrMessage, pObject, pBolSelectField, pBolEraseField, pBolConfirm ){
	if(pBolConfirm)
	{
		if (!confirm(pStrMessage))
		{
			pBolSelectField = true;
			pBolEraseField = true;
		}
	}
	else
	{
		alert( pStrMessage );
	}
	
	if ( pBolEraseField ) { pObject.value = ''; }
	if ( pBolSelectField ) { pObject.focus(); pObject.select(); }
}


// Abre o popup de cep
// AMartins : 10/01/2006
// Returns Nothing
function ShowCepPopup(){
	window.open('http://www.correios.com.br/servicos/cep/cep_default.cfm','ShowCep','location=no,resize=no, width=730,height=400,left=18,top=18,maximized=0,scrollbars=1');
}

// Abre o popup de ajuda de cep
// AMartins : 10/01/2006
// Returns Nothing
//<epsilva> 06/11/2006
//:: sParamHttp : http da loja que está chamando o pop-up
//:: bIsToUseHttp : booleano que indica se a string http informada no primeiro parâmetro é para
//					ser usada na chamada da página help_bsi.
function ShowCepHelpPopup(sParamHttp, bIsToUseHttp){
	if(bIsToUseHttp)
		window.open(sParamHttp + 'client_include/br/help_bsi.asp', '', 'width=450, height=440, resizable=no, scrollbars=yes, disabletop=y');
	else
		window.open('/client_include/br/help_bsi.asp', '', 'width=450, height=440, resizable=no, scrollbars=yes, disabletop=y');
}
//function ShowCepHelpPopup(){
//	window.open('/client_include/br/help_bsi.asp', '', 'width=450, height=440, resizable=no, scrollbars=yes, disabletop=y');
//}
//</epsilva> 06/11/2006

//Permite a digitação dos caracteres solicitados
//Autor: TMoraes
//Data: 17/02/2006
function AllowedKeys(strChars){

	var lngKey;			// Código ASC da tecla digitada
	var strValor;
	
	lngKey = window.event.keyCode;
	strValor = String.fromCharCode(lngKey);
		
	if ( (strChars.indexOf(strValor) < 0 )&& (lngKey != 9)){
		window.event.keyCode = 0;
		return false;
	}
	
	return true;	
}

//Permite a digitação de números
//Autor: TMoraes
//Data: 17/02/2006
function NumbersOnly(myfield, e, dec)
{
	var key;
	var keychar;

	if (window.event)
		key = window.event.keyCode;
	else if (e)
		key = e.which;
	else
		return true;
	
	keychar = String.fromCharCode(key);

	// control keys
	if ((key==null) || (key==0) || (key==8) || (key==9) || (key==27) )
		return true;

	// numbers
	else if ((("0123456789").indexOf(keychar) > -1))
		return true;

	// decimal point jump
	else if (dec && (keychar == "."))
	{
		myfield.form.elements[dec].focus();
		return false;
	}
	else
		return false;
}

// Abre a página da financeira referente ao OrderID passado
// Autor: Douglas Akira Omae
// Data: 22/02/2006
function OpenPagePaymentPost( pathPage )
{
	window.open(pathPage,'PaymentPost','location=no,resize=no, width=730,height=400,left=18,top=18,maximized=0,scrollbars=1');
}


function AutoNext(who, maxLength) 
{
	if (who.value.length == maxLength) 
	{
		var i=0,j=0, indice=-1;
		for (i=0; i<document.forms.length; i++) 
		{
			for (j=0; j<document.forms[i].elements.length; j++) 
			{
				if (document.forms[i].elements[j].name == who.name) 
				{
					indice=i;
					break;
				}
			}
			if (indice != -1)
		         break;
		}
		for (i=0; i<=document.forms[indice].elements.length; i++) {
			if (document.forms[indice].elements[i].name == who.name) {
				while ( (document.forms[indice].elements[(i+1)].type == "hidden") &&
						(i < document.forms[indice].elements.length) ) {
							i++;
				}
				document.forms[indice].elements[(i+1)].focus();
				break;
			}
		}
	}
}
	
function submitOnEnterChangePW(e, button)
{
	var key;
	if (window.event)
		key = window.event.keyCode;
	else if (e)
		key = e.which;
	else
		key = 0;
	if (key == 13)
	{ 
		var Image = document.getElementById( button );
		Image.click();
		

		return false;
	} else {
		return true;
	}
}

//Gera um click no objeto passado em no caso de "Enter" Pressionado
//Esta funçõa deve ser chamada no OnKeyDown do objeto
function ClickOn(element, e, objName) 
{
	var key;
	
	if (window.event)
		key = window.event.keyCode;
	else if (e)
		key = e.which;
	else
		key = 0;

	// Se for "Enter"
	if (key==13)
	{
		var Image = document.getElementById( objName );
		Image.click();
		return false;
	}
	else
	{
		return true;
	}
}

//Não gera click para os objetos passados
//Esta funçõa deve ser chamada no OnKeyDown do objeto
function ClickOff(element, e) 
{
	var key;
	
	if (window.event)
		key = window.event.keyCode;
	else if (e)
		key = e.which;
	else
		key = 0;

	// Se for "Enter"
	if (key==13)
	{
		return false;
	}
	else
	{
		return true;
	}
}

//Popup
function openPopUp(URL, NAME, OPTIONS) 
{
	window.open(URL, NAME, OPTIONS)
}