<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="br.com.fiap.digital.*"%>
<%@page import="java.util.*"%>
<%@page import="br.com.fiap.pessoa.*"%>
<html>
	<head>
		<script type="text/javascript" src="script/jQuery.js"></script>
		
		<script type="text/javascript" src="menu/jquery.dimensions.js"></script>
		<script type="text/javascript" src="menu/jquery.positionBy.js"></script>
		<script type="text/javascript" src="menu/jquery.bgiframe.js"></script>
		<script type="text/javascript" src="menu/jquery.jdMenu.js"></script>
		<script type="text/javascript" src="script/menu.js"></script>
		
		<link rel="stylesheet" href="menu/jdMenu.css" type="text/css" />	
		<link rel="stylesheet" href="menu/jdMenu.slate.css" type="text/css" />
		
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>BioID</title>
	</head>
<body>
	<div id="header">
		<div>Conteudo que vai de cabeçalho</div>
		<div id="menu">
			<ul class="jd_menu jd_menu_slate">
				<li>Home</li>
				<li id="cadastro">Cadastro</li>
				<li id="autenticar">Autenticar</li>
			</ul>
		</div>
		<div id="areaAjax">
		</div>
	</div>
</body>
</html>