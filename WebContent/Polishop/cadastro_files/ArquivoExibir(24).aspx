
// POLISHOP JavaScript
// MINHA POLISHOP : v1.0

$(document).ready(function()
{
	var url = location.href;
    var baseURL = url.substring(0, url.indexOf('/', 14));
	
	if ($("body").attr("class") == "minha-conta manutencao-conta esqueci-senha")
	{
		$(".enviar-senha input").hover (
			function(){ $(this).css({'background-position' : '-476px -127px'}); },
            function () { $(this).css({'background-position' : '-476px -107px' }); }
		);
		$("div.content h2").clone().insertBefore("div.recuperar-senha");
		$("div.insert").html("<h2><a href='" + baseURL + "/Vitrine/MinhaConta/MinhaConta.aspx' title='Meu Perfil'>Meu Perfil</a></h2><span></span><h2>Esqueci minha senha</h2>");
		$("").ajaxSuccess( function ()
		{
			if ( !$(".content .esqueci-senha h2").exists() )
			{
				$("div.content h2").clone().insertBefore("div.recuperar-senha");
			}
		});
	};
	
	if ($("body").attr("class") == "minha-conta manutencao-conta email-mudou")
	{
		$(".email-mudou-continuar input").hover (
			function(){ $(this).css({'background-position' : '-588px -127px'}); },
            function () { $(this).css({'background-position' : '-588px -107px' }); }
		);
		
		$("div.content h2").clone().insertBefore("div.alterar-email");
		$("div.insert").html("<h2><a href='" + baseURL + "/Vitrine/MinhaConta/MinhaConta.aspx' title='Meu Perfil'>Meu Perfil</a></h2><span></span><h2>Meu e-mail mudou</h2>");
		$("").ajaxSuccess( function ()
		{
			if ( !$(".content .esqueci-mudou h2").exists() )
			{
				$("div.content h2").clone().insertBefore("div.alterar-email");
			}
		});
	};

	if ($("body").attr("class") == "minha-conta manutencao-conta esqueci-email")
	{
		$(".buscar-email input").hover (
			function(){ $(this).css({'background-position' : '-700px -127px'}); },
            function () { $(this).css({'background-position' : '-700px -107px' }); }
		);
		$("div.content h2").clone().insertBefore("div.recuperar-email");
		$("div.insert").html("<h2><a href='" + baseURL + "/Vitrine/MinhaConta/MinhaConta.aspx' title='Meu Perfil'>Meu Perfil</a></h2><span></span><h2>Esqueci meu e-mail</h2>");
		$("").ajaxSuccess( function ()
		{
			if ( !$(".content .esqueci-mudou h2").exists() )
			{
				$("div.content h2").clone().insertBefore("div.recuperar-email");
			}
		});
	};

	if ($("body").attr("class") == "minha-conta meus-pedidos")
	{
		$("div.insert").html("<h2><a href='" + baseURL + "/Vitrine/MinhaConta/MinhaConta.aspx' title='Meu Perfil'>Meu Perfil</a></h2><span></span><h2>Meus Pedidos</h2>");
		$(".content-meuspedidos .tabela-pedidos h3").empty();
		$("div.nav").insertAfter("div.content-meuspedidos h2");
		$("fieldset.filtrar").appendTo("div.tabela-pedidos");
		$("table thead th.pedido").html("N&uacute;mero");
		$("div.ok input.bt").hover (
			function(){ $(this).css({'background-position' : '-10px -217px'}); },
            function () { $(this).css({'background-position' : '-10px -197px' }); }
		);
		$("div#login").css({"display" : "block"});
		$("div#login").empty();
		$("div.welcome").appendTo("div#login");
		$("div.welcome").css({"margin" : "49px 0 0 170px", "width" : "170px", "height" : "auto", "float" : "left", "padding" : "0", "text-align" : "left"});
		$("div.welcome em").css({"float" : "left"});
		$("div.welcome a.logout").css({"float" : "right", "margin" : "-3px 0 0 5px"});
	};

	if ($("body").attr("class") == "minha-conta meus-pedidos-detalhes")
	{
		var numPedido = $(".informacoes-entrega ul li.pedido-numero span").html();
		$("div.insert").html("<h2><a href='" + baseURL + "/Vitrine/MinhaConta/MinhaConta.aspx' title='Meu Perfil'>Meu Perfil</a></h2><span></span><h2><a href='" + baseURL + "/site/MeusPedidos.aspx' title='Meus Pedidos'>Meus Pedidos</a></h2><span></span><h2>Pedido " + numPedido.toString() + "</h2>");
		$("div.descricao-entrega").insertBefore("div.dados-entrega dl");
		$("<div class='box-dados-produto'><h3>Descri&ccedil;&atilde;o do Produto</h3></div>").insertBefore("table.descricao-compra");
		$("<div class='box-tabela-produto'></div>").insertBefore("table.descricao-compra");
		$("table.descricao-compra").appendTo("div.box-tabela-produto");
		$("th.quantidade").html("Quantidade");
		$("div.voltar a.bt").clone().insertAfter("div.informacoes-entrega ul");
		$("div#login").css({"display" : "block"});
		$("div#login").empty();
		$("div.welcome").appendTo("div#login");
		$("div.welcome").css({"margin" : "49px 0 0 170px", "width" : "170px", "height" : "auto", "float" : "left", "padding" : "0", "text-align" : "left"});
		$("div.welcome em").css({"float" : "left"});
		$("div.welcome a.logout").css({"float" : "right", "margin" : "-3px 0 0 5px"});
	};
	
	if ($("body").attr("class") == "minha-conta")
	{
		$("div.insert").html("<h2><a href='" + baseURL + "/Vitrine/MinhaConta/MinhaConta.aspx' title='Meu Perfil'>Meu Perfil</a></h2>");
		$(".minha-conta .area-3-2 h3:first").remove();
		$("ul.bts li.alterar-senha").insertAfter("ul.bts li.editar");
		$("div.informacoes-conta h3").html("Sua conta");
		$("div.nav").insertAfter("div.area-3-2-1 h2");
		$("#ctl00_Conteudo_58").insertAfter("div.area-3-2-3 ul.bts");
		$("div.area-3-2-5").insertAfter("div.area-3-2-3 ul.bts");
		$("div.area-3-2-6").insertAfter("div.area-3-2-5");
		$("div.area-3-2-7").insertAfter("div.area-3-2-6");
		$("div.area-3-2-8").insertAfter("div.area-3-2-7");
		$("div.area-3-2-9").insertAfter("div.area-3-2-8");
		$("div.area-3-2-10").insertAfter("div.area-3-2-9");
		$("div.area-3-3").insertAfter("div.area-3-2-10");
		$("div.area-3-3-2 h4").html("Meus desejos");
		$("div.menu-perfil ul li:eq(5) a").html("Opini&otilde;es e coment&aacute;rios"); 
		$('div.menu-perfil ul li:first, div.menu-perfil ul li:eq(2), div.menu-perfil ul li:eq(3), div.menu-perfil ul li:eq(4), div.menu-perfil ul li:last, div.area-3-2-5 dl dt:last, div.area-3-2-5 dl dt:eq(1), div.area-3-2-5 dl dd:eq(1)').remove();
		$("div.lista-minha-conta ul li").prepend('<div>');
		$("div.lista-minha-conta ul li").append('</div>');
		$("div.lista-minha-conta").easySlider({
			auto: false,
			speed: 400,
			pause: 5000,
			controlsBefore:	'<p id="controls">',
			controlsAfter:	'</p>',
			prevId: 'prevBtn',
			nextId: 'nextBtn',
			continuous: true 
		});
		$("div.area-3-3-2 p#controls").remove();
	};
	
	if ($("body").attr("class") == "minha-conta manutencao-conta alterar-senha")
	{
		$("div.insert").html("<h2><a href='" + baseURL + "/Vitrine/MinhaConta/MinhaConta.aspx' title='Meu Perfil'>Meu Perfil</a></h2><span></span><h2>Alterar Senha</h2>");
		$("input.bt").hover (
			function(){ $(this).css({'background-position' : '-476px -127px'}); },
            function () { $(this).css({'background-position' : '-476px -107px' }); }
		);
		$("div.content h2").clone().insertBefore("div.wrapper");
	};
	
	if ($("body").attr("class") == "minha-conta editar-conta")
	{
		$("div.insert").html("<h2><a href='" + baseURL + "/Vitrine/MinhaConta/MinhaConta.aspx' title='Meu Perfil'>Meu Perfil</a></h2><span></span><h2>Editar Perfil</h2>");
		$("li.voltar").find("input.bt").hover (
			function(){ $(this).css({'background-position' : '-10px -431px'}); },
            function () { $(this).css({'background-position' : '-10px -400px' }); }
		);
	};
});

$.fn.exists = function() { return $(this).length > 0 }