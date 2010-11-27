function alterarConteudo(id){
	var link = 	$('#' + id).html();
	if (link == 'Alterar'){
		$('#dado' + id).removeAttr('readonly');
		$('#dado' + id).select();
		$('#dado' + id).focus();
		$('#' + id).html('Salvar');
	}
	
	if (link == 'Salvar'){
		var conteudo = $('#dado' + id).val();
		$.ajax({
			url: "gravarUnicoDado.jsp",
			type:"POST",
			data: 'idPessoaDado=' + id + '&conteudo='+conteudo,
			cache: false,
			beforeSend: function(){
				$('#linha' + id).html('<td colspan="4" align="center">Gravando o dado<br /><img src="img/load.gif" /></td>');
			},
			success: function(data){
				$('#linha' + id).html(data);
			}
		});
	}
}

function excluirDado(id){
	$.ajax({
		url: "excluirDado.jsp",
		type:"POST",
		data: 'idPessoaDado=' + id,
		cache: false,
		beforeSend: function(){
			$('#linha' + id).html('<td colspan="4" align="center">Excluindo o dado<br /><img src="img/load.gif" /></td>');
		},
		success: function(data){
			$('#linha' + id).html(data);
		}
	});
}