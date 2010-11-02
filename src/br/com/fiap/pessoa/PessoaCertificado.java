package br.com.fiap.pessoa;

import java.util.*;
import br.com.fiap.certificado.*;

public class PessoaCertificado {
	
	private int idPessoaCertificado;
	private Date dataInicio;
	private Date dataExpiracao;
	private byte[] chavePublica;
	private Pessoa pessoa;
	
	public PessoaCertificado(){}
	
	public PessoaCertificado(Certificado c) throws Exception{
		dataInicio = c.getCertificado().getNotBefore();
		dataExpiracao = c.getCertificado().getNotAfter();
		chavePublica = c.getCertificado().getPublicKey().getEncoded();
	}
	
	public int getIdPessoaCertificado() {
		return idPessoaCertificado;
	}
	public void setIdPessoaCertificado(int idPessoaCertificado) {
		this.idPessoaCertificado = idPessoaCertificado;
	}
	public Date getDataInicio() {
		return dataInicio;
	}
	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}
	public Date getDataExpiracao() {
		return dataExpiracao;
	}
	public void setDataExpiracao(Date dataExpiracao) {
		this.dataExpiracao = dataExpiracao;
	}
	public byte[] getChavePublica() {
		return chavePublica;
	}
	public void setChavePublica(byte[] chavePublica) {
		this.chavePublica = chavePublica;
	}
	public Pessoa getPessoa() {
		return pessoa;
	}
	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
	
}
