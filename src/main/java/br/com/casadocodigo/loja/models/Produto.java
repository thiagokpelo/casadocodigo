package br.com.casadocodigo.loja.models;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Calendar;
import java.util.List;

import javax.persistence.*;

@Entity
public class Produto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String titulo;

	@Lob
	private String descricao;
	private Long paginas;

	@DateTimeFormat
	private Calendar dataLancamento;

	@ElementCollection
	private List<Preco> precos;
	
	public List<Preco> getPrecos() {
		return precos;
	}
	public void setPrecos(List<Preco> precos) {
		this.precos = precos;
	}
	public int getId() {
		return id;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Long getPaginas() {
		return paginas;
	}
	public void setPaginas(Long paginas) {
		this.paginas = paginas;
	}
	public Calendar getDataLancamento() {
		return dataLancamento;
	}
	public void setDataLancamento(Calendar dataLancamento) {
		this.dataLancamento = dataLancamento;
	}
	
	@Override
	public String toString() {
		return "Produto [titulo=" + titulo + ", descricao=" + descricao + ", paginas=" + paginas + "]";
	}
}
