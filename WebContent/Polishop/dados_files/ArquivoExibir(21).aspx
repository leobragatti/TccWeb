
// POLISHOP JavaScript
// NOVIDADES : v1.0

$(document).ready(function()
{
	if ($("body").attr("class") == "novidades")
	{
		// HEADER
		
		$("div.load").appendTo("div#header div#busca");
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
	};
});