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

import com.bd1_2024.entity.EstadoMotocicleta;
import com.bd1_2024.repository.EstadoMotocicletaRepository;

@RestController
@RequestMapping("/estadoMoto")
public class EstadoMotocicletaServicio {

    @Autowired
    EstadoMotocicletaRepository estadoMotocicletaRepository;

    @GetMapping(path = "/buscar")
    public List<EstadoMotocicleta> buscar() {
        return estadoMotocicletaRepository.findAll();

    }

    @PostMapping(path = "/guardar")
    public EstadoMotocicleta guardar(@RequestBody EstadoMotocicleta estadoMotocicleta) {
        return estadoMotocicletaRepository.save(estadoMotocicleta);
    }

    @DeleteMapping(path = "/eliminar/{idEstadoMotocicleta}")
    public void eliminar(@PathVariable("idEstadoMotocicleta") Long idEstadoMotocicleta) {
        estadoMotocicletaRepository.deleteById(idEstadoMotocicleta);

    }

}
