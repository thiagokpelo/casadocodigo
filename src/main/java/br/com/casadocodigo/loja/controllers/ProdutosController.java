package br.com.casadocodigo.loja.controllers;

import java.util.List;

import br.com.casadocodigo.loja.infra.FileSaver;
import br.com.casadocodigo.loja.validacoes.ProdutoValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import br.com.casadocodigo.loja.daos.ProdutoDAO;
import br.com.casadocodigo.loja.models.Produto;
import br.com.casadocodigo.loja.models.TipoPreco;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/produtos")
public class ProdutosController {
	
	@Autowired
	private ProdutoDAO produtoDAO;

	@Autowired
	private FileSaver fileSaver;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(new ProdutoValidation());
	}
	
	@RequestMapping(value="/form", method=RequestMethod.GET)
	public ModelAndView form(Produto produto) {
		ModelAndView modelAndView = new ModelAndView("produtos/form");
		modelAndView.addObject("tipos", TipoPreco.values());
		
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView listar() {
		List<Produto> produtos = produtoDAO.listar();
		ModelAndView modelAndView = new ModelAndView("produtos/lista");
		modelAndView.addObject("produtos", produtos);
		
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	@CacheEvict(value = "produtosHome", allEntries = true)
	public ModelAndView gravar(MultipartFile sumario, @Valid Produto produto, BindingResult result, RedirectAttributes redirectAttributes) {

		if(result.hasErrors()) {
			return form(produto);
		}

		String path = fileSaver.write("sumario", sumario);
		produto.setSumarioPath(path);

		produtoDAO.gravar(produto);
		redirectAttributes.addFlashAttribute("sucesso", "Produto cadastrado com sucesso");

		return new ModelAndView("redirect:produtos");
	}

	@RequestMapping(value = "/detalhe/{id}", method = RequestMethod.GET)
	public ModelAndView detalhe(@PathVariable("id") Integer id) {
		ModelAndView mv = new ModelAndView("produtos/detalhe");
		Produto produto = produtoDAO.find(id);

		mv.addObject("produto", produto);

		return mv;
	}
}
