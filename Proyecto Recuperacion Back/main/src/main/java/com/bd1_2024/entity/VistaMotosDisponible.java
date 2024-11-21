package com.bd1_2024.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "VISTA_INVENTARIO_DISPONIBLE")
@Data
public class VistaMotosDisponible {

    @Id
    @Column(name = "id_inventario")
    private Long idInventario;

    @Column(name = "modelo_motocicleta")
    private String modeloMotocicleta;

    @Column(name = "marca")
    private String marca;

    @Column(name = "cilindraje")
    private Integer cilindraje;

    @Column(name = "capacidad")
    private Integer capacidad;

    @Column(name = "foto")
    private String foto;

    @Column(name = "sucursal")
    private String sucursal;

    @Column(name = "direccion_sucursal")
    private String direccionSucursal;

    @Column(name = "precio_km")
    private Double precioKm;

    @Column(name = "precio_dia")
    private Double precioDia;

}
