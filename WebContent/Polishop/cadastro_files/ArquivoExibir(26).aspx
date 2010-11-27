
// POLISHOP JavaScript
// CARRINHO : v1.0

$(document).ready(function()
{	
	if ($("body").attr("class") == "carrinho")
	{
		
		$("div#login").css({"display" : "block"});
		$("div#login").empty();
		$("div.welcome").appendTo("div#login");
		$("div.welcome").css({"margin" : "49px 0 0 170px", "width" : "170px", "height" : "auto", "float" : "left", "padding" : "0", "text-align" : "left"});
		$("div.welcome em").css({"float" : "left"});
		$("div.welcome a.logout").css({"float" : "right", "margin" : "-3px 0 0 5px"});
		$("div#login p.welcome").html("Seja bem-vindo a Polishop!");
		
		if ( $.browser.msie )
        {
           $(".sidebar").insertAfter(".carrinhoTable");
		   $(" td.txtSubTotal").html("Subtotal");
        }
        
        $('iframe').parent().attr( "style", "overflow : hidden; width : 100px; height : auto; margin-top : 40px;" );
		$('iframe').parent().live( 'ready load', function () { $(this).attr( "style", "overflow : hidden; width : 100px; height : auto; margin-top : 40px;" ); });
		
		/*
		$('iframe, #TB_window').attr( "style", "overflow : auto; width : 610px; height : 300px; margin-top : 40px;" );
		$('iframe, #TB_window').live( 'ready load', function () { $(this).attr( "style", "overflow : auto; width : 610px; height : 300px; margin-top : 40px;" ); });
		$('iframe').parent().attr( "style", "overflow : auto; width : 610px; height : 300px; margin-top : 40px;" );
		$('iframe').parent().live( 'ready load', function () { $(this).attr( "style", "overflow : auto; width : 610px; height : 300px; margin-top : 40px;" ); });
		*/
		
		$('.popup').attr( "style", "overflow : auto; width : 610px; height : 300px; margin-top : 40px;" );
		$('.popup').live( 'ready load', function () { $(this).attr( "style", "overflow : auto; width : 610px; height : 300px; margin-top : 40px;" ); });
		
		$("a.thickbox.more").click ( function ()
		{
			$("iframe").attr( "style", "overflow : hidden; width : 600px; height : 300px; margin-top : 40px;");
			$("iframe").parent().attr( "style", "overflow : visible; width : 600px; height : 300px; margin-top : 40px;");
		});
		
		$('.popup fieldset.continuar input.fisubmit').hover (
			function () { $(this).css({ 'background-position' : '-154px -548px' }); },
            function () { $(this).css({ 'background-position' : '-10px -548px' }); }
		);
		
		$('div.fCep input.bt').hover (
			function () { $(this).css({ 'background-position' : '-663px -29px' }); },
            function () { $(this).css({ 'background-position' : '-663px -10px' }); }
		);
		
		$('fieldset.vale-presente input.bt').hover (
			function () { $(this).css({ 'background-position' : '-663px -29px' }); },
            function () { $(this).css({ 'background-position' : '-663px -10px' }); }
		);
		
		if ($("div.sidebar").length != 0)
		{
			$("div.sidebar").insertAfter("div.content");
			$(".carrinho .sidebar .prateleira ul li h3").insertAfter(".carrinho .sidebar .prateleira ul li a.img-produto-prateleira");
			$(".carrinho .sidebar .prateleira .comprar a").attr("title", "Adicionar ao Carrinho");
		};
		
		$("fieldset.vale-presente input.bt").hover (
			function () { $(this).css({ 'background-position' : '-663px -29px' }); },
            function () { $(this).css({ 'background-position' : '-663px -10px' }); }
		);
	};
});