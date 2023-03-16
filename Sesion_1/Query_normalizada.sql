use practica1bda_tablaunica_normalizada;

# 1.3 aparatado a
-- Obtener el número de clientes que han realizado pedidos entregados en Local. 

select count(*)
from cliente c inner join pedido p on c.clienteID = p.clienteID
where entrega = "Local";

# 1.3 apartado b
-- Obtener para cada pedido registrado el día 12 de febrero de 2023 que no incluya ningún tipo de oferta, el nombre del local, el nombre y medida del producto y
-- su tipo. Ordenar el resultado por nombre del producto y nombre del local.

select nombre_local, pr.nombre_producto, pr.medida, nombre_tipo
from pedido p 	inner join detalle d on p.pedidoID = d.pedidoID
				inner join producto pr on d.nombre_producto = pr.nombre_producto and d.medida = pr.medida
                inner join local l on l.localID = p.localID
where nombre_oferta is null and convert(fecha_hora,date)='2023-02-12'
order by nombre_local, pr.nombre_producto;

# 1.3 apartado c
-- Obtener por cada nombre de local la suma total cobrada para los pedidos que incluyan pizzas.

select nombre_local, SUM(total)
from local l 	inner join pedido p on l.localID = p.localID
				inner join detalle d on d.pedidoID = p.pedidoID
                inner join producto pr on d.nombre_producto = pr.nombre_producto and d.medida = pr.medida
where pr.nombre_tipo = "Comida"
group by nombre_local;


-- 1.4 a) Funciona
-- Los datos de un nuevo local de la cadena de pizzerías con identificador 4, nombre La Cuarta, y situada en la calle Venus y zona 3.
 
start transaction; 
	insert into calle (nombre_calle, zona)
    values ("Venus", 3);
    
	insert into local (localId, nombre_local, calle_local)
    values (4, "La Cuarta", "Venus");
rollback;


-- 1.4 b) Falla Medida
-- Los datos de un nuevo pedido (identificador 344) del cliente zampa con identificador 25, al local "La Primera" (identificador 1) de una Pizza Cuatro quesos el 28 de
-- febrero de 2023 a las 21:00 por un importe total de 18€ y entrega a domicilio.

start transaction; 
	insert into producto (nombre_producto)
    values ("Pizza Cuatro quesos");
    
    insert into cliente (usuario, clienteID)
	values ("zampa", 25);
    
    insert into local (localId, nombre_local)
    values (1, "La Primera", "Venus");

	insert into pedido (pedidoId, fecha_hora, total, entrega)
    values (344, "28/02/23 21:00:00", 18, "domicilio");
rollback;



-- 1.4 c) Fallo no tengo fecha del nuevo pedido
-- Los datos de un nuevo pedido (identificador 501) a domicilio del cliente new23 (identificador 35) de la calle Marte y zona 2, a la pizzería “La Primera” de 2 Pizza
-- Vegana de tamaño mediano acogiéndose a la oferta de 2x1 a domicilio, con valor subtotal y total de 13€. 

start transaction; 
    insert into calle (nombre_calle, zona)
    values ("Marte", 2);
    
    insert into cliente (usuario, clienteID, calle_cliente)
	values ("new23", 35, "Marte");
    
    insert into pedido (pedidoId, localID, total, entrega)
    values (501, 1, 13, "Domicilio");
    
    insert into detalle (pedidoId, nombre_producto, medida, nombre_oferta, subtotal, cantidad)
    values (501, "Pizza Vegana", "Mediana", "2 x 1 domicilio", 13, 2);
rollback;

-- 1.4 d) Fallo no tengo calle de maria1 ni otros muchos valores que estan puestos a not null (es probable que haya que quitar not nulls pero funciona o eso creo)
-- Los datos de un nuevo pedido (identificador 223) de recogida en local del cliente maria1 (identificador 3), a la pizzería “La Primera” de la calle Luna (zona 3), de 1
-- Pizza Carbonara familiar por un precio de 18€ (sin descuentos) con fecha de “14/02/2023 21:45:00”.

start transaction; 
    insert into pedido (pedidoId, localID, clienteID, total, fecha_hora)
    values (223, 1, 18, 3, "2023-02-14 21:45:00");
    
    insert into detalle (pedidoId, nombre_producto, medida, subtotal, cantidad)
    values (223, "Pizza Carbonara", "Familiar", 18, 1);
    
    insert into cliente (usuario, clienteID)
	values ("maria1", 3);
rollback;

-- 1.5 a) Cambiar la zona de la calle Sol a valor 4.

start transaction;
	update calle
	set zona = 4
	where nombre_calle = "Sol";
rollback;


-- 1.5 b) Debido a un error, se debe cancelar el pedido 170, eliminando los datos de dicho pedido. 

start transaction;
delete from pedido where pedidoID = 170;
rollback;



