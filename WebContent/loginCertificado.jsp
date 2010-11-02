
<%@page import="java.io.IOException"%>
<%@page import="java.security.*"%>
<%@page import="br.com.fiap.certificado.Certificado"%>
<%@page import="br.com.fiap.hibernate.*"%>
<%@page import="br.com.fiap.digital.*"%>
<%@page import="java.util.*"%>
<%@page import="br.com.fiap.pessoa.*"%>
<%@page import="br.com.fiap.dao.*"%>
<%
	PessoaDAO dao = new PessoaDAO();
	SessaoUtil.beginTransaction();
	String certificado = request.getParameter("certificado");
	String senha = request.getParameter("senha");
	
	try{
		Certificado c = new Certificado(certificado);
		PrivateKey pri = c.getPrivateFromFile("bragatti", senha);
		PublicKey pub = c.getPublicFromFile("bragatti", senha); 
		PessoaCertificado p = dao.selecionarCertificado(pub.getEncoded());
		if(p == null){
			out.println("Certificado inv&aacute;lido");
			return;
		}
		String conteudo = String.valueOf(p.getPessoa().getIdPessoa());
		byte[] assinado = c.createSignature(pri, conteudo.getBytes());
		PublicKey pub2  = c.getPublicFromBytes(p.getChavePublica());
		if(!c.verifySignature(pub2, conteudo.getBytes(),assinado)){
			out.println("Assinatura digital do certificado n&atilde;o confere");
			return;
		}
		session.setAttribute("pessoaLogada", p.getPessoa());
		out.println("Autentica&ccedil;&atilde;o realizada com sucesso");
		out.println("<input type='hidden' id='idPessoa' value='" + p.getPessoa().getIdPessoa() + "' />");
	}
	catch(IOException e){
		out.println("N&atilde;o foi poss&iacute;vel validar o certificado");
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
	
	SessaoUtil.commitTransaction();
		
	
%>