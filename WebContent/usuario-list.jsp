<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Desafio Sefaz</title>
</head>
<body>
	<center>
		<h1>Lista de Usuários</h1>
		<h2>
			<a href="${pageContext.request.contextPath}/usuario?acao=novo">Adicionar Usuário</a> &nbsp;&nbsp;&nbsp;
		</h2>
	</center>
	<div align="center">
		<table class="table table-striped table-bordered">
			<thead class="thead-primary">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">NOME</th>
					<th scope="col">EMAIL</th>
					<th scope="col">TELEFONES</th>
					<th scope="col">AÇÕES</th>
				</tr>
			</thead>
			<c:forEach var="usuario" items="${usuarios}">
				<tbody>
					<tr>
						<th scope="row"><c:out value="${usuario.id}"/></th>
						<td><c:out value="${usuario.nome}"/></td>
						<td><c:out value="${usuario.email}"/></td>
						<td>
						<a href="${pageContext.request.contextPath}/usuario?acao=listar&usuario_id=<c:out value="${usuario.id}"/>">Telefones</a>
						</td>
						<td>
						<a href="${pageContext.request.contextPath}/usuario?acao=editar&id=<c:out value='${usuario.id}'/>">Atualizar</a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/usuario?acao=excluir&id=<c:out value='${usuario.id}'/>">Excluir</a>
						</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>











	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>