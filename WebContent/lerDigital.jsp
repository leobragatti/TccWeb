
<%@page import="br.com.fiap.digital.*"%>
<%@page import="br.com.fiap.pessoa.*"%>

<%
	Digital d = new Digital(response.getWriter());
	
	try{
		if(!d.existirLeitor()){
			out.println("N&atilde;o h&aacute; leitor conectado");
			return;
		}
		
		byte[] b =  d.lerDigital(null, 1);
		PessoaDigital digital = new PessoaDigital();
		digital.setDigital(b);
		session.setAttribute("digital", digital);
		out.println("<input type='hidden' id='dedo' value='1' />");
		
	}catch(Exception e){
		out.println(e.getMessage());
	}
	finally{
		d = null;
	}
%>