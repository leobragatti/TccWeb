package br.com.fiap.pessoa;

public class PessoaDado {

	private int idPessoa;
	private int idDado;
	private boolean visivel;
	private boolean obrigatorio;
	
	public int getIdPessoa() {
		return idPessoa;
	}
	public void setIdPessoa(int idPessoa) {
		this.idPessoa = idPessoa;
	}
	public int getIdDado() {
		return idDado;
	}
	public void setIdDado(int idDado) {
		this.idDado = idDado;
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
	
}
