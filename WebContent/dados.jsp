<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="verificar.jsp" %>
<%
	if(p == null){
		out.println("Fa&ccedil;a a autentica&ccedil;&atilde;o primeiro");
		return;
	}
%>

<script type="text/javascript" src="script/dados.js"></script>
<script type="text/javascript">
	
</script>
<input type="submit" id="adicionar" value="Adicionar" class="submit">
<table id="campos">
</table>
<input type="hidden" id="id"  value="1" />
<input type="submit" class="submit" id="gravarDados" value="Gravar" />