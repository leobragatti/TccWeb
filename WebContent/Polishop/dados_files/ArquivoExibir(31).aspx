
/*  =====================================================================
	
		TAGS for Polishop
		by Jo Santana / JOGA Labs (Brazil)
		http://www.jogalabs.com
	
	=====================================================================  */

$( function ()
{
	if ($("body").attr("class") == "tags")
	{
		$("div.load").appendTo("div#header div#busca");
		$("div#login p.welcome").html("Seja bem-vindo a Polishop!");
		$("p.loginmsg em a strong").html("Clique aqui e acesse sua conta!");
		$("div.insert").html("<h2>TAGS MAIS POPULARES</h2>");
	};
});