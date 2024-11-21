package com.bd1_2024.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.bd1_2024.entity.VistaMotosDisponible;
import com.bd1_2024.repository.VistaMotosDisponibleRepository;

@RestController
@RequestMapping("/inventario")
public class VistaMotosDisponibleServicio {

    @Autowired
    private VistaMotosDisponibleRepository repository;

    @GetMapping("/disponible")
    public List<VistaMotosDisponible> obtenerInventarioDisponible() {
        return repository.findAll();
    }
}
