create database practica1bda_normalizada;

create table usuario(
usuario varchar(15),
clienteID integer,
calle_cliente varchar(20)
);

create table local(
localID integer,
nombre_local varchar(25),
calle_local varchar(20)
);

create table pedido(
pedidoID integer,
localID integer,
fecha_hora datetime,
clienteID integer,
total decimal(7,2),
entrega varchar(10)
);

