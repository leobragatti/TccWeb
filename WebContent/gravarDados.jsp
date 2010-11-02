
<%@page import="br.com.fiap.dado.*"%>
<%@page import="br.com.fiap.dao.*"%>
<%@page import="br.com.fiap.hibernate.*"%>
<%@page import="br.com.fiap.pessoa.*"%>
<%
	DadoDAO daoDado = new DadoDAO();
	PessoaDAO daoPessoa = new PessoaDAO();
	Pessoa p = (Pessoa)session.getAttribute("pessoaLogada");
	
	String[] campos = request.getParameterValues("campo");
	String[] conteudos = request.getParameterValues("conteudo");
	for(int i=0;i<campos.length;i++){
		try{
			SessaoUtil.beginTransaction();
			Dado d = daoDado.buscarPeloNome(campos[i]);
			if(d == null){
				d = new Dado();
				d.setDescricao(campos[i]);
				daoDado.gravar(d);
			}
			PessoaDado pd = new PessoaDado();
			pd.setConteudo(conteudos[i]);
			pd.setDado(d);
			pd.setPessoa(p);
			daoPessoa.gravar(pd);
			SessaoUtil.commitTransaction();
		}catch(Exception e){
			out.println(e.getMessage());
			SessaoUtil.rollbackTransaction();
			break;
		}
	}
	out.println("Dados gravados com sucesso");
%>