<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

	<div class="container col-md-8 col-md-offset-3" style="overflow: auto">
		<h1>Login:</h1>
		<br>
		<form action="${pageContext.request.contextPath}/usuario?acao=autenticar" method="post">
			<div class="form-group">
				<input type="password" class="form-control" id="username"
					placeholder="Usuario" name="nome" required>
			</div>
			
			<div class="form-group">
				<input type="password" class="form-control" id="password"
					placeholder="Email" name="email" required>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="form-row" align="center" >
				<div align="center" class="col col-7">
				<button type="submit" class="btn btn-primary">Efetuar login</button>
				</div >
				<div align="center" class="col col-3">
				<a href="${pageContext.request.contextPath}/usuario?acao=novo">Cadastrar-se</a>
				</div>					
			</div>
		</form>
	</div>
</body>
</html>