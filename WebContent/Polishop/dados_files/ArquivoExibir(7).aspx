// POLISHOP JavaScript
// SUBDEPARTAMENTO : v1.0

$(document).ready(function()
{
	if ($("body").attr("class") == "subdepartamento")
	{
		 if ( $.browser.msie )
        {
        	$(".search-single-navigator > h5").css({ "margin-top" : "-34px" });
            var altura = $("#produtos").height() + 100;
            $("#vitrine").css({ "height" : altura + "px" });
			
			$(document).change( function ()
			{
				var altura = $("#produtos").height() + 100;
            	$("#vitrine").css({ "height" : altura + "px" });
			});
        }
		
		var tmpBackup = $(".store-locator-cep-prefix");
		$(".subdepartamento .localize-lojas label.prefixo").text("");
		$(".subdepartamento .localize-lojas label.prefixo").html(tmpBackup);
		
		$("input:checkbox").attr('checked', false);
		
		var url = window.location.href;
		var baseURL = url.substring(0, url.indexOf('/', 14));
		
		var letreiroTexto = $(".search-single-navigator h3 a").text();
		var letreiroLink = $(".search-single-navigator h3 a").attr("href");
		$("#letreiro a.link").text( letreiroTexto );
		$("#letreiro a.link").attr({ "href" : letreiroLink, "title" : letreiroTexto });
		$("div.pager:first").remove();
		$("<div class='ondeestou'></div>").insertBefore(".navigation-tabs");
		$("div.menu-departamento h4:first").appendTo(".ondeestou");
		$("div.navigation-tabs h3:first, div.navigation-tabs h4:first").remove();
		$("div.menu-departamento h5, div.menu-departamento ul").removeClass();
		$("div.menu-departamento h5").addClass("even");
		$(".ondeestou h4 a").attr({ "href" : "javascript:void(0);" });
		$(".ondeestou h4 a").css({ "cursor" : "default" });
		
		if ( $("div.search-multiple-navigator").css("display") != "none" )
		{
			$("a.bt-refinar").insertAfter("div.menu-departamento");
			$("div.menu-departamento fieldset h5:first").css({ "border-top" : "none"});
		} else {
			$(".search-single-navigator a:first").remove();
		}
		
		$("a.tab-navegue, a.tab-navegue-ativo").click( function ()
		{
			$("a.bt-refinar").hide();
			$("a.bt-refinar").css("display", "none");
		});
		
		$("a.tab-refinar, a.tab-refinar-ativo").click( function ()
		{
			$("a.bt-refinar").show();
			$("a.bt-refinar").css("display", "block");
			$("a.bt-refinar").insertAfter("div.menu-departamento");
			$("div.menu-departamento fieldset h5:first").css({ "border-top" : "none"});						   
		});
		
		$("#lateral .filtros span:first, select#PS").remove();
		
		var elemento4 = $(".subdepartamento #vitrine #produtos ul.loop li:eq(3)");
		var elemento8 = $(".subdepartamento #vitrine #produtos ul.loop li:eq(7)");
		var elemento12 = $(".subdepartamento #vitrine #produtos ul.loop li:eq(11)");
		
		elemento4.css({ "width" : "190px" });
		elemento8.css({ "width" : "190px" });
		elemento12.css({ "width" : "190px" });
		
		$("#produtos ul.loop li").hover(
						  
			function ()
			{
				$(this).css({ 'width' : '191px', 'height' : '384px', 'padding' : '3px 0 3px 3px', 'border' : 'solid 3px #ed1c24', 'border-right' : 'solid 5px #ed1c24' });
				$(this).find(".BotaoComparar").css({ "top" : "343px" , "left" : "0" });
			},
			
			function ()
			{
				$(this).css({ 'width' : '190px', 'height' : '384px', 'padding' : '5px', 'border' : 'solid 1px #f2f2f2' });
				$(this).find(".BotaoComparar").css({ "top" : "345px" , "left" : "2px" });
			}
		);
		
		$("#produtos ul.loop li").css({ 'width' : '190px', 'height' : '384px', 'padding' : '5px', 'border' : 'solid 1px #f2f2f2' });
		$("#produtos ul.loop li").find(".BotaoComparar").css({ "top" : "345px" , "left" : "2px" });
		
		function CheckCompare() {
			
			$("input:checkbox").each( function() {
				if ($(this).is(':checked') ) {
					$("div#" + $(this).attr("id")).css({'background-position' : '-201px -214px'});
					$("div#" + $(this).attr("id") + " a").css({'display' : 'inline-block'});
				} else {
					$("div#" + $(this).attr("id")).css({'background-position' : '-10px -214px'});
					$("div#" + $(this).attr("id") + " a").css({'display' : 'none'});
				}
			});
		};
		
		// HEADER
		
		$("div#login p.welcome").html("Seja bem-vindo a Polishop!");
		$("p.loginmsg em a strong").html("Clique aqui e acesse sua conta!");
		
		// LATERAL
		
		$("#lateral .email input.newsletter-button-ok").hover(
															  
			function () {
				$(this).css("background-position", "-639px -247px");
			},
			function () {
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