USE practica2bda22_23;

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
