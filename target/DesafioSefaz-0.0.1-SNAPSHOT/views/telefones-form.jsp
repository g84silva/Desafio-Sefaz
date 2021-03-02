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
					<select class="form-control" name="ddd" id="ddd">
						<option value="">Selecione um DDD</option>
						<option value="11" ${telefone.ddd == '11' ? 'selected' : ''}>11</option>
						<option value="12" ${telefone.ddd == '12' ? 'selected' : ''}>12</option>
						<option value="13" ${telefone.ddd == '13' ? 'selected' : ''}>13</option>
						<option value="14" ${telefone.ddd == '14' ? 'selected' : ''}>14</option>
						<option value="15" ${telefone.ddd == '15' ? 'selected' : ''}>15</option>
						<option value="16" ${telefone.ddd == '16' ? 'selected' : ''}>16</option>
						<option value="17" ${telefone.ddd == '17' ? 'selected' : ''}>17</option>
						<option value="18" ${telefone.ddd == '18' ? 'selected' : ''}>18</option>
						<option value="19" ${telefone.ddd == '19' ? 'selected' : ''}>19</option>
						<option value="21" ${telefone.ddd == '21' ? 'selected' : ''}>21</option>
						<option value="22" ${telefone.ddd == '22' ? 'selected' : ''}>22</option>
						<option value="23" ${telefone.ddd == '23' ? 'selected' : ''}>23</option>
						<option value="24" ${telefone.ddd == '24' ? 'selected' : ''}>24</option>
						<option value="25" ${telefone.ddd == '25' ? 'selected' : ''}>25</option>
						<option value="26" ${telefone.ddd == '26' ? 'selected' : ''}>26</option>
						<option value="27" ${telefone.ddd == '27' ? 'selected' : ''}>27</option>
						<option value="28" ${telefone.ddd == '28' ? 'selected' : ''}>28</option>
						<option value="29" ${telefone.ddd == '29' ? 'selected' : ''}>29</option>
						<option value="31" ${telefone.ddd == '31' ? 'selected' : ''}>31</option>
						<option value="32" ${telefone.ddd == '32' ? 'selected' : ''}>32</option>
						<option value="33" ${telefone.ddd == '33' ? 'selected' : ''}>33</option>
						<option value="34" ${telefone.ddd == '34' ? 'selected' : ''}>34</option>
						<option value="35" ${telefone.ddd == '35' ? 'selected' : ''}>35</option>
						<option value="36" ${telefone.ddd == '36' ? 'selected' : ''}>36</option>
						<option value="37" ${telefone.ddd == '37' ? 'selected' : ''}>37</option>
						<option value="38" ${telefone.ddd == '38' ? 'selected' : ''}>38</option>
						<option value="39" ${telefone.ddd == '39' ? 'selected' : ''}>39</option>
						<option value="41" ${telefone.ddd == '41' ? 'selected' : ''}>41</option>
						<option value="42" ${telefone.ddd == '42' ? 'selected' : ''}>42</option>
						<option value="43" ${telefone.ddd == '43' ? 'selected' : ''}>43</option>
						<option value="44" ${telefone.ddd == '44' ? 'selected' : ''}>44</option>
						<option value="45" ${telefone.ddd == '45' ? 'selected' : ''}>45</option>
						<option value="46" ${telefone.ddd == '46' ? 'selected' : ''}>46</option>
						<option value="47" ${telefone.ddd == '47' ? 'selected' : ''}>47</option>
						<option value="48" ${telefone.ddd == '48' ? 'selected' : ''}>48</option>
						<option value="49" ${telefone.ddd == '49' ? 'selected' : ''}>49</option>
						<option value="51" ${telefone.ddd == '51' ? 'selected' : ''}>51</option>
						<option value="52" ${telefone.ddd == '52' ? 'selected' : ''}>52</option>
						<option value="53" ${telefone.ddd == '53' ? 'selected' : ''}>53</option>
						<option value="54" ${telefone.ddd == '54' ? 'selected' : ''}>54</option>
						<option value="55" ${telefone.ddd == '55' ? 'selected' : ''}>55</option>
						<option value="56" ${telefone.ddd == '56' ? 'selected' : ''}>56</option>
						<option value="57" ${telefone.ddd == '57' ? 'selected' : ''}>57</option>
						<option value="58" ${telefone.ddd == '58' ? 'selected' : ''}>58</option>
						<option value="59" ${telefone.ddd == '59' ? 'selected' : ''}>59</option>
						<option value="61" ${telefone.ddd == '61' ? 'selected' : ''}>61</option>
						<option value="62" ${telefone.ddd == '62' ? 'selected' : ''}>62</option>
						<option value="63" ${telefone.ddd == '63' ? 'selected' : ''}>63</option>
						<option value="64" ${telefone.ddd == '64' ? 'selected' : ''}>64</option>
						<option value="65" ${telefone.ddd == '65' ? 'selected' : ''}>65</option>
						<option value="66" ${telefone.ddd == '66' ? 'selected' : ''}>66</option>
						<option value="67" ${telefone.ddd == '67' ? 'selected' : ''}>67</option>
						<option value="68" ${telefone.ddd == '68' ? 'selected' : ''}>69</option>
						<option value="71" ${telefone.ddd == '71' ? 'selected' : ''}>71</option>
						<option value="72" ${telefone.ddd == '72' ? 'selected' : ''}>72</option>
						<option value="73" ${telefone.ddd == '73' ? 'selected' : ''}>73</option>
						<option value="74" ${telefone.ddd == '74' ? 'selected' : ''}>74</option>
						<option value="75" ${telefone.ddd == '75' ? 'selected' : ''}>75</option>
						<option value="76" ${telefone.ddd == '76' ? 'selected' : ''}>76</option>
						<option value="77" ${telefone.ddd == '77' ? 'selected' : ''}>77</option>
						<option value="78" ${telefone.ddd == '78' ? 'selected' : ''}>78</option>
						<option value="79" ${telefone.ddd == '79' ? 'selected' : ''}>79</option>
						<option value="81" ${telefone.ddd == '81' ? 'selected' : ''}>81</option>
						<option value="82" ${telefone.ddd == '82' ? 'selected' : ''}>82</option>
						<option value="83" ${telefone.ddd == '83' ? 'selected' : ''}>83</option>
						<option value="84" ${telefone.ddd == '84' ? 'selected' : ''}>84</option>
						<option value="85" ${telefone.ddd == '85' ? 'selected' : ''}>85</option>
						<option value="86" ${telefone.ddd == '86' ? 'selected' : ''}>86</option>
						<option value="87" ${telefone.ddd == '87' ? 'selected' : ''}>87</option>
						<option value="88" ${telefone.ddd == '88' ? 'selected' : ''}>88</option>
						<option value="89" ${telefone.ddd == '89' ? 'selected' : ''}>89</option>
						<option value="91" ${telefone.ddd == '91' ? 'selected' : ''}>91</option>
						<option value="92" ${telefone.ddd == '92' ? 'selected' : ''}>92</option>
						<option value="93" ${telefone.ddd == '93' ? 'selected' : ''}>93</option>
						<option value="94" ${telefone.ddd == '94' ? 'selected' : ''}>94</option>
						<option value="95" ${telefone.ddd == '95' ? 'selected' : ''}>95</option>
						<option value="96" ${telefone.ddd == '96' ? 'selected' : ''}>96</option>
						<option value="97" ${telefone.ddd == '97' ? 'selected' : ''}>97</option>
						<option value="98" ${telefone.ddd == '98' ? 'selected' : ''}>98</option>
						<option value="99" ${telefone.ddd == '99' ? 'selected' : ''}>99</option>
					</select>
				</div>
					<br>
					<div class="col col-6">
						<input type="text" class="form-control" placeholder="Número" name="numero" id="numero" required
							 maxlength="10" value="<c:out value="${telefone.numero}"/>"/>
						<select class="form-control" name="tipo" id="tipo">
						<option value="Celular" ${telefone.tipo == 'Comercial' ? 'selected' : ''}>Comercial</option>
						<option value="Fixo" ${telefone.tipo == 'Fixo' ? 'selected' : ''}>Fixo</option>
						</select>
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