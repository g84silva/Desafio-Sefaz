<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Adicionar Usuario</title>
</head>
<body>
	<center>
		<h1>Desfio Sefaz</h1>
		<h2>
			<a href="${pageContext.request.contextPath}/usuario?acao=listar">Listar Usuários</a>
		</h2>
	</center>
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
            			Adicionar usuário
            		</c:if>
				</h2>
			</caption>
			
			<c:if test="${usuario != null}">
        			<input type="hidden" name="id" value="<c:out value='${usuario.id}' />" />
        		</c:if> 
			
				<div class="form-col">
					<div class="col col-6">
						<input type="text" class="form-control" placeholder="Nome" name="nome"
							value="<c:out value="${usuario.nome}"/>"/>
					</div>
					<br>
					<div class="col col-6">
						<input type="text" class="form-control" placeholder="Email" name="email"
							value="<c:out value="${usuario.email}"/>"/>
					</div>
				</div>
				<br>
				<div>
					<c:if test="${usuario != null}">
						<button type="submit" value="Atualizar" class="btn btn-primary">Atualizar</button>
					</c:if>
					<c:if test="${usuario == null}">
						<button type="submit" value="Salvar" class="btn btn-primary">Salvar</button>
					</c:if>
				</div>
	</div>
</body>
</html>