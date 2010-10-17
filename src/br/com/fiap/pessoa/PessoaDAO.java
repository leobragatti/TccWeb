package br.com.fiap.pessoa;

import java.util.*;
import org.hibernate.*;
import br.com.fiap.hibernate.HibernateUtil;

public class PessoaDAO {
	
	private Session sessao;
	Transaction tx;
	public PessoaDAO(){
		sessao = HibernateUtil.getSessionFactory().openSession();
	}
	
	@Override
	public void finalize() throws Throwable {
		sessao.close();
	}
	
	public void beginTrans(){
		tx = sessao.beginTransaction();
	}
	
	public void commitTrans(){
		tx.commit();
	}
	
	public void rollbackTrans(){
		tx.rollback();
	}
	
	public void gravar(Pessoa p) throws Exception{
		try {
			sessao.saveOrUpdate(p);
		} catch (Exception e) {
			rollbackTrans();
			throw e;
		}
	}
	
	public void gravar(PessoaDigital d) throws Exception{
		try {
			sessao.saveOrUpdate(d);
		} catch (Exception e) {
			rollbackTrans();
			throw e;
		}
	}
	
	public List<Pessoa> listar(){
		List<Pessoa> lista = new ArrayList<Pessoa>();
		try{
			Query q = sessao.createQuery("from Pessoa");
			lista = q.list();
		}
		catch (Exception e) {
			rollbackTrans();
			e.printStackTrace();
		}
		return lista;
	}
	
	public Pessoa selecionar(int idPessoa){
		Pessoa p = null;
		try{
			beginTrans();
			p = (Pessoa)sessao.get(Pessoa.class, idPessoa);
			commitTrans();
		}
		catch (Exception e) {
			rollbackTrans();
			e.printStackTrace();
		}
		return p;
	}
	
	public Pessoa selecionar(String parametro, String filtro){
		Pessoa p = null;
		try{
			beginTrans();
			Query q = sessao.createQuery("from Pessoa where " + parametro + " = ?");
			q.setString(0, filtro);
			p = (Pessoa)q.uniqueResult();
			commitTrans();
		}
		catch (Exception e) {
			rollbackTrans();
			e.printStackTrace();
		}
		return p;
	}
	
	public void deletar(Pessoa p) throws Exception{
		try {
			sessao.delete(p);
		} catch (Exception e) {
			rollbackTrans();
			throw e;
		}
	}
	
}
