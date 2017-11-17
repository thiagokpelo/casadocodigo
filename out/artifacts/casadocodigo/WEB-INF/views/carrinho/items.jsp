<%--
  Created by IntelliJ IDEA.
  User: ThiagoCapelo
  Date: 17/11/2017
  Time: 08:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Itens do Carrinho</title>
</head>
<body>
    <h1>Carrinho de compras</h1>
    <h2><a href="${s:mvcUrl('CC#items').build()}">Seu carrinho (${carrinhoCompras.quantidade})</a></h2>
    <table>
        <thead>
            <tr>
                <th></th>
                <th>Título</th>
                <th>Preço</th>
                <th>Quantidade</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${carrinhoCompras.items}" var="item">
            <tr>
                <td><img class="imagemLivroNinja-principal" class="vitrineDestacao-itemPrincipal-imagem" src="//cdn.shopify.com/s/files/1/0155/7645/products/java8-featured_large.png?v=1411490181" alt="Livro de Java 8" title="Livro de Java 8"></td>
                <td>${item.produto.titulo}</td>
                <td>${item.tipo}</td>
                <td>
                    <input type="number" min="0" id="quantidade" name="quantidade" value="${carrinhoCompras.getQuantidade(item)}">
                </td>
                <td>${carrinhoCompras.getTotal(item)}</td>
                <td>
                    <form action="${s:mvcUrl('CC#remover').arg(0, item.produto.id).arg(1, item.tipo).build()}" method="post">
                        <button type="submit">Excluir</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
            <tr>
                <td>
                    <form action="${s:mvcUrl('PC#finalizar').build()}" method="post">
                        <button type="submit">Finalizar Compra</button>
                    </form>
                </td>
                <td>${carrinhoCompras.total()}</td>
            </tr>
        </tfoot>
    </table>
</body>
</html>
