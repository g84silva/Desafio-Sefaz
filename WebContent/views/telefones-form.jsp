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
	<jsp:include page="telefone-menu.jsp"></jsp:include>
	<br>
	<div class="container">
  		<div align="center">
		<h2>
			
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
            			Atualizar telefone de <c:out value='${usuario.nome}'/>
            		</c:if>
					<c:if test="${telefone == null}">
            			Cadastrar telefone a <c:out value='${usuario.nome}'/>
            		</c:if>
				</h2>
			</caption>
			<br>
			<c:if test="${teleofne != null}">
        			<input type="hidden" name="id" value="<c:out value='${telefone.id}' />" />
        		</c:if> 
			
				<div class="form-col">
					<div class="col col-6">
						<input type="number" class="form-control" placeholder="DDD" name="ddd" required
							value="<c:out value="${telefone.ddd}"/>"/>
					</div>
					<br>
					<div class="col col-6">
						<input type="text" class="form-control" placeholder="Numero" name="numero" required
							value="<c:out value="${telefone.numero}"/>"/>
					</div>
					<br>
					<div class="col col-6">
						<input type="text" class="form-control" placeholder="Residencial ou Celular" name="tipo" required
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
		</div>
	</div>
	
</body>
</html>