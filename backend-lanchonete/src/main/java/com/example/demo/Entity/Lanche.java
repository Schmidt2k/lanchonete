package com.example.demo.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="LANCHE")
public class Lanche {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_lanche")
	private Integer idLanche;
	
	@Column(name="imagem")
	private String imagem;
	
	@Column(name="titulo")
	private String titulo;
	
	@Column(name="valor_lanche")
	private double valorLanche;
	
	@Column(name="ingredientes")
	private String ingredientes;

	public String getIngredientes() {
		return ingredientes;
	}

	public void setIngredientes(String ingredientes) {
		this.ingredientes = ingredientes;
	}

	public Integer getIdLanche() {
		return idLanche;
	}

	public void setIdLanche(Integer idLanche) {
		this.idLanche = idLanche;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public double getValorLanche() {
		return valorLanche;
	}

	public void setValorLanche(double valorLanche) {
		this.valorLanche = valorLanche;
	}
	
}
