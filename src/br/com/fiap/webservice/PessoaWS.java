package br.com.fiap.webservice;

import java.util.*;
import br.com.fiap.dao.*;
import br.com.fiap.pessoa.*;

public class PessoaWS {

	public String[] getInformacoes(int idPessoa, String[] campos){
		String[] dados = new String[campos.length];
		try {
			PessoaDAO dao = new PessoaDAO();
			Pessoa p = dao.selecionar(idPessoa);
			for(int indice = 0;indice<campos.length;indice++ ){
				if(campos[indice].equalsIgnoreCase("rg") || campos[indice].equalsIgnoreCase("cpf")){
					if(campos[indice].equalsIgnoreCase("rg"))
						dados[indice] = p.getRg();
					if(campos[indice].equalsIgnoreCase("cpf"))
						dados[indice] = p.getCpf();
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
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dados;
	}
	
	public String validarAutenticacao(byte[] chave, int idPessoa){
		try{
			PessoaDAO dao = new PessoaDAO();
		}catch(Exception e){
			return e.getMessage();
		}
		return "ok";
	}
}