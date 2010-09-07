package br.com.fiap.certificado;

import java.io.*;
import java.security.*;
import java.security.cert.*;

public class Certificado {
	
	private File cert;
	
	public Certificado(String caminhoArquivo){
		cert = new File(caminhoArquivo);
	}
	
	public PrivateKey getPrivateFromFile(String alias, String password) throws Exception{
		KeyStore ks = KeyStore.getInstance("JKS");
		char[] pwd = password.toCharArray();
		InputStream is = new FileInputStream(cert);
		ks.load(is, pwd);
		is.close();
		Key chave = ks.getKey(alias, pwd);
		if (chave instanceof PrivateKey)
			return (PrivateKey) chave;
		return null;
	}
	
	public PublicKey getPublicFromFile() throws Exception{
		FileInputStream fr = new FileInputStream(cert);
		CertificateFactory cf = CertificateFactory.getInstance("X509");
		X509Certificate c = (X509Certificate) cf.generateCertificate(fr);
		PublicKey p = c.getPublicKey();
		return p;
	}
	
	public byte[] createSignature(PrivateKey chave, byte[] buffer) throws Exception{
		Signature sig = Signature.getInstance(chave.getAlgorithm());
		sig.initSign(chave);
		sig.update(buffer);
		return sig.sign();
	}
	
	public boolean verifySignature(PublicKey chave, byte[] buffer, byte[] signed) throws Exception{
		Signature sig = Signature.getInstance(chave.getAlgorithm());
		sig.initVerify(chave);
		sig.update(buffer);
		return sig.verify(signed);
	}
	
}