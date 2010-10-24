<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript" src="script/dados.js"></script>
<input type="submit" id="adicionar" value="Adicionar">
<table id="campos">
	<tr id="row1">
		<td valign="center" width="120">
			Campo:
		</td>
		<td valign="center" width="120">
			Conte&uacute;do:
		</td>
		<td valign="center"" rowspan="2">
			<input type="submit" id="remover1" value="Remover" onclick='removerCampo("#row1", "#row11"); return false;' >
		</td>
	</tr>

	<tr id="row11">
		<td width="120">
			<input type="text" id="campo1" /><br/><label for="conteudo1" id="mensagemCampo1" class="mensagem">Preenchimento obrigat&oacute;rio</label>
		</td>
		<td width="120">
			<input type="text" id="conteudo1" /><br/><label for="conteudo1" id="mensagemConteudo1" class="mensagem">Preenchimento obrigat&oacute;rio</label>
		</td>
	</tr>
</table>
<input type="hidden" id="id"  value="1" />
<input type="submit" id="gravarDados" value="Gravar" />