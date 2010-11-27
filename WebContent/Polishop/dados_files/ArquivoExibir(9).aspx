
// POLISHOP JavaScript
// INSTITUCIONAL : v1.0

$(document).ready(function()
{
	var classeBody = $("body").attr("class");
	
	if ( classeBody == "Afiliados" || classeBody == "ComoComprar" || classeBody == "CompraSegura" || classeBody == "PoliticaDevolucao" || classeBody == "VendasCorporativas" )
	{
		$("div.load").appendTo("div#header div#busca");
		$("div#login p.welcome").html("Seja bem-vindo a Polishop!");
		$("p.loginmsg em a strong").html("Clique aqui e acesse sua conta!");
	};
});


