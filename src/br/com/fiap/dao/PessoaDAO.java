package br.com.fiap.dao;

import java.util.*;
import org.hibernate.*;
import org.hibernate.criterion.Criterion;

import br.com.fiap.hibernate.*;
import br.com.fiap.pessoa.*;

public class PessoaDAO {
	
	private Session sessao;

	public PessoaDAO(){
		sessao = SessaoUtil.getSession();
	}
	
	@Override
	public void finalize() throws Throwable {
		sessao.close();
	}
	
	public void gravar(Pessoa p) throws Exception{
		try {
			sessao.saveOrUpdate(p);
			sessao.flush();
		} catch (Exception e) {
			throw e;
		}
	}
	
	public void gravar(PessoaDigital d) throws Exception{
		try {
			sessao.saveOrUpdate(d);
		} catch (Exception e) {
			throw e;
		}
	}
	
	public void gravar(PessoaDado d) throws Exception{
		try {
			sessao.saveOrUpdate(d);
		} catch (Exception e) {
			throw e;
		}
	}
	
	public void gravar(PessoaCertificado c) throws Exception{
		try {
			sessao.saveOrUpdate(c);
		} catch (Exception e) {
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
			e.printStackTrace();
		}
		return lista;
	}
	
	public Pessoa selecionar(int idPessoa){
		Pessoa p = null;
		try{
			p = (Pessoa)sessao.get(Pessoa.class, idPessoa);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	
	public Pessoa selecionar(String parametro, String filtro){
		Pessoa p = null;
		try{
			Query q = sessao.createQuery("from Pessoa where " + parametro + " = ?");
			q.setString(0, filtro);
			p = (Pessoa)q.uniqueResult();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	
	public void deletar(Pessoa p) throws Exception{
		try {
			sessao.delete(p);
		} catch (Exception e) {
			throw e;
		}
	}
	
	public void deletar(PessoaDado d) throws Exception{
		try {
			sessao.delete(d);
		} catch (Exception e) {
			throw e;
		}
	}
	
	public PessoaCertificado selecionarCertificado(int idPessoa) throws Exception{
		Query q = sessao.getNamedQuery("certificadoValido")
			.setInteger("idPessoa", idPessoa);
		PessoaCertificado c = (PessoaCertificado)q.uniqueResult();
		if(c == null)
			throw new Exception("N&aatilde;o possue nenhum certificado");
		return c;
	}
	
	public PessoaCertificado selecionarCertificado(byte[] chavePublica) throws Exception{
		Query q = sessao.getNamedQuery("buscarPorChavePublica")
			.setBinary("chavePublica", chavePublica);
		PessoaCertificado c = (PessoaCertificado)q.uniqueResult();
		if(c == null)
			throw new Exception("Certificado inv&aacute;lido");
		return c;
	}
	
	public PessoaDado selecionarDado(int idPessoaDado){
		PessoaDado dado = null;
		try{
			dado = (PessoaDado)sessao.get(PessoaDado.class, idPessoaDado);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return dado;
	}
	
}
