-- Asignatura Bases de Datos Avanzadas - curso 2022-23
-- ETS Ingeniería Sistemas Informáticos - UPM

-- -----------------------------------------------------
-- Practica 1 - Script de creación de la Tabla inicial
-- -----------------------------------------------------

 DROP DATABASE practica1bda_tablaunica_normalizada;
 CREATE DATABASE IF NOT EXISTS practica1bda_tablaunica_normalizada; 
 USE practica1bda_tablaunica_normalizada;

 
 CREATE TABLE Calle (
	nombre_calle varchar(20) not null unique,
    zona integer not null,
    primary key (nombre_calle)
    );
 
 -- INDICES LUEGO
CREATE TABLE Cliente (
	clienteID integer not null unique,
    usuario varchar(15) not null unique,
    calle_cliente varchar(20) not null,
    primary key (clienteID),
    foreign key (calle_cliente) references Calle(nombre_calle)
    );
    
-- INDICES LUEGO
CREATE TABLE Local (
	localID integer not null unique,
    nombre_local varchar(15) not null unique,
    calle_local varchar(20) not null,
    primary key (localID),
    foreign key (calle_local) references Calle(nombre_calle)
    );

-- METER INDICE LOCALID Y FECHA
CREATE TABLE Pedido (
	pedidoID integer not null unique,
    fecha_hora datetime not null,
    clienteID integer not null,
    localID integer not null,
    entrega varchar(10) not null,
    total decimal(7,2),
    
    primary key (pedidoID),
    foreign key (clienteID) references Cliente(clienteID),
    foreign key (localID) references Local(localID)
    );
    
CREATE TABLE Tipo (
	tipoID integer not null unique,
    nombre_tipo datetime not null,
    
    primary key (tipoID)
    );

CREATE TABLE Producto (
	nombre_producto varchar(20) not null,
    medida varchar(10) not null,
    tipoID integer not null,
    
    primary key (nombre_producto, medida),
    foreign key (tipoID) references Tipo(tipoID)
    );
    
CREATE TABLE Oferta (
	nombre_oferta varchar(20) not null unique,
    descuento integer not null,
    
    primary key (nombre_oferta)
    );

CREATE TABLE Detalle (
	pedidoID integer not null unique,
    nombre_producto varchar(20) not null,
    medida varchar(10) not null,
	nombre_oferta varchar(20) not null,

    subtotal varchar(15) not null,
    cantidad integer not null,
    
    foreign key (pedidoID) references Pedido(pedidoID),
    foreign key (nombre_producto, medida) references Producto(nombre_producto, medida),
    foreign key (nombre_oferta) references Oferta(nombre_oferta)
    );


    

    

    

    
