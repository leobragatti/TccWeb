
// POLISHOP JavaScript
// ATENDIMENTO : v1.0

$(document).ready(function()
{
	if ($("body").attr("class") == "atendimento")
	{
		TopicoSelecionado();
	
		$("ul.topicos a").click(function () {
			ZerarTopicos();
			$(this).addClass("ON");
			$("span#" + $(this).attr("id")).css({'display' : 'block'});
			$("span#" + $(this).attr("id")).css({'opacity' : '0'});
			$("span#" + $(this).attr("id")).animate({ opacity: 1 }, 300 );
			//window.location.replace($.jqURL.strip() + "?topico=" + $(this).attr("id"));
			window.location.hash = $(this).attr("id");v
			$('html, body').animate({ scrollTop : 0 }, 0 );
			return false;
		});
			$("div#login p.welcome").html("Seja bem-vindo a Polishop!");
			$("p.loginmsg em a strong").html("Clique aqui e acesse sua conta!");};
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
	if (topico == "" && $("body").attr("class") == "tiraduvidas") { topico = "Navegando"; }
	$("a#" + topico).addClass("ON");
	$("span#" + topico).css({'display' : 'block'});
	$("span#" + topico).css({'opacity' : '1'});
	//if ($("body").attr("class") == "tiraduvidas") { window.location.hash = topico; }
};