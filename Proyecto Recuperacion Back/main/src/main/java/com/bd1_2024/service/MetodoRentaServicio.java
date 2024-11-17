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

import com.bd1_2024.entity.MetodoRenta;
import com.bd1_2024.repository.MetodoRentaRepository;

@RestController
@RequestMapping("/metodoRenta")
public class MetodoRentaServicio {

    @Autowired
    MetodoRentaRepository metodoRentaRepository;

    @GetMapping(path = "/buscar")
    public List<MetodoRenta> buscar() {
        return metodoRentaRepository.findAll();

    }

    @PostMapping(path = "/guardar")
    public MetodoRenta guardar(@RequestBody MetodoRenta metodoRenta) {
        return metodoRentaRepository.save(metodoRenta);
    }

    @DeleteMapping(path = "/eliminar/{idMetodoRenta}")
    public void eliminar(@PathVariable("idMetodoRenta") Long idMetodoRenta) {
        metodoRentaRepository.deleteById(idMetodoRenta);

    }
}
