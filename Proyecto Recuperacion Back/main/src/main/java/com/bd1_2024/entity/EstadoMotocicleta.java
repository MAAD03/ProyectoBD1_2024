package com.bd1_2024.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "TIPO_ESTADO_MOTOCICLETA")
@Data
public class EstadoMotocicleta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_estado_motocicleta")
    private Long idEstadoMotocicleta;

    @Column(name = "descripcion", length = 100, nullable = true)
    private String descripcion;

    @Column(name = "fecha_modif")
    private Date fechaModif;

    @Column(name = "usuario_modif", length = 100)
    private String usuarioModif;
}
