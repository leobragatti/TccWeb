$(function(){
	tratarMenu();
});

function tratarMenu(){
	var logado = $('#logado').val();
	if(logado == 1){
		$('#sair').show();
		$('#visualizar').show();
		$('#dados').show();
		$('#cadastro').hide();
		$('#autenticar').hide();
	}
	else{
		$('#sair').hide();
		$('#visualizar').hide();
		$('#dados').hide();
		$('#cadastro').show();
		$('#autenticar').show();
	}
}

function abrirPagina(link) {
	if (link.id == 'home'){
		$('#areaAjax').html('<p>P&aacute;gina inicial</p>');
	}
	
    if (link.id == 'cadastro')
    {
		$.ajax({
		   url: 'cadastro.jsp',
		   cache:false,
		   success: function(data){
			$('#areaAjax').html(data)
			.hide()
			.fadeIn(500);
		   }
		});
    }
    
    if (link.id == 'autenticar')
    {
		$.ajax({
		   url: 'autenticar.jsp',
		   cache:false,
		   success: function(data){
			$('#areaAjax').html(data).hide().fadeIn(500);
		   }
		});
    }
    
    if (link.id == 'dados')
    {
		$.ajax({
		   url: 'dados.jsp',
		   cache: false,
		   success: function(data){
			$('#areaAjax').html(data)
			.hide()
			.fadeIn(500);
		   }
		});
    }
    
    if(link.id == 'visualizar'){
    	$.ajax({
 		   url: 'visualizar.jsp',
 		   cache: false,
 		   beforeSend: function(){
    			$('#areaAjax').html('Aguarde enquanto seus dados são carregados<img src="img/load.gif" />');
    	   },
 		   success: function(data){
 			$('#areaAjax').html(data)
 			.hide()
 			.fadeIn(500);
 		   }
 		});
    }
    
    if (link.id == 'sair')
    {
		$.ajax({
		   url: 'logout.jsp',
		   cache:false,
		   success: function(data){
				$('#areaAjax').html(data).hide().fadeIn(500);
				$('#logado').val('0');
				tratarMenu();
		   }
		});
    }
    
    return true;
}