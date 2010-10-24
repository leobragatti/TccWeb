
<%@page import="br.com.fiap.hibernate.*"%>
<%@page import="br.com.fiap.digital.*"%>
<%@page import="java.util.*"%>
<%@page import="br.com.fiap.pessoa.*"%>
<%@page import="br.com.fiap.dao.*"%>
<%
	PessoaDAO dao = new PessoaDAO();
	Pessoa p;
	
	SessaoUtil.beginTransaction();
	Enumeration<String> e = request.getParameterNames();
	String filtro = "";
	String parametro = "";
	while(e.hasMoreElements()){
		parametro = (String)e.nextElement();
		filtro = request.getParameter(parametro);
		p = dao.selecionar(parametro, filtro);
		if(p == null){
			out.println("Registro n&atilde;o localizado");
			SessaoUtil.commitTransaction();
			return;
		}
		else{
			session.setAttribute("pessoaLogada", p);
			SessaoUtil.commitTransaction();
			response.sendRedirect("validarDigital.jsp");
			return;
		}
	}
	
	
%>