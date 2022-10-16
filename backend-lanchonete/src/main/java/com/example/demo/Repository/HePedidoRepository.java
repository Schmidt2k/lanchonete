package com.example.demo.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.Entity.HePedido;

public interface HePedidoRepository extends JpaRepository<HePedido, Long>{
	List<HePedido> findByIdMesa(Integer idMesa);
}
