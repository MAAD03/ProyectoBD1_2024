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

import com.bd1_2024.entity.Marca;
import com.bd1_2024.repository.MarcaRepository;

@RestController
@RequestMapping("/marca")
public class MarcaServicio {
    @Autowired
    MarcaRepository marcaRepository;

    @GetMapping(path = "/buscar")
    public List<Marca> buscar() {
        return marcaRepository.findAll();

    }

    @PostMapping(path = "/guardar")
    public Marca guardar(@RequestBody Marca marca) {
        return marcaRepository.save(marca);
    }

    @DeleteMapping(path = "/eliminar/{idMarca}")
    public void eliminar(@PathVariable("idMarca") Long idMarca) {
        marcaRepository.deleteById(idMarca);

    }
}
