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
@Table(name = "USUARIO")
@Data
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_usuario")
    private Long idUsuario;

    @Column(name = "id_rol")
    private Long idRol;

    @Column(name = "nombre", length = 100, nullable = true)
    private String nombreUsuario;

    @Column(name = "apellido", length = 100, nullable = true)
    private String apellidoUsuario;

    @Column(name = "dpi", length = 20, nullable = true)
    private String dpiUsuario;

    @Column(name = "correo", length = 100, nullable = true)
    private String correoUsuario;

    @Column(name = "passwordU", length = 100, nullable = true)
    private String passwordUsuario;

    @Column(name = "telefono", length = 20, nullable = true)
    private String telefonoUsuario;

    @Column(name = "direccion", length = 255, nullable = true)
    private String direccionUsuario;

    @Column(name = "fecha_modif")
    private Date fechaModif;

    @Column(name = "usuario_modif", length = 100)
    private String usuarioModif;
}
