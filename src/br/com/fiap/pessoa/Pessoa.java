package br.com.fiap.pessoa;

public class Pessoa {

	private int idPessoa;
	private int idPessoaPerfil;
	private int idPessoaTipo;
	private String nome;
	private String cpf;
	private String rg;
	
	public int getIdPessoa() {
		return idPessoa;
	}
	public void setIdPessoa(int idPessoa) {
		this.idPessoa = idPessoa;
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
	
}
