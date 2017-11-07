<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Livros de Java, Android, iPhone, Ruby, PHP e muito mais - Casa do Código</title>
</head>
<body>
    <h1>Cadastrar Livro</h1>
    
    <form action="/casadocodigo/produtos" method="post">
    	<div>
    		<label>Titulo</label>
			<form:errors path="produto.titulo" />
    		<input type="text" name="titulo" />
    	</div>
    	<div>
    		<label>Descrição</label>
			<form:errors path="produto.descricao" />
    		<textarea rows="10" cols="20" name="descricao"></textarea>
    	</div>
    	<div>
    		<label>Páginas</label>
			<form:errors path="produto.paginas" />
    		<input type="number" name="paginas" />
    	</div>
    	
    	<c:forEach items="${tipos }" var="tipoPreco" varStatus="status">
    	<div>
    		<label>${tipoPreco }</label>
    		<input type="text" name="precos[${status.index }].valor" />
    		<input type="hidden" name="precos[${status.index }].tipo" value="${tipoPreco }" />
    	</div>
    	</c:forEach>
    	
    	
    	<button type="submit">Cadastrar</button>
    </form>
</body>
</html>
