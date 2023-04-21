use practica2bda22_23;
-- Ejercicio 6
-- Consulta
select pedidoID, primer_nombre, nombre_territorio, fecha_venta, sum((precio_unitario - descuento_unitario) * cantidad) as sumaTotal
from clientes c inner join territorioventas tv on c.territorioId=tv.territorioId
inner join pedidos p on p.ClienteId=c.ClienteID
inner join detallepedidos dp on dp.PedidoId=p.PedidoId
group by pedidoId;