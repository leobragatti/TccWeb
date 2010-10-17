
<%@page import="java.util.*"%>
<%@page import="br.com.fiap.pessoa.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  	  
<%	
	try{
		Pessoa pe = new Pessoa();
		
		ArrayList<PessoaDigital> digitais = new ArrayList<PessoaDigital>();
		digitais.add((PessoaDigital)session.getAttribute("digital"));
		pe.setNome(request.getParameter("nome"));
		pe.setRg(request.getParameter("rg"));
		pe.setCpf(request.getParameter("cpf"));
		
		if(pe.getNome() != null){
			PessoaDAO dao = new PessoaDAO();
			pe.setidPessoaPerfil(1);
			pe.setidPessoaTipo(1);
			dao.beginTrans();
			dao.gravar(pe);
			
			for(PessoaDigital digital : digitais){
				digital.setPessoa(pe);			
				dao.gravar(digital);
			}
			
			dao.commitTrans();
			session.removeAttribute("digital");
			out.println("Registro gravado com sucesso");
		}
	}catch(Exception e){
		out.println(e.getMessage());
	}
%>