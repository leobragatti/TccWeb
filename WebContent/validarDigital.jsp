
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%><%@page import="br.com.fiap.digital.*"%>
<%@page import="br.com.fiap.pessoa.*"%>
<%
	Digital d = new Digital(response.getWriter());
	
	try{
		byte [] b = null;
		if(!d.existirLeitor()){
			out.println("N&atilde;o h&aacute; leitor conectado");
			return;
		}
	
		Pessoa p = (Pessoa)session.getAttribute("pessoaLogada");
		Set<PessoaDigital> digitais = p.getDigital();
		b = d.lerSample(null);
		
		for(PessoaDigital digital : digitais)
			if (d.verify(b, digital.getDigital()))
				out.println(p.getIdPessoa());
			else{
				out.println("<br />Digital n&atilde;o bate");
				session.removeAttribute("pessoaLogada");
			}
		
	}catch(Exception e){
		out.println(e.getMessage());
	}
	finally{
		d = null;
	}
%>