package com.bd1_2024.entity;

import lombok.Data;
import java.util.Date;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "MENU")
@Data
public class Menu {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_menu")
    private Long idMenu;

    @Column(name = "nombre_menu", length = 100, nullable = true)
    private String nombreMenu;

    @Column(name = "ruta", length = 100, nullable = true)
    private String ruta;

    @Column(name = "fecha_modif")
    private Date fechaModif;

    @Column(name = "usuario_modif", length = 100)
    private String usuarioModif;
}
