<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Usuário</title>
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
<jsp:include page="usuario-menu-cadastro.jsp"/>
	<div class="container" align="center">
		<form action="${pageContext.request.contextPath}/usuario?acao=inserir" method="post">
			<caption>
				<br><br>
				<h2>Cadastro de usuário</h2>
			</caption>
			<br>
			<div class="form-col">
				<div class="col col-6">
					<input type="text" class="form-control" placeholder="Nome" name="nome" id="usuNome" required
						value="<c:out value="${usuario.nome}"/>" />
				</div>
				<br>
				<div class="col col-6">
					<input type="email" class="form-control" placeholder="exemplo@email.com" name="email" id="usuEmail"
						required value="<c:out value="${usuario.email}"/>" />
				</div>
			</div>
			<br>
			<div>
				<button type="submit" value="Salvar" class="btn btn-primary" data-toggle="modal" 
				data-target="#modalCadastro">Salvar</button>
			</div>
		</form>
	</div>			
	
	<div class="modal fade" tabindex="-1" id="modalCadastro">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Desafio Sefaz</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Usuário cadastrado!</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
</body>
</html>