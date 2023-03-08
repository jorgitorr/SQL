CREATE DATABASE select_vi;

CREATE TABLE equipo(
    nomeq VARCHAR(50),
    descripcion VARCHAR(50),
    CONSTRAINT eq_nom_pk PRIMARY KEY(nomeq)
);

CREATE TABLE ciclista(
    dorsal SMALLINT,
    nombre VARCHAR(50),
    edad TINYINT,
    nomeq VARCHAR(50),
    CONSTRAINT ci_do_pk PRIMARY KEY(dorsal),
    CONSTRAINT ci_nom_fk FOREIGN KEY(nomeq) REFERENCES equipo(nomeq)
);

CREATE TABLE etapa(
    netapa TINYINT,
    km SMALLINT,
    salida VARCHAR(20),
    llegada VARCHAR(20),
    dorsal SMALLINT,
    CONSTRAINT et_dor_fk FOREIGN KEY(dorsal) REFERENCES ciclista(dorsal),
    CONSTRAINT et_ne_pk PRIMARY KEY(netapa)
);

CREATE TABLE puerto(
    nompuerto VARCHAR(50),
    altura MEDIUMINT,
    categoria VARCHAR(1),
    pendiente TINYINT,
    netapa TINYINT,
    dorsal SMALLINT,
    CONSTRAINT pu_nom_pk PRIMARY KEY(nompuerto),
    CONSTRAINT pu_ne_fk FOREIGN KEY(netapa) REFERENCES etapa(netapa),
    CONSTRAINT pu_do_fk FOREIGN KEY(dorsal) REFERENCES ciclista(dorsal)
);

CREATE TABLE maillot(
    codigo VARCHAR(5),
    tipo VARCHAR(20),
    color VARCHAR(50),
    premio MEDIUMINT,
    CONSTRAINT ma_cod_pk PRIMARY KEY(codigo)
);

CREATE TABLE llevar(
    dorsal SMALLINT,
    netapa TINYINT,
    codigo VARCHAR(5),
    CONSTRAINT ll_ne_fk FOREIGN KEY(netapa) REFERENCES etapa(netapa),
    CONSTRAINT ll_dor_fk FOREIGN KEY(dorsal) REFERENCES ciclista(dorsal),
    CONSTRAINT ll_cod_fk FOREIGN KEY(codigo) REFERENCES maillot(codigo)
);


insert into equipo values('Amore Vita','Ricardo Padacci');
insert into equipo values('Banesto','Miguel EchevarrÃ­a');
insert into equipo values('Bresciali-Refin','Pietro Armani');
insert into equipo values('Carrera','Luigi Petroni');
insert into equipo values('Gatorade','Gian Luca Pacceli');
insert into equipo values('Kelme','Ãlvaro Pino');
insert into equipo values('Mapei-Clas','Juan FernÃ¡ndez');
insert into equipo values('Navigare','Lorenzo Sciacci');
insert into equipo values('Telecom','Morgan Reikacrd');
insert into equipo values('TVM','Steevens Henk');

insert into ciclista values(1,'Miguel Indurain',21,'Banesto');
insert into ciclista values(2,'Pedro Delgado',29,'Banesto');
insert into ciclista values(3,'Alex Zulle',20,'Navigare');
insert into ciclista values(4,'Alessio Di Basco',30,'TVM');
insert into ciclista values(5,'Armand',17,'Amore Vita');
insert into ciclista values(8,'Jean Van Poppel',24,'Bresciali-Refin');
insert into ciclista values(9,'Maximo Podel',17,'Telecom');
insert into ciclista values(10,'Mario Cipollini',31,'Carrera');
insert into ciclista values(11,'Eddy Seigneur',20,'Amore Vita');
insert into ciclista values(12,'Alessio Di Basco',34,'Bresciali-Refin');
insert into ciclista values(13,'Gianni Bugno',24,'Gatorade');
insert into ciclista values(15,'JesÃºs Montoya',25,'Amore Vita');
insert into ciclista values(16,'Dimitri Konishev',27,'Amore Vita');
insert into ciclista values(17,'Bruno Lealli',30,'Amore Vita');
insert into ciclista values(20,'Alfonso GutiÃ©rrez',27,'Navigare');
insert into ciclista values(22,'Giorgio Furlan',22,'Kelme');
insert into ciclista values(26,'Mikel Zarrabeitia',30,'Carrera');
insert into ciclista values(27,'Laurent Jalabert',22,'Banesto');
insert into ciclista values(30,'Melchor Mauri',26,'Mapei-Clas');
insert into ciclista values(31,'Per Pedersen',33,'Banesto');
insert into ciclista values(32,'Tony Rominger',31,'Kelme');
insert into ciclista values(33,'Stefenao della Sveitia',26,'Amore Vita');
insert into ciclista values(34,'Clauido Chiapucci',23,'Amore Vita');
insert into ciclista values(35,'Gian Mateo Faluca',34,'TVM');

insert into etapa values(1,35,'Valladolid','Ãvila',1);
insert into etapa values(2,70,'Salamanca','Zamora',2);
insert into etapa values(3,150,'Zamora','Almendralejo',1);
insert into etapa values(4,330,'CÃ³rdoba','Granada',1);
insert into etapa values(5,150,'Granada','AlmerÃ­a',3);

insert into puerto values('p1',2489,'1',34,2,3);
insert into puerto values('p2',2789,'1',44,4,3);
insert into puerto values('Puerto F',2500,'E',17,4,2);
insert into puerto values('Puerto fff',2500,'E',17,4,2);
insert into puerto values('Puerto nuevo1',2500,'a',17,4,1);
insert into puerto values('Puerto otro',2500,'E',17,4,1);
insert into puerto values('Puerto1',2500,'E',23,1,2);

insert into maillot values('MGE','General','Amarillo',1000000);
insert into maillot values('MMO','MontaÃ±a','Blanco y rojo',500000);
insert into maillot values('MMS','MÃ¡s sufrido','Estrellitas rojas',400000);
insert into maillot values('MMV','Metas volantes','Rojo',400000);
insert into maillot values('MRE','Regularidad','Verde',300000);
insert into maillot values('MSE','Sprint especial','Rosa',300000);

insert into llevar values(1,3,'MGE');
insert into llevar values(1,4,'MGE');
insert into llevar values(2,2,'MGE');
insert into llevar values(3,1,'MGE');
insert into llevar values(3,1,'MMV');
insert into llevar values(3,4,'MRE');
insert into llevar values(4,1,'MMO');


/*1. Obtener el código, el tipo, el color y el premio de todos los maillots que hay.*/
SELECT m.codigo, m.tipo, m.color, m.premio
FROM maillot m;


/*2. Obtener el dorsal y el nombre de los ciclistas cuya edad sea menor o igual
que 25 años.*/
SELECT c.dorsal, c.nombre
FROM ciclista c
WHERE c.edad<=25;

/*3. Obtener el nombre y la altura de todos los puertos de categoría
ʻEʼ (Especial).*/
SELECT p.nompuerto, p.altura 
FROM puerto p
WHERE p.categoria LIKE 'E';


/*4. Obtener el valor del atributo netapa de aquellas etapas con salida y llegada
en la misma ciudad.*/
SELECT e.netapa
FROM etapa e
WHERE e.salida=e.llegada;



/*5. ¿Cuántos ciclistas hay?*/
SELECT COUNT(*)
FROM ciclista c;



/*6. ¿Cuántos ciclistas hay con edad superior a 25 años?*/
SELECT COUNT(*)
FROM ciclista c
WHERE c.edad>25; 



/*7. ¿Cuántos equipos hay?*/
SELECT COUNT(*)
FROM equipo;




/*8. Obtener la media de edad de los ciclistas.*/
SELECT ROUND(AVG(c.edad),2)
FROM ciclista c;



/*9. Obtener la altura mínima y máxima de los puertos de montaña.*/
SELECT MIN(p.altura), MAX(p.altura)
FROM puerto p;


/*10. Obtener el nombre de cada ciclista junto con el nombre del equipo al que
pertenece*/
SELECT c.nombre, e.nomeq
FROM ciclista c, equipo e 
WHERE c.nomeq = e.nomeq;



/*11. Obtener el nombre de los ciclistas que sean de Banesto.*/
SELECT c.nombre
FROM ciclista c, equipo e;



/*12. ¿Cuántos ciclistas pertenecen al equipo Amore Vita?*/
SELECT COUNT(c.nombre)
FROM ciclista c 
WHERE c.nomeq = "Amore Vita";



/*13. Edad media de los ciclistas del equipo TVM.*/
SELECT ROUND(AVG(c.edad),0)
FROM ciclista c 
WHERE c.nomeq = "TVM";




/*14. Nombre de los ciclistas que pertenezcan al mismo equipo que Miguel
Indurain*/
SELECT c.nombre
FROM ciclista c
WHERE c.nomeq IN(SELECT c1.nomeq
FROM ciclista c1
WHERE c1.nombre = "Miguel Indurain")
and c.nombre!="Miguel Indurain"; 




/*15. Nombre de los ciclistas que han ganado alguna etapa.*/
SELECT c.nombre
FROM ciclista c, etapa e
WHERE c.dorsal = e.dorsal
GROUP BY c.nombre; 


/*16. Nombre de los ciclistas que han llevado el maillot General.*/
SELECT c.nombre
FROM ciclista c, llevar l, maillot m  
WHERE c.dorsal = l.dorsal AND l.codigo = m.codigo
AND m.tipo = "General"
GROUP BY c.nombre;


/*17. Obtener el nombre del ciclista más joven.*/
SELECT c.nombre
FROM ciclista c
WHERE c.edad IN(SELECT MIN(c1.edad)
FROM ciclista c1)
GROUP BY c.nombre; 


/*18. Obtener el número de ciclistas de cada equipo.*/
SELECT c.nomeq, COUNT(*)
FROM ciclista c 
GROUP BY c.nomeq;


/*19. Obtener el nombre de los equipos que tengan más de 5 ciclistas.*/
SELECT e.nomeq
FROM ciclista c, equipo e 
WHERE c.nomeq = e.nomeq
GROUP BY c.nomeq
HAVING COUNT(c.nombre)>5;



/*20. Obtener el número de puertos que ha ganado cada ciclista.*/
SELECT c.nombre, COUNT(*)
FROM puerto p, ciclista c
WHERE c.dorsal = p.dorsal 
GROUP BY c.dorsal;


/*21. Obtener el nombre de los ciclistas que han ganado más de un puerto.*/




/*22. Obtener el nombre y el director de los equipos a los que pertenezca algún
ciclista mayor de 33 años.*/




/*23. Nombre de los ciclistas que no pertenezcan a Kelme*/


/*24. Nombre de los ciclistas que no hayan ganado ninguna etapa.*/




/*25. Nombre de los ciclistas que no hayan ganado ningún puerto de montaña.*/




/*26. Nombre de los ciclistas que hayan ganado más de un puerto de montaña.*/





/*27. ¿Qué ciclistas han llevado el mismo maillot que Miguel Indurain?*/





/*28. De cada equipo obtener la edad media, la máxima edad y la mínima edad.*/





/*29. Nombre de aquellos ciclistas que tengan una edad entre 25 y 30 años y que
no pertenezcan a los equipos Kelme y Banesto.*/






/*30. Nombre de los ciclistas que han ganado la etapa que comienza en Zamora.*/





/*31. Obtén el nombre y la categoría de los puertos ganados por ciclistas del
equipo ʻBanestoʼ.*/




/*32. Obtener el nombre de cada puerto indicando el número (netapa) y los
kilómetros de la etapa en la que se encuentra el puerto.*/




/*33. Obtener el nombre de los ciclistas con el color de cada maillot que hayan
llevado.*/





/*34. Obtener pares de nombre de ciclista y número de etapa tal que ese ciclista
haya ganado esa etapa habiendo llevado el maillot de color amarillo al menos
una vez.*/







/*35. Obtener el valor del atributo netapa de las etapas que no comienzan en la
misma ciudad en que acabó la anterior etapa.*/




/*36. Obtener el valor del atributo netapa y la ciudad de salida de aquellas etapas
que no tengan puertos de montaña.*/



/*37. Obtener la edad media de los ciclistas que han ganado alguna etapa.*/



/*38. Selecciona el nombre de los puertos con una altura superior a la altura
media de todos los puertos.*/



/*39. Obtener el nombre de la ciudad de salida y de llegada de las etapas donde
estén los puertos con mayor pendiente.*/



/*40. Obtener el dorsal y el nombre de los ciclistas que han ganado los puertos
de mayor altura.*/




/*41. Obtener el nombre del ciclista más joven que ha ganado al menos una
etapa.*/



/*42. Obtener el valor del atributo netapa de aquellas etapas tales que todos los
puertos que están en ellas tienen más de 700 metros de altura.*/




/*43. Obtener el nombre y el director de los equipos tales que todos sus ciclistas
son mayores de 20 años.*/




/*44. Obtener el dorsal y el nombre de los ciclistas tales que todas las etapas que
han ganado tienen más de 170 km (es decir que sólo han ganado etapas de
más de 170 km).*/




/*45. Obtener el nombre de los ciclistas que han ganado todos los puertos de
una etapa y además han ganado esa misma etapa.*/




/*46. Obtener el nombre de los equipos tales que todos sus corredores han
llevado algún maillot o han ganado algún puerto.*/




/*47. Obtener el código y el color de aquellos maillots que sólo han sido llevados
por ciclistas de un mismo equipo.*/




/*48. Obtener el nombre de aquellos equipos tal que sus ciclistas sólo hayan
ganado puertos de 1ª categoría.*/



/*49. Obtener el valor del atributo netapa de aquellas etapas que tienen puertos
de montaña indicando cuántos tiene.*/




/*50. Obtener el nombre de todos los equipos indicando cuántos ciclistas tiene
cada uno.*/




/*51. Obtener el director y el nombre de los equipos que tengan más de 3
ciclistas y cuya edad media sea igual o inferior a 30 años.*/



/*52. Obtener el nombre de los ciclistas que pertenezcan a un equipo que tenga
más de cinco corredores y que hayan ganado alguna etapa indicando cuántas
etapas ha ganado.*/


/*53. Obtener el nombre de los equipos y la edad media de sus ciclistas de
aquellos equipos que tengan la media de edad máxima de todos los equipos.*/


/*54. Obtener el director de los equipos cuyos ciclistas han llevado más días
maillots de cualquier tipo.*/



/*55. Obtener el código y el color del maillot que ha sido llevado por algún ciclista
que no ha ganado ninguna etapa.*/



/*56. Obtener el valor del atributo netapa, la ciudad de salida y la ciudad de
llegada de las etapas de más de 190 km y que tengan por lo menos dos
puertos.*/



/*57. Obtener el dorsal y el nombre de los ciclistas que no han llevado todos los
maillots que ha llevado el ciclista de dorsal 2.*/



/*58. Obtener el dorsal y el nombre de los ciclistas que han llevado al menos un
maillot de los que ha llevado el ciclista de dorsal 2.*/



/*59. Obtener el dorsal y el nombre de los ciclistas que no han llevado ningún
maillot de los que ha llevado el ciclista de dorsal 2.*/




/*60. Obtener el dorsal y nombre de los ciclistas que han llevado exactamente los
mismos maillots que ha llevado el ciclista de dorsal 1.*/


/*61. Obtener el dorsal y el nombre del ciclista que ha llevado durante más
kilómetros un mismo maillot e indicar también el color de dicho maillot.*/



/*62. Obtener el dorsal y el nombre de los ciclistas que han llevado dos tipos de
maillot menos de los que ha llevado el ciclista de dorsal 3.*/



/*63. Obtener el valor del atributo netapa y los km de las etapas que tienen
puertos de montaña.*/