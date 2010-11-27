
// POLISHOP JavaScript
// SERVI‚OS : v1.0

$(document).ready(function()
{
	var checkClass  = $("body").attr("class").substring(0,11);
	
	if ( checkClass == 'sku servico' )
	{
		$('div.insert').html('<h2>PROTE&Ccedil;&Otilde;ES E GARANTIAS</h2>');
		$('div.content').prepend('<h1 class="title">Garantia F&aacute;cil</h1>');
		$('div.content').append('<div class="garantiaend"></div>');
		$('fieldset.continuar:last').appendTo('div.garantiaend');
		$('.box-garantia-extendida h3').remove();		
		$('div.content div.wrapper h2').css({ 'border-top' : 'solid 1px #dedede', 'margin-top' : '20px', 'width' : '900px' });
		
		$('fieldset.frmServicos').each( function ()
		{
			$(this).find('div.grp:not(:last) input').click( function ()
			{
				$('fieldset.continuar input').css({ 'background-position' : '0 -150px', 'height' : '38px', width : '222px' });
				$('fieldset.continuar input').hover(
					function () { $(this).css('background-position', '0 -189px') },
					function () { $(this).css('background-position', '0 -150px') }
				);
				
				$(this).parent().parent().parent().parent().parent().append('<button class="regulamento" type="button">Leia o Regulamento</button>');
				var thisID = $(this).attr('name').substring(0,$(this).attr('name').indexOf('@'));
				$(this).parent().parent().parent().parent().parent().find('button.regulamento').addClass(thisID.substring(0,3));
			});
		});
		
		$('fieldset.frmServicos').each( function ()
		{			
			$(this).find('div.grp:first').find('input').each( function ()
			{
				var seloID = $(this).attr('name').substring(0,$(this).attr('name').indexOf('@'));
				
				if ( seloID.substring(0,3) == 'Pro' )
				{
					$(this).parent().parent().parent().parent().parent().parent().prepend('<div class="resumo-facil">6 meses de prote&ccedil;&atilde;o contra danos acidentais ao produto e problemas n&atilde;o cobertos pela garantia do fabricante.</div>');
					$(this).parent().parent().parent().parent().parent().parent().prepend('<div class="logo-protecao-facil"></div>');
				}
					else
				{
					$(this).parent().parent().parent().parent().parent().parent().prepend('<div class="resumo-facil">Garante o produto contra defeitos el&eacute;tricos, eletr&ocirc;nicos e mec&acirc;nicos ap&oacute;s a garantia do fabricante.</div>');
					$(this).parent().parent().parent().parent().parent().parent().prepend('<div class="logo-garantia-facil"></div>');
				}
			});
		});
		
		$('fieldset.frmServicos').each( function ()
		{
			$(this).find('div.grp:last input').click( function ()
			{
				if ( !$('fieldset.frmServicos').find('div.grp:not(:last) input:checked').val() )
				{
					$('fieldset.continuar input').css({ 'background-position' : '0 -228px', 'height' : '38px', width : '222px' });
					$('fieldset.continuar input').hover(
						function () { $(this).css('background-position', '0 -267px') },
						function () { $(this).css('background-position', '0 -228px') }
					);
				};
				$(this).parent().parent().parent().parent().parent().find('button.regulamento').remove();
			});
		});
		
		$('button.regulamento').live( 'click', function ()
		{
			$('.servico').prepend('<div class="painelnegro"></div>');
			$('.servico').prepend('<div class="boxregulamento"><h4 class="titulo">Regulamento</h4><div class="texto"></div><a class="closebutton" href="javascript:void(0);"></a></div>');
			
			if ( $(this).hasClass('Pro') )
			{
				$('.boxregulamento .texto').load('http://www2.polishop.com.br/flv/protecaofacil-regulamento.html');
			}
				else
			{
				$('.boxregulamento .texto').load('http://www2.polishop.com.br/flv/garantiafacil-regulamento.html');
			}
			$('.painelnegro, .boxregulamento').css({ 'opacity' : '0' });
			$('.painelnegro').animate({ 'opacity' : '.6' }, 'fast');
			$('.boxregulamento').animate({ 'opacity' : '1' }, 'slow');
		});
		
		$('.painelnegro, .closebutton').live( 'click', function ()
		{
			$('.painelnegro, .boxregulamento').remove();
		});
	};
});

$.fn.exists = function() { return $(this).length > 0 }