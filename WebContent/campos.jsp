<%
	String id = request.getParameter("id");
%>
<tr id="row<%=id%>">
	<td valign="center" width="120">
		Campo:
	</td>
	<td valign="center" width="120">
		Conte&uacute;do:
	</td>
	<td valign="center" rowspan="2">
		<input type="submit" id="remover1" value="Remover" onclick='removerCampo("#row<%=id %>", "#row<%=id+1 %>"); return false;' >
	</td>
</tr>
<tr id="row<%=id+1	%>">
	<td width="120">
		<input type="text" id="campo<%=id%>" /><br/><label for="campo<%=id%>" id="mensagemCampo<%=id%>" class="mensagem">Preenchimento obrigat&oacute;rio</label>
	</td>
	<td width="120">
		<input type="text" id="conteudo<%=id%>" /><br/><label for="conteudo<%=id%>" id="mensagemConteudo<%=id%>" class="mensagem">Preenchimento obrigat&oacute;rio</label>
	</td>
</tr>
<script type="text/javascript">
	$('.mensagem').hide();
</script>