package com.example.demo.Entity;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="HE_PEDIDO")
public class HePedido {

	@Id
    @Column(name="id_pedido")
	private BigDecimal idPedido;
	
	@Column(name="id_cliente")
	private Integer idCliente;
	
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
	
//	@Query(value = "SELECT * FROM ITEM_PEDIDO i WHERE i.id_cliente = idCliente", nativeQuery = true)
//	List<ItemPedido> ltItensPedidos;
//	
	public BigDecimal getIdPedido() {
		return idPedido;
	}

	public Integer getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
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

	public void setIdPedido(BigDecimal idPedido) {
		this.idPedido = idPedido;
	}

}
