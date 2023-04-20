USE practica2bda22_23;

-- Consulta apartado b
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

-- Indices apartado d
CREATE INDEX Inombre_categoria ON categoriaproducto (nombre_categoria);
CREATE INDEX Icolor ON productos (color);
CREATE INDEX Inombre_subcategoria ON subcategoriaproducto (nombre_subcategoria);


DROP INDEX Inombre_categoria ON categoriaproducto;
DROP INDEX Icolor ON productos;
DROP INDEX Inombre_subcategoria ON subcategoriaproducto;

-- Uso del index hint -> Ignore index (Icolor)
SELECT P.nombre_producto, COUNT(*)
FROM categoriaproducto C JOIN subcategoriaproducto SC ON (C.categoriaID = SC.categoriaID)
			 JOIN productos P ignore index (Icolor) ON (P.subcategoriaID = SC.subcategoriaID)
                         JOIN detallepedidos DP ON (DP.productoID = P.productoID)
WHERE C.nombre_categoria = 'Componente' AND SC.nombre_subcategoria LIKE '%Cuadro%' AND P.color = 'Blue'
GROUP BY P.nombre_producto
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
			FROM subcategoriaproducto SCC JOIN productos PP ON (SCC.subcategoriaID = PP.subcategoriaID)
                        JOIN detallepedidos PE ON (PE.productoID = PP.productoID)
                        WHERE SCC.nombre_subcategoria = 'Dirección' OR SCC.nombre_subcategoria = 'Horquilla'
                        GROUP BY nombre_producto);