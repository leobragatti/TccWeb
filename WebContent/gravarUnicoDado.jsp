
<%@page import="br.com.fiap.pessoa.*"%>
<%@page import="br.com.fiap.hibernate.*"%>
<%@page import="br.com.fiap.dao.*"%>
<%
	String conteudo = request.getParameter("conteudo");
	int idPessoaDado = Integer.parseInt(request.getParameter("idPessoaDado"));
	try{
		PessoaDAO dao = new PessoaDAO();
		SessaoUtil.beginTransaction();
		PessoaDado dado = dao.selecionarDado(idPessoaDado);
		dado.setConteudo(conteudo);
		dao.gravar(dado);
		SessaoUtil.commitTransaction();
		out.println("<td colspan='4' align='center'>Dado atualizado com sucesso</td>");
	}catch(Exception e){
		SessaoUtil.rollbackTransaction();
		out.println(e.getMessage());
	}
%>