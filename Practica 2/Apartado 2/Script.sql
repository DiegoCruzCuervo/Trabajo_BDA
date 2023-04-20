-- Apartado 1 (Inner Join)
select distinct nombre_producto
from productos p inner join detallepedidos d on p.productoID = d.productoID
where d.cantidad > 5;

-- Variante (Subconsulta)
select distinct nombre_producto
from productos p
where exists ( 	select productoID
				from detallepedidos d
                where p.productoID = d.productoID and d.cantidad > 5
			);
            
-- Indices para el apartado 3
create index index_cantidad on detallepedidos (cantidad);
drop index index_cantidad on detallepedidos;