package com.bd1_2024.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bd1_2024.entity.Rol;

@Repository("rolRepository")
public interface RolRepository extends JpaRepository<Rol, Long> {

}
