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
import com.bd1_2024.entity.MenuRol;
import com.bd1_2024.repository.MenuRolRepository;

@RestController
@RequestMapping("/menuRol")
public class MenuRolServicio {

    @Autowired
    MenuRolRepository menurolRepository;

    @GetMapping(path = "/buscar")
    public List<MenuRol> buscar() {
        return menurolRepository.findAll();

    }

    @PostMapping(path = "/guardar")
    public MenuRol guardar(@RequestBody MenuRol menurol) {
        return menurolRepository.save(menurol);
    }

    @DeleteMapping(path = "/eliminar/{idMenuRol}")
    public void eliminar(@PathVariable("idMenuRol") Long idMenuRol) {
        menurolRepository.deleteById(idMenuRol);

    }

}
