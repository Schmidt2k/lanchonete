package com.example.demo.Controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.Entity.Funcionario;
import com.example.demo.Entity.HePedido;
import com.example.demo.Repository.HePedidoRepository;

@RestController
@RequestMapping("api/pedidos")
public class HePedidoController {

	@Autowired
	private HePedidoRepository hePedidoRepository;
	
    @CrossOrigin
	@GetMapping("/recuperarHePedido")
	public ResponseEntity<List<HePedido>> acessarHePedidos() {
		List<HePedido> resultado = hePedidoRepository.findAll();
		return ResponseEntity.ok(resultado);
	}
	
	@GetMapping("/recuperarHePedido/{id_pedido}")
	public ResponseEntity<Optional<HePedido>> acessarHePedido(@PathVariable Long id_pedido) {
		Optional<HePedido> resultado = hePedidoRepository.findById(id_pedido);
		return ResponseEntity.ok(resultado);
	}
	
	@PostMapping("/inserirHePedido")
	public ResponseEntity<HePedido> inserirHePedido(@RequestBody (required=true) HePedido hePedido) {
		return ResponseEntity.ok(hePedidoRepository.save(hePedido));
	}
	
	@DeleteMapping("/deletarHePedido/{id_pedido}")
	public ResponseEntity<Long> deletarHePedido(@PathVariable Long id_pedido) {
		hePedidoRepository.deleteById(id_pedido);
		return ResponseEntity.ok(id_pedido);
	}
}
