package com.bd1_2024.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "METODO_RENTA")
@Data
public class MetodoRenta {

    @Id
    @Column(name = "id_metodo_renta")
    private Long idMetodoRenta;

    @Column(name = "descripcion", length = 100, nullable = true)
    private String descripcion;

    @Column(name = "fecha_modif")
    private Date fechaModif;

    @Column(name = "usuario_modif", length = 100)
    private String usuarioModif;
}