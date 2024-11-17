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

import com.bd1_2024.entity.Inventario;
import com.bd1_2024.repository.InventarioRepository;

@RestController
@RequestMapping("/inventario")
public class InventarioServicio {

    @Autowired
    InventarioRepository inventarioRepository;

    @GetMapping(path = "/buscar")
    public List<Inventario> buscar() {
        return inventarioRepository.findAll();

    }

    @PostMapping(path = "/guardar")
    public Inventario guardar(@RequestBody Inventario inventario) {
        return inventarioRepository.save(inventario);
    }

    @DeleteMapping(path = "/eliminar/{idInventario}")
    public void eliminar(@PathVariable("idInventario") Long idInventario) {
        inventarioRepository.deleteById(idInventario);

    }
}
