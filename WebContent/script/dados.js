$(function(){
	$('.mensagem').hide();
	
	$('#adicionar').click(function(){
		
		var id = $('#id').val();
		id++;
		$.get("campos.jsp?id=" + id, function(html){
			$('#campos').append(html);
		});
		
		$('#id').val(id);
	});
	
	$('#gravarDados').click(function(){
		$('.mensagem').hide();
		var url='';
		var id = $('#id').val();
		for(i=1;i <= id;i++){
			var campo = $('#campo' + i).val();
			if(campo == ''){
				$('#mensagemCampo' + i).show();
				return false;
			}
			
			var conteudo = $('#conteudo' + i).val();
			if(conteudo == ''){
				$('#mensagemConteudo' + i).show();
				return false;
			}
			if(campo != undefined)
				url += 'campo=' + campo + '&conteudo=' + conteudo + '&';
		}
		
		$.ajax({
			url:"gravarDados.jsp",
			cache:false,
			type:"POST",
			data:url,
			beforeSend:function(){
				$('#areaAjax').html("Aguarde enquanto seus dados s&atilde;o gravados<br /><img src='img/load.gif' />");
			},
			success:function(data){
				$('#areaAjax').html(data);
			}
		});
		
	});
});

function removerCampo(id, id2){
	$(id).remove();
	$(id2).remove();
}