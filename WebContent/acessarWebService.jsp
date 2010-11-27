<%@ page import="org.apache.axis.client.*,
				 org.apache.axis.encoding.XMLType,
				 org.apache.axis.utils.Options,
				 javax.xml.rpc.ParameterMode,java.net.URL,
				 java.util.*,
				 br.com.fiap.pessoa.*,
				 br.com.fiap.certificado.*" %>
<%

//Pega o certificado
Certificado c =  new Certificado("c:/cert/bragatti.jks"); 
PrivateKey chavePrivada = c.getPrivateFromFile("bragatti", "voices");
byte[] assinado = c.createSignature(chavePrivada, "81".getBytes());

int idPessoa  = Integer.parseInt(request.getParameter("idPessoa"));
String endpointString = "http://localhost:8080/TccWeb/services/PessoaWS?wsdl"; 
Service service1 = new Service();

Call callOne = (Call)service1.createCall();

URL endpoint = new URL(endpointString);

callOne.setTargetEndpointAddress(endpoint);

callOne.setOperationName("getInformacoes");
//callOne.
callOne.setReturnType(XMLType.XSD_STRING);
callOne.addParameter("autenticacao",XMLType.XSD_HEXBIN,ParameterMode.IN);
callOne.addParameter("idPessoa_Empresa",XMLType.XSD_LONG,ParameterMode.IN);
callOne.addParameter("idPessoa",XMLType.XSD_LONG,ParameterMode.IN);
callOne.addParameter("campos",XMLType.XSD_STRING,ParameterMode.IN);

String[] parametro = {"nome", "rg", "cpf", "endereco"};
ArrayList ret = null; 

try{
	ret = (ArrayList)callOne.invoke(new Object[]{assinado, 81, idPessoa, parametro});
}
catch(Exception e){
	out.println(e.getMessage());
	return;
}

%>

<BODY>
	<h3>Cadastro</h3>
	<table>
		<tr>
			<td>Nome:</td>
			<td>
				<input type="text" value="<%=ret.get(0) %>"/>
			</td>
		</tr>
		<tr>
			<td>Rg:</td>
			<td>
				<input type="text" value="<%=ret.get(1) %>"/>
			</td>
		</tr>
		<tr>
			<td>Cpf:</td>
			<td>
				<input type="text" value="<%=ret.get(2) %>"/>
			</td>
		</tr>
		<tr>
			<td>Endere&ccedil;o:</td>
			<td>
				<input type="text" value="<%=ret.get(3) %>"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="Gravar" />
			</td>
		</tr>
	</table>
</BODY>

<%@page import="java.security.PrivateKey"%></HTML>