use practica2bda22_23;
-- Ejercicio 6

-- Sacar la suma de los detalles de cada pedido
select pedidoID, sum((precio_unitario - descuento_unitario)*cantidad) as SumaTotal
from detallepedidos
group by pedidoID;

-- Nombre y pais de los clientes
select clienteId, primer_nombre, nombre_territorio
from clientes c inner join territorioventas t on c.territorioId=t.territorioId;

-- Fecha del pedido y cliente que lo realizó
select pedidoId, clienteID, fecha_venta
from pedidos;

-- Consulta 2+3
select primer_nombre, nombre_pais, pedidoID, fecha_venta
from clientes c inner join territorioventas t on c.territorioId=t.territorioId
inner join pedidos p on c.clienteId=p.clienteId;

-- Consulta final
select primer_nombre, nombre_pais, fecha_venta, SumaTotal
from clientes c inner join territorioventas t on c.territorioId=t.territorioId
inner join pedidos p on c.clienteId=p.clienteId
inner join (select pedidoID, sum((precio_unitario - descuento_unitario)*cantidad) as SumaTotal
from detallepedidos
group by pedidoID) as TablaAux on p.pedidoId=TablaAux.pedidoId;