<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="pt-BR">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width">

	<title>${produto.titulo} - Casa do Código</title>
</head>
<body class="produto">
	<header>
		<h1>Casa do Código</h1>
		<h2><a href="${s:mvcUrl('CC#items').build()}">Seu carrinho (${carrinhoCompras.quantidade})</a></h2>
	</header>
	<main>
		<article id="${produto.id}">
			<header class="cabecalhoProdutoLivro container">

				<h1>
					Teste
					${produto.titulo}
				</h1>

				<div class="imagemLivroNinja" role="img">
					<img class="imagemLivroNinja-principal" class="vitrineDestacao-itemPrincipal-imagem" src="//cdn.shopify.com/s/files/1/0155/7645/products/java8-featured_large.png?v=1411490181" alt="Livro de Java 8" title="Livro de Java 8">
				</div>

			</header>

	
			<form action='<c:url value="/carrinho/adicionar" />' method="POST">
				<input type="hidden" value="${produto.id}" name="produtoId">
				<ul class="adicionarAoCarrinho-listaOfertas">

					<c:forEach items="${produto.precos}" var="preco" >
						<li class="adicionarAoCarrinho-oferta">
							<label class="adicionarAoCarrinho-infosDaOferta">
									<span class="adicionarAoCarrinho-tipoDaOferta-nome">
										${preco.tipo}
									</span>
								<p class="adicionarAoCarrinho-preco">
									<span class="adicionarAoCarrinho-preco-valor" itemprop="price">
										R$ ${preco.valor}
									</span>
								</p>
							</label>
							<input type="radio" name="tipo" class="variant-radio" id="product-variant-970167977" value="${preco.tipo}">
							<button class="adicionarAoCarrinho-botaoComprar" type="submit">
								Comprar
							</button>
						</li>
					</c:forEach>

				</ul>
			</form>

			<section class="conteudoDoLivro infoSection" itemprop="description">
				<h2 class="infoSection-titulo">
					Conteúdo
				</h2>

				<p class="infoSection-texto">
					${produto.descricao}
				</p>
			</section>

			<section class="infosAdicionaisDoLivro infoSection">
				<h2 class="infoSection-titulo">
					Dados do produto
				</h2>
				<dl class="infosAdicionaisDoLivro-info">
					<dt class="infosAdicionaisDoLivro-info-titulo">
						Número de páginas:
					</dt>
					<dd class="infosAdicionaisDoLivro-info-valor" itemprop="numberOfPages">
						${produto.paginas}
					</dd>

					<dt class="infosAdicionaisDoLivro-info-titulo">
						Data Lançamento:
					</dt>
					<dd class="infosAdicionaisDoLivro-info-valor" itemprop="isbn">
						<fmt:formatDate pattern="dd/MM/yyyy" value="${produto.dataLancamento.time}" />
					</dd>
				</dl>
			</section>

		</article>
	</main>
</body>
</html>
