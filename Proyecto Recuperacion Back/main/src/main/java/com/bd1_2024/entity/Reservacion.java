package com.bd1_2024.entity;

import java.math.BigDecimal;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "RESERVACION")
public class Reservacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_reservacion")
    private Long idReservacion;

    @Column(name = "id_metodo_renta", nullable = false)
    private Long idMetodoRenta;

    @Column(name = "id_estado_reservacion", nullable = false)
    private Long idEstadoReservacion;

    @Column(name = "id_inventario", nullable = false)
    private Long idInventario;

    @Column(name = "id_usuario", nullable = false)
    private Long idUsuario;

    @Column(name = "fecha_inicio", nullable = false)
    private Date fechaInicio;

    @Column(name = "fecha_fin", nullable = false)
    private Date fechaFin;

    @Column(name = "monto_pago", precision = 20, scale = 2)
    private BigDecimal montoPago;

    @Column(name = "fecha_modif")
    private Date fechaModif;

    @Column(name = "usuario_modif", length = 100)
    private String usuarioModif;

}
