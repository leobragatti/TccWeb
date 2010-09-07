<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="br.com.fiap.digital.Digital"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Digital d = new Digital(out);
		byte[] b = d.getTemplate(null,1).serialize();
		//DPFPTemplate dedo = d.getTemplate(null,1);
		double resultado = 0;
		for(int i=0;i<b.length;i++){
			resultado += b[i];
			out.println(b[i]+"<br>");
		}
		out.println("Resultado: " + resultado + "<br>");
		
	%>
</body>
</html>