package br.com.fiap.hibernate;

import org.hibernate.*;

public class SessaoUtil {

	private static Session sessao = null;
	private static boolean transacaoAberta;
	
	static{
		try{
			sessao = HibernateUtil.getSessionFactory().getCurrentSession();
		}
		catch(Exception e){
			sessao = HibernateUtil.getSessionFactory().openSession();
		}
	}
	
	public static Session getSession() {
		if(!sessao.isOpen())
			sessao = HibernateUtil.getSessionFactory().openSession();
		return sessao;
	}

	public static void beginTransaction() {
		if(!sessao.isOpen())
			sessao = HibernateUtil.getSessionFactory().openSession();
		sessao.clear();
		sessao.beginTransaction();
		transacaoAberta = true;
	}

	public static void rollbackTransaction() {
		if(!transacaoAberta)
			return;
		sessao.getTransaction().rollback();
		transacaoAberta = false;
	}

	public static void commitTransaction() {
		if(!transacaoAberta)
			return;
		sessao.getTransaction().commit();
		transacaoAberta = false;
	}
}
