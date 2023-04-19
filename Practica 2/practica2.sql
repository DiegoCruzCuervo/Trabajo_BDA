use practica2bda22_23;

select *
from clientes;

select *
from territorioventas;

select *
from categoriaproducto;


select *
from subcategoriaproducto;

select *
from productos;

select *
from pedidos;

select *
from detallepedidos;

-- Mejorar la query 10k rows
create index CANT on detallepedidos(cantidad);

-- 121k rows
drop index CANT on detallepedidos;

-- Ejercicio 1
select distinct nombre_producto
from productos p inner join detallepedidos d on p.productoID = d.productoID
where d.cantidad > 5;

-- VARIATE del 1
select distinct nombre_producto
from productos p
where exists ( 	select productoID
				from detallepedidos d
                where p.productoID = d.productoID and d.cantidad > 5
			);

-- Crear una consulta SQL que permita obtener el nombre de los productos de categoría Componente,
-- subcategoría que contenga con la palabra Cuadro, y color Blue, que se hayan vendido en más
-- pedidos a lo largo del tiempo que todos los productos de las subcategorías Dirección o Horquilla.

SELECT P.nombre_producto, COUNT(*)
FROM categoriaproducto C JOIN subcategoriaproducto SC ON (C.categoriaID = SC.categoriaID)
						 JOIN productos P ON (P.subcategoriaID = SC.subcategoriaID)
                         JOIN detallepedidos DP ON (DP.productoID = P.productoID)
WHERE C.nombre_categoria = 'Componente' AND SC.nombre_subcategoria LIKE '%Cuadro%' AND P.color = 'Blue'
GROUP BY P.nombre_producto
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
					    FROM subcategoriaproducto SCC JOIN productos PP ON (SCC.subcategoriaID = PP.subcategoriaID)
                        JOIN detallepedidos PE ON (PE.productoID = PP.productoID)
                        WHERE SCC.nombre_subcategoria = 'Dirección' OR SCC.nombre_subcategoria = 'Horquilla'
                        GROUP BY nombre_producto);
                        
-- Crear indice nombre_categoria, color, nombre_subcategoria, 
                        









