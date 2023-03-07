use pracABD;

-- Obtener el número de clientes que han realizado pedidos entregados en Local. 
select count(*)
from tablaunica
where entrega='Local';

-- Obtener para cada pedido registrado el día 12 de febrero de 2023 que no incluya ningún tipo de oferta, el nombre del local, el nombre y medida del producto y su tipo. Ordenar el resultado por nombre del producto y nombre del local. 
select nombre_local, producto, medida, tipo
from tablaunica
where convert(fecha_hora,date)='2023-02-12' and nombre_oferta is null and descuento is null;

-- Obtener por cada nombre de local la suma total cobrada para los pedidos que incluyan pizzas.
select nombre_local, sum(total) as sumaTotal
from tablaunica
group by nombre_local;

