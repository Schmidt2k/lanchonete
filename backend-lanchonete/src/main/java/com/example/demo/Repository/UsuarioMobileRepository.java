package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Entity.UsuarioMobile;

public interface UsuarioMobileRepository extends JpaRepository<UsuarioMobile, Integer> {
	UsuarioMobile findByNomeUsuarioMobileAndSenhaUsuarioMobile(String nomeUsuarioMobile, Integer senhaUsuarioMobile);
}
