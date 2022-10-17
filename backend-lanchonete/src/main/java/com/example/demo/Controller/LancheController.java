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

import com.example.demo.Entity.Lanche;
import com.example.demo.Repository.LancheRepository;

@RestController
public class LancheController {
	
	@Autowired
	private LancheRepository lancheRepository;
	
	@GetMapping("/recuperarLanche")
	public ResponseEntity<List<Lanche>> acessarLanche() {
		List<Lanche> resultado = lancheRepository.findAll();
		return ResponseEntity.ok(resultado);
	}
	
	@GetMapping("/recuperarLanche/{id}")
	public ResponseEntity<Optional<Lanche>> acessarLanche(@PathVariable Integer id) {
		Optional<Lanche> resultado = lancheRepository.findById(id);
		return ResponseEntity.ok(resultado);
	}
	
	@PostMapping("/inserirLanche")
	public ResponseEntity<Lanche> inserirSubClasse(@RequestBody (required=true) Lanche lanche) {
		return ResponseEntity.ok(lancheRepository.save(lanche));
	}
	
	@DeleteMapping("/deletarLanche/{id}")
	public ResponseEntity<Integer> deletarLanche(@PathVariable Integer id) {
		lancheRepository.deleteById(id);
		return ResponseEntity.ok(id);
	}
}



