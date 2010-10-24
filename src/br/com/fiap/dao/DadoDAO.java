package br.com.fiap.dao;

import org.hibernate.*;

import br.com.fiap.dado.*;
import br.com.fiap.hibernate.*;

public class DadoDAO {
	
	Session sessao;
	
	public DadoDAO(){
		sessao = SessaoUtil.getSession();
	}
	
	public Dado buscarPeloNome(String descricao) throws Exception{
		Dado d = null;
		Query q = sessao.createQuery("from Dado where descricao = ?");
		q.setString(0, descricao.toLowerCase());
		d = (Dado)q.uniqueResult();
		return d;
	}
	
	public void gravar(Dado d) throws Exception{
  		sessao.saveOrUpdate(d);
	}
}
