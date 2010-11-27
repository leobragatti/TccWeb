
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
		if ($("body").attr("class") == "offprice") {
	
		/*  DEFAULT HEADER   ---------------------------------------------------------------------------- */
		
			$('div.load').appendTo('div#header div#busca');
			$('div#login p.welcome').html('Seja bem-vindo a Polishop!');
			$('p.loginmsg em a strong').html('Clique aqui e acesse sua conta!');
	
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
			
		/*  VTEX FIX  ----------------------------------------------------------------------------------- */
			
			$('.ui-autocomplete').live( 'ready', function () { $(this).attr({ 'style' : 'z-index: 999' }); $(this).css({ 'z-index' : '999' }); });
			$('.ui-autocomplete').live( 'ready', function () { $(this).remove(); });
			$('.ui-autocomplete').live( 'load', function () { $(this).remove(); });
			$('.ui-autocomplete').live( 'change', function () { $(this).remove(); });
				
		/*  ASIDE OPT-IN  ------------------------------------------------------------------------------- */
	
			/*  Create a red block to the left  */
			
			$('body').prepend('<div class="aside-left"></div>');
			$('div.aside-left').css({ 'display' : 'block', 'top' : $('aside').offset().top, 'width' : $('aside').offset().left });
			
			/*  Auto resize function  */
			
			$(window).resize( function ()
			{
				$('div.aside-left').css({ 'width' : $('aside').offset().left });
			});
			
			/*  Insert input name blocks  */
			
			$('<span class="nome">Nome</span>').insertBefore('input.newsletter-client-name');
			$('<span class="email">E-mail</span>').insertBefore('input.newsletter-client-email');
			
			$('.newsletter-button-back').live( 'click', function ()
			{
				$('<span class="nome">Nome</span>').insertBefore('input.newsletter-client-name');
				$('<span class="email">E-mail</span>').insertBefore('input.newsletter-client-email');
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
			
			$('#photoButton').live( 'click', function ()
			{
				OpenWindow('photo');
				$('div.window').append('<img src="' + $(this).attr('rel') + '" />');
			});
			
		/*  POPUP WINDOW  ------------------------------------------------------------------------------ */
			
			$('div.cover, div.window a.close').live( 'click', function () { CloseWindow() } );
			
			$('div.window a.close').hover(
				function () { $(this).addClass('hover').css({ 'opacity' : '.5' }).animate({ 'opacity' : '1' }, 300); },
				function () { $(this).removeClass('hover').css({ 'opacity' : '.7' }).animate({ 'opacity' : '1' }, 300); }
			);
		};
	});

/*  CUSTOM FUNCTIONS ----------------------------------------------------------------------------------- */

	function Click () { void(0) };
	
	function OpenWindow ( type )
	{
		$('div.cover, div.window').css({ 'display' : 'block', 'opacity' : '0' });
		$('div.cover').animate({ 'opacity' : '1' }, 200 );
		
		if ( type == 'video' )
		{
			var windowInitMarginTop = '470px';
			var windowMarginTop = '220px';
			var windowHeight = '406px';
		}
			else
		{
			var windowInitMarginTop = '430px';
			var windowMarginTop = '180px';
			var windowHeight = '500px';
		}
		
		$('div.window').css({ 'height' : '0', 'margin-left' : '0', 'margin-top' : windowInitMarginTop, 'width' : '0' });
		$('div.window').delay(300).animate({ 'height' : windowHeight, 'margin-left' : '-325px', 'margin-top' : windowMarginTop, 'opacity' : '1', 'width' : '650px' }, 400, 'easeOutBack' );
	};
	
	function CloseWindow ()
	{
		$('div.window').hide();
		$('div.window img').remove();
		$('div.window #videoHolder').remove();
		$('div.cover').animate({ 'opacity' : '0' }, 400);
		$('div.cover').delay(400).hide(1);
	};
	