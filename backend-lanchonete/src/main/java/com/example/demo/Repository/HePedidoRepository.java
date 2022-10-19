package com.example.demo.Repository;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.Entity.HePedido;

public interface HePedidoRepository extends JpaRepository<HePedido, BigDecimal>{
	List<HePedido> findByIdCliente(Integer findByIdCliente);
}
