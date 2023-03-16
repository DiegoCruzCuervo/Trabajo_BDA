use practica1bda_tablaunica;

-- Clave principal de tablaunica (IPM) -> 1.2
alter table tablaunica
add primary key (pedidoID, producto, medida);


-- Indices de tablaunica (PMLF) -> 1.2
create unique index PMLF on tablaunica (producto, medida, localID, fecha_hora);
-- drop index PMLF on tablaunica;

-- Indices de tablaunica (PMEF) -> 1.2
create unique index PMEF on tablaunica (producto, medida, clienteID, fecha_hora);
-- drop index PMEF on tablaunica;

-- Indices de tablaunica (PMUF) -> 1.2
create unique index PMUF on tablaunica (producto, medida, usuario, fecha_hora);
-- drop index PMUF on tablaunica;

select *
from tablaunica;

select tablaunica.usuario
from tablaunica;

# 1.3 aparatado a
-- Obtener el número de clientes que han realizado pedidos entregados en Local. 

select count(*)
from tablaunica
where tablaunica.entrega = "Local";

# 1.3 apartado b
-- Obtener para cada pedido registrado el día 12 de febrero de 2023 que no incluya ningún tipo de oferta, el nombre del local, el nombre y medida del producto y
-- su tipo. Ordenar el resultado por nombre del producto y nombre del local.

select producto, nombre_local, tipo, medida
from tablaunica
where tablaunica.nombre_oferta is null and convert(fecha_hora,date)='2023-02-12'
order by producto, nombre_local;

# 1.3 apartado c
-- Obtener por cada nombre de local la suma total cobrada para los pedidos que incluyan pizzas.

select nombre_local, sum(total)
from tablaunica
where tipo = "Comida"
group by nombre_local;

-- 1.4 a) Falla No claves
-- Los datos de un nuevo local de la cadena de pizzerías con identificador 4, nombre La Cuarta, y situada en la calle Venus y zona 3.
 
start transaction; 
	insert into tablaunica (localId, nombre_local, calle_local, zona_local)
    values (4, "La Cuarta", "Venus", 3);
rollback;

-- 1.4 b) Falla Medida
-- Los datos de un nuevo pedido (identificador 344) del cliente zampa con identificador 25, al local "La Primera" (identificador 1) de una Pizza Cuatro quesos el 28 de
-- febrero de 2023 a las 21:00 por un importe total de 18€ y entrega a domicilio.

start transaction; 
	insert into tablaunica (pedidoId, usuario, clienteId, nombre_local, localId, producto, fecha_hora, total, entrega)
    values (344, "zampa", 25, "La Primera", 1, "Pizza Cuatro quesos", "28/02/23 21:00:00", 18, "domicilio");
rollback;

-- 1.4 c) OK
-- Los datos de un nuevo pedido (identificador 501) a domicilio del cliente new23 (identificador 35) de la calle Marte y zona 2, a la pizzería “La Primera” de 2 Pizza
-- Vegana de tamaño mediano acogiéndose a la oferta de 2x1 a domicilio, con valor subtotal y total de 13€. 

start transaction; 
	insert into tablaunica (pedidoId, entrega, usuario, clienteId, calle_cliente, zona_cliente, nombre_local, cantidad, producto, medida, nombre_oferta, subtotal, total)
    values (501, "Domicilio", "new23", 35, "Marte", 2, "La Primera", 2, "Pizza Vegana", "Mediana", "2 x 1 domicilio", 13, 13);
rollback;

-- 1.4 d) OK
-- Los datos de un nuevo pedido (identificador 223) de recogida en local del cliente maria1 (identificador 3), a la pizzería “La Primera” de la calle Luna (zona 3), de 1
-- Pizza Carbonara familiar por un precio de 18€ (sin descuentos) con fecha de “14/02/2023 21:45:00”.

start transaction; 
	insert into tablaunica (pedidoId, usuario, clienteId, nombre_local, calle_cliente, zona_cliente, cantidad, producto, medida, precio, fecha_hora)
	values (223, "maria1", 3, "La Primera", "Luna", 3, 1, "Pizza Carbonara", "Familiar", 18, "2023-02-14 21:45:00");
rollback;

-- 1.5 a) Cambiar la zona de la calle Sol a valor 4.

update tablaunica
set zona_cliente = 4
where calle_cliente = "Sol";

-- 1.5 b) Debido a un error, se debe cancelar el pedido 170, eliminando los datos de dicho pedido. 

delete from tablaunica where pedidoID = 170;












