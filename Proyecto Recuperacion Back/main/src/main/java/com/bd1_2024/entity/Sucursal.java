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
@Table(name = "SUCURSAL")
@Data
public class Sucursal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_sucursal")
    private Long idSucursal;

    @Column(name = "nombre_local", length = 256, nullable = true)
    private String nombreLocal;

    @Column(name = "direccion", length = 500, nullable = true)
    private String direccion;

    @Column(name = "ciudad_zona", length = 256, nullable = true)
    private String ciudadZona;

    @Column(name = "descripcion", length = 256, nullable = true)
    private String descripcion;

    @Column(name = "fecha_modif")
    private Date fechaModif;

    @Column(name = "usuario_modif", length = 100)
    private String usuarioModif;
}
