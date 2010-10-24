package br.com.fiap.pessoa;

public class PessoaDigital {
	
	private int idPessoaDigital;
	private byte[] digital;
	private Pessoa pessoa;
	
	public byte[] getDigital() {
		return digital;
	}
	
	public int getIdPessoaDigital() {
		return idPessoaDigital;
	}

	public void setIdPessoaDigital(int idPessoaDigital) {
		this.idPessoaDigital = idPessoaDigital;
	}

	public void setDigital(byte[] digital) {
		this.digital = digital;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
	
}
