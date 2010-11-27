<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="/TccWeb/script/autenticar.js"></script>

<table>
	<tr>
		<td>
			Selecione uma op&ccedil;&atilde;o para se autenticar:
			<select id="opcao" name="opcao" onchange="retornarOpcao(this.value);">
				<option value="rg">Rg</option>
				<option value="cpf">Cpf</option>
				<option value="cert">Certificado</option>
			</select>
			
			<input type="text" name="filtro" id="filtro" />
			<label for="filtro" class="error" id="error_Filtro">Campo de preenchimento obrigat&oacute;rio</label>
			
			<div id="areaCertificado">
				Informe o caminho do certificado:<br /><input type="file" id="certificado" />
				<label for="certificado" class="error" id="error_Certificado">Campo de preenchimento obrigat&oacute;rio</label>
				
				<br />
				
				Senha:<br />	<input type="password" id="senha" />
				<label for="senha" class="error" id="error_Senha">Campo de preenchimento obrigat&oacute;rio</label>
			</div>
			<br />
		</td>
	</tr>
</table>
<input type="submit" id="validar" value="Autenticar"/>