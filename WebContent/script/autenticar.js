$(function(){
	$('.error').hide();
		
	$('#validar').click(function(){		
		$('.error').hide();
		
		var filtro = $('#filtro').val();
		var opcao = $('#opcao').val();
		
		if(filtro == ''){
			$('#error_Filtro').show();
			return false;
		}
		
		$.ajax({
			url: "/TccWeb/login.jsp",
			cache:false,
			type:"POST",
			data:opcao + '=' + filtro,
			beforeSend:function(){
				$('#areaAjax').html('Fa&ccedil;a a leitura de sua digital<br /><img src="img/load.gif" />');
			},
			success: function(data){
				$('#areaAjax').html(data);
			}
		});
	});
});