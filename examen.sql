/*1. Obtener el nombre de los ciclistas que pertenezcan a un equipo que 
tenga más de cinco corredores y que hayan ganado alguna etapa indicando cuántas etapas ha ganado.*/
SELECT e.descripcion, COUNT(l.codigo)
FROM ciclista c, llevar l, equipo e 
WHERE c.dorsal = l.dorsal AND c.nomeq = e.nomeq
GROUP BY c.nomeq
ORDER BY COUNT(l.codigo) DESC
LIMIT 1;

/*2*/

SELECT c1.dorsal, c1.nombre
FROM ciclista c1, llevar l1 
WHERE c1.dorsal = l1.dorsal
GROUP BY l.dorsal 
HAVING COUNT(*)-2=(SELECT COUNT(*)
                    FROM ciclista c, llevar l
                    WHERE c.dorsal = l.dorsal IN(SELECT p.dorsal 
                                                FROM puerto p
                                                GROUP BY p.dorsal 
                                                ORDER BY COUNT(*)DESC
                                                LIMIT 1)
                    GROUP BY l.dorsal);


/*3*/

SELECT c1.dorsal, c1.nombre 
FROM ciclista c1, etapa e1, llevar l1, maillot m1
WHERE e1.dorsal = c1.dorsal 
AND m1.codigo = l1.codigo 
AND c1.dorsal = l1.dorsal
GROUP BY c1.dorsal 
HAVING SUM(e1.km) =(SELECT SUM(e.km)
                    FROM etapa e, llevar l 
                    WHERE l.netapa = e.netapa 
                    GROUP BY l.codigo
                    ORDER BY SUM(e.km) DESC
                    LIMIT 1);


/*4*/

SELECT c.dorsal, COUNT(l.dorsal)
FROM ciclista c LEFT JOIN llevar l USING(dorsal)
GROUP BY c.dorsal;


/*5. Ciclistas que no solamente hayan ganado una etapa, sino que también o bien hayan obtenido algún maillot en esa etapa*/

SELECT DISTINCT c.nombre
FROM ciclista c, etapa e
WHERE c.dorsal = e.dorsal
AND e.netapa IN(SELECT e1.netapa
                FROM etapa e1, llevar l1
                WHERE e1.netapa = l1.netapa) OR e.netapa IN(SELECT e2.netapa
                                                FROM etapa e2, puerto p2
                                                WHERE e2.netapa = p2.netapa);



SELECT DISTINCT c.nombre
FROM ciclista c
JOIN etapa e ON c.dorsal = e.dorsal
WHERE e.netapa IN (
  SELECT e1.netapa
  FROM etapa e1
  JOIN llevar l1 ON e1.netapa = l1.netapa
)
OR e.netapa IN (
  SELECT e2.netapa
  FROM etapa e2
  JOIN puerto p2 ON e2.netapa = p2.netapa
)