
<%@page import="br.com.fiap.pessoa.*"%>
<%@page import="br.com.fiap.hibernate.*"%>
<%@page import="br.com.fiap.dao.*"%>
<%
	int idPessoaDado = Integer.parseInt(request.getParameter("idPessoaDado"));
	try{
		PessoaDAO dao = new PessoaDAO();
		SessaoUtil.beginTransaction();
		PessoaDado dado = dao.selecionarDado(idPessoaDado);
		dao.deletar(dado);
		SessaoUtil.commitTransaction();
		out.println("<td colspan='4' align='center'>Dado exclu&iacute;do</td>");
	}catch(Exception e){
		SessaoUtil.rollbackTransaction();
		out.println(e.getMessage());
	}
%>