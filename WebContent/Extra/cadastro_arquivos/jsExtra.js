/* **************************** */
/* insere bordas */
/* **************************** */
$.fn.bordas = function (options) {
var settings = $.extend({
'classBotao': 'btBordas',
'classInput': 'btBordasInput',
'nofinal': true,
'tags': '<span class="rdbd bdlt"></span><span class="rdbd bdrt"></span><span class="rdbd bdrb"></span><span class="rdbd bdlb"></span>'
}, options);
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

criaBordas = function(){
	$('.sku .area1-1-3-1,.newsletter .box, .sidebox li a').bordas({'tags':'<span class="rdbd bdrb"></span><span class="rdbd bdlb"></span>'});
	$('.mnav, .carrinho .ficha, body.login .half,  .acessorios, .resultadoAcessorios, .detalhesProduto, .fotoProduto, .garantiaEstendida .infoGarantia, .tags, .consumidores, .sku .area1-1-3-2, .compreJunto,.wrapperCarrinhoResumo, .checkoutPassos li.passo, .sku .area1-1-2, .parcelamento .tabsCont, .carrinhoVazio, .finaliza, .npedido').bordas();
	$('.sku .area1-1-3-1 .tit, .carrinho .boxServ h3, .listaPassos h4.top').bordas({'tags':'<span class="rdbd bdlt"></span><span class="rdbd bdrt"></span>'});
}

$(document).ready(function(){
	 setTimeout('criaBordas();', 500);
	if(typeof Sys != 'undefined' && typeof Sys.WebForms != 'undefined' && typeof Sys.WebForms.PageRequestManager != 'undefined'){
		Sys.WebForms.PageRequestManager.getInstance().add_endRequest(criaBordas);
	}
	
});

var urlBanner = '<div class="banner-PA-Delivery"><a title="Aproveite para ir ao supermercado. Acesse www.paodeacucar.com.br" href="http://www.paodeacucar.com.br" target="_blank">Pão de Açucar Delivery. Aproveite para ir ao supermercado. Acesse www.paodeacucar.com.br</a></div>';

$(document).ready(function() {
    var re = new RegExp('/Site/FinalizaCompra\\.aspx\\?IdCompra=[0-9]{1,}$');
    if (re.exec(window.location) != null)
    {
        var banner = $('.conteudo').html();
        $('.conteudo').html(banner + urlBanner);
    }
});