package br.com.casadocodigo.loja.models;

import org.springframework.stereotype.Component;

import java.util.LinkedHashMap;
import java.util.Map;

@Component
public class CarrinhoCompras {

    private Map<CarrinhoItem, Integer> items = new LinkedHashMap<CarrinhoItem, Integer>();

    public void add(CarrinhoItem item) {
        items.put(item, getQuantidade(item) + 1);
    }

    private Integer getQuantidade(CarrinhoItem item) {
        if(items.containsKey(item)) {
            items.put(item, 0);
        }

        return items.get(item);
    }


}
