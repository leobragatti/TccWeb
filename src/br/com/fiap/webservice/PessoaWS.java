package br.com.fiap.webservice;

import java.util.*;
import br.com.fiap.pessoa.*;

public class PessoaWS {

	public String[] getInformacoes(int idPessoa, String[] campos){
		String[] dados = new String[campos.length];
		try {
			PessoaDAO dao = new PessoaDAO();
			Pessoa p = dao.selecionar(idPessoa);
			for(int indice = 1;indice<= campos.length;indice++ ){
				Collection<PessoaDado> colecaoDados = p.getDado().values();
				for(PessoaDado dado: colecaoDados){
					if(dado.getDado().getDescricao().equalsIgnoreCase(campos[indice])){
						dados[indice] = dado.getConteudo();
						break;
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dados;
	}
	
}