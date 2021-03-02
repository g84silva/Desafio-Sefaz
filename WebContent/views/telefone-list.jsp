<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Lista de telefones</title>
<style>
body {
  background-image: url('images/imagemfundo.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover; 	
}
</style>
</head>
<jsp:include page="telefone-menu.jsp"/>
<body>
	<br>
	<br>
	<center>
		<h1>Lista dos telefones de <c:out value='${usuario.nome}'/></h1>
	</center>
	<br>
	<div class="container">
  		<div align="center">
		<table class="table table-striped table-bordered table-light table-hover">
			<thead class="thead-primary">
				<tr align="center">
					<th scope="col">ID</th>
					<th scope="col">DDD</th>
					<th scope="col">NUMERO</th>
					<th scope="col">TIPO</th>
					<th scope="col">AÇÕES</th>
				</tr>
			</thead>
			<c:forEach var="telefone" items="${telefones}">
				<tbody>
					<tr align="center">
						<th scope="row"><c:out value="${telefone.id}"/></th>
						<td><c:out value="${telefone.ddd}"/></td>
						<td><c:out value="${telefone.numero}"/></td>
						<td><c:out value="${telefone.tipo}"/></td>
						<td colspan="2" align="center">
						<c:if test="${usuario.id eq sessionScope.usuario.id}">
						<a href="${pageContext.request.contextPath}/telefone?acao=editar&usuario_id=<c:out value='${usuario.id}'/>&id=<c:out value='${telefone.id}'/>">Atualizar</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/telefone?acao=excluir&usuario_id=<c:out value='${usuario.id}'/>&id=<c:out value='${telefone.id}'/>">Excluir</a>
						</c:if>
						</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
	</div>
	











	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>