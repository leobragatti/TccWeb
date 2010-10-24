package br.com.fiap.dado;

public class Dado{

	private int idDado;
	private String descricao;
	
	public int getIdDado() {
		return idDado;
	}
	public void setIdDado(int idDado) {
		this.idDado = idDado;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao.toLowerCase();
	}

	public String toString(){
		return this.descricao;
	}
	
	public int hashCode(){
		int hash = 1;
	    hash = hash * 31 + ((Integer)idDado).hashCode();
	    hash = hash * 31 + (descricao == null ? 0 : descricao.hashCode());
	    return hash;
	}
	
}
