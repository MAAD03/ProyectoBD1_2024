package com.bd1_2024.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "MOTOCICLETA")
@Data
public class Motocicleta {

    @Id
    @Column(name = "id_motocicleta")
    private Long idMotocicleta;

    @Column(name = "id_marca")
    private Long idMarca;

    @Column(name = "modelo", length = 100, nullable = true)
    private String nombreMenu;

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

/*
 * CREATE TABLE MOTOCICLETA (
 * id_motocicleta NUMBER PRIMARY KEY NOT NULL,
 * id_marca NUMBER NOT NULL,
 * modelo VARCHAR2(100),
 * kilometraje NUMBER,
 * cilindraje NUMBER,
 * capacidad NUMBER,
 * foto CLOB,
 * fecha_modif DATE,
 * usuario_modif VARCHAR2(100),
 * CONSTRAINT fk_motocicleta_marca FOREIGN KEY (id_marca) REFERENCES
 * MARCA(id_marca)
 * );
 */