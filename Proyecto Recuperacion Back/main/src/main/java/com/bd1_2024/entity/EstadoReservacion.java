package com.bd1_2024.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "TIPO_ESTADO_RESERVACION")
@Data
public class EstadoReservacion {

    @Id
    @Column(name = "id_estado_reservacion")
    private Long idEstadoReservacion;

    @Column(name = "descripcion", length = 100, nullable = true)
    private String descripcion;

    @Column(name = "fecha_modif")
    private Date fechaModif;

    @Column(name = "usuario_modif", length = 100)
    private String usuarioModif;
}

/*
 * CREATE TABLE TIPO_ESTADO_RESERVACION(
 * id_estado_reservacion NUMBER PRIMARY KEY NOT NULL,
 * descripcion VARCHAR2(100),
 * fecha_modif DATE,
 * usuario_modif VARCHAR2(100)
 * );
 */