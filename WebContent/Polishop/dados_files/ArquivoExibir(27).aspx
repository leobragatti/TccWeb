
// POLISHOP JavaScript
// TIRA DUVIDAS : v1.0

$(document).ready(function()
{
	if ($("body").attr("class") == "TiraDuvidas")
	{
		$("div.load").appendTo("div#header div#busca");
		$("div#login p.welcome").html("Seja bem-vindo a Polishop!");
		$("p.loginmsg em a strong").html("Clique aqui e acesse sua conta!");
	};
});