package com.example.demo.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="HE_PEDIDO")
public class HePedido {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id_pedido")
	private Long idPedido;

	@Column(name="id_mesa")
	private Integer idMesa;
	
	@Column(name="nome_cliente")
	private String nomeCliente;
	
	@Column(name="id_lanche")
	private Integer idLanche;
	
	@Column(name="nome_lanche")
	private String nomeLanche;
	
	@Column(name="qtd_lanche")
	private Integer qtdLanche;
	
	@Column(name="valor_lanche")
	private Double valorLanche;
	
	@Column(name="obs_lanche")
	private String obsLanche;
	
	public Long getIdPedido() {
		return idPedido;
	}

	public void setIdPedido(Long idPedido) {
		this.idPedido = idPedido;
	}

	public Integer getIdMesa() {
		return idMesa;
	}

	public void setIdMesa(Integer idMesa) {
		this.idMesa = idMesa;
	}

	public String getNomeCliente() {
		return nomeCliente;
	}

	public void setNomeCliente(String nomeCliente) {
		this.nomeCliente = nomeCliente;
	}

	public Integer getIdLanche() {
		return idLanche;
	}

	public void setIdLanche(Integer idLanche) {
		this.idLanche = idLanche;
	}

	public String getNomeLanche() {
		return nomeLanche;
	}

	public void setNomeLanche(String nomeLanche) {
		this.nomeLanche = nomeLanche;
	}

	public Integer getQtdLanche() {
		return qtdLanche;
	}

	public void setQtdLanche(Integer qtdLanche) {
		this.qtdLanche = qtdLanche;
	}

	public Double getValorLanche() {
		return valorLanche;
	}

	public void setValorLanche(Double valorLanche) {
		this.valorLanche = valorLanche;
	}

	public String getObsLanche() {
		return obsLanche;
	}

	public void setObsLanche(String obsLanche) {
		this.obsLanche = obsLanche;
	}

}
