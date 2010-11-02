<%
	session.removeAttribute("pessoaLogada");
	out.println("Sess&atilde;o encerrada");
	session.invalidate();
%>