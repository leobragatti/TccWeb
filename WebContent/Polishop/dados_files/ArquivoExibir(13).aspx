
// POLISHOP JavaScript
// POLITICA DE DEVOLUCAO : v2.0

$(document).ready(function()
{
	if ($("body").attr("class") == "PoliticaDevolucao")
	{
		TopicoSelecionado();
		
		$("ul.topicos a").click( function ()
		{
			ZerarTopicos();
			$(this).addClass("ON");
			var topicoB = "span." + $(this).attr("id");
    		var topicoC = topicoB.toString();
			$( topicoC ).css({'display' : 'block'});
			$( topicoC ).css({'opacity' : '0'});
			$( topicoC ).animate({ opacity: 1 }, 300 );
			//window.location.replace($.jqURL.strip() + "?topico=" + $(this).attr("id"));
			window.location.hash = $(this).attr("id");
			$('html, body').animate({ scrollTop : 0 }, 0 );
			return false;
		});
		
		$("div#login p.welcome").html("Seja bem-vindo a Polishop!");
		$("p.loginmsg em a strong").html("Clique aqui e acesse sua conta!");
	};
});

function ZerarTopicos ()
{	
	$("span").css({'display' : 'none'});
	$("ul.topicos a").removeClass("ON");
};

function TopicoSelecionado ()
{	
	// var topico = $.jqURL.get("topico");
	var topico = window.location.hash;
	if (topico == "" && $("body").attr("class") == "PoliticaDevolucao") { topico = "PoliticaDevolucao"; }
	$("a#" + topico).addClass("ON");
	var topicoB = "span." + topico.substring(1);
    var topicoC = topicoB.toString();
	$( topicoC ).css({"display" : "block"});
	$( topicoC ).css({"opacity" : "1"});
	if ($("body").attr("class") == "PoliticaDevolucao") { window.location.hash = topico; }
};