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
BEFORE INSERT ON ROL
FOR EACH ROW
BEGIN
  :NEW.id_rol := rol_seq.NEXTVAL;
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

--vista para bitacora donde se use el id_usuario 

