<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="br.com.fiap.pessoa.*"%>
<script type="text/javascript" src="script/cadastro.js"></script>
<table>
	<tr>
		<td align="right">Tipo de pessoa:</td>
		<td align="left">
			<select id="tipoPessoa" onchange="retornarOpcao(this.value);" >
				<option value="1">F&iacute;sica</option>
				<option value="2">Jur&iacute;dica</option>
			</select>
			<label for="nome" id="error_Tipo" class="error">Campo deve ser preenchido</label>
		</td>
	</tr>
	<tr id="linhaCertificado">
		<td align="right">Informe o local<br />do certificado:</td>
		<td align="left">
			<input type="text" name="certificado" id="certificado" />
			<label for="nome" id="error_Certificado" class="error">Campo deve ser preenchido</label>
		</td>
	</tr>
	<tr>
		<td align="right"><p id="tituloNome">Nome:</p></td>
		<td align="left">
			<input type="text" name="nome" id="nome" />
			<label for="nome" id="error_Nome" class="error">Campo deve ser preenchido</label>
		</td>
	</tr>
	<tr>
		<td align="right"><p id="tituloRg">RG:</p></td>
		<td align="left">
			<input type="text" name="rg" id="rg" />
			<label for="rg" id="error_Rg" class="error">Campo deve ser preenchido</label>
		</td>
	</tr>

	<tr>
		<td align="right"><p id="tituloCpf">CPF:</p></td>
		<td align="left">
			<input type="text" name="cpf" id="cpf" />
			<label for="cpf" id="error_Cpf" class="error">Campo deve ser preenchido</label>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="left">
			<input type="submit" value="Gravar" name="gravar" id="gravar" />
		</td>
	</tr>
</table>
<div id="error_Digital" class="error" title="Erro da digital">Realize a leitura da sua digital</div>
<div id="digital" title="Leitura da digital"></div>