use pracBDA;

-- Clave producto, medida, localID, fecha_hora
create unique index PMLF on tablaunica (producto, medida, localID, fecha_hora);
drop index PMLF on tablaunica;

-- CLave producto, medida, cliente, fecha_hora
create unique index PMEF on tablaunica (producto, medida, clienteID, fecha_hora);
drop index PMEF on tablaunica;

-- Clave producto, medida, usuario, fecha_hora
create unique index PMUF on tablaunica (producto, medida, usuario, fecha_hora);
drop index PMUF on tablaunica;