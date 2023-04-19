CREATE TABLE barcos(
    matricula VARCHAR(20),
    nombre VARCHAR(50),
    clase CHAR(1),
    armador VARCHAR(50),
    capacidad MEDIUMINT,
    nacionalidad VARCHAR(50)
);


CREATE TABLE lotes(
    codigo VARCHAR(10),
    codEspecie VARCHAR(50),
    matricula VARCHAR(20),
    numKilos SMALLINT,
    PPKS FLOAT,
    PPKA FLOAT,
    fechaVenta VARCHAR(10)
);




CREATE TABLE capturas(
    codigo VARCHAR(20),
    codEspecie VARCHAR(20),
    matricula VARCHAR(20),
    codCaldero SMALLINT,
    numKilos SMALLINT,
    fecha VARCHAR(20),
);

CREATE TABLE especies(
    codigo VARCHAR(20),
    nombre VARCHAR(30),
    tipo VARCHAR(20),
    cupoPorBarco SMALLINT
);


CREATE TABLE caladeros(
    codigo SMALLINT,
    nombre VARCHAR(30),
    extension MEDIUMINT,
    ubicacion VARCHAR(50)
);




-- Inserción de registros
INSERT INTO barcos 
VALUES('PU-2301','Mi Pepita','A','Jose Gonzalez', 2100, 'España');
INSERT INTO barcos 
VALUES('RI-2123','Maruxiña','B','Manoliño de Castro', 12000, 'España');
INSERT INTO barcos 
VALUES('NF-1111','Calm After the Storm','C','John Silver', 60000, 'Reino Unido');
INSERT INTO barcos 
VALUES('GX-2021','Gudari del Mar','A','Patxi Olarricoechea', 2900, 'España');
INSERT INTO barcos 
VALUES('HK-1401','Sakura Sakura','C','Ruychi Sakamoto', 21000, 'Japón');
INSERT INTO barcos 
VALUES('GU-0001','Hunga Hunga','A','Mutu Oblongo', 210, 'Guinea Bissau');


INSERT INTO lotes
VALUES('L1', '1', 'PU-2301', 220, 6.15, 7.20, '23/02/09');
INSERT INTO lotes
VALUES('L2', '4', 'PU-2301', 210, 4.34, 6.23, '25/02/09');
INSERT INTO lotes
VALUES('L3', '8', 'RI-2123', 1240, 3.20, 3.80, '27/01/09');
INSERT INTO lotes
VALUES('L4', '3', 'RI-2123', 2240, 4.63, 5.42, '23/02/09');
INSERT INTO lotes
VALUES('L5', '4', 'RI-2123', 2120, 5.61, 7.11, '12/03/09');
INSERT INTO lotes
VALUES('L6', '3', 'NF-1111', 3360, 4.61, 5.34, '23/01/09');
INSERT INTO lotes
VALUES('L7', '7', 'NF-1111', 2240, 4.26, 5.01,'23/01/09');
INSERT INTO lotes
VALUES('L8', '9', 'NF-1111', 5000, 4.00, 4.05,'27/02/09');
INSERT INTO lotes
VALUES('L9', '6', 'GX-2021', 640, 4.16, 5.07, '23/02/09');
INSERT INTO lotes
VALUES('L10','2', 'GX-2021', 1520, 6.01, 7.22, '23/02/09');
INSERT INTO lotes
VALUES('L11','3', 'GX-2021', 690, 6.12, 7.33, '01/02/09');
INSERT INTO lotes
VALUES('L12','1','GU-0001', 24, 5.16, 6.33,'01/03/09');

INSERT INTO especies
VALUES('1','Sardina','Pescado Azul',1200);
INSERT INTO especies
VALUES('2','Atún','Grandes Peces',8000);
INSERT INTO especies
VALUES('3','Fletán','Pescado Blanco',4200);
INSERT INTO especies
VALUES('4','Pez Espada','Grandes Peces',7200);
INSERT INTO especies
VALUES('5','Buey de Mar','Marisco',400);
INSERT INTO especies
VALUES('6','Merluza','Pescado Blanco',12000);
INSERT INTO especies
VALUES('7','Yellow Line','Grandes Peces',9200);
INSERT INTO especies
VALUES('8','Langostino Tigre','Marisco',600);
INSERT INTO especies
VALUES('9','Anchoa','Pescado Azul',200);
INSERT INTO especies
VALUES('10','Gamba Blanca','Marisco',1600);
INSERT INTO especies
VALUES('11','Jurel','Pescado Azul',1800);
INSERT INTO especies
VALUES('12','Rape','Grandes Peces',6200);


INSERT INTO caladeros
VALUES('1','Gran Sol',1323000,'Atlántico Norte');
INSERT INTO caladeros
VALUES('2','Mar de Irmingen',62000,'Atlántico Norte');
INSERT INTO caladeros
VALUES('3','Namibia',320000,'Atlántico Sur');
INSERT INTO caladeros
VALUES('4','Angola',543000,'Atlántico Sur');
INSERT INTO caladeros
VALUES('5','Chile',814000,'Pacífico Sur');
INSERT INTO caladeros
VALUES('6','Mozambique',132000,'Índico');
INSERT INTO caladeros
VALUES('7','Irún',32000,'Mar de Arabia');
INSERT INTO caladeros
VALUES('8','Islas Quer',32000,'Antártico');


INSERT INTO capturas
VALUES('C1','1','PU-2301','1',300,'21/03/09');
INSERT INTO capturas
VALUES('C2','3','RI-2123','8',2300,'23/03/09');
INSERT INTO capturas
VALUES('C3','3','NF-1111','7',8300,'21/03/09');
INSERT INTO capturas
VALUES('C4','4','GU-0001','5',30,'22/03/09');
INSERT INTO capturas
VALUES('C5','2','GX-2021','11',300,'24/03/09');
INSERT INTO capturas
VALUES('C6','5','NF-1111','3',5300,'20/03/09');
INSERT INTO capturas
VALUES('C7','6','RI-2123','3',4300,'27/03/09');
INSERT INTO capturas
VALUES('C8','6','RI-2123','4',1300,'21/03/09');
INSERT INTO capturas
VALUES('C9','5','PU-2301','4',600,'21/03/09');
INSERT INTO capturas
VALUES('C10','2','GX-2021','6',300,'22/03/09');
INSERT INTO capturas
VALUES('C11','7','PU-2301','1',400,'25/03/09');
INSERT INTO capturas
VALUES('C12','7','RI-2123','9',3000,'26/03/09');
INSERT INTO capturas
VALUES('C13','1','NF-1111','9',9000,'23/03/09');
INSERT INTO capturas
VALUES('C14','3','GX-2021','11',270,'24/03/09');




/*2. Añade las restricciones necesarias para que se cumplan siempre las siguientes condiciones:
a) La matrícula de los barcos empieza por dos letras mayúsculas, luego tiene un guión y luego cuatro
números.*/


ALTER TABLE barcos ADD CONSTRAINT ck_ma_bar CHECK (matricula REGEXP '[A-Z]{2}-[0-9]{4}');



/*b) No pueden realizarse capturas durante el verano (del 21 de Junio al 21 de Septiembre).*/

ALTER TABLE capturas ADD CONSTRAINT
ck_fec_cap CHECK(fecha NOT BETWEEN '%21/06' AND '%/21/09');



/*3. Muestra los caladeros en los que se han capturado más de 1000 kilos de pescado azul en los últimos
tres meses.*/

SELECT c.nombre, e.codigo
FROM caladeros c, capturas ca, especies e
WHERE c.codigo = ca.codCaldero
AND ca.codEspecie = e.codigo
AND e.tipo = "Pescado Azul" 
GROUP BY c.codigo, c.nombre, e.tipo
HAVING SUM(ca.numKilos)>1000;



SELECT c.codigo, c.nombre 
FROM caladeros c, capturas ca, especies es
WHERE c.codigo = ca.codcaldero AND ca.codEspecie = es.codigo 
GROUP BY c.codigo, c.nombre, es.tipo
HAVING es.tipo = "Pescado Azul" AND SUM(ca.NumKilos) > 1000


/*4. Añade una columna KilosTotalesCapturados a la tabla Caladeros y realiza las operaciones
necesarias para rellenarla a partir de los datos de la tabla Capturas.*/

ALTER TABLE caladeros ADD COLUMN KilosTotalesCapturados INT; 

UPDATE caladeros ca
SET KilosTotalesCapturados = (SELECT SUM(c.numKilos)
                                FROM capturas c
                                GROUP BY c.codigo
                                WHERE c.codCaldero = ca.codigo);

/*5. Muestra el total de kilos vendidos de cada especie de marisco y el importe total de dichas ventas,
incluyendo aquellas especies de las que no se ha vendido nada.*/

SELECT e.tipo, SUM(l.numKilos), SUM(l.numKilos)* l.PPKS
FROM lotes l RIGHT OUTER JOIN especies e ON(l.codEspecie = e.codigo)
GROUP BY e.tipo;



/*6. Muestra los nombres de los barcos que han pescado marisco tanto en Enero como en Febrero como
en Marzo.*/

SELECT b.nombre
FROM barcos b, capturas c
WHERE b.matricula = c.matricula
AND c.fecha LIKE'%01%' OR c.fecha LIKE'%03%' OR c.fecha LIKE'%02%';

SELECT b.nombre, c.fecha FROM barcos b, capturas c WHERE b.matricula = c.matricula AND (MONTH(c.fecha)>=1 AND MONTH(c.fecha)<=3)



/*7. Crea una vista con el nombre de los barcos, el código del último lote que vendió, el nombre de la
especie del lote y el dinero que ganaron en la operación.*/





/*8. Muestra los barcos que han capturado más de 1200 kilos de sardinas en el caladero llamado
'Terranova'.*/





/*9. Muestra los nombres de las especies ordenadas por número de kilos vendidos en Febrero.*/





/*10. Muestra el nombre del barco que ha capturado más kilos de gambas en el caladero de 'Gran Sol'.*/






/*11. Muestra el nombre de los barcos que han superado el cupo de capturas de alguna especie.*/





/*12. Muestra el nombre del armador que ha ingresado más dinero por la venta de pescado de sus barcos.*/





/*13. Muestra los barcos que han capturado más pescado de cada nacionalidad.*/



/*El segundo UPDATE incrementa los precios en un 16%. La expresión para el valor
puede ser todo lo compleja que se desee (en el ejemplo se utilizan funciones de fecha
para conseguir que los partidos que se juagaban hoy, pasen a jugarse el martes):*/

UPDATE partidos SET fecha= NEXT_DAY(SYSDATE,'Martes')
WHERE fecha=SYSDATE;
