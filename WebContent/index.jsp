<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="br.com.fiap.digital.*"%>
<%@page import="java.util.*"%>
<%@page import="br.com.fiap.pessoa.*"%>
<%@include file="verificar.jsp" %>
<html>
	<head>
		<script type="text/javascript" src="script/jQuery.js"></script>
		<script type="text/javascript" src="script/jQuery-ui.js"></script>
		
		<script type="text/javascript" src="script/menu.js"></script>
		
		<link type="text/css" href="css/smoothness/jquery-ui-1.8.5.custom.css" rel="stylesheet" />	
		<link href="style/style.css" rel="stylesheet" type="text/css" media="screen" />
		
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Registro Digital</title>
	</head>
<body>
	<div class="logo">
		<h1><a href="#">Registro Digital</a></h1>
		<p><em> TCC 2010</a></em></p>
	</div>
	<hr />
	<div class="header">
		<div class="menu">
			<ul>
				<li><a href="#" class="first" id="home">Home</a></li>
				<li class="current_page_item"><a href="#" id="cadastro" onClick="abrirPagina(this);">Cadastro</a></li>
				<li><a href="#" id="autenticar" onClick="abrirPagina(this);">Autenticar</a></li>
				<li><a href="#" id="visualizar" onClick="abrirPagina(this);">Visualizar</a></li>
				<li><a href="#" id="dados" onClick="abrirPagina(this);">Dados</a></li>
				<li><a href="#" id="sair" onClick="abrirPagina(this);">Sair</a></li>
			</ul>
		</div>
		<!-- end #menu -->
	</div>
	<div id="areaAjax" class="page">
		<div style="clear: both;">&nbsp;</div>
	</div>
	<br />
	<!-- end #page -->
	<div class="footer">
		<p>Trabalho de conclus&atilde;o de curso elaborado em 2010<br /> Todos os direitos reservados</p>
	</div>
	<!-- end #footer -->
	
</body>
</html>