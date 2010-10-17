$(function(){
	$('.error').hide();
	
	$.ajax({
		url: "lerDigital.jsp",
		cache: false,
		beforeSend: function(){
			$('#digital').html("Fa&ccedil;a a leitura da sua digital <span id=qtde>4</span> vezes<br /><img src='img/load.gif' />");
		},
		success: function(data){
			$('#digital').html(data);
		}
	});
	
	$('#gravar').click(function(){
		$('.error').hide();
		
		var nome = $('#nome').val();
		var rg = $('#rg').val();
		var cpf = $('#cpf').val();
		var dedo = $('#dedo').val();
		
		if(nome == ''){
			$('#error_Nome').show();
			return false;
		}
		
		if(rg == ''){
			$('#error_Rg').show();
			return false;
		}
		
		if(cpf == ''){
			$('#error_Cpf').show();
			return false;
		}
		
		if(dedo == undefined){
			$('#error_Digital').show();
			return false;
		}
		
		$.ajax({
			url: "gravarPessoa.jsp",
			cache:false,
			type: "POST",
			data: 'nome=' + nome + '&rg=' + rg + '&cpf=' + cpf,
			beforeSend:function(){
				$('#areaAjax').html("Aguarde enquanto seus dados s&atilde;o gravados<br /><img src='img/load.gif' />");
			},
			success: function(data){
				$('#areaAjax').html(data);
			}
		});	
		
	});
	}
);