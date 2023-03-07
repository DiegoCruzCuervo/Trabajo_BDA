use pracBDA;

-- a)
start transaction;
insert into tablaunica (localID, nombre_local, calle_local, zona_local) values (4, "La Cuarta", "Venus", 3);
commit;
rollback;
-- Fallo (no hay producto)

-- b)
start transaction;
insert into tablaunica (pedidoID, usuario, clienteID, nombre_local, localID, producto, fecha_hora, total, entrega)
values (344, "zampa", 25, "La Primera", 1, "Pizza Cuatro quesos", "2023-02-28 21:00:00", 18.00, "Domicilio");
commit;
-- Fallo (no hay medida)

-- c)
start transaction;
insert into tablaunica (pedidoID, entrega, usuario, clienteID, calle_cliente, zona_cliente, nombre_local, cantidad, producto, medida, nombre_oferta, subtotal, total)
values (501, "Local", "new23", 35, "Marte", 2, "La Primera", 2, "Pizza Vegana", "Mediana", "2x1 domicilio", 13, 13);
commit;
rollback;
delete from tablaunica where usuario = "new23";
-- Inserccion correcta

-- d)
start transaction;
insert into tablaunica (pedidoID, entrega, usuario, clienteID, nombre_local, calle_local, zona_local, cantidad, producto, medida, total, fecha_hora)
values (223, "Local", "maria1", 3, "La Primera", "Luna", 3, 1, "Pizza Carbonara", "Familiar", 18, "2023-02-14 21:45:00");
commit;
rollback;
delete from tablaunica where pedidoID = 223;
-- Inserccion correcta
