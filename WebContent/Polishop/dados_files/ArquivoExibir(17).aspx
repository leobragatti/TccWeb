
// POLISHOP JavaScript
// DEPARTAMENTO : v1.0

$(document).ready(function()
{	
	if ($("body").attr("class") == "departamento")
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
		
		// VITRINE
		
		$(".colecaodpto ul li:eq(12)").css({ "clear" : "both" });
		if ( $.browser.msie )
        {
          	var secao = $(".departamento .bread-crumb ul li:last a");
			$("#label .destaques strong").html(secao);
			var faixa = $("#letreiro .bread-crumb ul li:last a").html();
			$("#letreiro .bread-crumb").replaceWith("<h2>" + faixa + "</h2>");
		}
	};
});