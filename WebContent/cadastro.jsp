<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="br.com.fiap.pessoa.*"%>
<script type="text/javascript" src="script/cadastro.js"></script>
<table>
	<tr>
		<td align="right">Nome:</td>
		<td align="left">
			<input type="text" name="nome" id="nome" />
			<label for="nome" id="error_Nome" class="error">Campo deve ser preenchido</label>
		</td>
	</tr>
	<tr>
		<td align="right">RG:</td>
		<td align="left">
			<input type="text" name="rg" id="rg" />
			<label for="rg" id="error_Rg" class="error">Campo deve ser preenchido</label>
		</td>
	</tr>

	<tr>
		<td align="right">CPF:</td>
		<td align="left">
			<input type="text" name="cpf" id="cpf" />
			<label for="cpf" id="error_Cpf" class="error">Campo deve ser preenchido</label>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="Gravar" name="gravar" id="gravar" />
		</td>
	</tr>
</table>
<div id="error_Digital" class="error">Realize a leitura da sua digital</div>
<div id="digital"></div>