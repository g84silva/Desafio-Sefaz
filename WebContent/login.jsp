<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
<body>
	<div class="container">
	<div class="container col-md-8 col-md-offset-3 align-items-center" style="overflow: auto">
		<div align="center">
			<br><br>
			<h1>Desafio Sefaz</h1>
		</div>
		<br>
		<h2>Login:</h2>
		<br>
		<form action="${pageContext.request.contextPath}/Autorizar" method="post">
			
			<div class="form-group">
				<input type="email" class="form-control" id="userEmail"
					placeholder="exemplo@email.com" name="email" required>
			</div>
			
			<div class="form-group">
				<input type="password" class="form-control" id="userSenha"
					placeholder="senha" name="senha" required>
			</div>
			
			<c:if test="${sessionScope.msg ne null}">
			<p class="text-danger font-weight-bold"><c:out value="${sessionScope.msg}"></p></c:out>
			<c:set var="msg" value="" scope="session" />

			</c:if>
			<table>
				<tr colspan="2" align="center">
					<div align="center">
						<button type="submit" class="btn btn-primary">Efetuar login</button>
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div align="center">
						<a href="${pageContext.request.contextPath}/Cadastrar"><h5>Cadastrar-se<h5></a>
					</div>
				</tr>
			</table>
		</form>
	</div>
	</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>