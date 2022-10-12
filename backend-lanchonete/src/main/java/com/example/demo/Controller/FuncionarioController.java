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

import com.example.demo.Entity.Funcionario;
import com.example.demo.Repository.FuncionarioRepository;

@RestController
public class FuncionarioController {

	@Autowired
	private FuncionarioRepository funcRepository;
	
	@GetMapping("/recuperarFuncionario")
	public ResponseEntity<List<Funcionario>> acessarFuncionario() {
		List<Funcionario> resultado = funcRepository.findAll();
		return ResponseEntity.ok(resultado);
	}
	
	@GetMapping("/recuperarFuncionario/{id}")
	public ResponseEntity<Optional<Funcionario>> acessarFuncionario(@PathVariable Integer id) {
		Optional<Funcionario> resultado = funcRepository.findById(id);
		return ResponseEntity.ok(resultado);
	}
	
	@PostMapping("/inserirFuncionario")
	public ResponseEntity<Funcionario> inserirSubClasse(@RequestBody (required=true) Funcionario funcionario) {
		return ResponseEntity.ok(funcRepository.save(funcionario));
	}
	
	@DeleteMapping("/deletarFuncionario/{id}")
	public ResponseEntity<Integer> deletarFuncionario(@PathVariable Integer id) {
		funcRepository.deleteById(id);
		return ResponseEntity.ok(id);
	}
}
