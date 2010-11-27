
// POLISHOP JavaScript
// LOJAS : v1.0

$(document).ready(function()
{	
	if ($("body").attr("class") == "store-locator")
	{
		$("div.insert").empty();
		$("div.insert").html('<h2>Lojas</h2><span></span><h2>Resultado da Busca</h2>');
		
		if ( $('div').hasClass('resultado-loja') )
		{
			$("div.insert").empty();
			$("div.insert").html('<h2>Lojas</h2><span></span><h2>Mapa</h2>');
		}
	};
});