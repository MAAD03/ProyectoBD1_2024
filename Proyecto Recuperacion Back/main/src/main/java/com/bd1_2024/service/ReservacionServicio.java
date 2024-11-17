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

import com.bd1_2024.entity.Reservacion;
import com.bd1_2024.repository.ReservacionRepository;

@RestController
@RequestMapping("/reservacion")
public class ReservacionServicio {

    @Autowired
    ReservacionRepository reservacionRepository;

    @GetMapping(path = "/buscar")
    public List<Reservacion> buscar() {
        return reservacionRepository.findAll();

    }

    @PostMapping(path = "/guardar")
    public Reservacion guardar(@RequestBody Reservacion reservacion) {
        return reservacionRepository.save(reservacion);
    }

    @DeleteMapping(path = "/eliminar/{idReservacion}")
    public void eliminar(@PathVariable("idReservacion") Long idReservacion) {
        reservacionRepository.deleteById(idReservacion);

    }
}
