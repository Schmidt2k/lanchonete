package com.example.demo.Entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ITEM_PEDIDO")
public class ItemPedido {

	@Id
    @Column(name="id_item")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private BigDecimal idItem;
	
	@Column(name="valor_item")
	private double valor_item;
	
	@Column(name="nome_item")
	private String nomeItem;
	
}