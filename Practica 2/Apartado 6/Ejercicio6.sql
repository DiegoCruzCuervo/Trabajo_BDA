# Ejercicio 6

#Crear una consulta que devuelva, para cada pedido el nombre del cliente, su país, la fecha del
#pedido, el total del pedido calculado como la suma de los detalles de cada pedido (precio_unitario
#– descuento_unitario) * cantidad. Tomar nota del coste y plan de ejecución

-- Coste inical 30548 / Full table Scan ; Non-unique Key (cliente_territorio) ; Non-unique Key (pedido_cliente) ; Non-unique Key (PRIMARY) 

select c.primer_nombre, t.nombre_pais, p.fecha_venta, sum((precio_unitario - descuento_unitario)*cantidad) as TotalPedido
from pedidos p inner join clientes c on p.ClienteID = c.ClienteID
			   inner join territorioventas t on c.territorioID = t.territorioID
               inner join detallepedidos d on p.PedidoID = d.PedidoID
group by p.fecha_venta, c.primer_nombre, t.nombre_pais;


-- Meter el nombre_cliente en detalle pedido / Meter el país en detalle pedido / Meter fecha en detalle pedido

ALTER TABLE detallepedidos ADD primer_nombre varchar(50) NOT NULL;
ALTER TABLE detallepedidos ADD nombre_pais varchar(100) NOT NULL;
ALTER TABLE detallepedidos ADD fecha_venta date NOT NULL;

delimiter //
create trigger fecha_venta_tg_upload
after update on pedidos
for each row
begin

UPDATE detallepedidos
SET fecha_venta = NEW.fecha_venta
WHERE PedidoID = NEW.PedidoID;

end //

delimiter //
create trigger primer_nombre_tg_upload
after update on clientes
for each row
begin

UPDATE detallepedidos
SET primer_nombre = NEW.primer_nombre
WHERE PedidoID in ( select PedidoID
					from pedidos p
                    where p.ClienteID = NEW.ClienteID
                    );


end //

delimiter //
create trigger nombre_territorio_tg_upload
after update on territorioventas
for each row
begin

UPDATE detallepedidos
SET nombre_pais = NEW.nombre_pais
WHERE  PedidoID in ( select PedidoID
					from pedidos p
                    where p.TerritorioID = NEW.TerritorioID
                    );

end //

drop trigger nombre_territorio_tg_upload;
drop trigger primer_nombre_tg_upload;
drop trigger fecha_venta_tg_upload;

-- Último apartado -> Query tras desnormalizacion -> 12601 ha bajado considerablemente
select primer_nombre, nombre_pais, fecha_venta, sum((precio_unitario - descuento_unitario)*cantidad) as TotalPedido
from detallepedidos
group by primer_nombre, nombre_pais, fecha_venta;
-- 

########### TESTING TRIGGERS ###########

select *
from detallepedidos
where PedidoID = 57418;

select *
from pedidos
order by clienteID;

select *
from clientes
order by clienteID;

select *
from territorioventas;

use practica2bda22_23;
update clientes
set primer_nombre = "Spain"
where clienteID = 11024;

update territorioventas
set nombre_pais = "Spain"
where TerritorioID = 10;

update pedidos
set fecha_venta = "1-0-0" 
where PedidoID = 57418;

########################################