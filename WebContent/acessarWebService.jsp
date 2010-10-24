<%@ page import="org.apache.axis.client.*,
				 org.apache.axis.encoding.XMLType,
				 org.apache.axis.utils.Options,
				 javax.xml.rpc.ParameterMode,java.net.URL,
				 java.util.*" %>
<%

String endpointString = "http://localhost:8080/TccWeb/services/PessoaWS?wsdl"; 

Service service1 = new Service();

Call callOne = (Call)service1.createCall();

URL endpoint = new URL(endpointString);

callOne.setTargetEndpointAddress(endpoint);

callOne.setOperationName("getInformacoes");
//callOne.
callOne.setReturnType(XMLType.XSD_STRING);
callOne.addParameter("idPessoa",XMLType.XSD_LONG,ParameterMode.IN);
callOne.addParameter("campos",XMLType.XSD_STRING,ParameterMode.IN);

String[] parametro = {"rg", "cpf"};
ArrayList ret = (ArrayList)callOne.invoke(new Object[]{61, parametro});

%>
<HTML>
<BODY>
<%
for(int i=0;i<ret.size();i++)
	out.println("Campo: " + parametro[i] + "<br />Conteudo: " + ret.get(i) + "<br>");
%>
</BODY>
</HTML>