package br.com.casadocodigo.loja.models;

import java.io.Serializable;
import java.math.BigDecimal;

public class CarrinhoItem implements Serializable {

    private static final long serialVersionUID = 1L;

    private Produto produto;
    private TipoPreco tipo;

    public CarrinhoItem(Produto produto, TipoPreco tipo) {
        this.produto = produto;
        this.tipo = tipo;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public TipoPreco getTipo() {
        return tipo;
    }

    public void setTipo(TipoPreco tipo) {
        this.tipo = tipo;
    }

    public BigDecimal getPreco() {
        return produto.precoPara(tipo);
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((produto == null) ? 0 : produto.hashCode());
        result = prime * result + ((tipo == null) ? 0 : tipo.hashCode());

        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
                return true;
        if (obj == null)
                return false;
        if (getClass() != obj.getClass())
                return false;

        CarrinhoItem other = (CarrinhoItem) obj;

        if (produto == null) {
            if (other.produto != null)
                return false;
        } else if (!produto.equals(other.produto))
            return false;

        if (tipo != other.tipo)
                return false;

        return true;
    }

    public BigDecimal getTotal(int quantidade) {
        return this.getPreco().multiply(new BigDecimal(quantidade));
    }
}
