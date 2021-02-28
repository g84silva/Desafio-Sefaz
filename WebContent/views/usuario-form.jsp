<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Adicionar Usuario</title>

<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="usuario-menu.jsp" />
	<br>
	<div class="container">
		<div align="center">
			<c:if test="${usuario != null}">
				<form action="${pageContext.request.contextPath}/usuario?acao=atualizar" method="post">
			</c:if>
			<c:if test="${usuario == null}">
				<form action="${pageContext.request.contextPath}/usuario?acao=inserir" method="post">
			</c:if>
			<caption>
				<h2>
					<c:if test="${usuario != null}">
            			Atualizar usuário
            		</c:if>
					<c:if test="${usuario == null}">
            			Cadastro de usuário
            		</c:if>
				</h2>
			</caption>
			<br>
			<c:if test="${usuario != null}">
				<input type="hidden" name="id"
					value="<c:out value='${usuario.id}' />" />
			</c:if>

			<div class="form-col">
				<div class="col col-6">
					<input type="text" class="form-control" placeholder="Nome" name="nome" id="usuNome" required
						value="<c:out value="${usuario.nome}"/>" />
				</div>
				<br>
				<div class="col col-6">
					<input type="email" class="form-control"
						placeholder="exemplo@email.com" name="email" id="usuEmail" required
						value="<c:out value="${usuario.email}"/>" />
				</div>
			</div>
			<br>
			<div>
				<c:if test="${usuario != null}">
					<button type="submit" value="Atualizar" class="btn btn-primary"
						data-toggle="modal" data-target="#modalAtualizar">Atualizar</button>
				</c:if>
				<c:if test="${usuario == null}">
					<button type="submit" value="Salvar" class="btn btn-primary"
						data-toggle="modal" data-target="#modalCadastro">Salvar</button>
				</c:if>
			</div>
		</div>
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

	<div class="modal fade" tabindex="-1" id="modalAtualizar">
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
					<p>Usuário atualizado!</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
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