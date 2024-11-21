package com.bd1_2024.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bd1_2024.entity.VistaMenusPorRol;
import com.bd1_2024.repository.VistaMenusPorRolRepository;

@RestController
@RequestMapping("/MenusPorRol")
public class VistaMenusPorRolServicio {

    @Autowired
    private VistaMenusPorRolRepository vistaMenusPorRolRepository;

    @GetMapping("/porRol/{idRol}")
    public List<VistaMenusPorRol> obtenerMenusPorRol(@PathVariable("idRol") Long idRol) {
        return vistaMenusPorRolRepository.findByIdRol(idRol);
    }
}
