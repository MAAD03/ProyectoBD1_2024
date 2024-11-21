package com.bd1_2024.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bd1_2024.entity.Usuario;
import com.bd1_2024.repository.UsuarioRepository;

@RestController
@RequestMapping("/usuario")
public class UsuarioServicio {

    @Autowired
    UsuarioRepository usuarioRepository;

    @GetMapping(path = "/buscar")
    public List<Usuario> buscar() {
        return usuarioRepository.findAll();

    }

    @PostMapping(path = "/guardar")
    public Usuario guardar(@RequestBody Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    @DeleteMapping(path = "/eliminar/{idUsuario}")
    public void eliminar(@PathVariable("idUsuario") Long idUsuario) {
        usuarioRepository.deleteById(idUsuario);
    }

    @PostMapping(path = "/login")
    public Usuario login(@RequestBody Usuario usuario) {

        List<Usuario> usuarios = usuarioRepository.findByCorreoUsuarioAndPasswordUsuario(
                usuario.getCorreoUsuario(),
                usuario.getPasswordUsuario());

        Usuario usuarioRetorno = null;
        if (!usuarios.isEmpty()) {
            usuarioRetorno = usuarios.get(0);
        }
        return usuarioRetorno;
    }

}
