USE practica1bda_tablaunica_normalizada;
USE practica1bda_tablaunica;

 
SET sql_safe_updates = 0;

INSERT INTO practica1bda_tablaunica_normalizada.calle (nombre_calle, zona)
SELECT DISTINCT calle_cliente, zona_cliente
FROM practica1bda_tablaunica.tablaunica
WHERE calle_cliente IS NOT NULL
UNION
SELECT DISTINCT calle_local, zona_local
FROM tablaunica
WHERE calle_local IS NOT NULL;

-- HE AÑADIDO EL WHERE YA QUE HAY CLIENTES SIN CALLE EN TABLAUNICA
INSERT INTO practica1bda_tablaunica_normalizada.cliente (clienteID, usuario, calle_cliente)
SELECT DISTINCT clienteID, usuario, calle_cliente
FROM practica1bda_tablaunica.tablaunica
WHERE calle_cliente is not null;

INSERT INTO practica1bda_tablaunica_normalizada.local (localID, nombre_local, calle_local)
SELECT DISTINCT localID, nombre_local, calle_local
FROM practica1bda_tablaunica.tablaunica;


INSERT INTO practica1bda_tablaunica_normalizada.tipo (nombre_tipo)
SELECT DISTINCT tipo
FROM practica1bda_tablaunica.tablaunica;


INSERT INTO practica1bda_tablaunica_normalizada.oferta (nombre_oferta, descuento)
SELECT DISTINCT nombre_oferta, descuento
FROM practica1bda_tablaunica.tablaunica
WHERE nombre_oferta is not null;

INSERT INTO practica1bda_tablaunica_normalizada.producto (nombre_producto, medida, nombre_tipo)
SELECT DISTINCT producto, medida, tipo
FROM practica1bda_tablaunica.tablaunica;

INSERT INTO practica1bda_tablaunica_normalizada.detalle (pedidoID, nombre_producto, medida, nombre_oferta, subtotal, cantidad)
SELECT DISTINCT pedidoID, producto, medida, nombre_oferta, subtotal, cantidad
FROM practica1bda_tablaunica.tablaunica;

-- NO VA YA QUE NO EXISTE EL CLIENTEID = 3
-- SELECT DISTINCT pedidoID, fecha_hora, localID, clienteID, entrega, total
-- FROM practica1bda_tablaunica.tablaunica;

-- NO SE PUEDE INSERTAR YA QUE NO EXISTE EL CLIENTEID = 3
-- INSERT INTO practica1bda_tablaunica_normalizada.pedido (pedidoID, fecha_hora, localID, clienteID, entrega, total)
-- VALUES ('222','2023-02-14 21:45:00','3','3','Local','18.00');

INSERT INTO practica1bda_tablaunica_normalizada.pedido (pedidoID, fecha_hora, localID, clienteID, entrega, total)
VALUES ('101', '2023-02-11 20:45:00','1','11','Domicilio','18.00');

INSERT INTO practica1bda_tablaunica_normalizada.pedido (pedidoID, fecha_hora, localID, clienteID, entrega, total)
VALUES ('135',	'2023-02-11 20:45:00','1'	,'25','Domicilio','17.00');

INSERT INTO practica1bda_tablaunica_normalizada.pedido (pedidoID, fecha_hora, localID, clienteID, entrega, total)
VALUES ('170' ,	'2023-02-12 21:45:00','2','7','Domicilio','12.00');

INSERT INTO practica1bda_tablaunica_normalizada.pedido (pedidoID, fecha_hora, localID, clienteID, entrega, total)
VALUES (171,	'2023-02-12 21:45:00','3','30','Local','37.25');

INSERT INTO practica1bda_tablaunica_normalizada.pedido (pedidoID, fecha_hora, localID, clienteID, entrega, total)
VALUES ('208','2023-02-14 20:45:00','2','25','Local','12.00');










