<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Desafio Sefaz</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
body {
  background-image: url('images/imagemfundo.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover; 	
}
</style>
</head>
<body>
	<div align="center"><a href="${pageContext.request.contextPath}/">Home</a></div>
	<div class="container" align="center">
		<form action="${pageContext.request.contextPath}/Cadastrar" method="post">
			<caption>
				<br><br>
				<h2>Cadastro de usuário</h2>
			</caption>
			<br>
			<div class="form-col">
				<div class="col col-6">
					<input type="text" class="form-control" placeholder="Nome" name="nome" id="usuNome" required />
				</div>
				<br>
				<div class="col col-6">
					<input type="email" class="form-control" placeholder="exemplo@email.com" name="email" id="usuEmail"
						required />
				</div>
				<br>
				<div class="col col-6">
					<input type="password" class="form-control" placeholder="Senha" name="senha" id="usuSenha"
						required />
				</div>
			</div>
			<br>
			<div>
				<button type="submit" value="Salvar" class="btn btn-primary">Salvar</button>
			</div>
		</form>
	</div>			
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
</body>
</html>