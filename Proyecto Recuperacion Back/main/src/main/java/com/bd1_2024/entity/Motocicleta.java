package com.bd1_2024.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "MOTOCICLETA")
@Data
public class Motocicleta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_motocicleta")
    private Long idMotocicleta;

    @Column(name = "id_marca")
    private Long idMarca;

    @Column(name = "modelo", length = 100, nullable = true)
    private String modelo;

    @Column(name = "kilometraje")
    private Long kilometraje;

    @Column(name = "cilindraje")
    private Long cilindraje;

    @Column(name = "capacidad")
    private Long capacidad;

    @Lob
    @Column(name = "foto")
    private String foto;

    @Column(name = "fecha_modif")
    private Date fechaModif;

    @Column(name = "usuario_modif", length = 100)
    private String usuarioModif;

}
