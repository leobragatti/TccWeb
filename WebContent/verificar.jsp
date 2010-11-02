
<%@page import="br.com.fiap.pessoa.*"%>
<%
	Pessoa p = (Pessoa)session.getAttribute("pessoaLogada");
	if(p != null)
		out.println("<input type='hidden' id='logado' value='1'/>");
	else
		out.println("<input type='hidden' id='logado' value='0'/>");
%>