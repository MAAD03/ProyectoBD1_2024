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

import com.bd1_2024.entity.Sucursal;
import com.bd1_2024.repository.SucursalRepository;

@RestController
@RequestMapping("/sucursal")
public class SucursalServicio {

    @Autowired
    SucursalRepository sucursalRepository;

    @GetMapping(path = "/buscar")
    public List<Sucursal> buscar() {
        return sucursalRepository.findAll();

    }

    @PostMapping(path = "/guardar")
    public Sucursal guardar(@RequestBody Sucursal sucursal) {
        return sucursalRepository.save(sucursal);
    }

    @DeleteMapping(path = "/eliminar/{idSucursal}")
    public void eliminar(@PathVariable("idSucursal") Long idSucursal) {
        sucursalRepository.deleteById(idSucursal);

    }
}
