--menu
CREATE SEQUENCE menu_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE MENU(
    id_menu NUMBER PRIMARY KEY NOT NULL,
    nombre_menu VARCHAR2(100),
    ruta VARCHAR2(100),
    fecha_modif DATE,
    usuario_modif VARCHAR2(100)
);

CREATE OR REPLACE TRIGGER trg_menu_id
BEFORE INSERT ON MENU
FOR EACH ROW
BEGIN
  :NEW.id_menu := menu_seq.NEXTVAL;
END;

select * from rol;

// INSERT INTO MENU(nombre_menu, ruta, fecha_modif, usuario_modif)
// VALUES ('Menú Principal', '/home/menu', SYSDATE, '1');


--rol
CREATE SEQUENCE rol_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE ROL(
    id_rol NUMBER PRIMARY KEY NOT NULL,
    nombre_rol VARCHAR2(100),
    fecha_modif DATE,
    usuario_modif VARCHAR2(100)
);

CREATE OR REPLACE TRIGGER trg_rol_id
BEFORE INSERT ON ROL
FOR EACH ROW
BEGIN
  :NEW.id_rol := rol_seq.NEXTVAL;
END;


--menu_rol
CREATE SEQUENCE menurol_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE MENU_ROL (
    id_menurol NUMBER PRIMARY KEY NOT NULL,
    id_rol NUMBER NOT NULL,
    id_menu NUMBER NOT NULL,
    CONSTRAINT fk_menurol_rol FOREIGN KEY (id_rol) REFERENCES ROL(id_rol),
    CONSTRAINT fk_menurol_menu FOREIGN KEY (id_menu) REFERENCES MENU(id_menu)
);
CREATE OR REPLACE TRIGGER trg_menurol_id
BEFORE INSERT ON MENU_ROL
FOR EACH ROW
BEGIN
  :NEW.id_menurol := menurol_seq.NEXTVAL;
END;


--usuario
CREATE SEQUENCE usuario_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE USUARIO (
    id_usuario NUMBER PRIMARY KEY NOT NULL,
    id_rol NUMBER NOT NULL,
    nombre VARCHAR2(100),        
    apellido VARCHAR2(100),       
    dpi VARCHAR2(20),             
    correo VARCHAR2(100),         
    passwordU VARCHAR2(100),     
    telefono VARCHAR2(20),        
    direccion VARCHAR2(255),      
    fecha_modif DATE,
    usuario_modif VARCHAR2(100),  
    CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES ROL(id_rol)
);

CREATE OR REPLACE TRIGGER trg_usuario_id
BEFORE INSERT ON USUARIO
FOR EACH ROW
BEGIN
  :NEW.id_usuario := usuario_seq.NEXTVAL;
END;




--bitacora
CREATE SEQUENCE bitacora_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE BITACORA (
    id_bitacora NUMBER PRIMARY KEY NOT NULL,
    operacion VARCHAR2(100),        
    detalle_operacion VARCHAR2(100),       
    fecha_modif DATE,
    usuario_modif VARCHAR2(100),              
    nombre_tabla VARCHAR2(100),         
    datos_anterior CLOB,     
    datos_nuevos CLOB
);

CREATE OR REPLACE TRIGGER trg_bitacora_id
BEFORE INSERT ON BITACORA
FOR EACH ROW
BEGIN
  :NEW.id_bitacora := bitacora_seq.NEXTVAL;
END;


--marca
CREATE SEQUENCE marca_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE MARCA(
    id_marca NUMBER PRIMARY KEY NOT NULL,
    nombre VARCHAR2(100),
    fecha_modif DATE,
    usuario_modif VARCHAR2(100)
);

CREATE OR REPLACE TRIGGER trg_marca_id
BEFORE INSERT ON MARCA
FOR EACH ROW
BEGIN
  :NEW.id_marca := marca_seq.NEXTVAL;
END;


--motocicleta
CREATE SEQUENCE motocicleta_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE MOTOCICLETA (
    id_motocicleta NUMBER PRIMARY KEY NOT NULL,
    id_marca NUMBER NOT NULL,
    modelo VARCHAR2(100),        
    kilometraje NUMBER,       
    cilindraje NUMBER,             
    capacidad NUMBER,         
    foto CLOB,     
    fecha_modif DATE,
    usuario_modif VARCHAR2(100),  
    CONSTRAINT fk_motocicleta_marca FOREIGN KEY (id_marca) REFERENCES MARCA(id_marca)
);

CREATE OR REPLACE TRIGGER trg_motocicleta_id
BEFORE INSERT ON MOTOCICLETA
FOR EACH ROW
BEGIN
  :NEW.id_motocicleta := motocicleta_seq.NEXTVAL;
END;

--sucursal
CREATE SEQUENCE sucursal_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE SUCURSAL(
    id_sucursal NUMBER PRIMARY KEY NOT NULL,
    nombre_local VARCHAR2(256),
    direccion VARCHAR2(500),
    ciudad_zona VARCHAR2(256),
    descripcion VARCHAR2(256),
    fecha_modif DATE,
    usuario_modif VARCHAR2(100)
);

CREATE OR REPLACE TRIGGER trg_sucursal_id
BEFORE INSERT ON SUCURSAL
FOR EACH ROW
BEGIN
  :NEW.id_sucursal := sucursal_seq.NEXTVAL;
END;


--tipo estado motocicleta
CREATE SEQUENCE estado_motocicleta_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE TIPO_ESTADO_MOTOCICLETA(
    id_estado_motocicleta NUMBER PRIMARY KEY NOT NULL,
    descripcion VARCHAR2(100),
    fecha_modif DATE,
    usuario_modif VARCHAR2(100)
);

CREATE OR REPLACE TRIGGER trg_estado_motocicleta_id
BEFORE INSERT ON TIPO_ESTADO_MOTOCICLETA
FOR EACH ROW
BEGIN
  :NEW.id_estado_motocicleta := estado_motocicleta_seq.NEXTVAL;
END;


--inventario
CREATE SEQUENCE inventario_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE INVENTARIO (
    id_inventario NUMBER PRIMARY KEY NOT NULL,
    id_motocicleta NUMBER NOT NULL,
    id_sucursal NUMBER NOT NULL,
    id_estado_motocicleta NUMBER NOT NULL,
    precio_km NUMBER(20,2),        
    precio_dia NUMBER(20,2),           
    fecha_modif DATE,
    usuario_modif VARCHAR2(100),  
    CONSTRAINT fk_inventario_motocicleta FOREIGN KEY (id_motocicleta) REFERENCES MOTOCICLETA(id_motocicleta),
    CONSTRAINT fk_inventario_sucursal FOREIGN KEY (id_sucursal) REFERENCES SUCURSAL(id_sucursal),
    CONSTRAINT fk_inventario_estado_motocicleta FOREIGN KEY (id_estado_motocicleta) REFERENCES TIPO_ESTADO_MOTOCICLETA(id_estado_motocicleta)
);

CREATE OR REPLACE TRIGGER trg_inventario_id
BEFORE INSERT ON INVENTARIO
FOR EACH ROW
BEGIN
  :NEW.id_inventario := inventario_seq.NEXTVAL;
END;

--metodo renta
CREATE SEQUENCE metodo_renta_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE METODO_RENTA(
    id_metodo_renta NUMBER PRIMARY KEY NOT NULL,
    descripcion VARCHAR2(100),
    fecha_modif DATE,
    usuario_modif VARCHAR2(100)
);

CREATE OR REPLACE TRIGGER trg_metodo_renta_id
BEFORE INSERT ON METODO_RENTA
FOR EACH ROW
BEGIN
  :NEW.id_metodo_renta := metodo_renta_seq.NEXTVAL;
END;

--tipo estado reservacion
CREATE SEQUENCE estado_reservacion_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE TIPO_ESTADO_RESERVACION(
    id_estado_reservacion NUMBER PRIMARY KEY NOT NULL,
    descripcion VARCHAR2(100),
    fecha_modif DATE,
    usuario_modif VARCHAR2(100)
);

CREATE OR REPLACE TRIGGER trg_estado_reservacion_id
BEFORE INSERT ON TIPO_ESTADO_RESERVACION
FOR EACH ROW
BEGIN
  :NEW.id_estado_reservacion := estado_reservacion_seq.NEXTVAL;
END;

--reservacion
CREATE SEQUENCE reservacion_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE RESERVACION (
    id_reservacion NUMBER PRIMARY KEY NOT NULL,
    id_metodo_renta NUMBER NOT NULL,
    id_estado_reservacion NUMBER NOT NULL,
    id_inventario NUMBER NOT NULL,
    id_usuario NUMBER NOT NULL,
    fecha_inicio DATE,        
    fecha_fin DATE,     
    monto_pago NUMBER(20,2),
    fecha_modif DATE,
    usuario_modif VARCHAR2(100),  
    CONSTRAINT fk_reservacion_metodo_renta FOREIGN KEY (id_metodo_renta) REFERENCES METODO_RENTA(id_metodo_renta),
    CONSTRAINT fk_reservacion_estado_reservacion FOREIGN KEY (id_estado_reservacion) REFERENCES TIPO_ESTADO_RESERVACION(id_estado_reservacion),
    CONSTRAINT fk_reservacion_inventario FOREIGN KEY (id_inventario) REFERENCES INVENTARIO(id_inventario),
    CONSTRAINT fk_reservacion_usuario FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

CREATE OR REPLACE TRIGGER trg_reservacion_id
BEFORE INSERT ON reservacion
FOR EACH ROW
BEGIN
  :NEW.id_reservacion := reservacion_seq.NEXTVAL;
END;


--VISTAS 
CREATE OR REPLACE VIEW VISTA_MENUS_POR_ROL AS
SELECT r.id_rol, r.nombre_rol, m.id_menu, m.nombre_menu, m.ruta
FROM ROL r
JOIN MENU_ROL mr ON r.id_rol = mr.id_rol
JOIN MENU m ON mr.id_menu = m.id_menu;

select * from vista_menus_por_rol;

CREATE OR REPLACE VIEW VISTA_RESERVACIONES_ACTIVAS AS
SELECT r.id_reservacion, u.nombre, u.apellido, r.fecha_inicio, r.fecha_fin, r.monto_pago
FROM RESERVACION r
JOIN USUARIO u ON r.id_usuario = u.id_usuario
WHERE r.fecha_fin >= SYSDATE;

select * from vista_reservaciones_activas;

CREATE OR REPLACE VIEW VISTA_INVENTARIO_SUCURSAL AS
SELECT s.nombre_local, m.modelo, i.precio_km, i.precio_dia
FROM INVENTARIO i
JOIN MOTOCICLETA m ON i.id_motocicleta = m.id_motocicleta
JOIN SUCURSAL s ON i.id_sucursal = s.id_sucursal;

select * from vista_inventario_sucursal;

CREATE OR REPLACE VIEW VISTA_INVENTARIO_DISPONIBLE AS
SELECT 
    i.id_inventario,
    m.modelo AS modelo_motocicleta,
    ma.nombre AS marca,
    m.cilindraje,
    m.capacidad,
    m.foto,
    s.nombre_local AS sucursal,
    s.direccion AS direccion_sucursal,
    i.precio_km,
    i.precio_dia
FROM 
    INVENTARIO i
JOIN MOTOCICLETA m ON i.id_motocicleta = m.id_motocicleta
JOIN MARCA ma ON m.id_marca = ma.id_marca
JOIN SUCURSAL s ON i.id_sucursal = s.id_sucursal
JOIN TIPO_ESTADO_MOTOCICLETA tem ON i.id_estado_motocicleta = tem.id_estado_motocicleta
WHERE 
    tem.descripcion = 'Disponible';


select * from inventario;
select * from Tipo_estado_motocicleta;
select * from tipo_estado_reservacion;
select * from VISTA_INVENTARIO_DISPONIBLE;


--vista para bitacora donde se use el id_usuario 

--TRIGGERS PARA BITACORA

CREATE OR REPLACE TRIGGER TRG_BITACORA_MENU
AFTER INSERT OR UPDATE OR DELETE ON MENU
FOR EACH ROW
BEGIN
    -- INSERT
    IF INSERTING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'INSERT',                            
            'Se agregó un nuevo registro a MENU', 
            SYSDATE,                             
            USER,                                
            'MENU',                              
            NULL,                                
            TO_CLOB(:NEW.id_menu || ' - ' || :NEW.nombre_menu || ' - ' || :NEW.ruta)
        );
    END IF;

    -- UPDATE
    IF UPDATING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,               
            'UPDATE',                            
            'Se actualizó un registro en MENU',  
            SYSDATE,                             
            USER,                                
            'MENU',                              
            TO_CLOB(:OLD.id_menu || ' - ' || :OLD.nombre_menu || ' - ' || :OLD.ruta), 
            TO_CLOB(:NEW.id_menu || ' - ' || :NEW.nombre_menu || ' - ' || :NEW.ruta) 
        );
    END IF;

    -- DELETE
    IF DELETING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'DELETE',                           
            'Se eliminó un registro de MENU',   
            SYSDATE,                             
            USER,                                
            'MENU',                              
            TO_CLOB(:OLD.id_menu || ' - ' || :OLD.nombre_menu || ' - ' || :OLD.ruta),
            NULL                                
        );
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_BITACORA_ROL
AFTER INSERT OR UPDATE OR DELETE ON ROL
FOR EACH ROW
BEGIN
    -- INSERT
    IF INSERTING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'INSERT',                            
            'Se agregó un nuevo registro a ROL', 
            SYSDATE,                             
            USER,                                
            'ROL',                              
            NULL,                                
            TO_CLOB(:NEW.id_rol || ' - ' || :NEW.nombre_rol)
        );
    END IF;

    -- UPDATE
    IF UPDATING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,               
            'UPDATE',                            
            'Se actualizó un registro en ROL',  
            SYSDATE,                             
            USER,                                
            'ROL',                              
            TO_CLOB(:OLD.id_rol || ' - ' || :OLD.nombre_rol), 
            TO_CLOB(:NEW.id_rol || ' - ' || :NEW.nombre_rol)
        );
    END IF;

    -- DELETE
    IF DELETING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'DELETE',                           
            'Se eliminó un registro de ROL',   
            SYSDATE,                             
            USER,                                
            'ROL',                              
            TO_CLOB(:OLD.id_rol || ' - ' || :OLD.nombre_rol), 
            NULL                                
        );
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_BITACORA_MENU_ROL
AFTER INSERT OR UPDATE OR DELETE ON MENU_ROL
FOR EACH ROW
BEGIN
    -- INSERT
    IF INSERTING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'INSERT',                            
            'Se agregó un nuevo registro a MENU_ROL', 
            SYSDATE,                             
            USER,                                
            'MENU_ROL',                              
            NULL,                                
            TO_CLOB(:NEW.id_menurol || ' - ' || :NEW.id_rol|| ' - ' || :NEW.id_menu)
        );
    END IF;

    -- UPDATE
    IF UPDATING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,               
            'UPDATE',                            
            'Se actualizó un registro en MENU_ROL',  
            SYSDATE,                             
            USER,                                
            'MENU_ROL',                              
            TO_CLOB(:OLD.id_menurol || ' - ' || :OLD.id_rol || ' - ' || :OLD.id_menu), 
            TO_CLOB(:NEW.id_menurol || ' - ' || :NEW.id_rol|| ' - ' || :NEW.id_menu)
        );
    END IF;

    -- DELETE
    IF DELETING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'DELETE',                           
            'Se eliminó un registro de MENU_ROL',   
            SYSDATE,                             
            USER,                                
            'MENU_ROL',                              
            TO_CLOB(:OLD.id_menurol || ' - ' || :OLD.id_rol || ' - ' || :OLD.id_menu),  
            NULL                                
        );
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_BITACORA_USUARIO
AFTER INSERT OR UPDATE OR DELETE ON USUARIO
FOR EACH ROW
BEGIN
    -- INSERT
    IF INSERTING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'INSERT',                            
            'Se agregó un nuevo registro a USUARIO', 
            SYSDATE,                             
            USER,                                
            'USUARIO',                              
            NULL,                                
            TO_CLOB(:NEW.id_usuario || ' - ' || :NEW.id_rol|| ' - ' || :NEW.nombre || ' - ' || :NEW.apellido|| ' - ' || :NEW.dpi || ' - ' || :NEW.correo|| ' - ' || :NEW.passwordU || ' - ' || :NEW.telefono|| ' - ' || :NEW.direccion)
        );
    END IF;

    -- UPDATE
    IF UPDATING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,               
            'UPDATE',                            
            'Se actualizó un registro en USUARIO',  
            SYSDATE,                             
            USER,                                
            'USUARIO',                              
           TO_CLOB(:OLD.id_usuario || ' - ' || :OLD.id_rol|| ' - ' || :OLD.nombre || ' - ' || :OLD.apellido|| ' - ' || :OLD.dpi || ' - ' || :OLD.correo|| ' - ' || :OLD.passwordU || ' - ' || :OLD.telefono|| ' - ' || :OLD.direccion), 
           TO_CLOB(:NEW.id_usuario || ' - ' || :NEW.id_rol|| ' - ' || :NEW.nombre || ' - ' || :NEW.apellido|| ' - ' || :NEW.dpi || ' - ' || :NEW.correo|| ' - ' || :NEW.passwordU || ' - ' || :NEW.telefono|| ' - ' || :NEW.direccion)
        );
    END IF;

    -- DELETE
    IF DELETING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'DELETE',                           
            'Se eliminó un registro de USUARIO',   
            SYSDATE,                             
            USER,                                
            'USUARIO',                              
            TO_CLOB(:OLD.id_usuario || ' - ' || :OLD.id_rol|| ' - ' || :OLD.nombre || ' - ' || :OLD.apellido|| ' - ' || :OLD.dpi || ' - ' || :OLD.correo|| ' - ' || :OLD.passwordU || ' - ' || :OLD.telefono|| ' - ' || :OLD.direccion), 
            NULL                                
        );
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_BITACORA_MARCA
AFTER INSERT OR UPDATE OR DELETE ON MARCA
FOR EACH ROW
BEGIN
    -- INSERT
    IF INSERTING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'INSERT',                            
            'Se agregó un nuevo registro a MARCA', 
            SYSDATE,                             
            USER,                                
            'MARCA',                              
            NULL,                                
            TO_CLOB(:NEW.id_marca || ' - ' || :NEW.nombre)
        );
    END IF;

    -- UPDATE
    IF UPDATING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,               
            'UPDATE',                            
            'Se actualizó un registro en MARCA',  
            SYSDATE,                             
            USER,                                
            'MARCA',                              
           TO_CLOB(:OLD.id_marca || ' - ' || :OLD.nombre), 
            TO_CLOB(:NEW.id_marca || ' - ' || :NEW.nombre)
          );
    END IF;

    -- DELETE
    IF DELETING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'DELETE',                           
            'Se eliminó un registro de MARCA',   
            SYSDATE,                             
            USER,                                
            'MARCA',                              
            TO_CLOB(:OLD.id_marca || ' - ' || :OLD.nombre),
            NULL                                
        );
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_BITACORA_MOTOCICLETA
AFTER INSERT OR UPDATE OR DELETE ON MOTOCICLETA
FOR EACH ROW
BEGIN
    -- INSERT
    IF INSERTING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'INSERT',                            
            'Se agregó un nuevo registro a MOTOCICLETA', 
            SYSDATE,                             
            USER,                                
            'MOTOCICLETA',                              
            NULL,                                
            TO_CLOB(:NEW.id_motocicleta || ' - ' || :NEW.id_marca|| ' - ' || :NEW.modelo || ' - ' || :NEW.kilometraje|| ' - ' || :NEW.cilindraje || ' - ' || :NEW.capacidad)
        );
    END IF;

    -- UPDATE
    IF UPDATING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,               
            'UPDATE',                            
            'Se actualizó un registro en MOTOCICLETA',  
            SYSDATE,                             
            USER,                                
            'MOTOCICLETA',                              
             TO_CLOB(:OLD.id_motocicleta || ' - ' || :OLD.id_marca|| ' - ' || :OLD.modelo || ' - ' || :OLD.kilometraje|| ' - ' || :OLD.cilindraje || ' - ' || :OLD.capacidad), 
            TO_CLOB(:NEW.id_motocicleta || ' - ' || :NEW.id_marca|| ' - ' || :NEW.modelo || ' - ' || :NEW.kilometraje|| ' - ' || :NEW.cilindraje || ' - ' || :NEW.capacidad)
        );
    END IF;

    -- DELETE
    IF DELETING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'DELETE',                           
            'Se eliminó un registro de MOTOCICLETA',   
            SYSDATE,                             
            USER,                                
            'MOTOCICLETA',                              
           TO_CLOB(:OLD.id_motocicleta || ' - ' || :OLD.id_marca|| ' - ' || :OLD.modelo || ' - ' || :OLD.kilometraje|| ' - ' || :OLD.cilindraje || ' - ' || :OLD.capacidad), 
            NULL                                
        );
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_BITACORA_SUCURSAL
AFTER INSERT OR UPDATE OR DELETE ON SUCURSAL
FOR EACH ROW
BEGIN
    -- INSERT
    IF INSERTING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'INSERT',                            
            'Se agregó un nuevo registro a SUCURSAL', 
            SYSDATE,                             
            USER,                                
            'SUCURSAL',                              
            NULL,                                
            TO_CLOB(:NEW.id_sucursal || ' - ' || :NEW.nombre_local|| ' - ' || :NEW.direccion || ' - ' || :NEW.ciudad_zona|| ' - ' || :NEW.descripcion)
        );
    END IF;

    -- UPDATE
    IF UPDATING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,               
            'UPDATE',                            
            'Se actualizó un registro en SUCURSAL',  
            SYSDATE,                             
            USER,                                
            'SUCURSAL',                              
            TO_CLOB(:OLD.id_sucursal || ' - ' || :OLD.nombre_local|| ' - ' || :OLD.direccion || ' - ' || :OLD.ciudad_zona|| ' - ' || :OLD.descripcion), 
            TO_CLOB(:NEW.id_sucursal || ' - ' || :NEW.nombre_local|| ' - ' || :NEW.direccion || ' - ' || :NEW.ciudad_zona|| ' - ' || :NEW.descripcion)
        );
    END IF;

    -- DELETE
    IF DELETING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'DELETE',                           
            'Se eliminó un registro de SUCURSAL',   
            SYSDATE,                             
            USER,                                
            'SUCURSAL',                              
            TO_CLOB(:OLD.id_sucursal || ' - ' || :OLD.nombre_local|| ' - ' || :OLD.direccion || ' - ' || :OLD.ciudad_zona|| ' - ' || :OLD.descripcion), 
            NULL                                
        );
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_BITACORA_TIPO_ESTADO_MOTOCICLETA
AFTER INSERT OR UPDATE OR DELETE ON TIPO_ESTADO_MOTOCICLETA
FOR EACH ROW
BEGIN
    -- INSERT
    IF INSERTING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'INSERT',                            
            'Se agregó un nuevo registro a TIPO_ESTADO_MOTOCICLETA', 
            SYSDATE,                             
            USER,                                
            'TIPO_ESTADO_MOTOCICLETA',                              
            NULL,                                
            TO_CLOB(:NEW.id_estado_motocicleta || ' - ' || :NEW.descripcion)
        );
    END IF;

    -- UPDATE
    IF UPDATING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,               
            'UPDATE',                            
            'Se actualizó un registro en TIPO_ESTADO_MOTOCICLETA',  
            SYSDATE,                             
            USER,                                
            'TIPO_ESTADO_MOTOCICLETA',                              
            TO_CLOB(:OLD.id_estado_motocicleta || ' - ' || :OLD.descripcion), 
           TO_CLOB(:NEW.id_estado_motocicleta || ' - ' || :NEW.descripcion)
        );
    END IF;

    -- DELETE
    IF DELETING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'DELETE',                           
            'Se eliminó un registro de TIPO_ESTADO_MOTOCICLETA',   
            SYSDATE,                             
            USER,                                
            'TIPO_ESTADO_MOTOCICLETA',                              
           TO_CLOB(:OLD.id_estado_motocicleta || ' - ' || :OLD.descripcion), 
            NULL                                
        );
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_BITACORA_INVENTARIO
AFTER INSERT OR UPDATE OR DELETE ON INVENTARIO
FOR EACH ROW
BEGIN
    -- INSERT
    IF INSERTING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'INSERT',                            
            'Se agregó un nuevo registro a INVENTARIO', 
            SYSDATE,                             
            USER,                                
            'INVENTARIO',                              
            NULL,                                
             TO_CLOB(:NEW.id_inventario || ' - ' || :NEW.id_motocicleta|| ' - ' || :NEW.id_sucursal || ' - ' || :NEW.id_estado_motocicleta|| ' - ' || :NEW.precio_km|| ' - ' || :NEW.precio_dia)
        );
    END IF;

    -- UPDATE
    IF UPDATING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,               
            'UPDATE',                            
            'Se actualizó un registro en INVENTARIO',  
            SYSDATE,                             
            USER,                                
            'INVENTARIO',                              
            TO_CLOB(:OLD.id_inventario || ' - ' || :OLD.id_motocicleta|| ' - ' || :OLD.id_sucursal || ' - ' || :OLD.id_estado_motocicleta|| ' - ' || :OLD.precio_km|| ' - ' || :OLD.precio_dia),
            TO_CLOB(:NEW.id_inventario || ' - ' || :NEW.id_motocicleta|| ' - ' || :NEW.id_sucursal || ' - ' || :NEW.id_estado_motocicleta|| ' - ' || :NEW.precio_km|| ' - ' || :NEW.precio_dia)
        );
    END IF;

    -- DELETE
    IF DELETING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'DELETE',                           
            'Se eliminó un registro de INVENTARIO',   
            SYSDATE,                             
            USER,                                
            'INVENTARIO',                              
           TO_CLOB(:OLD.id_inventario || ' - ' || :OLD.id_motocicleta|| ' - ' || :OLD.id_sucursal || ' - ' || :OLD.id_estado_motocicleta|| ' - ' || :OLD.precio_km|| ' - ' || :OLD.precio_dia),
            NULL                                
        );
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_BITACORA_METODO_RENTA
AFTER INSERT OR UPDATE OR DELETE ON METODO_RENTA
FOR EACH ROW
BEGIN
    -- INSERT
    IF INSERTING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'INSERT',                            
            'Se agregó un nuevo registro a METODO_RENTA', 
            SYSDATE,                             
            USER,                                
            'METODO_RENTA',                              
            NULL,                                
            TO_CLOB(:NEW.id_metodo_renta || ' - ' || :NEW.descripcion)
        );
    END IF;

    -- UPDATE
    IF UPDATING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,               
            'UPDATE',                            
            'Se actualizó un registro en METODO_RENTA',  
            SYSDATE,                             
            USER,                                
            'METODO_RENTA',                              
            TO_CLOB(:OLD.id_metodo_renta || ' - ' || :OLD.descripcion), 
           TO_CLOB(:NEW.id_metodo_renta || ' - ' || :NEW.descripcion)
        );
    END IF;

    -- DELETE
    IF DELETING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'DELETE',                           
            'Se eliminó un registro de METODO_RENTA',   
            SYSDATE,                             
            USER,                                
            'METODO_RENTA',                              
           TO_CLOB(:OLD.id_metodo_renta || ' - ' || :OLD.descripcion), 
            NULL                                
        );
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_BITACORA_TIPO_ESTADO_RESERVACION
AFTER INSERT OR UPDATE OR DELETE ON TIPO_ESTADO_RESERVACION
FOR EACH ROW
BEGIN
    -- INSERT
    IF INSERTING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'INSERT',                            
            'Se agregó un nuevo registro a TIPO_ESTADO_RESERVACION', 
            SYSDATE,                             
            USER,                                
            'TIPO_ESTADO_RESERVACION',                              
            NULL,                                
            TO_CLOB(:NEW.id_estado_reservacion || ' - ' || :NEW.descripcion)
        );
    END IF;

    -- UPDATE
    IF UPDATING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,               
            'UPDATE',                            
            'Se actualizó un registro en TIPO_ESTADO_RESERVACION',  
            SYSDATE,                             
            USER,                                
            'TIPO_ESTADO_RESERVACION',                              
            TO_CLOB(:OLD.id_estado_reservacion || ' - ' || :OLD.descripcion), 
           TO_CLOB(:NEW.id_estado_reservacion || ' - ' || :NEW.descripcion)
        );
    END IF;

    -- DELETE
    IF DELETING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'DELETE',                           
            'Se eliminó un registro de TIPO_ESTADO_RESERVACION',   
            SYSDATE,                             
            USER,                                
            'TIPO_ESTADO_RESERVACION',                              
           TO_CLOB(:OLD.id_estado_reservacion || ' - ' || :OLD.descripcion), 
            NULL                                
        );
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_BITACORA_RESERVACION
AFTER INSERT OR UPDATE OR DELETE ON RESERVACION
FOR EACH ROW
BEGIN
    -- INSERT
    IF INSERTING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'INSERT',                            
            'Se agregó un nuevo registro a RESERVACION', 
            SYSDATE,                             
            USER,                                
            'RESERVACION',                              
            NULL,                                
            TO_CLOB(:NEW.id_reservacion || ' - ' || :NEW.id_metodo_renta|| ' - ' || :NEW.id_estado_reservacion || ' - ' || :NEW.id_inventario|| ' - ' || :NEW.id_usuario || ' - ' || :NEW.fecha_inicio|| ' - ' || :NEW.fecha_fin || ' - ' || :NEW.monto_pago)
        );
    END IF;

    -- UPDATE
    IF UPDATING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,               
            'UPDATE',                            
            'Se actualizó un registro en RESERVACION',  
            SYSDATE,                             
            USER,                                
            'RESERVACION',                              
           TO_CLOB(:OLD.id_reservacion || ' - ' || :OLD.id_metodo_renta|| ' - ' || :OLD.id_estado_reservacion || ' - ' || :OLD.id_inventario|| ' - ' || :OLD.id_usuario || ' - ' || :OLD.fecha_inicio|| ' - ' || :OLD.fecha_fin || ' - ' || :OLD.monto_pago), 
           TO_CLOB(:NEW.id_reservacion || ' - ' || :NEW.id_metodo_renta|| ' - ' || :NEW.id_estado_reservacion || ' - ' || :NEW.id_inventario|| ' - ' || :NEW.id_usuario || ' - ' || :NEW.fecha_inicio|| ' - ' || :NEW.fecha_fin || ' - ' || :NEW.monto_pago)
        );
    END IF;

    -- DELETE
    IF DELETING THEN
        INSERT INTO BITACORA (
            id_bitacora, operacion, detalle_operacion, fecha_modif, usuario_modif, nombre_tabla, datos_anterior, datos_nuevos
        ) VALUES (
            bitacora_seq.NEXTVAL,                
            'DELETE',                           
            'Se eliminó un registro de RESERVACION',   
            SYSDATE,                             
            USER,                                
            'RESERVACION',                              
             TO_CLOB(:OLD.id_reservacion || ' - ' || :OLD.id_metodo_renta|| ' - ' || :OLD.id_estado_reservacion || ' - ' || :OLD.id_inventario|| ' - ' || :OLD.id_usuario || ' - ' || :OLD.fecha_inicio|| ' - ' || :OLD.fecha_fin || ' - ' || :OLD.monto_pago),
            NULL                                
        );
    END IF;
END;


DELETE FROM BITACORA WHERE id_bitacora = 148;
select * from usuario;
SELECT * FROM Bitacora;
DROP TRIGGER trg_usuario_id;
SELECT trigger_name, table_name, status FROM user_triggers;
