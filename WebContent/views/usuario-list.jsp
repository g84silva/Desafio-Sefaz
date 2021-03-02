<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><html>
<%@ page import="br.com.desafio.sefaz.model.Usuario"%>
<!DOCTYPE HTML>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Lista de Usuários</title>
<style>
body {
  background-image: url('images/imagemfundo.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover; 	
}
</style>
</head>
<jsp:include page="usuario-menu.jsp"/>
<body>

	<div class="container">	
  		<div align="center">
			<br><br>
				<h1>Lista de Usuários</h1>
			&nbsp;&nbsp;&nbsp;
		<table class="table table-striped table-bordered table-light table-hover">
			<thead class="thead-primary">
				<tr align="center">
					<th scope="col">ID</th>
					<th scope="col">NOME</th>
					<th scope="col">EMAIL</th>
					<th scope="col">TELEFONES</th>
					<th scope="col">AÇÕES</th>
				</tr>
			</thead>
			<c:forEach var="usuario" items="${usuarios}">
				<tbody>
					<tr align="center">
						<th scope="row"><c:out value="${usuario.id}"/></th>
						<td><c:out value="${usuario.nome}"/></td>
						<td><c:out value="${usuario.email}"/></td>
						<td>
						<a href="${pageContext.request.contextPath}/telefone?acao=listar&usuario_id=<c:out value="${usuario.id}"/>">Telefones</a>
						</td>
						<td colspan="2" align="center">
						
						<c:if test="${usuario.id eq sessionScope.usuario.id}">
						
						<a href="${pageContext.request.contextPath}/usuario?acao=editar&id=<c:out value='${usuario.id}'/>">Atualizar</a>
						
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/usuario?acao=excluir&id=<c:out value='${usuario.id}'/>">Excluir</a>
						</c:if>
						</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
	</div>
	

	
	
	
	
	
	
	
	







	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>