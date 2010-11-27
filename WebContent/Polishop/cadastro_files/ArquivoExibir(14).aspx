// POLISHOP JavaScript
// AJUDA ON-LINE : v1.0

$(document).ready(function()
{
	if ($("body").attr("class") == "ajudaonline")
	{
		$("div#login p.welcome").html("Seja bem-vindo a Polishop!");
		$("p.loginmsg em a strong").html("Clique aqui e acesse sua conta!");
		
		TopicoSelecionado();
		
		$("ul.topicos a").click( function ()
		{
			ZerarTopicos();
			$(this).addClass("ON");
            var topicoA = "span." + $(this).attr("id");
    		var topicoB = topicoA.toString();
			$( topicoB ).css({'display' : 'block'});
			$( topicoB ).css({'opacity' : '0'});
			$( topicoB ).animate({ opacity: 1 }, 300 );
			window.location.hash = $(this).attr("id");
			return false;
		});
	};
});

function ZerarTopicos ()
{	
	$(".content #textos span").css({'display' : 'none'});
	$("ul.topicos a").removeClass("ON");
};

function TopicoSelecionado ()
{	
	ZerarTopicos();
	var topico = window.location.hash;
	
	if (topico == "" && $("body").attr("class") == "ajudaonline")
	{
		topico = "ajudaonline";
		var topico2 = topico;
	}
		else
	{
		var topico1 = topico.substring(1);
    	var topico2 = topico1.toString();
	}
	
	$( "a." + topico2 ).addClass("ON");
	$( "span." + topico2 ).css({"display" : "block"});
	$( "span." + topico2 ).css({"opacity" : "1"});
	
	if ($("body").attr("class") == "ajudaonline") { window.location.hash = topico; }
};