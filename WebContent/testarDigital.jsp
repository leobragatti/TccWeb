<%@page import="br.com.fiap.digital.*"%>
<%@page import="br.com.fiap.pessoa.*"%>

<%
	Digital d = new Digital(response.getWriter());
	
	try{
		if(!d.existirLeitor()){
			out.println("N&atilde;o h&aacute; leitor conectado");
			return;
		}
		
		byte[] b = d.lerSample(null);
		byte[] b2 = d.retornarBytesImagemDigital();
		session.setAttribute("imagem", b2);
		response.sendRedirect("imagem.jsp");
		
	}catch(Exception e){
		out.println(e.getMessage());
	}
	finally{
		d = null;
	}
%>