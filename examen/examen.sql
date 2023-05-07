1.

INSERT INTO (idCocina, idPlato) 
VALUES ((SELECT idCocina FROM Cocinero ORDER BY añosServicio LIMIT 1), 
(SELECT idPlato FROM plato p ORDER BY costo LIMIT 1)); 

2.
UPDATE Pedido
SET ¿listo?=true
WHERE (SELECT p.id
	   FROM pedido p, incluye i, plato p1
	   WHERE p.id = i.idPedido AND p1.id = i.idPlato
	   AND ALL p1.¿listo?=true);


3.
SELECT p1.nombreYApellido
FROM Pinche p, Empleado e, Persona p1
WHERE p.id IN(SELECT c.idPinche
			FROM Cocinero c, Cocina c1, Plato p
			WHERE c.idCocinero = c1.idCocina 
			AND c.idCocina = p.idPlato
			AND p.nombre = 'Lentejas a la Riojana'
			GROUP BY c.idPinche)
AND p.id = e.id AND p1.id = e.id
GROUP BY p.id;

4.
SELECT c.idCliente, p.idPlato, COUNT(p.idPlato)
FROM cliente c, pedido p, incluye i, plato p1 
WHERE c.idCliente = p.idCliente AND i.idPedido = p.idPedido AND i.idPlato=p.idPlato
GROUP BY p.idPlato, c.idCliente 
ORDER BY c.idCliente DESC;

5.
SELECT pt1.idPlato
FROM plato pt1 
WHERE pt1.idPlato = (SELECT pt.idPlato
					FROM plato pt, contiene c, ingrediente i
					WHERE pt.idPlato = c.idPlato AND c.idIngrediente = i.idIngrediente
					GROUP BY pt.idPlato
					HAVING MAX(c.cantidad))
GROUP BY pt1.idPlato;