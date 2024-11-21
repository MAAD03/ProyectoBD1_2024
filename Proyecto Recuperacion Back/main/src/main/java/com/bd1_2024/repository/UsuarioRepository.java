package com.bd1_2024.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bd1_2024.entity.Usuario;

@Repository("usuarioRepository")
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    List<Usuario> findByCorreoUsuarioAndPasswordUsuario(String correoUsuario, String passwordUsuario);

}
