
// POLISHOP JavaScript
// HOME : v1.0

$(document).ready(function()
{
	if ($("body").attr("class") == "home")
	{
		
		$(".slider").easySlider({
			auto: false,
			speed: 400,
			continuous: true 
		});
	
		$("span.imagine").css("opacity", "0.9");
		$("span.brilhe").css("opacity", "0.9");
		$("span.pratique").css("opacity", "0.9");
		$("span.viva").css("opacity", "0.9");
		$("span.invente").css("opacity", "0.9");
		$("span.transforme").css("opacity", "0.9");
		
		$("#mundoImagine").parent().hover( 
								 
			function ()
			{
				$("span.imagine").css("display", "block");
				$("span.imagine").stop().stop().animate({ "margin-top" : "0px" }, 100 );
			},
			
			function ()
			{
				$("span.imagine").stop().stop().animate({ "margin-top" : "108px" }, 500 );
			}
		);
		
		$("#mundoBrilhe").parent().hover( 
								 
			function ()
			{
				$("span.brilhe").css("display", "block");
				$("span.brilhe").stop().stop().animate({ "margin-top" : "0px" }, 100 );
			},
			
			function ()
			{
				$("span.brilhe").stop().stop().animate({ "margin-top" : "108px" }, 500 );
			}
		);
		
		$("#mundoPratique").parent().hover( 
								 
			function ()
			{
				$("span.pratique").css("display", "block");
				$("span.pratique").stop().stop().animate({ "margin-top" : "0px" }, 100 );
			},
			
			function ()
			{
				$("span.pratique").stop().stop().animate({ "margin-top" : "108px" }, 500 );
			}
		);
		
		$("#mundoViva").parent().hover( 
								 
			function ()
			{
				$("span.viva").css("display", "block");
				$("span.viva").stop().stop().animate({ marginTop: "0px" }, 100 );
			},
			
			function ()
			{
				$("span.viva").stop().stop().animate({ marginTop: "108px" }, 500 );
			}
		);
		
		$("#mundoInvente").parent().hover( 
								 
			function ()
			{
				$("span.invente").css("display", "block");
				$("span.invente").stop().stop().animate({ marginTop: "0px" }, 100 );
			},
			
			function ()
			{
				$("span.invente").stop().stop().animate({ marginTop: "108px" }, 500 );
			}
		);
		
		$("#mundoTransforme").parent().hover( 
								 
			function ()
			{
				$("span.transforme").css("display", "block");
				$("span.transforme").stop().stop().animate({ marginTop: "0px" }, 100 );
			},
			
			function ()
			{
				$("span.transforme").stop().stop().animate({ marginTop: "108px" }, 500 );
			}
		);
		
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