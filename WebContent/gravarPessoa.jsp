
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="br.com.fiap.certificado.Certificado"%>
<%@page import="br.com.fiap.hibernate.SessaoUtil"%>
<%@page import="java.util.*"%>
<%@page import="br.com.fiap.dao.*"%>
<%@page import="br.com.fiap.pessoa.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  	  
<%	
	try{
		Pessoa pe = new Pessoa();
		PessoaCertificado cert = null;
		
		String tipo = request.getParameter("tipoPessoa");
		pe.setidPessoaTipo(Integer.parseInt(request.getParameter("tipoPessoa")));
		pe.setNome(request.getParameter("nome"));
		pe.setRg(request.getParameter("rg"));
		pe.setCpf(request.getParameter("cpf"));
		pe.setidPessoaPerfil(1);
		
		ArrayList<PessoaDigital> digitais = new ArrayList<PessoaDigital>();
		
		if (pe.getidPessoaTipo() == 1){
			digitais.add((PessoaDigital)session.getAttribute("digital"));
		}
		else{
			String certificado = request.getParameter("certificado");
			cert = new PessoaCertificado(new Certificado(certificado));
		}
				
		if(pe.getNome() != null){
			PessoaDAO dao = new PessoaDAO();
			SessaoUtil.beginTransaction();
			dao.gravar(pe);
			if (pe.getidPessoaTipo() == 1){
				for(PessoaDigital digital : digitais){
					digital.setPessoa(pe);			
					dao.gravar(digital);
				}
			}
			else{
				cert.setPessoa(pe);
				dao.gravar(cert);
			}
					
			SessaoUtil.commitTransaction();
			session.removeAttribute("digital");
			session.setAttribute("pessoaLogada", pe);
			out.println("Registro gravado com sucesso");
		}
	}catch(Exception e){
		out.println(e.getMessage());
		SessaoUtil.rollbackTransaction();
	}
%>