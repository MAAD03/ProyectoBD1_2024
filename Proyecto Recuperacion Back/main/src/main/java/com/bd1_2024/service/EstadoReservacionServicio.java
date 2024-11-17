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

import com.bd1_2024.entity.EstadoReservacion;
import com.bd1_2024.repository.EstadoReservacionRepository;

@RestController
@RequestMapping("/estadoReservacion")
public class EstadoReservacionServicio {
    @Autowired
    EstadoReservacionRepository estadoReservacionRepository;

    @GetMapping(path = "/buscar")
    public List<EstadoReservacion> buscar() {
        return estadoReservacionRepository.findAll();

    }

    @PostMapping(path = "/guardar")
    public EstadoReservacion guardar(@RequestBody EstadoReservacion estadoReservacion) {
        return estadoReservacionRepository.save(estadoReservacion);
    }

    @DeleteMapping(path = "/eliminar/{idEstadoReservacion}")
    public void eliminar(@PathVariable("idEstadoReservacion") Long idEstadoReservacion) {
        estadoReservacionRepository.deleteById(idEstadoReservacion);

    }

}
