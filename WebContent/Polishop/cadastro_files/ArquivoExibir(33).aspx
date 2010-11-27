
/*  =====================================================================
	
		User Interface by JOGA Labs (Brazil)
		http://www.jogalabs.com
		
		Copyright 2010 - JOGA Labs.
		You cannot modify, rewrite, sell or distribute it in any way.
		You'll be stealing our work, and this is crime (and a shame).
	
	=====================================================================  */
	
/*  ON READY -------------------------------------------------------------------------------------------- */
	
	$( function ()
	{
	
		/*  IE FIX  ------------------------------------------------------------------------------------- */
	
			/*  Fix the bottom width  */
			
			if ( $.browser.msie )
			{
				$('footer').css({ 'width' : $('body').width() });
				
				$(window).resize( function ()
				{
					$('footer').css({ 'width' : $('body').width() });
				});
				
				if ( $.browser.version.substr(0,1) < 7 )
				{
					$('body').supersleight();
				};
			}
			
			$('#agree').click( function ()
			{
				$('div.alert').hide();
				$('div.cover').animate({ 'opacity' : '0' }, 400);
				$('div.cover').delay(400).hide('fast');		
			});

			
		/*  DESTAQUE  ----------------------------------------------------------------------------------- */
			
			$('#videoButton').click( function ()
			{
				OpenWindow('video');
				$('div.window').append('<div id="videoHolder" style="display: block; height: 406px; width: 650px; z-index: 115;"><div id="videoInclude"></div></div>');
				
				/* Load Flash Video from YouTube  */
				
				var flashvars = {};
				flashvars.ID = $(this).attr('rel');
				var params = { menu: 'false', allowScriptAccess: 'always', allowFullScreen: 'true', scale: 'noscale' };
				var attributes = { id: 'youtubeplayer' };

				swfobject.embedSWF('http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=produtoVideoPlayer.swf', 'videoInclude', '650', '406', '9.0.0', 'http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=expressinstall.swf', flashvars, params, attributes);

				SWFID = 'youtubeplayer';
			});
			
			if ( $('#loopedSlider').exists() )
			{
				$.fn.loopedSlider.defaults.addPagination = true;
				$('#loopedSlider').loopedSlider();
			}
		
			$('#descricao').click(function()
			{
				height = $('div.conteudo .descricao').css('height');
				$('div.conteudo').animate({ 'left' : '0', 'height' : height });
				$('div.produto_info').animate({ 'height' : height });
				$('ul.tabs a').removeClass('active');
				$('ul.tabs a#descricao').addClass('active');
			});
			
			$('#dadostecnicos').click(function()
			{
				height = $('div.conteudo .dadostecnicos').css('height');
				$('div.conteudo').animate({ 'left' : '-940px', 'height' : height });
				$('div.produto_info').animate({ 'height' : height });
				$('ul.tabs a').removeClass('active');
				$('ul.tabs a#dadostecnicos').addClass('active');
			});
			
			$('#itensinclusos').click(function()
			{
				height = $('div.conteudo .itensinclusos').css('height');
				$('div.conteudo').animate({ 'left' : '-1880px', 'height' : height });
				$('div.produto_info').animate({ 'height' : height });
				$('ul.tabs a').removeClass('active');
				$('ul.tabs a#itensinclusos').addClass('active');
			});
			
		/*  POPUP WINDOW  ------------------------------------------------------------------------------ */
			
			$('div.cover, div.window a.close').live( 'click', function () { CloseWindow() } );
			
			$('div.window a.close').hover(
				function () { $(this).addClass('hover').css({ 'opacity' : '.5' }).animate({ 'opacity' : '1' }, 300); },
				function () { $(this).removeClass('hover').css({ 'opacity' : '.7' }).animate({ 'opacity' : '1' }, 300); }
			);
		
	});

/*  CUSTOM FUNCTIONS ----------------------------------------------------------------------------------- */

	function Click () { void(0) };
	
	$.fn.exists = function() { return $(this).length > 0 }
	
	function OpenWindow ( type )
	{
		$('div.cover, div.window').css({ 'display' : 'block', 'opacity' : '0' });
		$('div.cover').animate({ 'opacity' : '.5' }, 200 );
		
		if ( type == 'video' )
		{
			var windowInitMarginTop = '470px';
			var windowHeight = '406px';
			var windowMarginTop = ($(window).height() / 2) - (406/2);
		}
			else
		{
			var windowInitMarginTop = '430px';
			var windowMarginTop = '180px';
			var windowHeight = '500px';
		}
		
		$('div.window').css({ 'height' : '0', 'margin-left' : '0', 'margin-top' : windowInitMarginTop, 'width' : '0' });
		$('div.window').delay(300).animate({ 'height' : windowHeight, 'margin-left' : '-325px', 'margin-top' : windowMarginTop.toString() + 'px', 'opacity' : '1', 'width' : '650px' }, 400, 'easeOutBack' );
		
		$(window).resize( function ()
		{
			var newMarginTop = ($(window).height() / 2) - (406/2);
			$('div.window').css({ 'margin-top' : newMarginTop.toString() + 'px' });
		});
	};
	
	function CloseWindow ()
	{
		$('div.window').hide();
		$('div.window img').remove();
		$('div.window #videoHolder').remove();
		$('div.cover').animate({ 'opacity' : '0' }, 400);
		$('div.cover').delay(400).hide(100);
	};
	