package br.com.fiap.pessoa;

import br.com.fiap.dado.Dado;

public class PessoaDado {

	private int idPessoaDado;
	private String conteudo;
	private boolean visivel;
	private boolean obrigatorio;
	private Pessoa pessoa;
	private Dado dado;

	public int getIdPessoaDado() {
		return idPessoaDado;
	}
	public void setIdPessoaDado(int idPessoaDado) {
		this.idPessoaDado = idPessoaDado;
	}
	public String getConteudo() {
		return conteudo;
	}
	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}
	public boolean isVisivel() {
		return visivel;
	}
	public void setVisivel(boolean visivel) {
		this.visivel = visivel;
	}
	public boolean isObrigatorio() {
		return obrigatorio;
	}
	public void setObrigatorio(boolean obrigatorio) {
		this.obrigatorio = obrigatorio;
	}
	public Pessoa getPessoa() {
		return pessoa;
	}
	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
	public Dado getDado() {
		return dado;
	}
	public void setDado(Dado dado) {
		this.dado = dado;
	}
	
}
