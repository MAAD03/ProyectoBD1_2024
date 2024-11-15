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
import com.bd1_2024.entity.Rol;
import com.bd1_2024.repository.RolRepository;

@RestController
@RequestMapping("/rol")
public class RolServicio {
    @Autowired
    RolRepository rolRepository;

    @GetMapping(path = "/buscar")
    public List<Rol> buscar() {
        return rolRepository.findAll();

    }

    @PostMapping(path = "/guardar")
    public Rol guardar(@RequestBody Rol rol) {
        return rolRepository.save(rol);
    }

    @DeleteMapping(path = "/eliminar/{idRol}")
    public void eliminar(@PathVariable("idRol") Long idRol) {
        rolRepository.deleteById(idRol);

    }
}
