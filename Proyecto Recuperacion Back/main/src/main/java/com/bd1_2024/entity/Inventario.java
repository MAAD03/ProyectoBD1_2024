package com.bd1_2024.entity;

import java.math.BigDecimal;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "INVENTARIO")
@Data
public class Inventario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_inventario")
    private Long idInventario;

    @Column(name = "id_motocicleta")
    private Long idMotocicleta;

    @Column(name = "id_sucursal")
    private Long idSucursal;

    @Column(name = "id_estado_motocicleta")
    private Long idEstadoMotocicleta;

    @Column(name = "precio_km", precision = 20, scale = 2)
    private BigDecimal precioKm;

    @Column(name = "precio_dia", precision = 20, scale = 2)
    private BigDecimal precioDia;

    @Column(name = "fecha_modif")
    private Date fechaModif;

    @Column(name = "usuario_modif", length = 100)
    private String usuarioModif;
}
