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

import com.example.demo.Entity.UsuarioMobile;
import com.example.demo.Repository.UsuarioMobileRepository;

@RestController
public class UsuarioMobileController {
	
	@Autowired
	private UsuarioMobileRepository usuarioMobileRepository;
	
	@GetMapping("/recuperarUsuarioMobile")
	public ResponseEntity<List<UsuarioMobile>> acessarUsuarioMobile() {
		List<UsuarioMobile> resultado = usuarioMobileRepository.findAll();
		return ResponseEntity.ok(resultado);
	}
	
	@GetMapping("/recuperarUsuarioMobile/{id}")
	public ResponseEntity<Optional<UsuarioMobile>> acessarUsuarioMobile(@PathVariable Integer id) {
		Optional<UsuarioMobile> resultado = usuarioMobileRepository.findById(id);
		return ResponseEntity.ok(resultado);
	}
	
	@PostMapping("/inserirUsuarioMobile")
	public ResponseEntity<UsuarioMobile> inserirSubClasse(@RequestBody (required=true) UsuarioMobile usuarioMobile) {
		return ResponseEntity.ok(usuarioMobileRepository.save(usuarioMobile));
	}
	
	@DeleteMapping("/deletarUsuarioMobile/{id}")
	public ResponseEntity<Integer> deletarLanche(@PathVariable Integer id) {
		usuarioMobileRepository.deleteById(id);
		return ResponseEntity.ok(id);
	}

	@GetMapping("/loginUsuarioMobile/usuario/{nomeUsuarioMobile}/senha/{senhaUsuarioMobile}")
	public ResponseEntity<UsuarioMobile> loginUsuarioMobile(@PathVariable String nomeUsuarioMobile, @PathVariable Integer senhaUsuarioMobile) {
		UsuarioMobile resultado = usuarioMobileRepository.findByNomeUsuarioMobileAndSenhaUsuarioMobile(nomeUsuarioMobile, senhaUsuarioMobile);
		return ResponseEntity.ok(resultado);
	}
	
}
