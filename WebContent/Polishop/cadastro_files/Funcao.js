
if (typeof ConfiguraControleAcessorios != 'function') {
    ConfiguraControleAcessorios = function () { };
}

if (typeof ep.vars != 'object') {
    ep = { 'vars': {}, 'fn': {}, 'sku': { 'iniciar': null} };
}

if (typeof ep.vars.urlsite == 'string' && ep.vars.urlsite.charAt(ep.vars.urlsite.length - 1) != "/") {
    ep.vars.urlsite += "/";
};


// funcao que sera sobrescrita pelo controle WebAnalytics.ascx 
PaginaScriptExecuta = function () { };

$(document).ready(function () {
    ep.fn.setupAjax();
    ep.fn.initFullPage();
});



ep.fn.initFullPage = function () {
    if (typeof Sys != 'undefined' && typeof Sys.WebForms != 'undefined' && typeof Sys.WebForms.PageRequestManager != 'undefined') {
        Sys.CultureInfo.prototype._getAbbrMonthIndex = function (value) {
            if (!this._upperAbbrMonths) {
                this._upperAbbrMonths = this._toUpperArray(this.dateTimeFormat.AbbreviatedMonthNames);
            }
            return Array.indexOf(this._upperAbbrMonths, this._toUpper(value));
        };
        //Sys.WebForms.PageRequestManager.getInstance().add_endRequest(ep.fn.functionAfterPostback); // chama funções que reescrevem HTML da página 
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    }
    ep.fn.setupPostBack();
    addInputClasses();
    ep.fn.thickboxInit();

    buscaCepCampos();
    corrigeLinksJanelas();
    criaBuscaPaginaProduto();
    definePopups();
    ep.vars.zoomCalled = 0;
    ep.fn.eventosInputs();
    ep.fn.alternaTextoDefault('fieldset.search input.fitext, div.newsletter input.fitext, #spnTxtConsulta input');
    ep.fn.pagServicoMensagemContador();
    PaginaScriptExecuta();

    if (($('body.sku').length > 0) && (gerAcessorios == null) && (typeof CriarGerenciadorAcessorios == 'function')) {
        CriarGerenciadorAcessorios();
    }
};




ep.fn.functionAfterPostback = function () {
    ep.fn.thickboxInit();
    addInputClasses();
    buscaCepCampos();
    corrigeLinksJanelas();
    //defineAvaliacaoProduto();
    //ep.fn.defineZoomSku();
    definePopups();
    ep.fn.eventosInputs();
    ep.fn.alternaTextoDefault('fieldset.search input.fitext, div.newsletter input.fitext, #spnTxtConsulta input');
    //criaCarrosselSistema();
};
var gerAcessorios = null;
var incItensCompara = 0;
var objComparacao;
var dicionarioSaltaCampo;


// callBack criado para o final de CADA request - DESLIGADO. NAO USAR - DEPRECATED (ep.fn.setupAjax) 
panelCompletouRequest = function (responseText, textStatus, XMLHttpRequest) {
    //ep.fn.functionAfterPostback();
};


ep.fn._onAjaxStart = function () {
    //	$(this).show();
};
ep.fn._onAjaxSend = function () {
    // $(this).show().unbind('ajaxSend');
    //$(this).unbind('ajaxSend');
};
ep.fn._onAjaxStop = function () {
    //	$(this).hide();
    ep.fn.functionAfterPostback();
};
//  usa os eventos globais do ajax do Jquery para rodar as funções apenas ao final de *todos* os request, ao invés de rodar a cada ajax. 
ep.fn.setupAjax = function () {
    if ($('body.popup').length == 0) {
        if ($('#dAjaxLoading').length == 0) {
            $('body').append('<div id="dAjaxLoading"><span></span></div>');
        }
        $('#dAjaxLoading')
			.ajaxStart(ep.fn._onAjaxStart)
			.ajaxSend(ep.fn._onAjaxSend)
			.ajaxStop(ep.fn._onAjaxStop);
    }
};

ep.fn.preventClick = function () {
    return false;
};

// caso não tenha sido criada a função de postback, criar 
ep.fn.setupPostBack = function () {
    if ($('#aspnetForm').lenght > 0) {
        theForm = document.forms['aspnetForm'];
        if (!theForm) {
            theForm = document.aspnetForm;
        }
    }
};

__doPostBack = function (eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
};


// testa se imagem já está carregada 
ep.fn.isImageOk = function (img) {
    if (!img.complete) {
        return false;
    }
    if (typeof img.naturalWidth != "undefined" && img.naturalWidth == 0) {
        return false;
    }
    return true;
};




// outras listas over - IE6 
ep.fn.listasOver = function () {
    $(this).addClass('over');
};
ep.fn.listasOut = function () {
    $(this).removeClass('over');
};
setTodasAsListasOver = function () {
    if ($.browser.msie && $.browser.version < 7) {
        $('#outras-listas-wrapper')
			.unbind()
			.mouseover(ep.fn.listasOver)
			.mouseout(ep.fn.listasOut);
    }
};

function EnviaBusca(Form, txtTexto, comboCategoria, Url) {

    textoBusca = (Form.elements[txtTexto].value.replace(/[\,\+\;\"\'\/\\\<\>]/g, ""));

    if (textoBusca == "Digite aqui")
        textoBusca = "";
    if (textoBusca != "") {
        if (textoBusca.length >= 100)
            textoBusca = textoBusca.substr(0, 99);

        Url = Url.replace("BUSCATEXTBOX", textoBusca);
        FiltroParam = "&";
        if (Form.elements[comboCategoria][document.aspnetForm.elements[comboCategoria].selectedIndex].value != "")
            FiltroParam += "Filtro=C" + Form.elements[comboCategoria][Form.elements[comboCategoria].selectedIndex].value + "&";
        FiltroParam += "gravaBusca=1";
    }
    window.location = Url + FiltroParam;

}

function EnviaFiltroPedido(Form, campoStatus, campoCompra, campoDataDe, campoDataAte, Url) {
    FiltroParam = "";
    flagAtiva = Form.elements[campoStatus][Form.elements[campoStatus].selectedIndex].value;
    idCompra = Form.elements[campoCompra].value;
    dataDe = Form.elements[campoDataDe].value;
    dataAte = Form.elements[campoDataAte].value;
    FiltroParam = "flagAtiva=" + flagAtiva + "&idCompra=" + idCompra + "&dataDe=" + dataDe + "&dataAte=" + dataAte;
    window.location = Url + FiltroParam;
};

function EnviaMarca(Form, comboMarca, Url) {
    if (Form.elements[comboMarca][document.aspnetForm.elements[comboMarca].selectedIndex].value != "") {
        PaginaMarca = Form.elements[comboMarca][Form.elements[comboMarca].selectedIndex].value;
    }
    window.location = PaginaMarca;
};

function onEnter(evt, frm, btnEnter) {
    var keyCode = null;

    if (evt.which) {
        keyCode = evt.which;
    }
    else if (evt.keyCode) {
        keyCode = evt.keyCode;
    }
    if (13 == keyCode) {
        frm.elements[btnEnter].click();
        return false;
    }
    return true;
};


ep.fn.AbrePop = function (obj) { };

ep.fn.AbrePopCompleta = function (obj) {
    if (window.open) {
        obj.janela = window.open(obj.href, "PopExterna");
        if (obj.janela) {
            if (obj.janela.focus) {
                obj.janela.focus();
            }
            return false;
        }
    }
    return true;
};

function Popup(url, width, height) { // REMOVER 
    window.open(url, "Popup", "width='+width+'px,height='+height+'px,resizable=1,scrollbars=1,status=yes");
};

//
// Salta para o próximo campo se o campo informado tiver atingido o tamanho máximo.
//
function SaltaCampo(campo, prox, tammax, teclapres) {
    var tecla = teclapres.keyCode;
    var vr = campo.value;
    var tam = vr.length;

    // Desconsidera o [tab] e o [shift+tab]
    if ((tecla != 9) && (tecla != 16)) {
        if (campo.value.length >= tammax) {
            // Trunca o conteudo para o tamanho máximo, no caso de CTRL+V
            campo.value = campo.value.substring(0, tammax);
            // Muda o foco para o próximo componente
            if (prox.focus) {
                prox.focus();
            }
        }
    }
};
//
//
// Salta para o campo anterior se o campo informado tiver atingido o tamanho máximo.
//
//
function SaltaCampoTras(campo, prox, tammax, e) { };

function checkKeySetClick(srcClickObj, e) {
    var key;
    if (window.event) {
        key = window.event.keyCode; //IE
    } else {
        key = e.which; //firefox
    }
    if (key == 13) {
        return false;
    }
};
function PopUpWindow(url, width, height, name, scroll) {
    var top = (screen.height - height) / 2;
    var left = (screen.width - width) / 2;
    window.open(url, name, 'scrollbars=' + scroll + ',status=0,menubar=0,resize=0,width=' + width + ',height=' + height + ',top=' + top + ',left=' + left);
};

function mascara(o, f) {
    v_obj = o;
    v_fun = f;
    setTimeout("execmascara()", 1);
};

function execmascara() {
    v_obj.value = v_fun(v_obj.value);
};

function cpf(v) {
    v = v.replace(/\D/g, ""); //Remove tudo o que não é dígito
    v = v.substring(0, 11); //Trunca digitos excedentes
    v = v.replace(/(\d{3})(\d)/, "$1.$2"); //Coloca um ponto entre o terceiro e o quarto dígitos
    v = v.replace(/(\d{3})(\d)/, "$1.$2"); //Coloca um ponto entre o terceiro e o quarto dígitos
    //de novo (para o segundo bloco de números)
    v = v.replace(/(\d{3})(\d{1,2})$/, "$1-$2"); //Coloca um hífen entre o terceiro e o quarto dígitos
    return v;
};

function cnpj(v) {
    v = v.replace(/\D/g, ""); //Remove tudo o que não é dígito
    v = v.substring(0, 14); //Trunca digitos excedentes
    v = v.replace(/^(\d{2})(\d)/, "$1.$2"); //Coloca ponto entre o segundo e o terceiro dígitos
    v = v.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3"); //Coloca ponto entre o quinto e o sexto dígitos
    v = v.replace(/\.(\d{3})(\d)/, ".$1/$2"); //Coloca uma barra entre o oitavo e o nono dígitos
    v = v.replace(/(\d{4})(\d)/, "$1-$2"); //Coloca um hífen depois do bloco de quatro dígitos
    return v;
};

function validaData(oSrc, args) {
    var arrDtIn = args.Value.split('/');
    var strDtIn = ('00' + arrDtIn[0]).replace(/^0+(\d\d)/, '$1');
    strDtIn += ('/' + ('00' + arrDtIn[1]).replace(/^0+(\d\d)/, '$1'));
    strDtIn += ('/' + ('0000' + arrDtIn[2]).replace(/^0+(\d\d\d\d)/, '$1'));
    if (arrDtIn.length < 3) {
        return args.IsValid = false;
    }
    var dtIn = new Date(parseInt(arrDtIn[2], 10), parseInt(arrDtIn[1], 10) - 1, parseInt(arrDtIn[0], 10), 12, 0, 0);
    var strDtOut = ('00' + dtIn.getDate()).replace(/^0+(\d\d)/, '$1');
    strDtOut += ('/' + ('00' + (dtIn.getMonth() + 1)).replace(/^0+(\d\d)/, '$1'));
    strDtOut += ('/' + dtIn.getFullYear());
    if (strDtIn != strDtOut) {
        args.IsValid = false;
    } else {
        args.isValid = true;
    }

    return false;
};
function validaDataNasc(oSrc, args) {
    var arrDtIn = args.Value.split('/');
    var strDtIn = ('00' + arrDtIn[0]).replace(/^0+(\d\d)/, '$1');
    strDtIn += ('/' + ('00' + arrDtIn[1]).replace(/^0+(\d\d)/, '$1'));
    strDtIn += ('/' + ('0000' + arrDtIn[2]).replace(/^0+(\d\d\d\d)/, '$1'));
    if (arrDtIn.length < 3) {
        args.IsValid = false;
    }
    var dtIn = new Date(parseInt(arrDtIn[2], 10), parseInt(arrDtIn[1], 10) - 1, parseInt(arrDtIn[0], 10));

    var strDtOut = ('00' + dtIn.getDate()).replace(/^0+(\d\d)/, '$1');
    strDtOut += ('/' + ('00' + (dtIn.getMonth() + 1)).replace(/^0+(\d\d)/, '$1'));
    strDtOut += ('/' + dtIn.getFullYear());

    alert(strDtIn + ">>" + strDtOut);

    if ((strDtIn != strDtOut) || (dtIn > new Date())) {
        args.IsValid = false;
    }
    args.isValid = true;
};
function validaDataEvento(oSrc, args) {
    var arrDtIn = args.Value.split('/');
    var strDtIn = ('00' + arrDtIn[0]).replace(/^0+(\d\d)/, '$1');
    strDtIn += ('/' + ('00' + arrDtIn[1]).replace(/^0+(\d\d)/, '$1'));
    strDtIn += ('/' + ('0000' + arrDtIn[2]).replace(/^0+(\d\d\d\d)/, '$1'));

    if (arrDtIn.length < 3) {
        return args.IsValid = false;
    }
    var dtIn = new Date(parseInt(arrDtIn[2], 10), parseInt(arrDtIn[1], 10) - 1, parseInt(arrDtIn[0], 10));

    var strDtOut = ('00' + dtIn.getDate()).replace(/^0+(\d\d)/, '$1');
    strDtOut += ('/' + ('00' + (dtIn.getMonth() + 1)).replace(/^0+(\d\d)/, '$1'));
    strDtOut += ('/' + dtIn.getFullYear());
    if ((strDtIn != strDtOut) || (dtIn < new Date())) {
        args.IsValid = false;
    } else {
        args.isValid = true;
    }
    return false;
};

function valida_CPFCNPJ(oSrc, args) {
    if (args.Value.replace(/[^\d]/g, '').length == 11) {
        valida_CPF(oSrc, args);
    } else if (args.Value.replace(/[^\d]/g, '').length == 14) {
        valida_CNPJ(oSrc, args);
    } else {
        args.IsValid = false;
    }
};

//Validação de CPF
function valida_CPF(oSrc, args) {
    var i;
    s = args.Value.replace(/[^\d]/g, '');
    var c = s.substr(0, 9);
    var dv = s.substr(9, 2);
    var d1 = 0;
    for (i = 0; i < 9; i++) {
        d1 += (c.charAt(i) * (10 - i));
    }
    if (d1 == 0) {
        args.IsValid = false;
        return;
    }
    d1 = 11 - (d1 % 11);
    if (d1 > 9) {
        d1 = 0;
    }

    if (dv.charAt(0) != d1) {
        args.IsValid = false;
        return;
    }
    d1 *= 2;
    for (i = 0; i < 9; i++) {
        d1 += (c.charAt(i) * (11 - i));
    }
    d1 = 11 - (d1 % 11);
    if (d1 > 9) {
        d1 = 0;
    }
    if (dv.charAt(1) != d1) {
        args.IsValid = false;
        return;
    }
    args.IsValid = true;
};

//Validação de CNPJ
function valida_CNPJ(oSrc, args) {
    args.IsValid = true;
    var cnpj = args.Value;
    var valida = new Array(6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2);
    var dig1 = new Number;
    var dig2 = new Number;
    exp = /\.|\-|\//g
    cnpj = cnpj.toString().replace(exp, "");
    var digito = new Number(eval(cnpj.charAt(12) + cnpj.charAt(13)));
    for (i = 0; i < valida.length; i++) {
        dig1 += (i > 0 ? (cnpj.charAt(i - 1) * valida[i]) : 0);
        dig2 += cnpj.charAt(i) * valida[i];
    }
    dig1 = (((dig1 % 11) < 2) ? 0 : (11 - (dig1 % 11)));
    dig2 = (((dig2 % 11) < 2) ? 0 : (11 - (dig2 % 11)));
    if (((dig1 * 10) + dig2) != digito) {
        args.IsValid = false;
        return;
    }
};
function soNumeros(v) {
    return v.replace(/\D/g, "")
};

function AlertDesenvolvimento() {
    alert("Funcionalidade em Desenvolvimento\n Aguarde próximos releases.");
};
function AlertSemEspecificacao() {
    alert("Especificação pendente.\n Aguarde próximos releases.");
};

function MarcarComparacao(idProd, marcado) {
    var obj = objComparacao;
    var vet = obj.value.split(",");
    var achou; //Adiciono os ids clicados
    if (marcado) {
        incItensCompara++;
        achou = false;
        for (i = 0; i <= vet.length - 1; i++) {
            if (idProd == vet[i]) {
                achou = true;
            }
        }
        if (!achou) {
            if (obj.value.length > 0) {
                obj.value += "," + idProd;
            } else {
                obj.value += idProd;
            }
        }
    } else { //Apago os ids clicados
        incItensCompara--;
        if (obj.value.length > 0) {
            for (i = 0; i <= vet.length - 1; i++) {
                if (idProd == vet[i]) {
                    if (i == 0) {
                        if (vet.length > 1) {
                            obj.value = obj.value.replace(idProd + ",", "");
                        } else {
                            obj.value = obj.value.replace(idProd, "");
                        }
                    } else {
                        obj.value = obj.value.replace("," + idProd, "");
                    }
                }
            }
        }
    }
    if (document.getElementById("NumeroSuperior") != null) {
        document.getElementById("NumeroSuperior").innerHTML = incItensCompara;
        document.getElementById("NumeroInferior").innerHTML = incItensCompara;
    }
};

function Comparar(ClientID, Url) {
    var obj = document.getElementById(ClientID);
    var MsgErro = document.getElementById("divAlerta");
    objComparacao = obj;
    var vet = obj.value.split(",");
    if (vet.length >= 2 && vet.length <= 4) {
        window.location = "../../Site/ComparacaoProduto.aspx?ProdutosCompara=" + obj.value + "&ReturnUrl=" + Url;
    } else if (vet.length < 2) {
        MsgErro.innerHTML = "<p><strong>Aten&ccedil;&atilde;o:</strong> M&iacute;nimo de 2 produtos para comparar.</p>";
        MsgErro.style.display = 'block';
    } else if (vet.length > 4) {
        MsgErro.innerHTML = "<p><strong>Aten&ccedil;&atilde;o:</strong> M&aacute;ximo de 4 produtos para comparar.</p>";
        MsgErro.style.display = 'block';
    }
};

function MontaUrl(url, ClientID) {
    var obj = document.getElementById(ClientID);
    objComparacao = obj;
    window.location = url + '&ComparacaoProdutos=' + obj.value;
};

function CarregaTela(ClientID) {
    var obj = document.getElementById(ClientID);
    objComparacao = obj;
    if (typeof obj != 'undefined' && obj != null && obj.value.length > 0) {
        var vet = obj.value.split(",");
        if (incItensCompara == 0) {
            if (vet[0] != "") {
                incItensCompara = vet.length;
            }
            if (document.getElementById("NumeroSuperior") != null) {
                document.getElementById("NumeroSuperior").innerHTML = incItensCompara;
                document.getElementById("NumeroInferior").innerHTML = incItensCompara;
            }
        }
    }
};

function chat(url) {
    var hWnd = window.open(url, "chat", "width=400,height=450,resizable=no,toolbar=0,location=0,directories=0,status=no,menubar=0,scrollbars=0");
    //window.open(url,"chtsub","width=620,height=428,resizable=no,toolbar=0,location=0,directories=0,status=no,menubar=0,scrollbars=0");
    if (hWnd != null) {
        if (hWnd.opener == null) {
            hWnd.opener = self;
            hWnd.location.href = url;
        }
    }
};

function checkFormValidation(oDivMensagem, sRedirecionamentos) {
    if (BuscandoCEP) {
        BuscandoCEP = false;
        return;
    }

    if (typeof (Page_IsValid) != "undefined") {

        for (i = 0; i < Page_Validators.length; i++) {
            var sCtrl = Page_Validators[i].controltovalidate;
            var oCtrl = document.getElementById(sCtrl);

            if (typeof (oCtrl) != "undefined" && oCtrl != null) {
                try {
                    if ((oCtrl.tagName && oCtrl.tagName == 'SELECT') || (oCtrl == "[object HTMLSelectElement]")) {
                        oCtrl.className = oCtrl.className.replace(/^errorSelect$/gi, ' ');
                        oCtrl.className = oCtrl.className.replace(/^errorSelect\s/gi, ' ');
                        oCtrl.className = oCtrl.className.replace(/\serrorSelect$/gi, ' ');
                        oCtrl.className = oCtrl.className.replace(/\serrorSelect\s/gi, ' ');
                    }
                    else {
                        oCtrl.className = oCtrl.className.replace(/^error$/gi, ' ');
                        oCtrl.className = oCtrl.className.replace(/^error\s/gi, ' ');
                        oCtrl.className = oCtrl.className.replace(/\serror$/gi, ' ');
                        oCtrl.className = oCtrl.className.replace(/\serror\s/gi, ' ');
                    }
                } catch (err) { }
            }

            var arrRedirecionamentos = sRedirecionamentos.split('#');
            for (k = 0; k < arrRedirecionamentos.length; k++) {
                if ((arrRedirecionamentos[k] != null) && (arrRedirecionamentos[k] != '')) {
                    oCtrl = document.getElementById(arrRedirecionamentos[k].split('|')[1]);
                    if (typeof (oCtrl) != "undefined" && oCtrl != null) {
                        oCtrl.className = oCtrl.className.replace(/^error$/gi, ' ');
                        oCtrl.className = oCtrl.className.replace(/^error\s/gi, ' ');
                        oCtrl.className = oCtrl.className.replace(/\serror$/gi, ' ');
                        oCtrl.className = oCtrl.className.replace(/\serror\s/gi, ' ');
                    }
                }
            }
        }
        if (!Page_IsValid) {
            var arrRedirecionamentos = sRedirecionamentos.split('#');
            var arrObjInvalidos = new Array();

            document.getElementById(oDivMensagem).style.display = 'block';
            for (i = 0; i < Page_Validators.length; i++) {
                var sCtrl = Page_Validators[i].controltovalidate;
                var oCtrl = document.getElementById(sCtrl);
                if (!Page_Validators[i].isvalid) {
                    for (k = 0; k < arrRedirecionamentos.length; k++) {
                        if (arrRedirecionamentos[k] != null) {
                            if (arrRedirecionamentos[k].split('|')[0] == sCtrl) {
                                arrObjInvalidos[arrObjInvalidos.length] = document.getElementById(arrRedirecionamentos[k].split('|')[1]);
                            }
                        }
                    }
                    arrObjInvalidos[arrObjInvalidos.length] = oCtrl;
                }
            }
            for (i = 0; i < arrObjInvalidos.length; i++) {
                if ((typeof (arrObjInvalidos[i]) != 'undefined') && (arrObjInvalidos[i] != null)) {
                    if ((arrObjInvalidos[i].tagName && arrObjInvalidos[i].tagName == 'SELECT') || (arrObjInvalidos[i] == "[object HTMLSelectElement]")) {
                        arrObjInvalidos[i].className += " erroSelect";
                    } else {
                        arrObjInvalidos[i].className += " error";
                    }
                }
            }
            return false;
        }
    }
};


// ########################  
// Carrossel usando jQuery
// ########################

criaCarrosselSistema = function () {
    //$('div.prateleira').epcarrossel();
    $('div.carrosselSistema').each(function () {
        if ($(this).hasClass('carrosselVertical')) {
            $(this).epcarrossel({ 'vertical': true });
        } else {
            $(this).epcarrossel();
        }
    });
};

$.fn.getDimensions = function () {
    var dim = 0;
    $(this).find(options.element).each(function () {
        dim = dim + (options.vertical ? $(this).outerHeight() + parseInt($(this).css('marginTop')) + parseInt($(this).css('marginBottom')) : $(this).outerWidth() + parseInt($(this).css('marginRight')) + parseInt($(this).css('marginLeft')));
    });
    return dim;
};

$.fn.destroyCarousel = function () {
    if ($(this).hasClass(options.carClass)) {
        $(this).find(options.elementGroup).css({ 'width': 'auto', 'height': 'auto' });
        $(this).find('.carrosselProdutos').replaceWith($(this).find(options.elementGroup));
        $(this).removeClass(options.carClass);
    };
    return this;
};

$.fn.createCarousel = function () {
    // wraps container element (ul) in some html to make a viewport and scrolls 
    if (options.vertical) {
        $(this).find(options.elementGroup).eq(0).wrap(options.wrapper).css({ 'height': options.elWH });
        $(this).find(options.elementGroup).parent().css({ 'height': options.elWH });
    } else {
        $(this).find(options.elementGroup).eq(0).wrap(options.wrapper).css({ 'width': options.elWH });
        $(this).find(options.elementGroup).parent().css({ 'width': options.elWH });
    }
    $(this).find('div.carrosselProdutos')
		.addClass(((options.vertical) ? 'carVertical' : 'carHorizontal'))
		.prepend(options.bts);
    $(this).addClass(options.carClass);
    return this;
};
$.fn.associateEvents = function () {
    fn.init(this);
    return this;
};

//$.testaCarrosseisLargura = function(){
//	if(typeof criaCarrosseis == 'function'){
//		criaCarrosseis();
//	} else {
//		window.ep.vars.carrosseis = $('.carrossel');
//		$(window.ep.vars.carrosseis).epcarrossel();
//	}
//};


ep.vars.firstLoad = true;
ep.vars.currentWidth = document.documentElement.clientWidth;
ep.fn.onWindowresize = function (event) {
    if (!$.browser.msie || (ep.vars.currentWidth != document.documentElement.clientWidth && ep.vars.firstLoad == false)) {
        //$.testaCarrosseisLargura();
    }
    ep.vars.currentWidth = document.documentElement.clientWidth;
    ep.vars.firstLoad = false;
};
$(window).bind('resize', ep.fn.onWindowresize);


$.fn.epcarrossel = function (settings) {
    options = jQuery.extend({
        speed: "fast",
        scroll: 1,
        vertical: false,
        required: false,
        element: 'li',
        elementSelector: 'div.maisImagensInner li',
        elementGroup: 'ul',
        btClass: { all: 'a.btCarrossel', prev: 'a.btn-nav-esquerda', next: 'a.btn-nav-direita' },
        innerClass: 'div.maisImagensInner',
        wrapper: '<div class="carrosselProdutos"><div class="maisImagensWrapper"><div class="maisImagensInner"></div></div></div>',
        bts: '<ol class="carroselBtLista"><li class="bt-left"><a href="#" class="btn-nav-esquerda btn-sobeCar btCarrossel">sobe</a></li><li class="bt-right"><a href="#" class="btn-nav-direita btn-desceCar btCarrossel">desce</a></li></ol>',
        btPosition: 'before',
        carClass: 'carrossel',
        elDim: null,
        elWH: null,
        wh: null,
        lt: null
    }, settings);

    calculaDimensoes = function (el, options) {
        return (options.vertical) ? $(el).height() + parseInt($(el).css('marginTop')) + parseInt($(el).css('marginBottom')) : $(el).width() + parseInt($(el).css('marginLeft')) + parseInt($(el).css('marginRight'));
    };

    fn = {
        init: function (obj) {
            var el;
            $(obj).find(options.btClass.prev).unbind().click(fn.goPrev);
            $(obj).find(options.btClass.next).unbind().click(fn.goNext);
            $(obj).find(options.innerClass).css({ 'top': 0, 'left': 0 });
            el = $(obj).find(options.elementSelector);
            options.elDim = calculaDimensoes(el, options);
            options.firstClick = true;
            $(obj).find(options.btClass.next).data('opt', options);
            $(obj).find(options.btClass.prev).data('opt', options);
        },
        goPrev: function () {
            options = $(this).data('opt');
            fn.walk(false, $(this).parents('div.carrosselProdutos').find(options.innerClass));
            return false;
        },
        goNext: function () {
            options = $(this).data('opt');
            fn.walk(true, $(this).parents('div.carrosselProdutos').find(options.innerClass));
            return false;
        },
        getDim: function () { },
        getLimits: function () { },
        walk: function (sinal, obj) {
            var el = $(obj);
            var newPos = 0;
            newPos = fn.calculatePosition(el, sinal);
            var animDirection = (options.vertical) ? { 'top': newPos} : { 'left': newPos };
            el.animate(animDirection, 500);
        },
        calculatePosition: function (obj, sinal) {
            var newPos, leftBound, rightBound, leftLimit, rightLimit;
            if (options.firstClick && $.browser.msie) {
                options.elWH = $(obj).parents('.carrossel').getDimensions();
                options.elDim = calculaDimensoes($(obj).find(options.element), options);
            }

            if (sinal) {
                newPos = parseInt($(obj).css(options.lt)) - (options.elDim * options.scroll);
            } else {
                newPos = parseInt($(obj).css(options.lt)) + (options.elDim * options.scroll);
            }
            leftBound = parseInt($(obj).position()[options.lt]) + newPos;
            rightBound = parseInt($(obj).position()[options.lt]) + parseInt(options.elWH) + newPos;
            leftLimit = 0;
            rightLimit = (options.vertical) ? parseInt($(obj).parent().height()) : parseInt($(obj).parent().width());

            if (rightBound < rightLimit && sinal) {
                newPos = -(options.elWH - rightLimit);
            }
            if ((leftBound >= leftLimit) || (newPos > leftLimit)) {
                newPos = 0;
            }
            if (options.firstClick) {
                options.firstClick = false;
            }

            return newPos;
        }
    };

    return this.each(function (a, b) {
        var grupo, item, container, viewport, mustHaveCarousel;
        $(this).destroyCarousel();
        options.wh = options.vertical ? 'height' : 'width';
        options.lt = options.vertical ? 'top' : 'left';
        options.elWH = $(this).getDimensions();
        mustHaveCarousel = (options.elWH > ((options.vertical) ? $(this).height() : $(this).width()));
        if (mustHaveCarousel || options.required) {
            $(this)
				.createCarousel()
				.associateEvents();
        };
    });
};


// ########################

arrumaPrateleiras = function () {
    var tamanhoMaximo = 0;
    $(".prateleira").each(
		function alteraNome(item) {
		    $(this).removeClass("prateleira");
		    $(this).addClass("ativo");
		    tamanhoMaximo = 0;
		    $(".ativo ul li").each(
				function mostraTamanho(item) {
				    if ($(this).parent().parent().hasClass("ativo")) {
				        var tamanho = $(this).height();
				        if (tamanhoMaximo < tamanho) {
				            tamanhoMaximo = tamanho;
				        }
				    }
				}
			)
		    $(".ativo ul li").height(tamanhoMaximo);
		    $(this).removeClass("ativo");
		}
	)
}

function SomenteNumero(e) {
    var tecla = (window.event) ? event.keyCode : e.which;
    if ((tecla > 47 && tecla < 58)) {
        return true;
    } else {
        return !(tecla != 8 && tecla != 0);
    }
};

var BuscandoCEP;
function AvancaCampo(campo, prox, tammax, teclapres) {
    BuscandoCEP = true;
    var tecla = teclapres.keyCode;
    var Origem = document.getElementById(campo);
    var Destino = document.getElementById(prox);
    // Desconsidera o [tab] e o [shift+tab]
    if ((tecla != 9) && (tecla != 16)) {
        if (Origem.value.length >= tammax) {
            // Trunca o conteudo para o tamanho máximo, no caso de CTRL+V
            Origem.value = Origem.value.substring(0, tammax);
            Destino.focus();
            //Dá o submit para carregar o endereço.
            if ((Origem.value.length == 5) && (Destino.value.length == 3)) {
                setTimeout("__doPostBack('" + campo + "','')", 0);
            } else if (Origem.value.length == 3) {
                setTimeout("__doPostBack('" + campo + "','')", 0);
            }
        }
    }
};
// TODO: usar o 'equalHeights para isso
// Ajusta o tamanho dos boxs dos enderecos
arrumaEndereco = function () {
    var alturaMaxima = 0;
    var divs = $(".lista-endereco ul li div");
    $(divs).each(function (item) {
        var altura = $(this).height();
        alturaMaxima = (altura > alturaMaxima) ? altura : alturaMaxima;
    });
    $(divs).each(function (item) {
        $(this).height(alturaMaxima);
    });
};

// Cadastra campos de CEP para a validacao 
ep.fn.buscaCepKeyUp = function (event) {
    SaltaCampo(this, $('#labelTxtCepSufixo input').get(0), 5, event);
};
campoApenasNumeros = function (event) {
    if (event.keycode == 13) {
        return false;
    }
    mascara(this, soNumeros);
};
buscaCepCampos = function () {
    $('#labelTxtCepPrefixo input')
		.keyup(ep.fn.buscaCepKeyUp)
		.keypress(campoApenasNumeros);
    $('#labelTxtCepSufixo input').keypress(campoApenasNumeros);
};

function ConcatenaNumeroComplemento(dest, field1, field2) {
    $('#' + dest).val($('#' + field1).val() + $('#' + field2).val());
};

function CloseOnReload() {
    self.parent.tb_remove_pt();
};
function RefreshParentPage() {
    self.parent.location.reload();
};

ep.fn.criaBuscaPaginaProdutoClick = function () {
    //$('#pesquisa-palavra').realizaBusca();
    var str = $.trim($('#pesquisa-palavra').val());
    if (str != "") {
        $('body').each(function () {
            $('body').removeHighlight();
            $.highlight(this, str.toUpperCase());
        });
    } else {
        $('body').removeHighlight();
    }
};
criaBuscaPaginaProduto = function () {
    $('span.pesquisar input').click(ep.fn.criaBuscaPaginaProdutoClick);
};


//
//highlight v2
//Highlights arbitrary terms.
//<http://johannburkard.de/blog/programming/javascript/highlight-javascript-text-higlighting-jquery-plugin.html>
//MIT license.
//Johann Burkard
//<http://johannburkard.de>
//<mailto:jb@eaio.com>
//

jQuery(function () {
    jQuery.highlight = document.body.createTextRange ?

    // Version for IE using TextRanges. 
	function (node, te) {
	    var r = document.body.createTextRange();
	    r.moveToElementText(node);
	    for (var i = 0; r.findText(te); i++) {
	        r.pasteHTML('<b class="highlight">' + r.text + '<\/b>');
	        r.collapse(false);
	    }
	}

	:

    //  (Complicated) version for Mozilla and Opera using span tags. 
	function (node, te) {
	    var pos, skip, spannode, middlebit, endbit, middleclone;
	    skip = 0;
	    if (node.nodeType == 3) {
	        pos = node.data.toUpperCase().indexOf(te);
	        if (pos >= 0) {
	            spannode = document.createElement('b');
	            spannode.className = 'highlight';
	            middlebit = node.splitText(pos);
	            endbit = middlebit.splitText(te.length);
	            middleclone = middlebit.cloneNode(true);
	            spannode.appendChild(middleclone);
	            middlebit.parentNode.replaceChild(spannode, middlebit);
	            skip = 1;
	        }
	    }
	    else if (node.nodeType == 1 && node.childNodes && !/(script|style)/i.test(node.tagName)) {
	        for (var i = 0; i < node.childNodes.length; ++i) {
	            i += $.highlight(node.childNodes[i], te);
	        }
	    }
	    return skip;
	};
});

jQuery.fn.removeHighlight = function () {
    this.find("b.highlight").each(function () {
        with (this.parentNode) {
            replaceChild(this.firstChild, this);
            normalize();
        }
    });
    return this;
};

// end highlight 
// Avaliacao produto usuario 
jQuery.resetaEstrelas = function (selecionadoId, avaliacaoProdutoStars) {
    $.each(avaliacaoProdutoStars, function (a, obj) {
        $(obj).removeClass('savedRatingStar').removeClass('filledRatingStar').addClass('emptyRatingStar');
    });
    $.each(avaliacaoProdutoStars, function (a, obj) {
        $(obj).removeClass('emptyRatingStar').addClass('filledRatingStar');
        if ($(obj).attr('id') == selecionadoId) {
            var notaProduto = selecionadoId.substring(selecionadoId.lastIndexOf('_') + 1);
            $(obj).parent().attr('title', notaProduto);
            $(obj).parent().parent().find('#rtAvaliacao_RatingExtender_ClientState').val(notaProduto);
            return false;
        }
    });
};

jQuery.selecionaNotaAvaliacao = function (obj) {
    var selNota = $(obj).parent().find('#rtAvaliacao_RatingExtender_ClientState').val();
    var urlNota = $(obj).parent().find('#hdnUrlResenha').val();
    window.location.href = urlNota + "&CurrentRating=" + selNota;
    //$('#ctl00_Conteudo_Resenha1_pnlAResenhaOpiniao').load(urlNota + "&CurrentRating=" + selNota, function(a, b){
    //	defineAvaliacaoProduto();
    //});
};

jQuery.resetaNotaOriginal = function (obj, orig, todas) {
    $.each(todas, function (a, obj) {
        $(obj).removeClass('filledRatingStar');
    });
    $.each(orig, function (a, obj) {
        $(obj).addClass('savedRatingStar');
    });
};


ep.fn.avaliacaoClick = function () {
    $(this).unbind('mouseout');
    if ($(this).attr('href').indexOf('http://') != -1 || $(this).attr('href').indexOf('https://') != -1) {
        return true;
    }
    $.selecionaNotaAvaliacao(this);
    return false;
};

jQuery.fn.criaAvaliacaoProduto = function () {
    return this.each(function () {
        var avaliacaoProdutoStars = $(this).find('span');
        var avaliacaoNotaOriginal = $(this).find('span.savedRatingStar');
        $(this).find('span')
			.unbind()
			.mouseover(function () { $.resetaEstrelas(this.id, avaliacaoProdutoStars); });
        $(this).find('a')
			.unbind()
			.click(ep.fn.avaliacaoClick)
			.mouseout(function () { $.resetaNotaOriginal(this, avaliacaoNotaOriginal, avaliacaoProdutoStars); });
    });
};

//defineAvaliacaoProduto = function(){
//	$('#rating-avalie-wrapper').criaAvaliacaoProduto();
//};

// fim Avaliacao produto usuario 
abreLinkParent = function () {
    //window.parent.location.reload();
    window.parent.location.href = this.href;
    return false;
};

abreLinkParentRefresh = function () {
    window.parent.location.reload();
    return false;
};

abreLinkExterno = function () {
    var newWin = window.parent.open(this.href, "_blank");
    if (newWin) {
        if (newWin.focus) {
            newWin.focus();
        }
        return false;
    }
    return true;
};

// corrige links das janelas de fechar, apenas se NAO for telerik 
corrigeLinksJanelas = function () {
    $('body.popup a.btn-thickbox, body.popup input.btn-thickbox, body.popup button.btn-thickbox').unbind().click(tb_remove_pt);
    $('body.popup a.lnkParent').unbind().click(abreLinkParent);
    $('body.popup a.lnkParentRefresh').unbind().click(abreLinkParentRefresh);
    $('body.pop-servico a.btn-thickbox').unbind().click(abreLinkParentRefresh);
    $('body.popup a.lnkExterno').unbind().click(abreLinkExterno);
};

function FechaJanelaCarrinhoServico() {
    window.parent.location.reload();
}

// iguala Alturas prateleiras 
//igualaAlturaItensTodos = function(){
//	$('body.todas-categorias div.listas-categorias > div').equalHeightColumn();
//	$('div.prateleira > ul > li').equalHeightColumn();
//	$('body.sku div.lista-comprar li').equalHeightColumn({'other':'#conteudo-central-produto div.lista-comprar div.maisImagensInner , #conteudo-central-produto div.lista-comprar div.maisImagensWrapper'});
//	$('body.sku #qvct div.lista-percentual li').equalHeightColumn({'other':'#qvct div.maisImagensInner , #qvct div.maisImagensWrapper'});
//	$('body.sku #qcct div.lista-percentual li').equalHeightColumn({'other':'#qcct div.maisImagensInner , #qcct div.maisImagensWrapper'});
//	$('body.sku #qvvt div.lista-percentual li').equalHeightColumn({'other':'#qvvt .maisImagensInner , #qvvt div.maisImagensWrapper'});
//	$('body.checkout div.lista-tageado li').equalHeightColumn({'other':'div.lista-tageado div.maisImagensInner , div.lista-tageado div.maisImagensWrapper'});
//};

// plugin para igualar Altura dos itens selecionados. pode-se enviar tags adicionais para que fiquem com a mesma altura máxima 

// 
//	Calcula a altura da prateleira para cada linha. Inicia na altura zero, e para cada elemento que está numa nova linha (offset().top) diferente, 
//	ele cria um novo array com os elementos, define um novo set para os cálculos de altura máxima 
//
$.fn.equalHeightColumn = function (options) {
    var settings = $.extend({ 'other': false }, options);
    var maxMaxHeight = 0;
    var prevTop = 0;
    var rows = [];
    var rowPos = -1;
    var sz;
    var newtop;
    $(this).each(function (c, el) {
        newtop = $(el).offset().top;
        if ((newtop != prevTop) || (c == 0)) {
            rowPos++;
            rows[rowPos] = { maxHeight: 0, elements: [] };
        }
        sz = $(el).height();
        rows[rowPos].maxHeight = (rows[rowPos].maxHeight < sz) ? sz : rows[rowPos].maxHeight;
        maxMaxHeight = (maxMaxHeight < rows[rowPos].maxHeight) ? rows[rowPos].maxHeight : maxMaxHeight;
        rows[rowPos].elements.push($(el));
        prevTop = newtop;
    });
    $.each(rows, function (a, obj) {
        $.each(obj.elements, function (count, elem) {
            elem.height(obj.maxHeight);
        });
    });
    if (settings.other != false) {
        $(settings.other).height(maxMaxHeight);
    }
};
// Timer criado quando o metodo VaiParaMensagemErro e chamado. Esse timer chama
// apos dois segundos durante dez vezes este metodo para que ele possa observar se aconteceu algum erro. 
var timeoutVaiParaMensagemErro = null;
// Quantidade maximas de vezes que o metodo VaiParaMensagemErro e chamado.
var chamadasRestantes = 60;
//
// Metodo usado para posicionar a janela no quadro de mensagem de erro de um formulario.
// Como nao existe um evento de onerror para o validador, e necessario que este metodo
// observe por um tempo para verificar se algum erro foi gerado.
// Para que se possa dar tempo da classe 'erro' seja inserido nos campos com erro, este
// metodo configura um timer para que seja chamado durante um numero de vezes. 
//
VaiParaMensagemErro = function (idElement) {
    if ($("#" + idElement).css("display") != "none") {
        // nao pode fazer o scroll de primeira senao o scroll para cima feita pelo asp.net atrapalha.
        if (timeoutVaiParaMensagemErro == null) {
            // cria um timer para que o metodo possa esperar para que as classes de erro sejam geradas
            timeoutVaiParaMensagemErro = setTimeout("VaiParaMensagemErro('" + idElement + "')", 2000);
        } else {
            // obtem o offset (posicao) do elemento informado (sumario de mensagens de erro).
            //var offset = $("#" + idElement).offset();
            // faz a janela posicionar-se no elemento informado.
            //window.scrollTo(offset.left, (offset.top - 60));
            window.location.hash = idElement;
            clearTimeout(timeoutVaiParaMensagemErro);
            timeoutVaiParaMensagemErro = null;
        }
    } else {
        // se ainda nao foi configurado um timer para chamar este metodo automaticamente,..
        if (timeoutVaiParaMensagemErro == null) {
            // cria um timer para que o metodo possa esperar para que as classes de erro sejam geradas
            timeoutVaiParaMensagemErro = setTimeout("VaiParaMensagemErro('" + idElement + "')", 2000);
        } else {
            if (chamadasRestantes == 0) {
                // ja chamou este metodo o maximo de vezes (5 vezes)
                clearTimeout(timeoutVaiParaMensagemErro);
                timeoutVaiParaMensagemErro = null;
            } else {
                // decrementa o numero de chamadas restantes
                chamadasRestantes = chamadasRestantes - 1;
            }
        }
    }
};


ep.fn.thickboxInit = function () {
    if ((typeof tb_init == 'function') && ($('body.popup').length == 0)) {
        tb_init('a.lnkPop, a.thickbox, area.thickbox, input.thickbox');
    }
};

$.fn.bordas = function (options) {
    var settings = $.extend({
        'classBotao': 'btBordas',
        'classInput': 'btBordasInput',
        'nofinal': true,
        'tags': '<span class="rdbd bdlt">&nbsp;</span><span class="rdbd bdrt">&nbsp;</span><span class="rdbd bdrb">&nbsp;</span><span class="rdbd bdlb">&nbsp;</span>'
    },
	options);
    return this.each(function () {
        if ($(this).find('span.rdbd').length == 0) {
            if (settings.nofinal) {
                $(this).append(settings.tags).addClass(settings.classBotao);
            } else {
                $(this).prepend(settings.tags).addClass(settings.classBotao);
            }
            if ($(this).find('input').length > 0) {
                $(this).addClass(settings.classInput);
            }
        }
        if ($.browser.msie && $.browser.version < 7 && ($(this).width() % 2 != 0)) {
            $(this).find('span.bdrt, span.bdrb').css('margin-right', '-1px');
        }
    });
};

// ProdutoAmpliacaoImagem.aspx 
definePopups = function () {
    $('a.popextra').click(redefineLinksPopups);
    $('body.popup').load(function () {
        $('#TB_load').hide();
        $('#TB_load', window.top.document).hide();
    });
};

redefineLinksPopups = function () {
    var options, arrayOptions, tempSettings, tempOption, settings, strSettings, hWnd;
    options = $(this).attr('rel');
    tempSettings = {};
    if (options.length > 0) {
        arrayOptions = options.split('_');
        tempSettings = {};
        tempOption = [];
        for (var i = 0; i < arrayOptions.length; i++) {
            tempOption = arrayOptions[i].split('-');
            tempSettings[tempOption[0]] = tempOption[1];
        }
    }
    settings = $.extend({
        'width': 560,
        'height': 400,
        'resizable': 1,
        'toolbar': 1,
        'location': 1,
        'directories': 1,
        'status': 1,
        'menubar': 0,
        'scrollbars': 0
    },
	tempSettings);
    strSettings = '';
    for (var i in settings) {
        strSettings += i + '=' + settings[i] + ',';
    }
    strSettings = strSettings.substring(0, (strSettings.length - 1));
    hWnd = window.open(this.href, "PopWindowX", strSettings);
    if (hWnd) {
        hWnd.focus();
        return false;
    }
    return true;
};

// Configura a imagem em ImgPrincipal
function MostraImagemPrincipal(img, imgId, imgPrincipal) {
    imgId.src = imgPrincipal;
};
// FIM ProdutoAmpliacaoImagem.aspx 

// Controla o loading de todos os paineis !! updatepanel, panelAssincrono 
updatePanelJQuery = function (eid, url) {
    $(document).ready(function () {
        $("#" + eid).load(url, panelCompletouRequest);
    });
};

addInputClasses = function () {
    var tipo, tipoc;
    $('input').each(function () {
        tipo = $(this).attr('type');
        tipoc = 'fi' + tipo;
        if (tipo && tipo != '' && tipo != null && tipo != 'hidden' && !$(this).hasClass(tipoc)) {
            $(this).addClass(tipoc);
        }
    });
};

function EndRequestHandler(sender, args) {
    if (args.get_error() != undefined) {
        var errorMessage;
        if (args.get_response().get_statusCode() == '200') {
            errorMessage = args.get_error().message;
        } else {
            // Error occurred somewhere other than the server page.
            errorMessage = 'An unspecified error occurred. ';
            if ($('#erroSistema').length == 0) {
                $('body').append('<div id="erroSistema" style="position:absolute;clear:both;width:100%;height:30px;top:0;left:0;z-index:1002;margin:0;line-height:30px;color:#f00;background-color:#ff0;font-weight:bold;text-align:center;">Ocorreu um erro no sistema. Por favor, recarregue a p&aacute;gina e tente novamente<a href="#" onclick="$(this).parent().remove();" style="position:absolute;top:3px;right:3px;width:20px;height:20px;border:1px solid red;color:red;line-height:20px;z-index:1003;" title="Fechar">X</a></div>');
            }
            ep.fn.erroAnalytics(errorMessage);
        }
        args.set_errorHandled(true);

        //		alert(errorMessage);
    }
};

// CadastroCliente_DadosPessoais.aspx 

var textoAtual = "";

function RefreshDataNascimento() {
    document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_txtDataNasc").value = ("00" + document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_txtDataNascDia").value).replace(/^0+(\d\d)/, "$1");
    document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_txtDataNasc").value += ("/" + ("00" + document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_txtDataNascMes").value).replace(/^0+([0-9][0-9])/, "$1"));
    document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_txtDataNasc").value += ("/" + ("0000" + document.getElementById("ctl00_Conteudo_ctrlCadastroCliente_txtDataNascAno").value).replace(/^0+([0-9][0-9][0-9][0-9])/, "$1"));
};

// site/TrocaDevolucaoPresenteado.aspx 
function RefreshDataNascimento2() {
    document.getElementById("ctl00_Conteudo_tbxDataEntrega").value = ("00" + document.getElementById("ctl00_Conteudo_tbxDataEntregaDia").value).replace(/^0+(\d\d)/, "$1");
    document.getElementById("ctl00_Conteudo_tbxDataEntrega").value += ("/" + ("00" + document.getElementById("ctl00_Conteudo_tbxDataEntregaMes").value).replace(/^0+([0-9][0-9])/, "$1"));
    document.getElementById("ctl00_Conteudo_tbxDataEntrega").value += ("/" + ("0000" + document.getElementById("ctl00_Conteudo_tbxDataEntregaAno").value).replace(/^0+([0-9][0-9][0-9][0-9])/, "$1"));
};

// FIM site/TrocaDevolucaoPresenteado.aspx 
function ValidateCTRL(obj) { };

function forbidPasteDown(evt) {
    var oSrc = (evt.target != undefined ? evt.target : evt.srcElement);
    textoAtual = oSrc.value;
};

function forbidPasteUp(evt) {
    var oSrc = (evt.target != undefined ? evt.target : evt.srcElement);
    if (((evt.ctrlKey) && (evt.keyCode == 86)) || (evt.shiftKey) && (evt.keyCode == 45)) {
        oSrc.value = textoAtual;
    }
};

function valida_Inscricao(oSrc, args) {
    if (args.Value.length == 0) {
        args.IsValid = false;
    } else {
        args.IsValid = true;
    }
};

function valida_CartaoFidelidade(oSrc, args) {
    args.IsValid = false;
    var numero = args.Value;
    var codigo = Math.ceil(numero / 10);
    var dv = numero % 10;

    var maxPosition = 10;
    var soma = 0;

    for (position = 2; position <= maxPosition; position++) {
        var alg = Math.floor((numero % Math.pow(10, position)) / Math.pow(10, position - 1));
        soma += (alg * position);
    }

    var dvCalculado = ((soma % 11) < 2) ? 0 : 11 - (soma % 11);
    args.IsValid = (dv == dvCalculado);
};

/*
function checkFormValidation(oDivMensagem, sRedirecionamentos){
if (!Page_IsValid){
var arrRedirecionamentos = sRedirecionamentos.split('#');
var arrObjInvalidos = new Array();
document.getElementById(oDivMensagem).style.display = 'block';
for (i = 0; i < Page_Validators.length; i++){
var sCtrl = Page_Validators[i].controltovalidate;
var oCtrl = document.getElementById(sCtrl);
if (oCtrl){
oCtrl.className = oCtrl.className.replace(/^erro$/gi, ' ');
oCtrl.className = oCtrl.className.replace(/^erro\s/gi, ' ');
oCtrl.className = oCtrl.className.replace(/\serro$/gi, ' ');
oCtrl.className = oCtrl.className.replace(/\serro\s/gi, ' ');
if (!Page_Validators[i].isvalid){
for (k = 0; k < arrRedirecionamentos.length; k++){
if (arrRedirecionamentos[k] != null){
if (arrRedirecionamentos[k].split('|')[0] == sCtrl){
arrObjInvalidos[arrObjInvalidos.length] = document.getElementById(arrRedirecionamentos[k].split('|')[1]);
}
}
}
arrObjInvalidos[arrObjInvalidos.length] = oCtrl;
} else {
for (k = 0; k < arrRedirecionamentos.length; k++){
if (arrRedirecionamentos[k] != null){
if (arrRedirecionamentos[k].split('|')[0] == sCtrl){
var oTmpObj = document.getElementById(arrRedirecionamentos[k].split('|')[1]);
oTmpObj.className = oTmpObj.className.replace(/^erro$/gi, ' ');
oTmpObj.className = oTmpObj.className.replace(/^erro\s/gi, ' ');
oTmpObj.className = oTmpObj.className.replace(/\serro$/gi, ' ');
oTmpObj.className = oTmpObj.className.replace(/\serro\s/gi, ' ');
}
}
}
}
}
}
for (i = 0; i < arrObjInvalidos.length; i++){
arrObjInvalidos[i].className += " error";
}
return false;
}
};
*/
// CadastroCliente_DadosPessoais.aspx 

// control/listaGerenciadaCriarLista.ascx 
function RefreshDataEntrega(dataEvento, dia, mes, ano) {
    document.getElementById(dataEvento).value = (document.getElementById(dia).value).replace(/^0+(\d\d)/, "$1");
    if (document.getElementById(mes).value != '') {
        document.getElementById(dataEvento).value += ("/" + (document.getElementById(mes).value).replace(/^0+([0-9][0-9])/, "$1"));
    } else {
        document.getElementById(dataEvento).value += ((document.getElementById(mes).value).replace(/^0+([0-9][0-9])/, "$1"));
    }
    if (document.getElementById(ano).value != '') {
        document.getElementById(dataEvento).value += ("/" + (document.getElementById(ano).value).replace(/^0+([0-9][0-9][0-9][0-9])/, "$1"));
    } else {
        document.getElementById(dataEvento).value += ((document.getElementById(ano).value).replace(/^0+([0-9][0-9][0-9][0-9])/, "$1"));
    }
};
// FIM control/listaGerenciadaCriarLista.ascx 

function ValidaTextoConvidados(src, args) {
    args.IsValid = args.Value.indexOf('<') == -1 && args.Value.indexOf('>') == -1;
};

function EnviaBuscaMultipla(Filtro, strBusca, clientId, Url) {
    arrayClientId = clientId.split(",");
    var valoreEscolhido = "";
    for (i = 0; i < arrayClientId.length; i++) {
        for (j = 0; j < document.aspnetForm.elements[arrayClientId[i]].length; j++) {
            var Valor = document.aspnetForm.elements[arrayClientId[i]][j].value
            if (document.aspnetForm.elements[arrayClientId[i]][j].checked == true) {
                if (arrayClientId[i] == "Marca") {
                    valoreEscolhido += "_M" + Valor;
                } else if (arrayClientId[i] == "FaixaPreco") {
                    valoreEscolhido += "_P" + Valor;
                } else {
                    valoreEscolhido += "_V" + Valor;
                }
            }
        }
    }
    Filtro = Filtro + valoreEscolhido;
    window.location = Url + "?Filtro=" + Filtro + "&strBusca=" + strBusca + "&ordenacao=";
};
// FIM control/Sidebar.ascx 

// control/TxtGeral.ascx
// funcao que sera invocada quando o callback retornar
var functionToInvoke = null;
//
// Seta a função que será invocada quando o resultado do
// callback chegar.
//
function SetFunctionToInvoke(func) {
    functionToInvoke = func;
};
//
// Função chamada automaticamente quando o resultado do callback chega.
//
function SetResultCallBack(result, context) {
    resultCallBack = result;
};
//
// Chame essa função para invocar o call back.
// params: é a string contendo os parametros para a função que será invocada
// func: é a função quer será invocada quando o resultado do call back chega.
//
function InvokeCallBack(params, func) {
    // nao faz nada se algum parametro estiver invalido.
    if (func == null || params == null) {
        return;
    }
    // seta a funcao a ser invocada quando o call back retorna
    SetFunctionToInvoke(func); // cria o call back
    var callbackRef = GetCallbackEventReference(this, "document.all['txtId'].value", "SetResultCallBack", "null", "null"); // invoca o callback
    callbackRef();
};


// control/Wizard.ascx 
function Envia(Filtro, qtd, url) {
    fitroTotal = Filtro;
    for (var j = 0; j < qtd; j++) {
        valor = document.getElementById("var" + j).value;
        if (valor != "") {
            fitroTotal += "_V" + valor;
        }
    }
    window.location.href = url + "Filtro=" + fitroTotal;
};
// FIM control/Wizard.ascx 

function validateEmailList(source, clientside_arguments) {
    clientside_arguments.IsValid = true;
    var strIn = clientside_arguments.Value;
    var arrIn = strIn.replace(/\s/g, '').split(';');
    //var re = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
    var re = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,3}$/;
    for (k = 0; k < arrIn.length; k++) {
        clientside_arguments.IsValid &= re.test(arrIn[k]);
    }
};

// site/FinalizaCompra.aspx 
function fabrewin(url) {
    mpg_popup = window.open(url, "mpg_popup", "toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=1,resizable=0,screenX=0,screenY=0,left=0,top=0,width=765,height=440");
    //return true;
};
//  FIM site/FinalizaCompra.aspx 

// Mostra o carregando.
function Carregando(divDesejaExcluir, divDetalheEvento) {
    var divDesejaExcluir = document.getElementById(divDesejaExcluir);
    divDesejaExcluir.style.display = 'none';
    var divDetalheEvento = document.getElementById(divDetalheEvento);
    divDetalheEvento.style.display = 'none';
    var spnProcessando = document.getElementById("spnProcessando");
    spnProcessando.style.display = 'block';
};
//  FIM site/PopUpConfirmaExclusãoEvento.aspx 

// Atualiza a mensagem do contador de caracteres.
ep.fn.pagServicoMensagemContador = function () {
    $('body.embalagem textarea.mensagem').bind('keydown', AtualizaContador);
};

AtualizaContador = function (event) {
    var qtAindaFalta = 500 - $(this).val().length;
    $(this).parent().children('span.txtCounter').text(qtAindaFalta + " caracteres");
};
//  FIM site/Servicos.aspx 

ep.fn.campoBlur = function (obj, defaultTxt) {
    if (obj.value == '' || obj.value == null) {
        obj.value = defaultTxt;
    }
};

ep.fn.campoFocus = function (obj, defaultTxt) {
    if (obj.value == defaultTxt) {
        obj.value = '';
    }
};


ep.fn.alternaTextoDefault = function (campos) {
    ep.vars.defaulttext = [];
    $(campos).each(function (count, obj) {
        ep.vars.defaulttext[count] = this.value;
        $(this)
			.focus(function () { ep.fn.campoFocus(this, ep.vars.defaulttext[count]); })
			.blur(function () { ep.fn.campoBlur(this, ep.vars.defaulttext[count]); });
    });
};

fixIeBreadCrumb = function () {
    ep.fn.simulaAfterIe("div.breadcrumb a", ' &gt;');
};

ep.fn.simulaAfterIe = function (els, txt) {
    if ($.browser.msie && $.browser.version <= 7) {
        $(els).append(txt);
    }
};

function DefineLinkBreadCrumb(ClientID, UrlBreadCrumb) {
    var query = location.search;
    //if(query == ""){query = "?"}else{query +="&"};
    $('#' + ClientID).load(UrlBreadCrumb + query.replace("\?", "\&"));
};

tb_remove_pt = function () {
    $("#TB_imageOff", window.parent.document).unbind("click");
    $("#TB_closeWindowButton", window.parent.document).unbind("click");
    $("#TB_window", window.parent.document).fadeOut("fast", function () {
        $('#TB_window,#TB_overlay,#TB_HideSelect', window.parent.document)
			.trigger("unload")
			.unbind()
			.remove();
    });
    $("#TB_load", window.parent.document).remove();
    if ($.browser.msie && $.browser.version < 7) { //if IE 6
        $('body,html', window.parent.document).css({
            height: "auto",
            width: "auto"
        });
        $('html', window.parent.document).css("overflow", "");
    }
    window.parent.document.onkeydown = "";
    window.parent.document.onkeyup = "";
    return false;
};

ep.fn.tb_show_ep = function (lnk, caption) {
    if (lnk.href) {
        tb_show(caption, lnk.href, false);
        return false;
    } else {
        return true;
    }
};

// AGENDA 
//
// Seta a data selecionada no visualizador
//
function Calendar_OnDateSelected(sender, eventArgs) {
    // limpa o span das datas	   
    var dtSelecionada = document.getElementById("dtSelecionada");
    dtSelecionada.innerHTML = "";
    // obtém a referencia para o calendario
    var calendario = $find(IdCalendario);
    // obtém as datas selecionadas
    var dates = calendario.get_selectedDates();

    // para cada data..
    for (var i = 0; i < dates.length; i++) {
        var date = dates[i];
        var data = date[2] + "/" + date[1] + "/" + date[0];
        data += " "; // adiciona um espaco ao final para dar espaco entre as datas
        dtSelecionada.innerHTML += data;
    }
};

function MostraMensagemErro() {
    if (!Page_IsValid) {
        document.getElementById('divErro').style.display = 'block'
    } else {
        document.getElementById('divErro').style.display = 'none';
    }
};
// FIM AGENDA 

// AMIGOS 
ep.fn.enviaFormAmigos = function (event) {
    if (event.keyCode == 13) {
        window.location.href = '../../Vitrine/MinhaConta/MeusAmigos.aspx?txtConsulta=' + this.value;
        return false;
    }
    return true;
};
ep.fn.eventosInputsClick = function () {
    window.location.href = '../../Vitrine/MinhaConta/MeusAmigos.aspx?txtConsulta=' + $('#spnTxtConsulta input').val();
    return false;
};
ep.fn.eventosInputs = function () {
    $('#spnTxtConsulta input').bind('keydown', ep.fn.enviaFormAmigos);
    $('#fldSetBuscarAmigos span.ok input').click(ep.fn.eventosInputsClick);
};
// FIM AMIGOS 

ep.fn.getStyle = function (el, styleProp) {
    var y = false;
    if ($.browser.msie && $.browser.version < 7) { //y = $(el).css(styleProp);
        y = parseInt($(el).get(0).currentStyle[styleProp]);
    } else {
        y = (styleProp == 'width') ? parseInt($(el).outerWidth()) : parseInt($(el).outerHeight());
    }
    if (isNaN(y)) {
        return false;
    }
    switch (y) {
        case null:
        case undefined:
        case 'undefined':
        case 'auto':
        case '':
        case 'NaN':
        case NaN:
        case false:
        case '0px':
            return false;
            break;
    }
    return y;
};

ep.fn.checaAlturaPop = function (obj) {
    var x = $(obj).contents().find("body.popup").get(0);
    ep.vars.popDimension = {
        'w': ep.fn.getStyle(x, 'width'),
        'h': ep.fn.getStyle(x, 'height')
    };
    if (ep.vars.popDimension.h) {
        //$('#TB_iframeContent', window.parent.document).height( ep.vars.popDimension.h );
        ep.vars.popDimension.t = ($.browser.msie && $.browser.version < 7) ? -(ep.vars.popDimension.h / 2 + 20) + window.parent.document.documentElement.scrollTop : -(ep.vars.popDimension.h / 2 + 20);
        $("#TB_window").css({
            'margin-top': ep.vars.popDimension.t,
            'height': ep.vars.popDimension.h
        });

    }
    if (ep.vars.popDimension.w) {
        //$('#TB_iframeContent', window.parent.document).width( ep.vars.popDimension.w );
        ep.vars.popDimension.l = -(ep.vars.popDimension.w / 2 + 20);
        $("#TB_window").css({
            'margin-left': ep.vars.popDimension.l,
            'width': ep.vars.popDimension.w
        });
    }
};


//
// @author Guilliano
//
// Tabela generica para guardar qualquer coisa usando uma chave.
//
// Metodos:
// - bool contem(<object> chave) : Verifica se contem um elemento com a chave informada.
// - void adiciona(<object> chave, <object> objeto) : Adiciona um objeto usando uma chave. O objeto não é inserido se
//													  já existe um outro com a mesma chave.
// - <object> remover(<object> chave) : Remove um objeto que tenha a chave informada.
// - Array<object> getChaves() : Obtém um array com todas as chaves que possuem algum objeto relacionado.
// - Array<object> getObjetos() : Obtém um array com todos os objetos guardados no conjunto.
// - <inteiro> tamanho() : Conta quantos objetos estão contidos no conjunto.
// --------------------------------------------------------------------------------------------------------------------
function ConjuntoGenerico() {
    this.Tabela = new Array();
    this.contem = ConjuntoGenerico_Contem;
    this.adiciona = ConjuntoGenerico_Adiciona;
    this.remove = ConjuntoGenerico_Remover;
    this.getChaves = ConjuntoGenerico_Chaves;
    this.getObjetos = ConjuntoGenerico_Objetos;
    this.tamanho = ConjuntoGenerico_Tamanho;
};

// Verifica se ja tem o acessorio na lista.
//
function ConjuntoGenerico_Contem(chave) {
    if (chave == null) {
        throw "NullPointerException {" + chave + "}";
    }
    if (this.Tabela[chave] != null) {
        return true;
    }
    return false;
};

// Adiciona um novo acessório a lista.
//
function ConjuntoGenerico_Adiciona(chave, objeto) {
    if (chave == null || objeto == null) {
        throw "NullPointerException {" + chave + "},{" + objeto + "}";
    }
    if (this.contem(chave)) {
        return;
    }
    this.Tabela[chave] = objeto;
};

// Remove um objeto do conjunto.
//
function ConjuntoGenerico_Remover(chave) {
    if (chave == null) {
        throw "NullPointerException {" + chave + "}";
    }
    var obj = this.Tabela[chave];
    this.Tabela[chave] = null;
    return obj;
};

// Retorna um array com as chaves identificadoras dos elementos do conjunto.
// As chaves sao retornadas em forma de string.
//
function ConjuntoGenerico_Chaves() {
    var chaves = new Array();
    for (var chave in this.Tabela) {
        if (this.Tabela[chave] != null) {
            chaves.push(chave);
        }
    }
    return chaves;
};

// Obtém a lista de todos os objetos guardados no conjunto.
//
function ConjuntoGenerico_Objetos() {
    var objetos = new Array();
    for (var chave in this.Tabela) {
        if (this.Tabela[chave] != null) {
            objetos.push(this.Tabela[chave]);
        }
    }
    return objetos;
};

// Retorna a quantidade de objetos existem no conjunto.
//
function ConjuntoGenerico_Tamanho() {
    var quantidade = 0;
    for (var chave in this.Tabela) {
        if (this.Tabela[chave] != null) {
            quantidade = quantidade + 1;
        }
    }
    return quantidade;
};

//
// @author Guilliano
//
//
// Gerenciador dos acessorios selecionados
// da tabela de produtos.
// Metodos:
//  - <ConjuntoGenerico> getAcessorios() : obtém o conjunto de todos os skus da lista de acessorios
//										   adicionados ao gerenciador. Veja a documentacao do ConjuntoGenerico.
//  - <Sku> getSkuEscolhido() : Obtém o sku escolhido (o sku principal da página).
//  - <void> setSkuEscolhido(<Sku> novoSkuEscolhido) : Seta o novo sku escolhido.
//  - <float> getPrecoTotal() : Obtem a soma de todos os precos dos skus (incluindo o escolhido).
//  - <ConjuntoGenerico> getAcessorios() : Obtem o conjunto de todos os skus acessorios do sku escolhido.
//
//  Construtores:
//  - GerenciadorAcessorios( <Sku> )
//
//  Exemplo:
//	var gerenciador = new GerenciadorAcessorios( new Sku( 12, 300.00)); 
//	-- repare que Sku recebe um ID e um valor <float> que e o preco do sku.
//
function GerenciadorAcessorios(skuEscolhidoInicial) {
    this.acessorios = new ConjuntoGenerico(); // conjunto dos acessorios.
    this.getAcessorios = GerenciadorAcessorios_GetAcessorios;
    this.skuEscolhido = skuEscolhidoInicial; // seta o sku escolhido inicialmente na página.
    this.getSkuEscolhido = GerenciadorAcessorios_GetSkuEscolhido;
    this.setSkuEscolhido = GerenciadorAcessorios_SetSkuEscolhido;
    this.getPrecoTotal = GerenciadorAcessorios_GetPrecoTotal;
    this.getPrecoTotalAsString = GerenciadorAcessorios_GetPrecoTotalAsString;
    this.getTodosIds = GerenciadorAcessorios_GetTodosIds;
    this.formatarInteiro = GerenciadorAcessorios_FormatarInteiro;
};

// Obtém os skus que foram escolhidos como acessorios.
// O tipo de retorno é um objeto do tipo ConjuntoGenerico (veja documentacao).
//
function GerenciadorAcessorios_GetAcessorios() {
    return this.acessorios;
};

// Metodo get para o sku escolhido do gerenciador de acessorios.
//
function GerenciadorAcessorios_GetSkuEscolhido() {
    return this.skuEscolhido;
};

// Metodo set para o sku escolhido da página. Esse metodo deve ser usado para configurar o novo sku que foi escolhido
// para ser o principal.
//
function GerenciadorAcessorios_SetSkuEscolhido(novoSkuEscolhido) {
    this.skuEscolhido = novoSkuEscolhido;
};

// Obtem o valor do preço total calculado atraves da soma de todos os preços dos sku mais o preco do sku principal.
//
function GerenciadorAcessorios_GetPrecoTotal() {
    if (this.getSkuEscolhido() == null) {
        throw "NullPointerException {'Nenhum sku escolhido.'}";
    }
    var precoTotal = this.getSkuEscolhido().getPreco(); // conta o preco do sku escolhido principal.
    if (this.getAcessorios().tamanho() > 0) {
        var skusAcessorios = this.getAcessorios().getObjetos();
        for (var acessorio in skusAcessorios) {
            precoTotal += skusAcessorios[acessorio].getPreco(); // conta o preço do acessorio.
        }
    }
    return precoTotal;
};

// Obtem o total dos precos dos skus em forma de uma string em formato PT-BR.
//
function GerenciadorAcessorios_GetPrecoTotalAsString() {
    var totalFloat = this.getPrecoTotal();
    var totalString = "" + totalFloat;
    // faz um split pela virgula.
    var totalSplited = totalString.split(".");
    var inteiroString = "0";
    if (totalSplited.length > 0) {
        inteiroString = totalSplited[0];
        if (inteiroString.length > 3) {
            inteiroString = this.formatarInteiro(inteiroString);
        }
    }
    var decimalString = "00";
    if (totalSplited.length > 1) {
        // pega a parte decimal.
        decimalString = totalSplited[1];
        // completa a parte decimal com um zero.
        if (decimalString.length == 1) {
            decimalString = decimalString + "0";
        }
    }
    return inteiroString + "," + decimalString;
};

// Obtém um array com todos os ids dos skus, incluindo o id do sku escolhido.
function GerenciadorAcessorios_GetTodosIds() {
    var todosIds = new Array();
    if (this.getSkuEscolhido() == null) {
        throw "NullPointerException {'Nenhum sku escolhido.'}";
    }
    //todosIds.push(this.getSkuEscolhido().getId());
    var skusAcessorios = this.getAcessorios().getObjetos();
    for (var acessorio in skusAcessorios) {
        todosIds.push(skusAcessorios[acessorio].getId());
    }
    return todosIds;
};

// Transforma uma string de um numero inteiro para um numero inteiro no formato pt-br.
//
function GerenciadorAcessorios_FormatarInteiro(inteiroString) {
    var inteiroStringLocal = inteiroString;
    var tokens = new Array();
    var startToken = inteiroString;
    var lastStart = inteiroStringLocal.length;
    for (var i = inteiroString.length - 3; i >= 1; i = i - 3) {
        startToken = inteiroStringLocal.substring(0, i);
        var token = inteiroStringLocal.slice(i, lastStart);
        lastStart = i;
        tokens.push("." + token);
    }
    for (var j = tokens.length - 1; j >= 0; j = --j) {
        startToken = startToken + tokens[j];
    }
    return startToken;
};

//
// @author Guilliano
//
// ------------------------------------------------------------
// Objeto que representa um sku.
// Metodos:
//  - <int> getId() : Obtém o id do sku.
//  - <void> setId(<int> novoId) : Seta o novo id do sku.
//  - <float> getPreco() : Obtém o preço do sku.
//  - <void> setPreco(<float> novoPreco) : Seta o novo preço do sku.
//
function Sku(id, preco) {
    if (id == null || preco == null) {
        throw "NullPointerException {" + id + "},{" + preco + "}";
    }
    this.id = id;
    this.getId = Sku_GetId;
    this.setId = Sku_SetId;
    this.preco = preco;
    this.getPreco = Sku_GetPreco;
    this.setPreco = Sku_SetPreco;
};

// Obtém o id do sku.
//
function Sku_GetId() {
    return this.id;
};

// Seta um novo valor para o id do objeto sku.
//
function Sku_SetId(novoId) {
    this.id = novoId;
};

// Obtém o valor do preço do sku.
//
function Sku_GetPreco() {
    return this.preco;
};

// Seta o novo preço do objeto sku.
//
function Sku_SetPreco(novoPreco) {
    this.preco = novoPreco;
};

// Adiciona ou remove um sku e seu valor da lista.
// Se addOrRemove for 0 remove se for 1 adiciona.
//
function MarcarCompra(id, preco, addOrRemove) {
    var sku = new Sku(id, preco);
    if (addOrRemove) { // se contem o sku informado, entao remove
        if (!gerAcessorios.getAcessorios().contem(sku.getId())) {
            gerAcessorios.getAcessorios().adiciona(sku.getId(), sku);
        } // habilita o botão
        btnComprarIntens.removeClass("bt-comprar-indisponivel");
        btnComprarIntens.addClass("bt-comprar-disponivel");
    } else { // se contem o sku informado, entao remove
        if (gerAcessorios.getAcessorios().contem(sku.getId())) {
            gerAcessorios.getAcessorios().remove(sku.getId());
        } // se a lista ficou vazia
        if (gerAcessorios.getAcessorios().tamanho() == 0) { // desabilita o botão
            btnComprarIntens.removeClass("bt-comprar-disponivel");
            btnComprarIntens.addClass("bt-comprar-indisponivel");
        }
    }
    atualizaPrecoAtualizadoItens(null);
};

// Funcao que forca os checkboxes da prateleira de acessorios sempre ao iniciar a pagina estarem nao checked
// porque quando o usuario clica no botao voltar do Firefox, os checkboxes que foram checked anteriormente
// voltam checked e o preco total das compras (botao comprar dos acessorios) aparece com um preco que nao inclui
// os acessorios.

function AcertaAoVoltar() {
    $(":checkbox").each(function (i) { // obtém a função wrapper que envolve a funcao MarcaCompra definido para
        // o evento onclick (se a MarcarCompra existir significa que o checkbox é da prateleira 
        var fncMarca = $(this).attr("onclick"); // forca o resultado ser convertido para string para ver se a funcao MarcaCompra esta sendo invocada no
        // onclick do checked.
        if (("" + fncMarca).search("MarcarCompra") > 0) {
            $(this).attr("checked", "");
        }
    });
};

// Apenda os sku de acessorios e envia para o carrinho.
//
function Produto_onClickBtnComprarItensSelecionado(btnId) {
    // Se nenhum acessorio foi adicinado a lista, nao faz nada.
    if (gerAcessorios.getAcessorios().tamanho() == 0) {
        return false;
    }
    var LnkComprarItens = document.getElementById(btnId);
    // Using multiple unit types within one animation.	
    var href = LnkComprarItens.href;
    // adiciona a lista de skus
    if (gerAcessorios.getAcessorios().tamanho() > 0) {
        href += "&idsAcessorios=" + gerAcessorios.getTodosIds();
    }
    LnkComprarItens.href = href;
    // pode redirecionar para o carrinho
    return true;
};

// Apenda os sku de acessorios a url do botao.
// Coloca a lista de acessorios na url do botao informado.
// Saida: a url ficara com o parametro idsAcessorios=xxx,yyy.
function onClickBtnComprar(btnId) {
    // se nao tem nada na lista nao faz nada com a url
    if (gerAcessorios.getAcessorios().tamanho() == 0) {
        return true;
    }
    // Using multiple unit types within one animation.	
    var href = $("#" + btnId).attr("href");
    // adiciona a lista de skus
    href += "&idsAcessorios=" + gerAcessorios.getTodosIds();
    $("#" + id).attr("href", href);
    // pode redirecionar para o carrinho
    return true;
};

function TrackCall(UrlTrack) {
    var query = "?" + ((location.search == "") ? "" : encodeURIComponent(location.search) + "&") + "referrer=" + encodeURIComponent(document.referrer);
    $.getJSON(UrlTrack + query);
};

ep.fn.erroAnalytics = function (e) {
    var cameFrom = (document.referrer) ? "&from=" + encodeURIComponent(document.referrer) : "";
    $.getJSON(ep.vars.urlsite + 'erroAnalytics.aspx?erroJs=' + (encodeURIComponent(e.toString())) + cameFrom, function () { });
};

isNumber = function (x) {
    return ((typeof x === typeof 1) && (null !== x) && isFinite(x));
};


//
// SWFObject v1.5: Flash Player detection and embed - http://blog.deconcept.com/swfobject/
//
// SWFObject is (c) 2007 Geoff Stearns and is released under the MIT License:
// http://www.opensource.org/licenses/mit-license.php
//
//
if (typeof deconcept == "undefined") { var deconcept = new Object(); } if (typeof deconcept.util == "undefined") { deconcept.util = new Object(); } if (typeof deconcept.SWFObjectUtil == "undefined") { deconcept.SWFObjectUtil = new Object(); } deconcept.SWFObject = function (_1, id, w, h, _5, c, _7, _8, _9, _a) { if (!document.getElementById) { return; } this.DETECT_KEY = _a ? _a : "detectflash"; this.skipDetect = deconcept.util.getRequestParameter(this.DETECT_KEY); this.params = new Object(); this.variables = new Object(); this.attributes = new Array(); if (_1) { this.setAttribute("swf", _1); } if (id) { this.setAttribute("id", id); } if (w) { this.setAttribute("width", w); } if (h) { this.setAttribute("height", h); } if (_5) { this.setAttribute("version", new deconcept.PlayerVersion(_5.toString().split("."))); } this.installedVer = deconcept.SWFObjectUtil.getPlayerVersion(); if (!window.opera && document.all && this.installedVer.major > 7) { deconcept.SWFObject.doPrepUnload = true; } if (c) { this.addParam("bgcolor", c); } var q = _7 ? _7 : "high"; this.addParam("quality", q); this.setAttribute("useExpressInstall", false); this.setAttribute("doExpressInstall", false); var _c = (_8) ? _8 : window.location; this.setAttribute("xiRedirectUrl", _c); this.setAttribute("redirectUrl", ""); if (_9) { this.setAttribute("redirectUrl", _9); } }; deconcept.SWFObject.prototype = { useExpressInstall: function (_d) { this.xiSWFPath = !_d ? "expressinstall.swf" : _d; this.setAttribute("useExpressInstall", true); }, setAttribute: function (_e, _f) { this.attributes[_e] = _f; }, getAttribute: function (_10) { return this.attributes[_10]; }, addParam: function (_11, _12) { this.params[_11] = _12; }, getParams: function () { return this.params; }, addVariable: function (_13, _14) { this.variables[_13] = _14; }, getVariable: function (_15) { return this.variables[_15]; }, getVariables: function () { return this.variables; }, getVariablePairs: function () { var _16 = new Array(); var key; var _18 = this.getVariables(); for (key in _18) { _16[_16.length] = key + "=" + _18[key]; } return _16; }, getSWFHTML: function () { var _19 = ""; if (navigator.plugins && navigator.mimeTypes && navigator.mimeTypes.length) { if (this.getAttribute("doExpressInstall")) { this.addVariable("MMplayerType", "PlugIn"); this.setAttribute("swf", this.xiSWFPath); } _19 = "<embed type=\"application/x-shockwave-flash\" src=\"" + this.getAttribute("swf") + "\" width=\"" + this.getAttribute("width") + "\" height=\"" + this.getAttribute("height") + "\" style=\"" + this.getAttribute("style") + "\""; _19 += " id=\"" + this.getAttribute("id") + "\" name=\"" + this.getAttribute("id") + "\" "; var _1a = this.getParams(); for (var key in _1a) { _19 += [key] + "=\"" + _1a[key] + "\" "; } var _1c = this.getVariablePairs().join("&"); if (_1c.length > 0) { _19 += "flashvars=\"" + _1c + "\""; } _19 += "/>"; } else { if (this.getAttribute("doExpressInstall")) { this.addVariable("MMplayerType", "ActiveX"); this.setAttribute("swf", this.xiSWFPath); } _19 = "<object id=\"" + this.getAttribute("id") + "\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" width=\"" + this.getAttribute("width") + "\" height=\"" + this.getAttribute("height") + "\" style=\"" + this.getAttribute("style") + "\">"; _19 += "<param name=\"movie\" value=\"" + this.getAttribute("swf") + "\" />"; var _1d = this.getParams(); for (var key in _1d) { _19 += "<param name=\"" + key + "\" value=\"" + _1d[key] + "\" />"; } var _1f = this.getVariablePairs().join("&"); if (_1f.length > 0) { _19 += "<param name=\"flashvars\" value=\"" + _1f + "\" />"; } _19 += "</object>"; } return _19; }, write: function (_20) { if (this.getAttribute("useExpressInstall")) { var _21 = new deconcept.PlayerVersion([6, 0, 65]); if (this.installedVer.versionIsValid(_21) && !this.installedVer.versionIsValid(this.getAttribute("version"))) { this.setAttribute("doExpressInstall", true); this.addVariable("MMredirectURL", escape(this.getAttribute("xiRedirectUrl"))); document.title = document.title.slice(0, 47) + " - Flash Player Installation"; this.addVariable("MMdoctitle", document.title); } } if (this.skipDetect || this.getAttribute("doExpressInstall") || this.installedVer.versionIsValid(this.getAttribute("version"))) { var n = (typeof _20 == "string") ? document.getElementById(_20) : _20; n.innerHTML = this.getSWFHTML(); return true; } else { if (this.getAttribute("redirectUrl") != "") { document.location.replace(this.getAttribute("redirectUrl")); } } return false; } }; deconcept.SWFObjectUtil.getPlayerVersion = function () { var _23 = new deconcept.PlayerVersion([0, 0, 0]); if (navigator.plugins && navigator.mimeTypes.length) { var x = navigator.plugins["Shockwave Flash"]; if (x && x.description) { _23 = new deconcept.PlayerVersion(x.description.replace(/([a-zA-Z]|\s)+/, "").replace(/(\s+r|\s+b[0-9]+)/, ".").split(".")); } } else { if (navigator.userAgent && navigator.userAgent.indexOf("Windows CE") >= 0) { var axo = 1; var _26 = 3; while (axo) { try { _26++; axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash." + _26); _23 = new deconcept.PlayerVersion([_26, 0, 0]); } catch (e) { axo = null; } } } else { try { var axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7"); } catch (e) { try { var axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6"); _23 = new deconcept.PlayerVersion([6, 0, 21]); axo.AllowScriptAccess = "always"; } catch (e) { if (_23.major == 6) { return _23; } } try { axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash"); } catch (e) { } } if (axo != null) { _23 = new deconcept.PlayerVersion(axo.GetVariable("$version").split(" ")[1].split(",")); } } } return _23; }; deconcept.PlayerVersion = function (_29) { this.major = _29[0] != null ? parseInt(_29[0]) : 0; this.minor = _29[1] != null ? parseInt(_29[1]) : 0; this.rev = _29[2] != null ? parseInt(_29[2]) : 0; }; deconcept.PlayerVersion.prototype.versionIsValid = function (fv) { if (this.major < fv.major) { return false; } if (this.major > fv.major) { return true; } if (this.minor < fv.minor) { return false; } if (this.minor > fv.minor) { return true; } if (this.rev < fv.rev) { return false; } return true; }; deconcept.util = { getRequestParameter: function (_2b) { var q = document.location.search || document.location.hash; if (_2b == null) { return q; } if (q) { var _2d = q.substring(1).split("&"); for (var i = 0; i < _2d.length; i++) { if (_2d[i].substring(0, _2d[i].indexOf("=")) == _2b) { return _2d[i].substring((_2d[i].indexOf("=") + 1)); } } } return ""; } }; deconcept.SWFObjectUtil.cleanupSWFs = function () { var _2f = document.getElementsByTagName("OBJECT"); for (var i = _2f.length - 1; i >= 0; i--) { _2f[i].style.display = "none"; for (var x in _2f[i]) { if (typeof _2f[i][x] == "function") { _2f[i][x] = function () { }; } } } }; if (deconcept.SWFObject.doPrepUnload) { if (!deconcept.unloadSet) { deconcept.SWFObjectUtil.prepUnload = function () { __flash_unloadHandler = function () { }; __flash_savedUnloadHandler = function () { }; window.attachEvent("onunload", deconcept.SWFObjectUtil.cleanupSWFs); }; window.attachEvent("onbeforeunload", deconcept.SWFObjectUtil.prepUnload); deconcept.unloadSet = true; } } if (!document.getElementById && document.all) { document.getElementById = function (id) { return document.all[id]; }; } var getQueryParamValue = deconcept.util.getRequestParameter; var FlashObject = deconcept.SWFObject; var SWFObject = deconcept.SWFObject;




//
// jQuery.Preload - Multifunctional preloader
// Copyright (c) 2008 Ariel Flesler - aflesler(at)gmail(dot)com
// Dual licensed under MIT and GPL.
// Date: 3/25/2009
// @author Ariel Flesler
// @version 1.0.8
//
; (function ($) { var h = $.preload = function (c, d) { if (c.split) c = $(c); d = $.extend({}, h.defaults, d); var f = $.map(c, function (a) { if (!a) return; if (a.split) return d.base + a + d.ext; var b = a.src || a.href; if (typeof d.placeholder == 'string' && a.src) a.src = d.placeholder; if (b && d.find) b = b.replace(d.find, d.replace); return b || null }), data = { loaded: 0, failed: 0, next: 0, done: 0, total: f.length }; if (!data.total) return finish(); var g = $(Array(d.threshold + 1).join('<img/>')).load(handler).error(handler).bind('abort', handler).each(fetch); function handler(e) { data.element = this; data.found = e.type == 'load'; data.image = this.src; data.index = this.index; var a = data.original = c[this.index]; data[data.found ? 'loaded' : 'failed']++; data.done++; if (d.enforceCache) h.cache.push($('<img/>').attr('src', data.image)[0]); if (d.placeholder && a.src) a.src = data.found ? data.image : d.notFound || a.src; if (d.onComplete) d.onComplete(data); if (data.done < data.total) fetch(0, this); else { if (g && g.unbind) g.unbind('load').unbind('error').unbind('abort'); g = null; finish() } }; function fetch(i, a, b) { if (a.attachEvent && data.next && data.next % h.gap == 0 && !b) { setTimeout(function () { fetch(i, a, 1) }, 0); return !1 } if (data.next == data.total) return !1; a.index = data.next; a.src = f[data.next++]; if (d.onRequest) { data.index = a.index; data.element = a; data.image = a.src; data.original = c[data.next - 1]; d.onRequest(data) } }; function finish() { if (d.onFinish) d.onFinish(data) } }; h.gap = 14; h.cache = []; h.defaults = { threshold: 2, base: '', ext: '', replace: '' }; $.fn.preload = function (a) { h(this, a); return this } })(jQuery);




// **********************
//	 THICKBOX 
// *********************** 

//
// Thickbox 3.1 - One Box To Rule Them All.
// By Cody Lindley (http://www.codylindley.com)
// Copyright (c) 2007 cody lindley
// Licensed under the MIT License: http://www.opensource.org/licenses/mit-license.php
//
ep.fn.tbStartedDirect = function (e, t, a, g) {
    tb_show(t, a, g);
    window.blur();
    //return false;
};

ep.fn.tbStartedClick = function () {
    var t = this.title || this.name || null;
    var a = this.href || this.alt;
    var g = this.rel || false;
    tb_show(t, a, g);
    this.blur();
    return false;
};
function tb_init(domChunk) {
    $(domChunk).not('.tbstarted').each(function () {
        if (this.onclick && this.onclick.toString().indexOf('tb_show_ep') != -1) {
            $(this).attr('onclick', null);
        }
        $(this).addClass('tbstarted').click(ep.fn.tbStartedClick);
    });
};
ep.fn.thickboxAjaxLoad = function () { //to do a post change this load method
    tb_position();
    $("#TB_load").remove();
    tb_init("#TB_ajaxContent a.thickbox");
    $("#TB_window").css({
        display: "block"
    });
};
function tb_show(caption, url, imageGroup) {
    try {
        if ($.browser.msie && $.browser.version < 7) { //if IE 6
            $("body", "html").css({
                height: "100%",
                width: "100%"
            });
            $("html").css("overflow", "hidden");
            if (document.getElementById("TB_HideSelect") === null) { //iframe to hide select elements in ie6
                $("body").append("<iframe id='TB_HideSelect' src='" + ep.vars.urlsit + "Js/blank.html'></iframe><div id='TB_overlay'></div><div id='TB_window'></div>");
                $("#TB_overlay").click(tb_remove);
                $("#TB_HideSelect").height($('body').height());
            }
        } else { //all others
            if (document.getElementById("TB_overlay") === null) {
                $("body").append("<div id='TB_overlay'></div><div id='TB_window'></div>");
                $("#TB_overlay").click(tb_remove);
            }
        }
        if (tb_detectMacXFF()) {
            $("#TB_overlay").addClass("TB_overlayMacFFBGHack");
        } else {
            $("#TB_overlay").addClass("TB_overlayBG");
        }
        if (caption === null) {
            caption = "";
        }
        if ($('#TB_load').length == 0) {
            $("body").append("<div id='TB_load'>&nbsp;</div>");
        }
        $('#TB_load').show();
        var baseURL;
        if (url.indexOf("?") !== -1) {
            baseURL = url.substr(0, url.indexOf("?"));
        } else {
            baseURL = url;
        }
        var urlString = /\.jpg$|\.jpeg$|\.png$|\.gif$|\.bmp$/;
        var urlType = baseURL.toLowerCase().match(urlString);
        if (urlType == '.jpg' || urlType == '.jpeg' || urlType == '.png' || urlType == '.gif' || urlType == '.bmp') { //code to show images
        } else { //code to show html
            var queryString = url.replace(/^[^\?]+\??/, '');
            var params = tb_parseQuery(queryString);
            TB_WIDTH = (params['width'] * 1) + 30 || 630;
            TB_HEIGHT = (params['height'] * 1) + 40 || 440;
            ajaxContentW = TB_WIDTH - 30;
            ajaxContentH = TB_HEIGHT - 45;
            if (url.indexOf('TB_iframe') != -1) {
                urlNoQuery = url.split('TB_');
                $("#TB_iframeContent").remove();
                if (params['modal'] != "true") {
                    $("#TB_window").append("<iframe allowtransparency='true' frameborder='0' hspace='0' src='" + urlNoQuery[0] + "' id='TB_iframeContent' name='TB_iframeContent" + Math.round(Math.random() * 1000) + "' onload='tb_showIframe();ep.fn.checaAlturaPop(this);'> </iframe>");
                } else { //iframe modal
                    $("#TB_overlay").unbind();
                    $("#TB_window").append("<iframe allowtransparency='true' frameborder='0' hspace='0' src='" + urlNoQuery[0] + "' id='TB_iframeContent' name='TB_iframeContent" + Math.round(Math.random() * 1000) + "' onload='tb_showIframe();ep.fn.checaAlturaPop(this);'> </iframe>");
                }
            } else { // not an iframe, ajax
                if ($("#TB_window").css("display") != "block") {
                    if (params['modal'] != "true") { //ajax no modal
                        $("#TB_window").append("<div id='TB_ajaxContent' style='width:" + ajaxContentW + "px;height:" + ajaxContentH + "px'></div>");
                    } else { //ajax modal
                        $("#TB_overlay").unbind();
                        $("#TB_window").append("<div id='TB_ajaxContent' class='TB_modal' style='width:" + ajaxContentW + "px;height:" + ajaxContentH + "px;'></div>");
                    }
                } else { //this means the window is already up, we are just loading new content via ajax
                    $("#TB_ajaxContent")[0].style.width = ajaxContentW + "px";
                    $("#TB_ajaxContent")[0].style.height = ajaxContentH + "px";
                    $("#TB_ajaxContent")[0].scrollTop = 0;
                    $("#TB_ajaxWindowTitle").html(caption);
                }
            }
            $("#TB_closeWindowButton").click(tb_remove);
            if (url.indexOf('TB_inline') != -1) {
                $("#TB_ajaxContent").append($('#' + params['inlineId']).children());
                $("#TB_window").unload(function () {
                    $('#' + params['inlineId']).append($("#TB_ajaxContent").children()); // move elements back when you're finished
                });
                tb_position();
                $("#TB_load").remove();
                $("#TB_window").css({
                    display: "block"
                });
            } else if (url.indexOf('TB_iframe') != -1) {
                tb_position();
                if ($.browser.safari) { //safari needs help because it will not fire iframe onload
                    $("#TB_load").remove();
                    $("#TB_window").css({
                        display: "block"
                    });
                }
            } else {
                $("#TB_ajaxContent").load(url += "&random=" + (new Date().getTime()), ep.fn.thickboxAjaxLoad);
            }
        }
        if (!params['modal']) {
            document.onkeyup = function (e) {
                if (e == null) { // ie
                    keycode = event.keyCode;
                } else { // mozilla
                    keycode = e.which;
                }
                if (keycode == 27) { // close
                    tb_remove();
                }
            };
        }
    } catch (e) { //nothing here
    }
};

//helper functions below
function tb_showIframe() {
    //corrigeLinksJanelas();
    $("#TB_load").remove();
    $("#TB_window").css({ display: "block" });
};
ep.fn.tbRemoveFadeOut = function () {
    $('#TB_window,#TB_overlay,#TB_HideSelect').trigger("unload").unbind().remove();
};
function tb_remove() {
    $("#TB_imageOff").unbind("click");
    $("#TB_closeWindowButton").unbind("click");
    $("#TB_window").fadeOut("fast", ep.fn.tbRemoveFadeOut);
    $("#TB_load").remove();
    if (typeof document.body.style.maxHeight == "undefined") {//if IE 6
        $("body", "html").css({ height: "auto", width: "auto" });
        $("html").css("overflow", "");
    }
    document.onkeydown = "";
    document.onkeyup = "";
    return false;
};

function tb_position() {
    $("#TB_window").css({ marginLeft: '-' + parseInt((TB_WIDTH / 2), 10) + 'px', width: TB_WIDTH + 'px' });
    if (!(jQuery.browser.msie && jQuery.browser.version < 7)) { // take away IE6
        $("#TB_window").css({ marginTop: '-' + parseInt((TB_HEIGHT / 2), 10) + 'px' });
    }
};

function tb_parseQuery(query) {
    var Params = {};
    var key, val, KeyVal, Pairs;
    if (!query) {
        return Params;
    } // return empty object
    Pairs = query.split(/[;&]/);
    for (var i = 0; i < Pairs.length; i++) {
        KeyVal = Pairs[i].split('=');
        if (!KeyVal || KeyVal.length != 2) {
            continue;
        }
        key = unescape(KeyVal[0]);
        val = unescape(KeyVal[1]);
        val = val.replace(/\+/g, ' ');
        Params[key] = val;
    }
    return Params;
};

function tb_getPageSize() {
    var de = document.documentElement;
    var w = window.innerWidth || self.innerWidth || (de && de.clientWidth) || document.body.clientWidth;
    var h = window.innerHeight || self.innerHeight || (de && de.clientHeight) || document.body.clientHeight;
    arrayPageSize = [w, h];
    return arrayPageSize;
};

function tb_detectMacXFF() {
    var userAgent = navigator.userAgent.toLowerCase();
    if (userAgent.indexOf('mac') != -1 && userAgent.indexOf('firefox') != -1) {
        return true;
    }
};

// **********************
// FIM THICKBOX 
// *********************** 


// **************************************
// LIMITAR CARACTERES EM CAMPO TEXT AREA
// Para funcionar basta colocar a classe limita-caracter no campo 
// **************************************

(function ($) {
    $.fn.extend({
        limit: function (limit/*, element*/) {

            var interval, f;
            var self = $(this);

            $(this).focus(function () {
                interval = window.setInterval(substring, 100);
            });

            $(this).blur(function () {
                clearInterval(interval);
                substring();
            });

            substringFunction = "function substring(){ var val = $(self).val();var length = val.length;if(length > limit){$(self).val($(self).val().substring(0,limit)); alert(\"Limite de 300 caracteres ultrapassado.\");}";
            //if (typeof element != 'undefined')
            //    substringFunction += "if($(element).html() != limit-length){$(element).html((limit-length<=0)?'0':limit-length);}"

            substringFunction += "}";

            eval(substringFunction);



            substring();

        }
    });
})(jQuery);
$(document).ready(function () {
    if ($(".limita-caracter").length > 0) {
        $('.limita-caracter').limit('300', '.mostra-caracter-digitado');
    }
});


