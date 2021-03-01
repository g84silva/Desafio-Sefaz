<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
  	<script type="text/javascript">
  	JQuery("#numero")
    .mask("99999-9999")
    .focusout(function (event) {
        let target, phone, element;
        target = (event.currentTarget) ? 
                 event.currentTarget : 
                 event.srcElement;
        phone = target.value.replace(/\D/g, '');
        element = jQuery(target);
        element.unmask();
        if (phone.length > 10) {
            element.mask("99999-9999");
        } else {
            element.mask("(99) 9999-99999");
        }
    });
	</script>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Atualizar telefone</title>
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
	<jsp:include page="telefone-menu.jsp"></jsp:include>
	<br>
	<div class="container">
  		<div align="center">
		<c:if test="${telefone != null}">
			<form action="${pageContext.request.contextPath}/telefone?acao=atualizar&usuario_id=<c:out value='${usuario.id}'/>&id=<c:out value='${telefone.id}'/>" method="post">
		</c:if>
		<c:if test="${telefone == null}">
			<form action="${pageContext.request.contextPath}/telefone?acao=inserir&usuario_id=<c:out value='${usuario.id}'/>" method="post">
		</c:if>
		<br>
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
						<input type="number" class="form-control" placeholder="DDD" name="ddd" id="ddd" required
							maxlength="2" value="<c:out value="${telefone.ddd}"/>"/>
					</div>
					<br>
					<div class="col col-6">
						<input type="text" class="form-control" placeholder="Número" name="numero" id="numero" required
							 maxlength="10" value="<c:out value="${telefone.numero}"/>"/>
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

	
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>