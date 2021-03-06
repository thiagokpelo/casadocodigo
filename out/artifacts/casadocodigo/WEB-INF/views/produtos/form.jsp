<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Livros de Java, Android, iPhone, Ruby, PHP e muito mais - Casa do Código</title>
</head>
<body>
    <h1>Cadastrar Livro</h1>

    <form action="${s:mvcUrl('PC#gravar').build()}" method="post" enctype="multipart/form-data">
    	<div>
    		<label>Titulo</label>
    		<form:input path="produto.titulo" />
			<form:errors path="produto.titulo" />
    	</div>
    	<div>
    		<label>Descrição</label>
    		<form:textarea path="produto.descricao" rows="10" cols="20" />
			<form:errors path="produto.descricao" />
    	</div>
    	<div>
    		<label>Páginas</label>
    		<form:input path="produto.paginas" />
			<form:errors path="produto.paginas" />
    	</div>

		<div>
			<label>Data de Lançamento</label>
			<form:input path="produto.dataLancamento"  />
			<form:errors path="produto.dataLancamento" />
		</div>
    	
    	<c:forEach items="${tipos }" var="tipo" varStatus="status">
    	<div>
    		<label>${tipo }</label>
    		<form:input path="produto.precos[${status.index }].valor" />
    		<form:hidden path="produto.precos[${status.index }].tipo" value="${tipo }" />
    	</div>
    	</c:forEach>

		<div>
			<label>Sumário</label>
			<input name="sumario" type="file">
		</div>
    	
    	<button type="submit">Cadastrar</button>
    </form>
</body>
</html>
