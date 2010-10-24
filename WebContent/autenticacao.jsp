<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="br.com.fiap.digital.*"%>
<%@page import="java.util.*"%>
<%@page import="br.com.fiap.pessoa.*"%>
<html>
	<head>
		<script type="text/javascript" src="script/jQuery.js"></script>
		<script type="text/javascript" src="script/jQuery-ui.js"></script>
		<script type="text/javascript">
			$(function(){
				$.get("/TccWeb/autenticar.jsp", function(data){
					$('#areaAjax').html(data);
				});
			});
		</script>
		
		<link type="text/css" href="css/smoothness/jquery-ui-1.8.5.custom.css" rel="stylesheet" />	
		
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Registro Digital</title>
	</head>
<body>
	<div id="areaAjax">
	</div>
</body>
</html>