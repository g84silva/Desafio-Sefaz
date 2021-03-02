<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Desafio Sefaz</title>
<style>
body {
  background-image: url('images/imagemfundo.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover; 	
}
</style>
</head>
<jsp:include page="usuario-menu.jsp" />
<body>
<br><br><br><br>
<div class="container container-center">
	<div class="form-group" align="center">
    	<label>
    		<h2>Olá <c:out value="${usuario.nome}"/>, seja bem-vindo(a)!</h2>
    	</label>  	
  	</div>
</div>
	
</body>
</html>