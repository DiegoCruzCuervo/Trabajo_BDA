use practica2bda22_23;
-- Ejercicio 5
-- Update b

-- Pedidos de 2023
select pedidoID
from pedidos
where year(fecha_venta)=2023;

-- Productos vendidos con categoria Bicicleta
select ProductoId
from productos p inner join subcategoriaproducto sb on p.subcategoriaID=sb.subcategoriaID
inner join categoriaproducto cp on sb.categoriaID=cp.categoriaID
where cp.nombre_categoria='Bicicleta'
group by productoId;

-- Productos que ya tenian descuento
select productoID
from detallepedidos
where descuento_unitario > 0
group by productoID;

-- Consulta grande 
select *
from detallepedidos
where  descuento_unitario > 0 and
pedidoID in (select pedidoID
from pedidos
where year(fecha_venta)=2023
group by PedidoID) and
ProductoId in (select ProductoId
from productos p inner join subcategoriaproducto sb on p.subcategoriaID=sb.subcategoriaID
inner join categoriaproducto cp on sb.categoriaID=cp.categoriaID
where cp.nombre_categoria='Bicicleta'
group by ProductoId);

-- Actualizacion
start transaction;

select *
from detallepedidos
where  descuento_unitario > 0 and
pedidoID in (select pedidoID
from pedidos
where year(fecha_venta)=2023
group by PedidoID) and
ProductoId in (select ProductoId
from productos p inner join subcategoriaproducto sb on p.subcategoriaID=sb.subcategoriaID
inner join categoriaproducto cp on sb.categoriaID=cp.categoriaID
where cp.nombre_categoria='Bicicleta'
group by ProductoId);

update detallepedidos
set descuento_unitario=descuento_unitario+0.01
where descuento_unitario>0 and 
pedidoID in (select pedidoID
from pedidos
where year(fecha_venta)=2023
group by PedidoID) and
ProductoId in (select ProductoId
from productos p inner join subcategoriaproducto sb on p.subcategoriaID=sb.subcategoriaID
inner join categoriaproducto cp on sb.categoriaID=cp.categoriaID
where cp.nombre_categoria='Bicicleta'
group by ProductoId);

select *
from detallepedidos
where  descuento_unitario > 0 and
pedidoID in (select pedidoID
from pedidos
where year(fecha_venta)=2023
group by PedidoID) and
ProductoId in (select ProductoId
from productos p inner join subcategoriaproducto sb on p.subcategoriaID=sb.subcategoriaID
inner join categoriaproducto cp on sb.categoriaID=cp.categoriaID
where cp.nombre_categoria='Bicicleta'
group by ProductoId);

rollback;