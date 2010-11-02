package br.com.fiap.certificado;

import java.io.*;
import java.security.*;
import java.security.cert.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

public class Certificado {
	
	private File cert;
	private X509Certificate certificado;
	
	public Certificado(){};
	
	public Certificado(String caminhoArquivo) throws Exception{
		cert = new File(caminhoArquivo);
	}
	
	public X509Certificate getCertificado() throws Exception {
		FileInputStream fr = new FileInputStream(cert);
		CertificateFactory cf = CertificateFactory.getInstance("X.509");
		certificado = (X509Certificate) cf.generateCertificate(fr);
		return certificado;
	}

	public void setCertificado(X509Certificate certificado) {
		this.certificado = certificado;
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
	
	public PublicKey getPublicFromFile(String alias, String password) throws Exception{
		KeyStore ks = KeyStore.getInstance("JKS");
		char[] pwd = password.toCharArray();
		InputStream is = new FileInputStream(cert);
		ks.load(is, pwd);
		is.close();
		X509Certificate c = (X509Certificate) ks.getCertificate(alias);
		PublicKey p = c.getPublicKey();
		return p;
	}
	
	public PublicKey getPublicFromFile() throws Exception{
		FileInputStream fr = new FileInputStream(cert);
		CertificateFactory cf = CertificateFactory.getInstance("X.509");
		certificado = (X509Certificate) cf.generateCertificate(fr);
		PublicKey p = certificado.getPublicKey();
		return p;
	}
	
	public PublicKey getPublicFromBytes(byte[] chave) throws NoSuchAlgorithmException, NoSuchProviderException, InvalidKeySpecException{
		KeyFactory kf = KeyFactory.getInstance("RSA");
		X509EncodedKeySpec pubKeySpec = new X509EncodedKeySpec(chave);
		PublicKey key = kf.generatePublic(pubKeySpec);
		return key;
	}
	
	public byte[] createSignature(PrivateKey chave, byte[] buffer) throws Exception{
		//Signature sig = Signature.getInstance(chave.getAlgorithm());
		Signature sig = Signature.getInstance("SHA1withRSA");
		sig.initSign(chave);
		sig.update(buffer);
		return sig.sign();
	}
	
	public boolean verifySignature(PublicKey chave, byte[] buffer, byte[] signed) throws Exception{
		//Signature sig = Signature.getInstance(chave.getAlgorithm());
		Signature sig = Signature.getInstance("SHA1withRSA");
		sig.initVerify(chave);
		sig.update(buffer);
		return sig.verify(signed);
	}
	
}