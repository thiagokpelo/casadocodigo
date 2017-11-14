package br.com.casadocodigo.loja.validacoes;

import br.com.casadocodigo.loja.models.Produto;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ProdutoValidation implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return Produto.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmpty(errors, "titulo", "field.required", "field.required.produto.titulo");
        ValidationUtils.rejectIfEmpty(errors, "descricao", "field.required", "field.required.produto.descricao");

        Produto produto = (Produto) target;

        if (produto.getPaginas() == null || produto.getPaginas() <= 0) {
            errors.rejectValue("paginas", "field.required");
        }
    }
}
