package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Entity.Lanche;

public interface LancheRepository extends JpaRepository<Lanche, Integer>{

}
