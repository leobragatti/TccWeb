package br.com.fiap.dado;

public class Dado implements Comparable<Dado>{

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
		this.descricao = descricao;
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
	
	@Override
	public boolean equals(Object o){
		Dado d = (Dado)o;
		System.out.println("Metodo equals");
		return this.descricao.equalsIgnoreCase(d.getDescricao());
	}
	public int compareTo(Dado o) {
		// TODO Auto-generated method stub
		System.out.println("Porra");
		return 0;
	}
	
}
