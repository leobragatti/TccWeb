
// POLISHOP JavaScript
// CENTRAL DE PEDIDOS : v1.0

$(document).ready(function()
{
	if ($("body").attr("class") == "CentralPedidos")
	{
		$("div.load").appendTo("div#header div#busca");
		$("div#login p.welcome").html("Seja bem-vindo a Polishop!");
		$("p.loginmsg em a strong").html("Clique aqui e acesse sua conta!");
		
		function AbrirPedidos()
		{
			window.open('http://comercio.polishop.com.br/is-bin/INTERSHOP.enfinity/eTS/Store/pt/-/BRC/Tracking-StartView <http://comercio.polishop.com.br/is-bin/INTERSHOP.enfinity/eTS/Store/pt/-/BRC/Tracking-StartView;sid=7IT68ru1CIOmg_BrUtTe4qgZsyw7TSUrJTA=>','televendas','width=780,height=370,scrollbars=yes');
		};
	};
});