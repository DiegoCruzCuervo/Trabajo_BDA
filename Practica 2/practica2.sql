set SQL_SAFE_UPDATES = 0;

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
FROM categoriaproducto C  JOIN subcategoriaproducto SC ON (C.categoriaID = SC.categoriaID)
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
create unique index categoria_nombrecategoria on categoriaproducto (nombre_categoria);
create unique index nombre_subcategoria on subcategoriaproducto (nombre_subcategoria);
create index color on productos (color);
-- No hace full table scane y el coste baja a 78








-- -----------------------------------------------------
-- Practica 2 -Consulta del apartado 4
-- -----------------------------------------------------

-- seleccionamos el nombre y apellidos de los clientes que hayan realizado un pedido y nacidos entre 1980 y 1986, que sean mujeres y
-- con ingresos anuales en el 10% de los más altos entre 1970 y 80 y que sean mujeres. Comparando la suma de los productos realizados
-- con la media de productos que se compraron en 2021

# Katrina Chande
# Lindsay Chander
# Tabitha Moreno


select c.primer_nombre, c.apellidos
from pedidos p inner join clientes c on p.clienteID = c.clienteID
     inner join detallepedidos d ON p.PedidoID = d.PedidoID
where year(c.fecha_nacimiento) between 1980 and 1986 and genero = "F" and
   c.ingresos_anuales >= (
      select MAX(ingresos_anuales) AS `90th_percentile`
      from (
             select ingresos_anuales, PERCENT_RANK() OVER (ORDER BY ingresos_anuales)
                    AS percentile_rank
             from clientes
             where year(fecha_nacimiento) between 1970  and 1980 and genero = "F"
           ) AS ranked_sales
     where percentile_rank <= 0.9
    )
group by c.clienteID, c.primer_nombre, c.apellidos
having sum((precio_unitario - descuento_unitario) * cantidad) >= (
       select avg(total) 
       from (
             select sum( (precio_unitario - descuento_unitario) * cantidad) as total
             from pedidos p inner join detallepedidos d ON p.PedidoID = d.PedidoID
             where year(fecha_venta) = 2021
             group by clienteID
) as totales2021
);

drop index categoria_nombrecategoria on categoriaproducto;
drop index nombre_subcategoria on subcategoriaproducto;
drop index color on productos;

-- Indices -> ingresos_anuales / Antes: 4087; Después: 1735 (ingresos) / Después: 4623 (genero y ingresos)

create index indice_ingresos_anuales on clientes (ingresos_anuales);
create index indice_genero on clientes (genero);
drop index indice_genero on clientes;

                        









