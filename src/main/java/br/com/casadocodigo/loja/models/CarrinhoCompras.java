package br.com.casadocodigo.loja.models;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION, proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CarrinhoCompras {

    private Map<CarrinhoItem, Integer> items = new LinkedHashMap<CarrinhoItem, Integer>();

    public BigDecimal total() {
        BigDecimal total = BigDecimal.ZERO;

        for (CarrinhoItem item : items.keySet()) {
            total = total.add(getTotal(item));
        }

        return total;
    }

    public void add(CarrinhoItem item) {
        items.put(item, getQuantidade(item) + 1);
    }

    public Integer getQuantidade(CarrinhoItem item) {
        if(!items.containsKey(item)) {
            items.put(item, 0);
        }

        return items.get(item);
    }

    public int getQuantidade() {
        return items
                    .values()
                    .stream()
                    .reduce(0, (proximo, acumulador) -> proximo + acumulador);
    }

    public BigDecimal getTotal(CarrinhoItem item) {
        return item.getTotal(getQuantidade(item));
    }

    public Collection<CarrinhoItem> getItems() {
        return items.keySet();
    }

    public void remover(Integer produtoId, TipoPreco tipoPreco) {
        Produto produto = new Produto();
        produto.setId(produtoId);

        items.remove(new CarrinhoItem(produto, tipoPreco));
    }
}
