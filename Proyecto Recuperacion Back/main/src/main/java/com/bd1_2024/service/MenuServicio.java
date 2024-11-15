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
import com.bd1_2024.entity.Menu;
import com.bd1_2024.repository.MenuRepository;

@RestController
@RequestMapping("/menu")
public class MenuServicio {

    @Autowired
    MenuRepository menuRepository;

    @GetMapping(path = "/buscar")
    public List<Menu> buscar() {
        return menuRepository.findAll();

    }

    @PostMapping(path = "/guardar")
    public Menu guardar(@RequestBody Menu menu) {
        return menuRepository.save(menu);
    }

    @DeleteMapping(path = "/eliminar/{idMenu}")
    public void eliminar(@PathVariable("idMenu") Long idMenu) {
        menuRepository.deleteById(idMenu);

    }
}
