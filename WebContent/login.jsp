
<%@page import="br.com.fiap.digital.*"%>
<%@page import="java.util.*"%>
<%@page import="br.com.fiap.pessoa.*"%>
<%
	PessoaDAO dao = new PessoaDAO();
	Pessoa p;
	
	Enumeration<String> e = request.getParameterNames();
	String filtro = "";
	String parametro = "";
	while(e.hasMoreElements()){
		parametro = (String)e.nextElement();
		filtro = request.getParameter(parametro);
		p = dao.selecionar(parametro, filtro);
		if(p == null){
			out.println("Registro n&atilde;o localizado");
			return;
		}
		else{
			session.setAttribute("pessoaLogada", p);
			response.sendRedirect("validarDigital.jsp");
			return;
		}
	}

	
	
%>