-- Apartado 5 Sesion 1
-- Realizar cambios en los datos mediante sentancias SQL

-- a)
update tablaunica
set zona_local = 4
where calle_local = "Sol";

update tablaunica
set zona_cliente = 4
where zona_cliene= "Sol";

-- b)
delete from tablaunica where pedidoID = 170;