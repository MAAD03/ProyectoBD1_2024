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

import com.bd1_2024.entity.Bitacora;
import com.bd1_2024.repository.BitacoraRepository;

@RestController
@RequestMapping("/bitacora")
public class BitacoraServicio {

    @Autowired
    BitacoraRepository bitacoraRepository;

    @GetMapping(path = "/buscar")
    public List<Bitacora> buscar() {
        return bitacoraRepository.findAll();

    }

    @PostMapping(path = "/guardar")
    public Bitacora guardar(@RequestBody Bitacora bitacora) {
        return bitacoraRepository.save(bitacora);
    }

    @DeleteMapping(path = "/eliminar/{idBitacora}")
    public void eliminar(@PathVariable("idBitacora") Long idBitacora) {
        bitacoraRepository.deleteById(idBitacora);

    }
}
