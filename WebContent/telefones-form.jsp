<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Desafio Sefaz</title>
</head>
<body>
	<center>
		<h2>
			<a href="${pageContext.request.contextPath}/usuario?acao=listar">Listar Usuários</a>
		</h2>
	</center>
	<div align="center">
		<h2>
			Usuário: <c:out value='${telefone.usuario.nome}'/>
		</h2>
		<c:if test="${telefone != null}">
			<form action="${pageContext.request.contextPath}/telefone?acao=atualizar&usuario_id=<c:out value='${usuario.id}'/>&id=<c:out value='${telefone.id}'/>" method="post">
		</c:if>
		<c:if test="${telefone == null}">
			<form action="${pageContext.request.contextPath}/telefone?acao=inserir&usuario_id=<c:out value='${usuario.id}'/>" method="post">
		</c:if>
			<caption>
				<h2>
					<c:if test="${telefone != null}">
            			Atualizar telefone
            		</c:if>
					<c:if test="${telefone == null}">
            			Adicionar telefone
            		</c:if>
				</h2>
			</caption>
			<c:if test="${teleofne != null}">
        			<input type="hidden" name="id" value="<c:out value='${telefone.id}' />" />
        		</c:if> 
			
				<div class="form-col">
					<div class="col col-6">
						<input type="number" class="form-control" placeholder="DDD" name="ddd"
							value="<c:out value="${telefone.ddd}"/>"/>
					</div>
					<br>
					<div class="col col-6">
						<input type="text" class="form-control" placeholder="Numero" name="numero"
							value="<c:out value="${telefone.numero}"/>"/>
					</div>
					<br>
					<div class="col col-6">
						<input type="text" class="form-control" placeholder="Residencial ou Celular" name="tipo"
							value="<c:out value="${telefone.tipo}"/>"/>
					</div>
				</div>
				<br>
				<div>
					<c:if test="${telefone != null}">
						<button type="submit" value="Atualizar" class="btn btn-primary">Atualizar</button>
					</c:if>
					<c:if test="${telefone == null}">
						<button type="submit" value="Salvar" class="btn btn-primary">Salvar</button>
					</c:if>
				</div>
			</form>
	</div>
</body>
</html>