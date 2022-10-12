package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Entity.Funcionario;


public interface FuncionarioRepository extends JpaRepository<Funcionario, Integer>{

}
