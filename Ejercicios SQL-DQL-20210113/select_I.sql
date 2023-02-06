CREATE DATABASE select_I;

CREATE TABLE personas(
	cod_hospital TINYINT(4),
	dni VARCHAR(20),
	apellidos VARCHAR(100),
	funcion VARCHAR(50),
	salario SMALLINT(10),
    localidad VARCHAR(50)
);

INSERT INTO personas (cod_hospital,dni,apellidos,funcion,salario, localidad)
VALUES (1,"1245678","Garcia Hernández, Eladio","CONSERJE",1200, "LORCA"),
(1,"87654321","Fuentes Bermejo, Carlos","DIRECTOR",2000, "MURCIA"),
(2,"55544433","González MArín, Alicia","CONSERJE",1200, "MURCIA"),
(1,"66655544","Castillo Montes, Pedro","MEDICO",1700, "MURCIA"),
(2,"55544433","Tristán García, Ana","MEDICO",1900, "MURCIA"),
(3,"55544411","Ruiz Hernández, Caridad","MEDICO",1900, "MURCIA"),
(3,"99988333","Serrano Díaz, Alejandro","DIRECTOR",2400, "CARTAGENA"),
(4,"33222111","Mesa del Castillo, Juan","MEDICO",2200, "LORCA"),
(2,"22233333","Martinez Molina, Andres","MEDICO",1600, "CARTAGENA"),
(4,"55544412","Jiménez Jiménez, Dolores","CONSERJE",1200, "MURCIA"),
(4,"22233311","Martinez Molina, Gloria","DIRECTOR",1600, "MURCIA");

/*1 Mostrar todos los datos de todas las personas.*/
SELECT * FROM personas;

/*2 Obtén el DNI, apellidos y función de todas las personas.*/
SELECT dni, apellidos, funcion FROM personas

/*3 Mostrar los apellidos de las personas que vivan en LORCA.*/
SELECT apellidos FROM personas WHERE localidad = "LORCA";
/*4 Mostrar los apellidos de las personas que vivan en MURCIA o LORCA*/
SELECT apellidos FROM personas WHERE localidad IN("MURCIA", "LORCA");
/*5 Seleccionar los datos de aquellas personas que vivan en MURCIA y tengan
un salario superior a los 1500 euros.*/
SELECT * FROM personas WHERE localidad IN("MURCIA") AND salario>1500;
/*6 Mostrar los datos de las personas que vivan en MURCIA, tengan un salario
superior a los 1500 euros y sean DIRECTORES.*/
SELECT * FROM personas WHERE localidad IN("MURCIA") AND salario>1500 AND funcion IN("DIRECTOR");
/*7 Mostrar los datos de las personas cuya función sea MÉDICO ordenados por
apellidos descendentemente.*/
SELECT * FROM personas WHERE funcion IN("MEDICO") ORDER BY apellidos ASC;

/*8 Mostrar los datos de todas las localidades que hay en la tabla personas sin
repeticiones (debes empear la cláusula DISTINCT)*/
SELECT DISTINCT localidad FROM personas; 

/*9 Mostrar los datos de las personas que tengan un salario superior a 1500
euros y sean médicos. Ordenar la salida por salario descendentemente.*/
SELECT * FROM personas WHERE salario>1500 AND funcion IN("MEDICO") ORDER BY salario DESC;

/*10 Seleccionar aquellas personas cuyo apellido comience por M.*/
SELECT * FROM personas WHERE apellidos LIKE 'M%';

/*11 Mostrar los datos de las personas que tengan una M en el apellido y cuya
función sea CONSERJE*/
SELECT * FROM personas WHERE apellidos LIKE '%m%' OR 'M%' OR '%M';

/*12 Mostrar aquellas personas que tengan un salario entre 1500 y 200 euros.*/
SELECT * FROM personas WHERE salario BETWEEN 200 AND 1500;
/*13 Seleccionar los datos de aquellas personas cuya función sea MÉDICO o
DIRECTOR (utilizar el operador IN)*/
SELECT * FROM personas WHERE funcion IN('MEDICO', 'DIRECTOR');
/*14 Obtener los datos de aquellas personas cuya función no sea CONSERJE
(utilizar el operador NOT IN) y tengan un salario superior a los 1500 euros,
ordenados por apellido descendentemente.*/
SELECT * FROM personas WHERE funcion NOT IN('CONSERJE') AND salario>1500 ORDER BY apellidos DESC;
/*15 Mostrar los datos de las personas que sean de MURCIA o CARTAGENA y
que pertenezcan al hospital número 1.*/
SELECT * FROM personas WHERE localidad IN("MURCIA","CARTAGENA") AND cod_hospital = 1;
/*16 Obtén los apellidos en mayúsculas de las personas que trabajen en el
hospital número 1.*/
SELECT UPPER(apellidos) FROM personas WHERE cod_hospital = 1;
/*17 Con una consulta devuelve los apellidos de todas las personas. Al lado debe
aparecer la longitud de cada apellido.*/
SELECT apellidos, LENGHT(apellidos) FROM personas; 
/*18 Obtener los apellidos y localidad en minúscula de todas aquellas personas
que no trabajen en el hospital número 1.*/
SELECT apellidos, LOWER(localidad) FROM personas WHERE cod_hospital NOT IN(1); /*COMO PUEDO PONERLE EL NOMBRE QUE YO QUIERA A LAS TABLAS QUE MUESTRA?*/

/*19 Obtener los datos de las personas que trabajen en los hospitales 1 ó 2 y
tengan un salario superior a 1500 euros.*/
SELECT * FROM personas WHERE cod_hospital IN(1,2) AND salario>1500;
/*20 Visualizar los datos de aquellas personas que no trabajen en el hospital
número 2 y que sean de MURCIA.*/
SELECT * FROM personas WHERE cod_hospital NOT IN(2) AND localidad = "Murcia";