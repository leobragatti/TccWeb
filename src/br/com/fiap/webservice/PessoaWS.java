package br.com.fiap.webservice;

import java.io.InputStream;
import java.security.PublicKey;
import java.security.cert.X509Certificate;
import java.util.*;

import br.com.fiap.certificado.*;
import br.com.fiap.dao.*;
import br.com.fiap.hibernate.SessaoUtil;
import br.com.fiap.pessoa.*;

public class PessoaWS {

	public String[] getInformacoes(byte[] autenticacao, int idPessoa_Empresa, int idPessoa, String[] campos) throws Exception{
		
		try{
			validarAutenticacao(autenticacao, idPessoa_Empresa);
		}catch(Exception e){
			throw e;
		}
		
		String[] dados = new String[campos.length];
		try {
			PessoaDAO dao = new PessoaDAO();
			SessaoUtil.beginTransaction();
			Pessoa p = dao.selecionar(idPessoa);
			for(int indice = 0;indice<campos.length;indice++ ){
				if(campos[indice].equalsIgnoreCase("rg") || campos[indice].equalsIgnoreCase("cpf") || campos[indice].equalsIgnoreCase("nome")){
					if(campos[indice].equalsIgnoreCase("rg"))
						dados[indice] = p.getRg();
					if(campos[indice].equalsIgnoreCase("cpf"))
						dados[indice] = p.getCpf();
					if(campos[indice].equalsIgnoreCase("nome"))
						dados[indice] = p.getNome();
				}
				else{
					Collection<PessoaDado> colecaoDados = p.getDado().values();
					for(PessoaDado dado: colecaoDados){
						if(dado.getDado().getDescricao().equalsIgnoreCase(campos[indice])){
							dados[indice] = dado.getConteudo();
							break;
						}
					}
				}
			}
			SessaoUtil.commitTransaction();
		} catch (Exception e) {
			SessaoUtil.rollbackTransaction();
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dados;
	}
	
	public boolean validarAutenticacao(byte[] chave, int idPessoa) throws Exception{
		PessoaDAO dao = new PessoaDAO();
		PessoaCertificado cert = dao.selecionarCertificado(idPessoa);
		Certificado c = new Certificado();
		PublicKey pub = c.getPublicFromBytes(cert.getChavePublica());
		if (!c.verifySignature(pub, String.valueOf(idPessoa).getBytes(), chave)){
			throw new Exception("Empresa n&atilde;o autorizada a solicitar informa&ccedil;&otilde;es");
		}
		return true;
	}
}