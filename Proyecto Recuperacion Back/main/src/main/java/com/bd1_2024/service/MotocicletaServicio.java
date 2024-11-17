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

import com.bd1_2024.entity.Motocicleta;
import com.bd1_2024.repository.MotocicletaRepository;

@RestController
@RequestMapping("/motocicleta")
public class MotocicletaServicio {

    @Autowired
    MotocicletaRepository motocicletaRepository;

    @GetMapping(path = "/buscar")
    public List<Motocicleta> buscar() {
        return motocicletaRepository.findAll();

    }

    @PostMapping(path = "/guardar")
    public Motocicleta guardar(@RequestBody Motocicleta motocicleta) {
        return motocicletaRepository.save(motocicleta);
    }

    @DeleteMapping(path = "/eliminar/{idMotocicleta}")
    public void eliminar(@PathVariable("idMotocicleta") Long idMotocicleta) {
        motocicletaRepository.deleteById(idMotocicleta);

    }

}
