
// POLISHOP JavaScript
// BASE : v1.0

$(document).ready(function()
{
	if ( $.browser.msie )
	{
		$("fieldset.busca input.btn-buscar").attr( "value", "" );
	}
	
	// MENU
	
	if ($("div#menu").length != 0)
	{
		$("a#menuOffprice").appendTo("div#menu");
		$("a#menuNovidades").appendTo("div#menu");
		$("a#menuOutrosCanais").appendTo("div#menu");
		$("a#menuOffprice").css({'display' : 'block'});
		$("a#menuNovidades").css({'display' : 'block'});
		$("a#menuOutrosCanais").css({'display' : 'block'});
	}
	
	if ($("div.menuwrap").length != 0)
	{
		$("a#menuOffprice").appendTo("div.menuwrap");
		$("a#menuNovidades").appendTo("div.menuwrap");
		$("a#menuOutrosCanais").appendTo("div.menuwrap");
		$("a#menuOffprice").css({'display' : 'block'});
		$("a#menuNovidades").css({'display' : 'block'});
		$("a#menuOutrosCanais").css({'display' : 'block'});
		$("div#letreiro").insertAfter('div.menuwrap');
		//$("div.content h2").clone().appendTo("div.insert");
		$("div#dropmenu").appendTo("div.menuwrap");
	}
	
	// MENU >> Timer
	
	var timeout	= 1000;
	var closetimer	= 0;
	
	$("a#menuOutrosCanais").click( function ()
	{
		$("div#dropmenu").slideToggle();
	});
	
	$("div#menu, div.menuwrap").mouseleave( function()
	{
		setCloseTimer();
	});
	
	$("div#menu, div.menuwrap").mouseover( function()
	{
		cancelCloseTimer();
	});
	
	function openMenu ( id )
	{	
		cancelCloseTimer();
		$("div#dropmenu").stop().slideDown();
	}
	
	function closeMenu ()
	{
		$("div#dropmenu").stop().slideUp();
	}
	
	function setCloseTimer ()
	{
		closetimer = window.setTimeout( closeMenu, timeout );
	}
	
	function cancelCloseTimer ()
	{
		if ( closetimer )
		{
			window.clearTimeout( closetimer );
			closetimer = null;
		}
	}
	
	$("body").mouseover(function () {
		hideLegendas();
	});
	
	function hideLegendas () {
		$("#legendaBusca").hide();
		$("#legendaCadastro").hide();
		$("#legendaAtendimento").hide();
		$("#legendaCarrinho").hide();
	}

	$("input.campoBusca").focus(function () {
		$(this).val("");
	});
	
	$ativo = "busca";
	$motion = false;
	
	$("#botaoBusca").mouseover(function () {
		if ($motion == false) {
			hideLegendas();
			if ($ativo != "busca") {
				var pos = $("#botaoBusca").offset();
				var width = $("#botaoBusca").width();
				var height = $("#botaoBusca").height();
				$("#legendaBusca").css( { "left": (pos.left + (width/2) - 28) + "px", "top": (pos.top + height) + "px" } );
				$("#legendaBusca").show( 200 );
			}
		}
	});
	
	$("#botaoBusca").mousemove(function () {
		$("#legendaCadastro").hide();
		$("#legendaAtendimento").hide();
		$("#legendaCarrinho").hide();
	});
	
	$("#botaoBusca").click(function () {
		hideLegendas();
		$motion = true;
		$(this).hide();
		if ($ativo == "cadastro") {
			$("#boxCadastro").animate( { width:"0"}, 100, null, showBusca );
		} else if ($ativo == "atendimento") {
			$("#boxAtendimento").animate( { width:"0"}, 100, null, showBusca );
		}
		$("#televendasfone").slideDown(300);
	});
	
	function showBusca() {
		$("#boxBusca").show( 0 );
		$("#boxBusca").fadeIn( "fast" );		
		$ativo = "busca";
		botaoAtivo();
		$motion = false;
	};
	
	function motionOff() {
		$motion = false;
	};
	
	$("#botaoCadastro").hover(
		
		function ()
		{
			if ($motion == false) {
				hideLegendas();
				if ($ativo != "cadastro") {
					var pos = $("#botaoCadastro").offset();
					var width = $("#botaoCadastro").width();
					var height = $("#botaoCadastro").height();
					$("#legendaCadastro").css( { "left": (pos.left + (width/2) - 72) + "px", "top": (pos.top + height) + "px" } );
					$("#legendaCadastro").show( 200 );
					$(this).css({'background-position' : '-289px -95px'});
				} else {
					$(this).css({'background-position' : '-435px -95px'});
				}
			}
		},
	
		function ()
		{
			if ($ativo != "cadastro") {
				$(this).css({'background-position' : '-289px -10px'});
			} else {
				$(this).css({'background-position' : '-289px -95px'});
			};
		}
	);
	
	$("#botaoCadastro").mousemove(function () {
		if ($ativo != "cadastro") {
			$("#legendaBusca").hide();
			$("#legendaAtendimento").hide();
			$("#legendaCarrinho").hide();
		} else {
			$(this).css({'background-position' : '-435px -95px'});
		}
	});
	
	$("#botaoCadastro").click(function () {
		hideLegendas();
		$motion = true;
		if ($ativo == "cadastro") {
			$("#botaoBusca").hide();
			$("#boxCadastro").animate( { width:"0"}, 500, null, showBusca );
			$("#televendasfone").slideDown(300);
			return true;
		} else if ($ativo == "atendimento") {
			$("#boxCadastro").animate( { width:"200px"}, 500, null, motionOff );
			$("#boxAtendimento").animate( { width:"0"}, 500, null, motionOff );
		} else {
			$("#boxBusca").hide();
			$("#botaoBusca").show("slow");
			$("#boxCadastro").animate( { width:"200px"}, 500, null, motionOff );
		}
		$ativo = "cadastro";
		botaoAtivo();
		$("#televendasfone").slideUp(100);
	});
	
	$("#botaoAtendimento").hover(
		
		function () {
			if ($motion == false) {
				hideLegendas();
				if ($ativo != "atendimento") {
					var pos = $("#botaoAtendimento").offset();
					var width = $("#botaoAtendimento").width();
					var height = $("#botaoAtendimento").height();
					$("#legendaAtendimento").css( { "left": (pos.left + (width/2) - 72) + "px", "top": (pos.top + height) + "px" } );
					$("#legendaAtendimento").show( 200 );
					$(this).css({'background-position' : '-216px -95px'});
				} else {
					$(this).css({'background-position' : '-435px -95px'});
				}
			}
		},
	
		function () {
			if ($ativo != "atendimento") {
				$(this).css({'background-position' : '-216px -10px'});
			} else {
				$(this).css({'background-position' : '-216px -95px'});
			}
		}
	);
	
	$("#botaoAtendimento").mousemove(function () {
		if ($ativo != "atendimento") {
			$("#legendaBusca").hide();
			$("#legendaCadastro").hide();
			$("#legendaCarrinho").hide();
		} else {
			$(this).css({'background-position' : '-435px -95px'});
		}
	});
	
	$("#botaoAtendimento").click(function () {
		hideLegendas();
		$motion = true;
		if ($ativo == "atendimento") {
			$("#botaoBusca").hide();
			$("#boxAtendimento").animate( { width:"0"}, 500, null, showBusca );
			$("#televendasfone").slideDown(300);
			return true;
		} else if ($ativo == "atendimento") {
			$("#botaoAtendimento").animate( { width:"0"}, 500, null, motionOff );
			$("#televendasfone").slideDown(300);
			return true;
		} else if ($ativo == "cadastro") {
			$("#boxAtendimento").animate( { width:"320px"}, 500, null, motionOff );
			$("#boxCadastro").animate( { width:"0"}, 500 );
		} else {
			$("#boxBusca").hide();
			$("#boxAtendimento").animate( { width:"320px"}, 500, null, motionOff );
			$("#botaoBusca").show("slow");
		}
		$ativo = "atendimento";
		botaoAtivo();
		$("#televendasfone").slideUp(100);
	});
	
	$("#botaoCarrinho").hover(
		
		function () {
			if ($motion == false) {
				var pos = $("#botaoCarrinho").offset();
				var width = $("#botaoCarrinho").width();
				var height = $("#botaoCarrinho").height();
				$("#legendaCarrinho").css( { "left": (pos.left + (width/2) - 70) + "px", "top": (pos.top + height + 26) + "px" } );
				$("#legendaCarrinho").show( 200 );
			}
		},
	
		function () {
			$("#legendaCarrinho").hide();
		}
	);
	
	$("#botaoCarrinho").mousemove(function () {
		$("#legendaBusca").hide();
		$("#legendaCadastro").hide();
		$("#legendaAtendimento").hide();
	});
	
	$("#botaoCarrinho").click(function () {
		hideLegendas();
	});
	
	function botaoAtivo() {
		switch ($ativo)
		{
		case "busca":
			resetarBotoes();
			break;
		case "cadastro":
			resetarBotoes();
			$("#botaoCadastro").css({'background-position' : '-289px -95px'});
			break;
		case "atendimento":
			resetarBotoes();
			$("#botaoAtendimento").css({'background-position' : '-216px -95px'});
			break;
		default:
			resetarBotoes();
			break;
		}
	};
	
	function resetarBotoes() {
		$("#botaoCadastro").css({'background-position' : '-289px -10px'});
		$("#botaoAtendimento").css({'background-position' : '-216px -10px'});
	};
	
	$clickPais = true;
	
	$("#mudarPais").click(function () {
		if ($clickPais) {
			$("#boxPaises").css({'width' : '97px', 'background-position' : '-569px -60px'});
			$("#ARG").css({'display' : 'block'});
			$clickPais = false;
		} else {
			$("#boxPaises").css({'width' : '57px', 'background-position' : '-603px -94px'});
			$("#ARG").css({'display' : 'none'});
			$clickPais = true;
		}
	});
	
	hideLegendas();
	
	if ($("body").attr("class") == "home" || $("body").attr("class") == "busca" || $("body").attr("class") == "departamento" || $("body").attr("class") == "novidades" || $("body").attr("class") == "parceiros")
	{
		var buscaLojaCepPrefixo = $("div.localize-lojas").find("label.prefixo").html();
		$("div.localize-lojas").find("label.prefixo").empty();
		$("div.localize-lojas").find("label.prefixo").html(buscaLojaCepPrefixo.substr(17));
		
		$(".localize-lojas label.botao input").hover(
			function(){ $(this).css({'background-position' : '-441px -400px'}); },
	    	function () { $(this).css({'background-position' : '-414px -400px' }); }
		);
	};
	
});