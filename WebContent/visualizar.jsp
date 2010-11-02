
<%@page import="java.util.*"%>
<%@page import="br.com.fiap.dado.*"%>
<%@page import="br.com.fiap.hibernate.*"%>
<%@page import="br.com.fiap.pessoa.*"%>
<%@page import="br.com.fiap.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="verificar.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="script/visualizar.js">
</script>
<%
	if(p == null){
		out.println("Fa&ccedil;a a autentica&ccedil;&atilde;o primeiro");
		return;
	}
	PessoaDAO dao = new PessoaDAO();
	SessaoUtil.beginTransaction();
	Pessoa pe = dao.selecionar(p.getIdPessoa());
	Map<Dado, PessoaDado> dados = pe.getDado();
	SessaoUtil.commitTransaction();
%>
<table>
	<tr>
		<td>C&oacute;digo:</td>
		<td><%=pe.getIdPessoa() %></td>
	</tr>
	<tr>
		<td>Nome:</td>
		<td><%=pe.getNome() %></td>
	</tr>
	<tr>
		<td>Rg:</td>
		<td><%=pe.getRg() %></td>
	</tr>
	<tr>
		<td>Cpf:</td>
		<td><%=pe.getCpf() %></td>
	</tr>
	<%
		if(dados == null)
			return;
	
		for(PessoaDado dado: dados.values()){
			out.println("<tr id='linha" + dado.getIdPessoaDado() + "'>");
			out.println("<td>");
			out.println(dado.getDado().getDescricao() + ":");
			out.println("</td>");
			out.println("<td>");
			out.println("<input type='text' id='dado" + dado.getIdPessoaDado() + "' readonly value='" + dado.getConteudo() + "' size='30' />");
			out.println("</td>");
			out.println("<td>");
			out.println("<a href='#' id='" + dado.getIdPessoaDado() + "' onClick='alterarConteudo(this.id);'>Alterar</a>");
			out.println("</td>");
			out.println("<td>");
			out.println("<a href='#' id='" + dado.getIdPessoaDado() + "' onClick='excluirDado(this.id);'>Excluir</a>");
			out.println("</td>");
			out.println("</tr>");
		}
	%>
</table>