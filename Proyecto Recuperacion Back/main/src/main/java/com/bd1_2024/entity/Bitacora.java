package com.bd1_2024.entity;

import java.util.Date;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "BITACORA")
@Data
public class Bitacora {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_bitacora")
    private Long idBitacora;

    @Column(name = "operacion", length = 100, nullable = true)
    private String operacion;

    @Column(name = "detalle_operacion", length = 100, nullable = true)
    private String detalleOperacion;

    @Column(name = "fecha_modif")
    private Date fechaModif;

    @Column(name = "usuario_modif", length = 100, nullable = true)
    private String usuarioModif;

    @Column(name = "nombre_tabla", length = 100, nullable = true)
    private String nombreTabla;

    @Lob
    @Column(name = "datos_anterior")
    private String datosAnterior;

    @Lob
    @Column(name = "datos_nuevos")
    private String datosNuevos;

}
