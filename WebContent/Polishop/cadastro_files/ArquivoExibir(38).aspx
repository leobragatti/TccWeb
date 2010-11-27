
// POLISHOP JavaScript
// CHECKOUT : v1.0

$(document).ready(function()
{
	if ($("div.header-steps").length != 0)
	{
		var url = location.href;
    	var baseURL = url.substring(0, url.indexOf('/', 14));
			
		// Ajuste de pos do DIV de conteudo
		$("div.content").css({'top' : '30px'});
		$("div.content").css({'margin-bottom' : '50px'});
		// Logo da Polishop em Flash
		$("<div id='logo'></div>").insertBefore(".header-steps .steps ul");
		$(".header-steps h1").appendTo(".header-steps .steps #logo");
		$("<script type='text/javascript'>swfobject.embedSWF('" + baseURL + "/Control/ArquivoExibir.aspx?NomeArquivo=logo.swf', 'logo', '142', '54', '9.0.0', 'swf/expressinstall.swf');</script>").insertBefore(".header-steps .steps #logo");
		// Link para o Chat Online
		$("a#checkout-chat").appendTo(".header-steps .steps");
		$("a#checkout-chat").css({'display' : 'block'});
		$("a#checkout-chat").click( function () { abrirChat() });
		
		function abrirChat ()
		{
			window.name="Polishop | Ajuda Online";
			window.open( "http://www.polishop.com.br/chat/mysuite.htm", "janela1", "toolbar=no,resizable=no,top=180,left=180,directories=no,status=no,menubar=no,scrollbars=no,width=600,height=450" );
		};
	};
	
	if ($("body").attr("class") == "login")
	{
		$("input.bt").hover(
			function(){ $(this).css({ 'background-position' : '-10px -127px', 'cursor' : 'pointer' }); },
            function () { $(this).css({'background-position' : '-10px -88px', 'cursor' : 'pointer' }); }
		);
		
		if ( $.browser.msie )
        {
           $("input.bt").attr( "value", "" );
        }
        
        $("<a class='oldCustomerLogin' href='https://www2.polishop.com.br/Site/EsqueciMinhaSenha.aspx' alt='Quero acessar minha conta!'>Se voc&ecirc; j&aacute; &eacute; nosso cliente e est&aacute; com dificuldades para acessar sua conta, <u>clique aqui</u>.</a>").insertAfter(".criar-conta");
	};
	
	if ($("body").attr("class") == "checkout cadastro-cliente")
	{
		$("a#menuNovidades").appendTo("div.menuwrap");
		$("a#menuOutrosCanais").appendTo("div.menuwrap");
		$("a#menuNovidades").css({'display' : 'block'});
		$("a#menuOutrosCanais").css({'display' : 'block'});
    	$("div#letreiro").insertAfter('div.menuwrap');
		$("div#dropmenu").appendTo("div.menuwrap");
		
		$("div.insert").html("<h2>Identifica&ccedil;&atilde;o</h2><span></span><h2>Cadastro</h2>");
		$("fieldset.frmTipoPessoa legend span").html("Dados pessoais");
		$(".fCheck label:last").hide();
		$("input.fisubmit").hover(
			function(){ $(this).css({'background-position' : '-10px -127px'}); },
            function () { $(this).css({'background-position' : '-10px -88px' }); }
		);
		
		$("iframe").attr( "scrolling", "no");
		$("iframe").attr( "style", "overflow : hidden; width : 600px; height : 240px;");
		$("iframe").parent().attr( "style", "overflow : visible; width : 600px; height : 240px;");
		
		$("a.thickbox.tbstarted").click ( function ()
		{
			$("iframe").attr( "scrolling", "no");
			$("iframe").attr( "style", "overflow : hidden; width : 600px; height : 240px;");
			$("iframe").parent().attr( "style", "overflow : visible; width : 600px; height : 240px;");
		});
		
		if ( $.browser.safari )
		{
			$("iframe").parent().css({ "width" : "600px", "height" : "300px", "overflow" : "hidden" });
			$("iframe").css({ "width" : "600px", "height" : "350px", "overflow" : "hidden" });
		}
	};
	
	if ($("body").attr("class") == "checkout endereco-compra")
	{		
		$("span.continuar input.bt").hover(
			function(){ $(this).css({'background-position' : '-384px -545px'}); },
      function () { $(this).css({'background-position' : '-606px -390px' }); }
		);
		
		var  is_chrome = navigator.userAgent.toLowerCase().indexOf('chrome') > -1;
		
		if ( is_chrome )
		{
			$("div.content").css({ "margin" : "80px 0 0 -491px" });
		}
		
		if ( $.browser.safari )
		{
			$("div.content").css({ "margin" : "100px 0 60px -491px" });
		}
		
		if ( $(".menuwrap").length != 0 )
		{
			$("div.endereco h2").clone().prependTo(".content");
			$("div.insert").html("<h2><a href='" + baseURL + "/Vitrine/MinhaConta/MinhaConta.aspx' title='Meu Perfil'>Meu Perfil</a></h2><span></span><h2>Endere&ccedil;os de Entrega</h2>");
			if ( is_chrome || $.browser.safari )
			{
				$("div.content").css({ "margin-top" : "20px" });
			}
		}
	};
	
	if ($("body").attr("class") == "checkout forma-pagamento")
	{
		$('.formaPagamentoVale').css('display', 'block');
		
		$("input:radio, fieldset.vale-presente input.fisubmit").live('click', function ()
		{
			clearInterval(intervalo);
			var intervalo = window.setInterval( function () { $('.formaPagamentoVale').css('display', 'block'); }, 10);
			window.setTimeout( function () { clearInterval(intervalo); }, 10000);
		});
		
		$('<div class="banner_visa" style="padding: 10px 0 20px 20px;"><img src="https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=checkout_visa.gif" height="56" width="898" alt="Promo&ccedil;&atilde;o Exclusiva!" /></div>').appendTo('#ctl00_Conteudo_ctrlControleEducativo_PopupMenu');
		
		$('').ajaxSuccess( function ()
		{
			if ( $('div.banner_visa').exists() )
			{
				$('div.banner_visa').remove();
			}
			
			$('<div class="banner_visa" style="padding: 10px 0 20px 20px;"><img src="https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=checkout_visa.gif" height="56" width="898" alt="Promo&ccedil;&atilde;o Exclusiva!" /></div>').appendTo('#ctl00_Conteudo_ctrlControleEducativo_PopupMenu');
			
		});
	
		$("#footer").insertAfter("div.content");
		$("fieldset.continuar input").hover(
			function(){ $(this).css({'background-position' : '-10px -49px'}); },
            function () { $(this).css({'background-position' : '-10px -10px' }); }
		);
		$("ul.lista-boletos p").appendTo("div.opc-boleto fieldset label");
		
		$("div.erroOi, div.erroOi a.fechar").live('click', function ()
		{
			$("div.erroOi").hide();
		});
		
		$(".pagamento-cartao-wrapper .aviso-erro, .pagamento-cartao-wrapper .aviso-erro a.fechar").live('click', function ()
		{
			$(".pagamento-cartao-wrapper .aviso-erro").hide();
		});
		
		$("").ajaxSuccess( function ()
		{
			if ( !$.browser.msie )
        	{
				$(".pagamento-cartao-wrapper .aviso-erro").live('mouseover', function ()
				{
					$(".pagamento-cartao-wrapper .aviso-erro p").html("Os campos marcados em vermelho apresentaram problemas no preenchimento. <a class='fechar' href='javascript:void(0);' title='Fechar'>Fechar</a>");
					$(".pagamento-cartao-wrapper .aviso-erro a.fechar").appendTo(".pagamento-cartao-wrapper .aviso-erro");
				});
				$(".pagamento-cartao-wrapper .aviso-erro p").html("Os campos marcados em vermelho apresentaram problemas no preenchimento. <a class='fechar' href='javascript:void(0);' title='Fechar'>Fechar</a>");
				$(".pagamento-cartao-wrapper .aviso-erro a.fechar").appendTo(".pagamento-cartao-wrapper .aviso-erro");
			}
			if ( $(".forma-pagamento div.debito fieldset.continuar:first input").exists() )
			{
				$(".forma-pagamento div.debito fieldset.continuar:first input").remove();
			}
			$("ul.lista-boletos p").appendTo("div.opc-boleto fieldset label");
			$("div.debito-wrapper fieldset.continuar:last").show();
			var tmp = $("ul.lista-debito label input[type=radio]:checked").offset().top;
			var tmp2 = $("ul.lista-debito").offset().top;
			var altura = (tmp - tmp2) + 80;
			$("div.debito-wrapper fieldset.continuar:last").css({ "position" : "absolute", "right" : "38px", "top" : altura });
			if ($("input#ctl00_Conteudo_ctrlFormaPagamento_rblFormaPagamentoDebito_2:checked") == false ) { $("#ctl00_Conteudo_ctrlFormaPagamento_InfoDebito").hide() }
			else { $("#ctl00_Conteudo_ctrlFormaPagamento_InfoDebito").show() }
			
		});
		
		$("iframe").attr( "scrolling", "no");
		$("iframe").parent().attr( "scrolling", "no");
		$("iframe").attr( "style", "overflow : visible; width : 600px; height : 600px;");
		$("iframe").parent().attr( "style", "overflow : visible; width : 600px; height : 600px;");
		
		if ( !$.browser.msie )
        {
			$("#ctl00_Conteudo_ctrlFormaPagamento_pMsgAvisoCartao1").remove();
		}
	};
	
	if ($("body").attr("class") == "checkout confirmacao-compra")
	{
		$("div.confirmar-pedido input.bt").hover(
			function(){ $(this).css({'background-position' : '-315px -49px'}); },
            function () { $(this).css({'background-position' : '-315px -10px' }); }
		);
	};
	
	if ($("body").attr("class") == "checkout finaliza-compra")
	{
		$(".info").insertAfter("div.print");
		$(".txtFinalizacao").appendTo(".info");
		$("p.continuar-comprando a.bt").attr({'title' : 'Voltar &agrave; P&aacute;gina Inicial'});
		$("<div style='clear: both; display: block; height: 60px; margin: 20px auto 30px auto; *padding-top: 20px; width: 468px;'><form name='formebit' method='get' target='_top' action='https://www.ebitempresa.com.br/bitrate/pesquisa1.asp'><input type=hidden name='empresa' value='18395'><input type='image' border='0' name='banner' src='https://www.ebitempresa.com.br/bitrate/banners/b18395.gif' alt='O que voc&ecirc; achou desta loja?' width='468' height='60'></form></div>").insertAfter("div.info");
		$('.content').append('<div style="width: 780px; height: auto; clear: both; margin: 40px; border: solid 1px #f1f1f1; padding: 30px;">Para maior comodidade voc&ecirc; pode agendar a entrega da sua compra. Para realizar o agendamento, ap&oacute;s finalizar a sua compra no site, entre em contato com o nosso Servi&ccedil;o de Atendimento ao Cliente de segunda a sexta das 9h &agrave;s 18h pelo fone (11) 3444-0389.<br><br><font style="font-size: 13px; font-weight: bold; color: #333;">Informa&ccedil;&otilde;es importantes</font><br><br>O agendamento quanto ao dia e per&iacute;odo de entrega (Manh&atilde;, Tarde, Noite) est&aacute; dispon&iacute;vel somente para o Estado de S&atilde;o Paulo. Trata-se de uma exig&ecirc;ncia legal conforme Lei Estadual 13.747, decreto n. 55.015, que determina que o fornecedor de bens e servi&ccedil;os dever&aacute; estipular no ato da contrata&ccedil;&atilde;o a data e turno para cumprimento de suas obriga&ccedil;&otilde;es.<br><br><ol style="line-height: 15px;"><li style="padding-left: 10px;"><b>a.</b> N&atilde;o ocorrer&aacute; entregas aos finais de semana e/ou feriados.<br></li><li style="padding-left: 10px;"><b>b.</b> O servi&ccedil;o de agendamento pode n&atilde;o est&aacute; habilitado a todos os turnos em determinadas regi&otilde;es. <br></li><li style="padding-left: 10px;"><b>c.</b> As faixas de CEP dispon&iacute;veis para entrega na modalidade agendada, s&atilde;o definidas junto aos agentes log&iacute;sticos contratados.<br></li></div>');
		
		if ( $('.print-boleto').exists() )
		{
			$('.print-boleto').prependTo('.content h2');
			$('.print-boleto').click( function ()
			{
				$(this).delay(2000).hide('slow');
				var teste = $(this).find('a').attr('href');
				$('<p class="pagto_link">Caso ainda não tenha sido realizado, <a class="pagto_a" target="_blank" href="' + teste + '">clique aqui</a> para fazer o pagamento</p>').insertAfter('p.congrats');
			});
		}
		
		if ( $('.janela-debito').exists() )
		{
			$('.janela-debito').prependTo('.content h2');
			$('.janela-debito').click( function ()
			{
				$(this).delay(2000).hide('slow');
				var teste = $(this).find('a').attr('href');
				$('<p class="pagto_link">Caso ainda não tenha sido realizado, <a class="pagto_a" target="_blank" href="' + teste + '">clique aqui</a> para fazer o pagamento</p>').insertAfter('p.congrats');
			});
		}
	};
});

$.fn.exists = function() { return $(this).length > 0 }