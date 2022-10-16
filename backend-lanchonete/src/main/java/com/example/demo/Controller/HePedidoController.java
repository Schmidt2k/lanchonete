package com.example.demo.Controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.Entity.HePedido;
import com.example.demo.Repository.HePedidoRepository;

@RestController
public class HePedidoController {

	@Autowired
	private HePedidoRepository hePedidoRepository;
	
	@GetMapping("/recuperarHePedido")
	public ResponseEntity<List<HePedido>> acessarHePedidos() {
		List<HePedido> resultado = hePedidoRepository.findAll();
		return ResponseEntity.ok(resultado);
	}
	
	@GetMapping("/recuperarHePedido/{idPedido}")
	public ResponseEntity<Optional<HePedido>> acessarHePedido(@PathVariable Long idPedido) {
		Optional<HePedido> resultado = hePedidoRepository.findById(idPedido);
		return ResponseEntity.ok(resultado);
	}
	
	@GetMapping("/recuperarHePedido/mesa/{idMesa}")
	public ResponseEntity<List<HePedido>> acessarHePedidoMesa(@PathVariable Integer idMesa) {
		List<HePedido> resultado = hePedidoRepository.findByIdMesa(idMesa);
		return ResponseEntity.ok(resultado);
	}
	
	
	@PostMapping("/inserirHePedido")
	public ResponseEntity<HePedido> inserirHePedido(@RequestBody (required=true) HePedido hePedido) {
		return ResponseEntity.ok(hePedidoRepository.save(hePedido));
	}
	
	@DeleteMapping("/deletarHePedido/{idPedido}")
	public ResponseEntity<Long> deletarHePedido(@PathVariable Long idPedido) {
		hePedidoRepository.deleteById(idPedido);
		return ResponseEntity.ok(idPedido);
	}
}
