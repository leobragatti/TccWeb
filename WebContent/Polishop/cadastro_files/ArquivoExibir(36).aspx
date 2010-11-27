
// POLISHOP JavaScript
// PRODUTO : v1.0

$(document).ready(function()
{
	if ($("body").attr("class") == "sku")
	{
		var url = location.href;
    var baseURL = url.substring(0, url.indexOf('/', 14));
    var changedLists = 0;
		
		var PrimaImg = $("#botaoZoom:first").attr( "rel" );
		$("div#image img").attr( "src", PrimaImg );
		
		//$.browser.msie - $.browser.mozilla - $.browser.safari - $.browser.chrome
		
		 if ( $.browser.msie )
		{
			$("#info .top .tabs p:first").remove();
			//$("buy-button").css({'display' : 'block' });
            $("#vejatambem").insertAfter("#info");
            $("#meuhistorico").insertAfter("#vejatambem");
            
            if ( $("h4.VideoProduto").exists() )
            {
            	$("ul.thumbs li").css({'margin-top' : '-5px' });
            }
		}
		
		var  is_chrome = navigator.userAgent.toLowerCase().indexOf('chrome') > -1;
		
		if ( $.browser.safari || is_chrome )
		{
			$("a#Tags").css({ "margin" : "0 0 0 -20px", "border" : "none" });
			$("a#Tags").parent().css({ "border" : "none" });
		}
		
		$(".colecaoVT h2:first").remove();
		$(".colecaoVT ul li:even").remove();
		$(".colecaoVT ul li p.departamento").remove();
		$(".colecaoVT ul li").each( function () 
		{
			$(this).find("div.rating-produto").prependTo($(this).find("p.preco"));
			$(this).find("h2").prependTo($(this).find("p.preco"));
			$(this).find("h3").prependTo($(this).find("p.preco"));
		});
		
		$(".colecaoVT").easySlider({
			auto: true,
			speed: 400,
			pause: 7000,
			controlsBefore:	'<p id="controls">',
			controlsAfter:	'</p>',
			continuous: true 
		});
		
		$(document).change( function ()
		{
			organizarThumbs();
		});
		
		$("h4.Itens-Inclusos").appendTo("div.Itens");
		$("th.Itens-Inclusos").parent().parent().parent().appendTo("div.Itens");
		$(".sku #produto #info .Tags #tags p:first").css({ "margin-bottom" : "12px" });
		$(".sku #produto #info .Tags #tags").find("[title=Topo]").remove();
		
		$(".sku #produto #info .Tecnicos table th").append(":");
		$("h4.Dados-Tecnicos").next("table").find("th:last").css({ "border-bottom" : "none" });
		$("h4.Dados-Tecnicos").next("table").find("td:last").css({ "border-bottom" : "none" });
		
		$(".sku #produto #info .Itens table th").append(":");
		$(".sku #produto #info .Itens table th:last").css({ "border-bottom" : "none" });
		$(".sku #produto #info .Itens table td:last").css({ "border-bottom" : "none" });
		
		$("div.brandName").appendTo("#image");
		$("div.categoryName").appendTo("div#letreiro h2");
		
		$(".sku #lnkPubliqueResenha").remove();
		$(".sku .ver-todos-comentarios span a.thickbox").remove();
		
		$("#calculoFrete").appendTo("body");
		
		if( $("h4.VideoProduto").length > 0 )
		{
			var youtubecode = $("td.VideoProduto").text();
			$("ul.thumbs").parent().append('<a id="botaoVideo" href="javascript:void(0);" title="V&iacute;deo" rel="' + youtubecode + '">V&iacute;deo</a>');
			$("ul.thumbs").css({ "margin" : "10px 0 40px 0" });
			$("h4.VideoProduto").remove();
			$("th.VideoProduto").parent().parent().parent().remove();
		};
		
		$("#divCompreJunto").remove();
		$("#crossupsell").remove();
		
		$(".see-other-payment-method-link").text("(veja mais)");
		$(".other-payment-method span").addClass("texto");
		$(".see-other-payment-method-link").insertBefore(".other-payment-method select");
		$(".other-payment-method").prepend("<span class='bullet'></span>");
		$("#CalculoDeFrete").prepend("<span class='bullet'></span>");
		
		if ($("#produto #info .Tags #tags a:last").attr("class") == "")
		{
			$("<span class='bullet'></span>").insertBefore("#produto #info .Tags #tags a:last");
			//$("#produto #info .Tags #tags a:last").css({"color" : "inherit", "font-weight" : "bold", "margin-top" : "20px"});
		};
		$("div.Tags").insertAfter("div.Opiniao");
		$("div.avalie-produto h5").html("Avalie este produto");
		
		$("ul.thumbs a").click( function ()
		{
			ZerarThumbs();
			var ID = $(this).attr("id");
			var pos = $(this).offset();
			var holder = $("#produto").offset();
			$(this).addClass("ON");
			$("div#setaThumbs").css({'left' : (pos.left - holder.left + 30) + 'px'});
			
			if (ID == "botaoVideo" || ID == "botao360" || ID == "botaoExplore") {
				//$("#show #include #image").css({'display' : 'none'});
				//$("#show #include #special").css({'display' : 'block'});
				//loadInclude( ID, $(this).attr("rel") );
			} else {
				$("#videoHolder").empty();
				$("#videoHolder").remove();
				var marca = $("div.brandName").css("display");
				var isto = $(this).attr("rel");
				var primeiroThumb = $("#botaoZoom:first").attr("rel");
				if ( ID == "botaoZoom" && isto == primeiroThumb  )
				{
					if ( marca == "none" ) { $("div.brandName").css({ "display" : "block" }) };
				}
					else
				{
					if ( marca != "none" ) { $("div.brandName").css({ "display" : "none" }) };
				}
				$("#show #include #special").css({'display' : 'none'});
				$("div#setaThumbs").animate({ 'top': '511px' }, 300 );
				$("#show #include").animate({ 'height': '500px' }, 300 );
				$("#show #botaoVideo").animate({ 'top': '517px' }, 300 );
				
				$('#show #include #image').css({ 'display' : 'block' });
				var picRel = $(this).attr('rel');
				var picAlt = $('#show #include #image img').attr('alt');
				$('#show #include #image img').replaceWith('<img src="' + picRel + '" alt="' + picAlt + '" style="opacity: 0;">');
				$('#show #include #image img').animate({ 'opacity': '1' }, 300 );
			}
		});
		
		$("#botaoVideo").live( 'click', function ()
		{
			ZerarThumbs();
			var ID = $(this).attr("id");
			var pos = $(this).offset();
			var holder = $("#produto").offset();
			$(this).addClass("ON");
			$("div#setaThumbs").css({'left' : (pos.left - holder.left + 30) + 'px'});
			$("#show #include #image").css({'display' : 'none'});
			
			//$("#show #include #special").css({'display' : 'block'});
			//loadInclude( ID, $(this).attr("rel") );
			
			$('#show #include').append('<div id="videoHolder" style="display: block; height: 406px; width: 650px;"><div id="videoInclude"></div></div>');
			$('div#setaThumbs').animate({ 'top': '417px' }, 300 );
			$('#show #include').animate({ 'height': '406px' }, 300 );
			$("#show #botaoVideo").animate({ 'top' : '423px' }, 300);
			
			var flashvars = {};
			flashvars.ID = $(this).attr('rel');
			var params = { menu: 'false', allowScriptAccess: 'always', allowFullScreen: 'true', scale: 'noscale' };
			var attributes = { id: 'youtubeplayer' };

			swfobject.embedSWF('/Control/ArquivoExibir.aspx?NomeArquivo=produtoVideoPlayer.swf', 'videoInclude', '650', '406', '9.0.0', '/Control/ArquivoExibir.aspx?NomeArquivo=expressinstall.swf', flashvars, params, attributes);

			SWFID = 'youtubeplayer';
		});
		
		$("#compartilhe").appendTo("div.Descricao");
		
		$("ul.tabs a").click( function ()
		{
			ZerarTopicos();
			var ID = $(this).attr("id");
			$(this).addClass("ON");
			$("#product-content div").css({'display' : 'none'});
			
			if (ID != "Tags") { $("#compartilhe").appendTo("div." + ID); }
			
			$("div." + ID).css({'display' : 'block'});
			$("div." + ID + " div").css({'display' : 'block'});
			$("div." + ID).css({'opacity' : '0'});
			$("div." + ID).animate({ opacity: 1 }, 500 );
			
			if (ID == "Descricao") {
				$("div#setaAbas").css({'margin' : '-1px 0 0 40px'});
			} else if (ID == "Tecnicos") {
				$("div#setaAbas").css({'margin' : '-1px 0 0 144px'});
			} else if (ID == "Itens") {
				$("div#setaAbas").css({'margin' : '-1px 0 0 257px'});
			} else if (ID == "Opiniao") {
				$("div#setaAbas").css({'margin' : '-1px 0 0 382px'});
			} else if (ID == "Tags") {
				$("div#setaAbas").css({'margin' : '-1px 0 0 484px'});
			}
		});
		
		$("a#fontSizeUp").click(function () {
			ChangeFontSize( $(this) );
		});
		
		$("a#fontSizeDown").click(function () {
			ChangeFontSize( $(this) );
		});
		
		$("ul.tabs a#Opiniao").click( function ()
		{
			$("fieldset#opcoes-avalie label:eq(0)").css({ "background-position" : "-10px -618px" });
			$("fieldset#opcoes-avalie label:eq(1)").css({ "background-position" : "-10px -649px", "width" : "206px" });
			$("fieldset#opcoes-avalie label:eq(2)").css({ "background-position" : "-10px -680px", "width" : "226px" });
		});
		
		$("fieldset#opcoes-avalie").find("label:eq(0)").css({ "background-position" : "-10px -618px" });
		
		$("fieldset#opcoes-avalie").find("label:eq(1)").css({ "background-position" : "-10px -649px", "width" : "206px" });
		
		$("fieldset#opcoes-avalie").find("label:eq(2)").css({ "background-position" : "-10px -680px", "width" : "226px" });
		
		$("div.topico").each( function () 
		{
			if ( $(this).html() == "" )
			{
				$(this).remove();
			};
		});
		
		organizarThumbs();
		
		var myTimer = {};
		myTimer = $.timer( 10,function() { organizarThumbs(); selectFirstImageThumb(); });
		
		$("<div class='botaoParcelamento'></div>").insertBefore(".other-payment-method-ul");
		$(".other-payment-method-ul li:first").clone().appendTo(".botaoParcelamento");
		$(".botaoParcelamento").append("<a href='javascript:void(0);'><font>VEJA</font><b>+</b></a> ");
		var tamanhoParcelamento = $(".other-payment-method-ul").height();
		$(".other-payment-method-ul").css({ "height" : "0" });
		$(".other-payment-method-ul li:first").remove();
		
		$(".botaoParcelamento").click( function ()
		{
			
			if ( $(".other-payment-method-ul").css("display") != "block" )
			{
				$(".other-payment-method-ul").css({ "display" : "block" });
				$(".other-payment-method-ul").css({ "height" : "0" });
				$(".other-payment-method-ul").animate({ "height" : tamanhoParcelamento + "px" },"fast");
				$(this).find("a").find("b").text("-");
			} 
				else
			{
				$(".other-payment-method-ul").css({ "display" : "none" });
				$(this).find("a").find("b").text("+");
			}
		});
	
		if ( $(".garantia-extendida").length > 0 )
		{
			$("#header #login").remove();
			$("div.insert h2").html("SERVI&Ccedil;OS");
			$(".garantia-extendida input.fisubmit:first").remove();
			$(".garantia-extendida .wrapper").prepend("<div class='title'><h1 class='title'>Garantia Estendida</h1><span></span></div>");
			$(".garantia-extendida .wrapper h2:first").prependTo(".box-info");
			$(".garantia-extendida fieldset.continuar").appendTo(".box-info");
			$(".box-garantia-extendida h3").appendTo(".garantia-extendida .wrapper div.title span");
			$(".box-garantia-extendida a.more").appendTo(".garantia-extendida .wrapper div.title span");
			$(".box-image img").css({ "height" : "250px" });
			$("#busca .botao").css({ "float" : "right", "border" : "none", "margin-top" : "-19px" });
			$("#busca .campoBusca").css({ "display" : "inline-block", "float" : "left", "width" : "270px", "margin-top" : "-15px", "background" : "transparent" });
		};
		
		$(".sku-selector").change( function () 
		{
			organizarThumbs();
		});
		
		$("document").load( function () 
		{
			organizarThumbs();
		});
		
		 shareLinks();
		
		$("div#image img").attr( "src", PrimaImg );
		
		$('.giftlistinsertsku').insertAfter('.add_list h6');
		$('.giftlistinsertsku-message').insertAfter('.add_list .giftlistinsertsku');
		
		$('a#buttonAddToList').click( function ()
		{
			$('div.add_list').show();
			$('div.add_list').css({ 'opacity' : '0' });
			$('div.add_list').animate({ 'opacity' : '1' }, 500);
			var left = $(this).offset().left - 20;
			var top = $(this).offset().top - 20;
			$('div.add_list').css({ 'left' : left + 'px', 'top' : top + 'px' });
			if (changedLists != 1)
			{
				$('li.Lista-de-Casamento a').each( function ()
				{
					$(this).text($(this).text().substr(18));
				});
			};
			changedLists = 1;
		});
		
		$('a#closeListWindow').click( function ()
		{
			$('div.add_list').hide();
		});
		
		if ( $('ul.Voltagem').find('select').exists() ) { $('ul.Voltagem').parent().show(); } else { $('ul.Voltagem').parent().hide(); }
				
	};
});

$.fn.exists = function() { return $(this).length > 0 }

jQuery.timer = function(time,func,callback){
	var a = {timer:setTimeout(func,time),callback:null}
	if(typeof(callback) == 'function'){a.callback = callback;}
	return a;
};

function shareLinks ()
{
	var url = window.location.href;
	var title = $("div.productName").html() + " - " + $("div.productDescriptionShort").html() + " Aqui na Polishop!";
	var shortUrl = window.location.href;
	var twitter = "Olha o que eu vi na Polishop: " + shortUrl;
	$("a.delicious").attr( "href", "http://del.icio.us/post?url=" + url + "&title=" + title );
	$("a.twitter").parent().remove(); //$("a.twitter").attr( "href", "http://twitter.com/home?status=" + twitter );
	$("a.facebook").attr( "href", "http://www.facebook.com/share.php?u=" + url );
	$("a.technorati").attr( "href", "http://technorati.com/cosmos/search.html?url=" + url );
	$("a.stumbleupon").attr( "href", "http://www.stumbleupon.com/submit?url=" + url + "&title=" + title );
	$("a.digg").attr( "href", "http://digg.com/submit?phase=2&url=" + url );
	$("a.reddit").attr( "href", "http://reddit.com/submit?url=" + url + "&title=" + title );
	$("a.myspace").attr( "href", "http://www.myspace.com/Modules/PostTo/Pages/default.aspx?u=" + url );
}

function formataParcelamento ()
{
	var url = location.href;
    var baseURL = url.substring(0, url.indexOf('/', 14));
    
    $(".see-other-payment-method-link").text("(veja mais)");
	$(".other-payment-method span").addClass("texto");
	$(".see-other-payment-method-link").insertBefore(".other-payment-method select");
	$(".other-payment-method").prepend("<span class='bullet'></span>");
			
	$("<div class='botaoParcelamento'></div>").insertBefore(".other-payment-method-ul");
	$(".other-payment-method-ul li:first").clone().appendTo(".botaoParcelamento");
	$(".botaoParcelamento").append("<a href='javascript:void(0);'><font>VEJA</font><b>+</b></a> ");
	var tamanhoParcelamento = $(".other-payment-method-ul").height();
	$(".other-payment-method-ul").css({ "height" : "0" });
	$(".other-payment-method-ul li:first").remove();
	
	$(".other-payment-method span.bullet").css({ "display" : "inline-block", "background-image" : "url(" + baseURL + "/Control/ArquivoExibir.aspx?NomeArquivo=produto.gif')", "background-position" : "-256px -193px", "width" : "21px", "height" : "18px", "margin" : "5px 7px 0 7px" });
	$(".other-payment-method-ul").css({ "clear" : "both", "color" : "#62ad00", "display" : "none", "font-size" : "13px", "margin" : "0 0 0 35px" });
	$(".other-payment-method-ul li").css({ "clear" : "both", "display" : "block", "float" : "left", "padding-bottom" : "3px" });
	$(".sku #produto .botaoParcelamento").css({ "color" : "#62ad00", "cursor" : "pointer", "display" : "block", "font-size" : "13px", "margin" : "-10px 0 0 30px", "padding" : "5px" });
	$(".sku #produto .botaoParcelamento a").css({ "color" : "#ff0101", "display" : "inline-block", "font-size" : "11px", "font-family": "'Trebuchet MS', Arial, Helvetica, sans-serif", "text-decoration" : "none", "margin-left" : "10px", "padding" : "3px" });
	$(".sku #produto .botaoParcelamento a b").css({ "display" : "inline-block", "font-size" : "14px", "font-weight" : "bold", "margin" : "0 0 0 3px" });
	
}

function ZerarTopicos ()
{	
	$("div#product-content div").css({'display' : 'none'});
	$("ul.tabs a").removeClass("ON");
};

function ZerarThumbs ()
{
	$("ul.thumbs a").removeClass();
	$("#botaoVideo").removeClass("ON");
};

function selectFirstImageThumb ()
{
	ZerarThumbs();
	$("a#botaoZoom:first").addClass("ON");
	$("#botaoVideo").removeClass("ON");
		
	var setaPos = $("a#botaoZoom:first").offset().left;
	var setaHolder = $("#produto").offset().left;
	var setaCalculo = (parseInt(setaPos) - parseInt(setaHolder)) + 30;
	$("div#setaThumbs").css({ "left" : setaCalculo + "px" });
	
	var PrimaImg = $("#botaoZoom:first").attr( "rel" );
	$("div#image img").attr( "src", PrimaImg );
};

function organizarThumbs ()
{
	var thumbsQtd = $("ul.thumbs li").length;
	var testeNum = 0;
		
	if ( thumbsQtd < 8 )
	{
		var testeNum = (8 - thumbsQtd) * 40;
		if ( $("#botaoVideo").exists() )
		{
			testeNum = testeNum + 36;
		};
		$("ul.thumbs").css({ "margin-left" : testeNum + "px" });
	};
		
	if ( $("ul.thumbs li a:eq(1)").length > 0 ) { $("ul.thumbs li a:eq(1)").css({ "left" : (080 + testeNum) + "px" }); }
	if ( $("ul.thumbs li a:eq(2)").length > 0 ) { $("ul.thumbs li a:eq(2)").css({ "left" : (160 + testeNum) + "px" }); }
	if ( $("ul.thumbs li a:eq(3)").length > 0 ) { $("ul.thumbs li a:eq(3)").css({ "left" : (240 + testeNum) + "px" }); }
	if ( $("ul.thumbs li a:eq(4)").length > 0 ) { $("ul.thumbs li a:eq(4)").css({ "left" : (320 + testeNum) + "px" }); }
	if ( $("ul.thumbs li a:eq(5)").length > 0 ) { $("ul.thumbs li a:eq(5)").css({ "left" : (400 + testeNum) + "px" }); }
	if ( $("ul.thumbs li a:eq(6)").length > 0 ) { $("ul.thumbs li a:eq(6)").css({ "left" : (480 + testeNum) + "px" }); }
	if ( $("ul.thumbs li a:eq(7)").length > 0 ) { $("ul.thumbs li a:eq(7)").css({ "left" : (560 + testeNum) + "px" }); }
	
	if ( $("#botaoVideo").exists() )
	{
		$("#botaoVideo").css({ "left" : (testeNum - 81) + "px" });
	};
};

function loadInclude ( ID, REL )
{
	var url = location.href;
    var baseURL = url.substring(0, url.indexOf('/', 8));
    var videoREL = $("#botaoVideo").attr("rel");
    
    var videoHTML = '<div id="video"><script type="text/javascript">var flashvars = {}; flashvars.ID = "'+videoREL+'"; var params = { menu: "false", allowScriptAccess: "always", allowFullScreen: "true", scale: "noscale" }; var attributes = { id: "youtubeplayer" }; swfobject.embedSWF("'+baseURL+'/Control/ArquivoExibir.aspx?NomeArquivo=produtoVideoPlayer.swf", "flashVideo", "650", "406", "9.0.0", "'+baseURL+'/Control/ArquivoExibir.aspx?NomeArquivo=expressinstall.swf", flashvars, params, attributes); SWFID = "youtubeplayer";</script><div id="flashVideo"><p style="margin: 150px 0 0 250px"><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" /></a></p></div></div>';
    
    switch ( ID )
	{
		case "botaoVideo" : $("div#setaThumbs").animate({ 'top': '417px' }, 300 ); 
							$("#show #include").animate({ 'height': '406px' }, 300 );
							$("#show #botaoVideo").animate({ 'top' : '423px' }, 300);
							$("#show #include #special").html(videoHTML);
							break;
							
		case "botao360" :   $("div#setaThumbs").animate({ 'top': '511px' }, 300 );
							$("#show #include").animate({ 'height': '500px' }, 300 );
							$("#show #include #special").load(REL);
							break;
							
		case "botaoExplore" :   $("div#setaThumbs").animate({ 'top': '511px' }, 300 );
								$("#show #include").animate({ 'height': '500px' }, 300 );
								$("#show #include #special").load(REL);
								break;
	}
};

function ChangeFontSize ( BOTAO )
{
	var tamanho = $("div#product-content").css("font-size");
	var entrelinha = $("div#product-content").css("line-height");
	tamanho = tamanho.split("px");
	tamanho = parseFloat(tamanho[0]);
	entrelinha = entrelinha.split("px");
	entrelinha = parseFloat(entrelinha[0]);
	
	if ( BOTAO.attr("id") == 'fontSizeUp' ) {
		if (tamanho < 17 ) {
			tamanho = tamanho + 2;
			entrelinha = entrelinha + 2;
		}
	} else {
		if (tamanho > 12 ) {
			tamanho = tamanho - 2;
			entrelinha = entrelinha - 2;
		}
	}
	
	$("div#product-content").css({'font-size' : tamanho + 'px'});
	$("div#product-content").css({'line-height' : entrelinha + 'px'});
	
	if (tamanho == 17 || tamanho == 11 ) {
		BOTAO.addClass("OFF");
	}
	if (tamanho > 11) {
		$("a#fontSizeDown").removeClass("OFF");
	}
	if (tamanho < 17) {
		$("a#fontSizeUp").removeClass("OFF");
	}
};
		
function AjudaPorTelefone ()
{
	var nomeProd = $("div.options div.nome div.productName").text();
	window.open('http://comercio.polishop.com.br/is-bin/INTERSHOP.enfinity/eCS/Store/pt/-/BRC/chuck_Produto-Duvidas?nomeProduto=' + nomeProd,'duvidas','width=400,height=370,top=50,left=50');
	void(0);
}
