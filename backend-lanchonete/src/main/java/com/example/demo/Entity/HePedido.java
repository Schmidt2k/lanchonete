package com.example.demo.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class HePedido {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id_pedido;
	
	private Integer id_mesa;
	
	private String nome_cliente;
	
	private Integer id_lanche;
	
	private String nome_lanche;
	
	private Integer qtd_lanche;
	
	private Double valor_lanche;
	
	private String obs_lanche;

	public Long getId_pedido() {
		return id_pedido;
	}

	public void setId_pedido(Long id_pedido) {
		this.id_pedido = id_pedido;
	}

	public Integer getId_mesa() {
		return id_mesa;
	}

	public void setId_mesa(Integer id_mesa) {
		this.id_mesa = id_mesa;
	}

	public String getNome_cliente() {
		return nome_cliente;
	}

	public void setNome_cliente(String nome_cliente) {
		this.nome_cliente = nome_cliente;
	}

	public Integer getId_lanche() {
		return id_lanche;
	}

	public void setId_lanche(Integer id_lanche) {
		this.id_lanche = id_lanche;
	}

	public String getNome_lanche() {
		return nome_lanche;
	}

	public void setNome_lanche(String nome_lanche) {
		this.nome_lanche = nome_lanche;
	}

	public Integer getQtd_lanche() {
		return qtd_lanche;
	}

	public void setQtd_lanche(Integer qtd_lanche) {
		this.qtd_lanche = qtd_lanche;
	}

	public Double getValor_lanche() {
		return valor_lanche;
	}

	public void setValor_lanche(Double valor_lanche) {
		this.valor_lanche = valor_lanche;
	}

	public String getObs_lanche() {
		return obs_lanche;
	}

	public void setObs_lanche(String obs_lanche) {
		this.obs_lanche = obs_lanche;
	}
}
