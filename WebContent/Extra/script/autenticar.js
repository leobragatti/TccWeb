$(function(){
	$('.error').hide();
	$('#areaCertificado').hide();
	
	$('#validar').click(function(){		
		$('.error').hide();
		
		var filtro = $('#filtro').val();
		var certificado = $('#certificado').val();
		var senha = $('#senha').val();
		var opcao = $('#opcao').val();
		var url;
		var data;
		var mensagem;
		
		if (opcao == 'cert'){
			if(certificado == ''){
				$('#error_Certificado').show();
				return false;
			}
			if(senha == ''){
				$('#error_Senha').show();
				return false;
			}
			url = '/TccWeb/loginCertificado.jsp';
			data = 'certificado=' + certificado + '&senha=' + senha;
			mensagem = 'Realizando a valida&ccedil;&atilde;o';
		}
		else{
			if(filtro == ''){
				$('#error_Filtro').show();
				return false;
			}
			url = '/TccWeb/login.jsp';
			data = opcao + '=' + filtro;
			mensagem = 'Fa&ccedil;a a leitura de sua digital';
		}
		
		$.ajax({
			url: url,
			cache:false,
			type:"POST",
			data:data,
			beforeSend:function(){
				$('#areaAjax').html(mensagem + '<br /><img src="img/load.gif" />');
			},
			success: function(data){
				$('#areaAjax').html(data);
				$('#logado').val('1');
				tratarMenu();
			}
		});
	});
});

function retornarOpcao(opcao){
	if(opcao == 'cert'){
		$('#areaCertificado').show();
		$('#filtro').hide();
	}
	else{
		$('#areaCertificado').hide();
		$('#filtro').show();
	}
}