package com.example.demo.Controller;

import java.math.BigDecimal;
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
	
	@GetMapping("/recuperarHePedido/{idPedido}")
	public ResponseEntity<Optional<HePedido>> acessarHePedido(@PathVariable BigDecimal idPedido) {
		Optional<HePedido> resultado = hePedidoRepository.findById(idPedido);
		return ResponseEntity.ok(resultado);
	}
	
	@GetMapping("/recuperarHePedido/idCliente/{idCliente}")
	public ResponseEntity<List<HePedido>> acessarHePedidoMesa(@PathVariable Integer idCliente) {
		List<HePedido> resultado = hePedidoRepository.findByIdCliente(idCliente);
		return ResponseEntity.ok(resultado);
	}
	
	
	@PostMapping("/inserirHePedido")
	public ResponseEntity<HePedido> inserirHePedido(@RequestBody (required=true) HePedido hePedido) {
		return ResponseEntity.ok(hePedidoRepository.save(hePedido));
	}
	
	@DeleteMapping("/deletarHePedido/{idPedido}")
	public ResponseEntity<BigDecimal> deletarHePedido(@PathVariable BigDecimal idPedido) {
		hePedidoRepository.deleteById(idPedido);
		return ResponseEntity.ok(idPedido);
	}
}
