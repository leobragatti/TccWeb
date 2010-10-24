package br.com.fiap.pessoa;

import java.util.*;
import br.com.fiap.dado.Dado;

public class Pessoa {

	private int idPessoa;
	private int idPessoaPerfil;
	private int idPessoaTipo;
	private String nome;
	private String cpf;
	private String rg;
	private Set<PessoaDigital> digital = new HashSet<PessoaDigital>();
	private Map<Dado, PessoaDado> dado;
	private Set<PessoaCertificado> certificado = new HashSet<PessoaCertificado>();
	
	public int getIdPessoa() {
		return idPessoa;
	}
	public void setIdPessoa(int idPessoa) {
		this.idPessoa = idPessoa;
	}
	public int getidPessoaPerfil() {
		return idPessoaPerfil;
	}
	public void setidPessoaPerfil(int idPessoaPerfil) {
		this.idPessoaPerfil = idPessoaPerfil;
	}
	public int getidPessoaTipo() {
		return idPessoaTipo;
	}
	public void setidPessoaTipo(int idPessoaTipo) {
		this.idPessoaTipo = idPessoaTipo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getRg() {
		return rg;
	}
	public void setRg(String rg) {
		this.rg = rg;
	}
	public int getIdPessoaPerfil() {
		return idPessoaPerfil;
	}
	public void setIdPessoaPerfil(int idPessoaPerfil) {
		this.idPessoaPerfil = idPessoaPerfil;
	}
	public int getIdPessoaTipo() {
		return idPessoaTipo;
	}
	public void setIdPessoaTipo(int idPessoaTipo) {
		this.idPessoaTipo = idPessoaTipo;
	}
	public Set<PessoaDigital> getDigital() {
		return digital;
	}
	public void setDigital(Set<PessoaDigital> digital) {
		this.digital = digital;
	}
	public Map getDado() {
		return dado;
	}
	public void setDado(Map dado) {
		this.dado = dado;
	}
	public void setCertificado(Set<PessoaCertificado> certificado) {
		this.certificado = certificado;
	}
	public Set<PessoaCertificado> getCertificado() {
		return certificado;
	}
	
}
