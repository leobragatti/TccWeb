
// POLISHOP JavaScript
// BUSCA : v1.0

$(document).ready(function()
{
	if ($("body").attr("class") == "busca")
	{
		$("div#login p.welcome").html("Seja bem-vindo a Polishop!");
		$("p.loginmsg em a strong").html("Clique aqui e acesse sua conta!");
		
		$("input:checkbox").attr('checked', false);
		$("div.BotaoComparar a").css({'display' : 'none'});
		
		var url = window.location.href;
		var baseURL = url.substring(0, url.indexOf('/', 14));
		
		var Formato = "horizontal";
		$("div.pager:first").remove();
		
		$("div.navigation-tabs").find('.search-single-navigator').find('ul').removeClass();
		$("div.navigation-tabs").find('.search-single-navigator').find('h5').removeClass();
		$("div.navigation-tabs").find('.search-single-navigator').find('ul:even').addClass('even');
		$("div.navigation-tabs").find('.search-single-navigator').find('h5:even').addClass('even');
		
		$("div.navigation-tabs").find('.search-multiple-navigator').find('fieldset').removeClass();
		$("div.navigation-tabs").find('.search-multiple-navigator').find('fieldset h5').removeClass();
		$("div.navigation-tabs").find('.search-multiple-navigator').find('fieldset:even').addClass('odd');
		$("div.navigation-tabs").find('.search-multiple-navigator').find('h5:even').addClass('odd');
		$("div.navigation-tabs").find('.search-multiple-navigator').find('.bt-refinar').clone().appendTo('div.navigation-tabs .search-multiple-navigator');
		
		$("span.resultado-busca-tempo").remove();
		
		$("div.navigation-tabs").find('.search-multiple-navigator').find('fieldset').find('label:last').css({ 'border' : 'none' });
		
		$(".navigation-tabs .search-single-navigator ul").each( function () 
		{
			$(this).find("li:last").css({ "border" : "none" });
		});
		
		$(".navigation .search-single-navigator ul").each( function () 
		{
			$(this).find("li:last").css({ "border" : "none" });
		});
		
		$(".lista").mouseover(function ()
		{
			$(this).css({'margin' : '0 -3px 0 0'});
			$(this).css({'border' : 'solid 3px #ff0000'});
			$(this).css({'width' : '785px'});
			$(this).css({'padding' : '13px 0 0 13px'});
			$(this).css({'height' : '98px'});
			$(this).find(".rating-produto").css({'top' : '18px'});
			$(this).find(".rating-produto").css({'left' : '676px'});
			$(this).find(".BotaoComparar").css({'top' : '38px'});
			$(this).find(".BotaoComparar").css({'left' : '658px'});
		});
		
		$(".lista").mouseout(function ()
		{
			$(this).css({'border' : 'solid 1px #f2f2f2'});
			$(this).css({'margin' : '0 -3px 0 0'});
			$(this).css({'width' : '787px'});
			$(this).css({'padding' : '15px 0 0 15px'});
			$(this).css({'height' : '100px'});
			$(this).find(".rating-produto").css({'top' : '20px'});
			$(this).find(".rating-produto").css({'left' : '678px'});
			$(this).find(".BotaoComparar").css({'top' : '40px'});
			$(this).find(".BotaoComparar").css({'left' : '660px'});
		});
		
		$("ul.loop input:checkbox").click(function () {
			
			if ($(this).is(':checked') ) {
				if (Formato == "horizontal") {
					$("div#" + $(this).attr("id")).css({'background-position' : '-331px -151px'});
				} else {
					$("div#" + $(this).attr("id")).css({'background-position' : '-201px -214px'});
				}
				$("div#" + $(this).attr("id") + " a").css({'display' : 'inline-block'});
			} else {
				if (Formato == "horizontal") {
					$("div#" + $(this).attr("id")).css({'background-position' : '-201px -151px'});
				} else {
					$("div#" + $(this).attr("id")).css({'background-position' : '-10px -214px'});
				}
				$("div#" + $(this).attr("id") + " a").css({'display' : 'none'});
			}
			
			$("div#"+$(this).attr("id")).css({'opacity' : '0'});
			$("div#"+$(this).attr("id")).animate({ opacity: 1 }, 250 );
			
		});
		
		function CheckCompare() {
			
			$("ul.loop input:checkbox").each( function() {
				if ($(this).is(':checked') ) {
					if (Formato == "horizontal") {
						$("div#" + $(this).attr("id")).css({'background-position' : '-331px -151px'});
					} else {
						$("div#" + $(this).attr("id")).css({'background-position' : '-201px -214px'});
					}
					$("div#" + $(this).attr("id") + " a").css({'display' : 'inline-block'});
				} else {
					if (Formato == "horizontal") {
						$("div#" + $(this).attr("id")).css({'background-position' : '-201px -151px'});
					} else {
						$("div#" + $(this).attr("id")).css({'background-position' : '-10px -214px'});
					}
					$("div#" + $(this).attr("id") + " a").css({'display' : 'none'});
				}
			});
		};
		
		$("input#newsletterButtonOK").mouseover(function () {
			$(this).css("background-position", "-639px -247px");
		});
		
		$("input#newsletterButtonOK").mouseout(function () {
			$(this).css("background-position", "-639px -228px");
		});
		
		SelecionarOrdem();
		SelecionarNumItens();
	};
});

function Filtrar ( ordem )
{
	
	var onde = $.jqURL.get("fq");
	if (onde == null) { onde = "" };
	var termo = $.jqURL.get("ft");
	if (termo == null) { termo = "" };
	var itens = $.jqURL.get("PS");
	if (itens == null) { itens = "" };
	if (ordem == null) { ordem = "" };
	
	var myURL = window.location.href;
	var tmpURL = myURL.substring(0, myURL.indexOf('?', 14));
	var gotoURL = tmpURL + '?fq=' + onde + '&ft=' + termo + '&O=' + ordem + '&PS=' + itens;
	gotoURL.toString();
	
	window.location =  gotoURL;
	
	SelecionarOrdem();
};

function Itens ( num )
{	
	var termo =  $.jqURL.get("ft");
	var ordem =  $.jqURL.get("O");
	
	if (ordem == "" || ordem == null)
	{
		window.location.href= baseURL + '/a/busca?ft=' + termo + '&PS=' + num ;
	}
		else
	{
		window.location.href= baseURL + '/a/busca?ft=' + termo + '&PS=' + num + '&O=' + ordem ;
	};
};
	
function SelecionarOrdem ()
{	
	var ordem =  $.jqURL.get("O");
	
	if ( ordem != "" || ordem != null )
	{
		switch ( ordem )
		{
			case "OrderByTopSaleDESC" : 
			
				ZerarOrdem();
				$("a#MaisVendidos").css({'background-position' : '-10px -103px','cursor' : 'default'});
				break;
				
			case "OrderByPriceASC" :
				
				ZerarOrdem();
				$("a#MenorPreco").css({'background-position' : '-140px -103px','cursor' : 'default'});
				break;
				
			case "OrderByPriceDESC" :
			
				ZerarOrdem();
				$("a#MaiorPreco").css({'background-position' : '-260px -103px','cursor' : 'default'});
				break;
			
			case "OrderByNameASC" :
			
				ZerarOrdem();
				$("a#AZ").css({'background-position' : '-380px -103px','cursor' : 'default'});
				break;
			
			case "OrderByNameDESC" :
			
				ZerarOrdem();
				$("a#ZA").css({'background-position' : '-470px -103px','cursor' : 'default'});
				break;
				
			default :
				
				ZerarOrdem();
				$("a#MaisVendidos").css({'background-position' : '-10px -103px','cursor' : 'default'});
				break;
		};
	};
};
	
function ZerarOrdem ()
{	
	$("a#MaisVendidos").css({'background-position' : '-10px -10px'});
	$("a#MenorPreco").css({'background-position' : '-140px -10px'});
	$("a#MaiorPreco").css({'background-position' : '-260px -10px'});
	$("a#AZ").css({'background-position' : '-380px -10px'});
	$("a#ZA").css({'background-position' : '-470px -10px'});
};
	
function SelecionarNumItens ()
{	
	var itens =  $.jqURL.get("PS");
	$("select#PS option[value='" + itens + "']").attr('selected', 'selected');
	
	if (itens == null) { $("select#PS option[value='20']").attr('selected', 'selected'); }
};