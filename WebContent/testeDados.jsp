<%@page import="java.util.*"%>
<%@page import="br.com.fiap.pessoa.*"%>
<%@page import="br.com.fiap.dado.*"%>
<%
	PessoaDAO dao = new PessoaDAO();
	try{
		Pessoa p = dao.selecionar((int)62);
		
		Collection<PessoaDado> s = p.getDado().values();
		for(PessoaDado o: s){
			out.println(o.getConteudo() + "<br />");
			out.println(o.getDado().getDescricao());
		}
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
	finally{
		try{
			dao.finalize();
		}
		catch(Throwable e){
			e.printStackTrace();
		}
	}
%>