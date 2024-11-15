package com.bd1_2024.entity;

import java.util.Date;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "ROL")
@Data
public class Rol {

    @Id
    @Column(name = "id_rol")
    private Long idRol;

    @Column(name = "nombre_rol", length = 100, nullable = true)
    private String nombreRol;

    @Column(name = "fecha_modif")
    private Date fechaModif;

    @Column(name = "usuario_modif", length = 100)
    private String usuarioModif;
}
