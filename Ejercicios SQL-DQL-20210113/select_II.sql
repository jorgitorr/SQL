CREATE DATABASE select_II;

CREATE TABLE alumnos(
    expediente INT,
    nombre VARCHAR(50),
    localidad VARCHAR(20),
    fecha_nacimiento DATE,
    direccion VARCHAR(100),
    curso TINYINT,
    nivel VARCHAR(50),
    faltas TINYINT
);


INSERT INTO alumnos VALUES(123456, "Juan Miguel Soer Bakero", "Murcia", '1995-10-1',"Gran Vía, 2, 4A", 1, "ESO",15),
(654321, "Laura Gómez Fernández", "Lorca",'1994-10-09', "Junterones,10,5B",2,"ESO", 25),
(765432, "Beatriz Martínez Hernández","Murcia",'1993-05-04',"Plaza Mayor,6,3B",3,"ESO",5),
(987654, "Diego Martín Llorente", "Alhama de Murcia", '1990-03-03',"Diego de la Cierva, 5, 7A", 1, "BACHILLERATO",34),
(445544, "Juan Francisco Cano", "Murcia",'1992-01-07',"San Juan,14, 3B",1,"ESO",13),
(223322, "Raquel Riquelme Rubio", "Lorca", '1992-12-13', "San Juan, 14, 3B", 1, "BACHILLERATO", 7),
(9988877,"Cristina Sánchez Bermejo","Murcia", '1995-03-02', "Torre de Romo, 7", 1, "ESO", 1),
(334455, "Pedro Jesús Rodriguez", "Alhama de Murcia", '1994-10-05',"Camino de Badel, 4", 2, "ESO", 11),
(334400, "Javier Ramirez Rodriguez", "Murcia", '1993-09-03', "Gran Via, 4, 3A", 1, "ESO", 0),
(993322, "Gema Rubio Colero", "Lorca", '1992-09-05', "Plaza Fuentesanta, 5, 7A", 1, "BACHILLERATO", 19),
(554411, "Joaquin Hernández", "Lorca", '1991-12-15', "Junterones, 4, 5A", 2, "BACHILLERATO", 14);

/*
1 Muestra todos los datos de todos los alumnos.*/
SELECT * FROM alumnos;
/*
2 Muestra el nombre , localidad y fecha de nacimiento de todos los alumnos.
*/
SELECT nombre, localidad, fecha_nacimiento FROM alumnos;
/*
3 Muestra el nombre de todos los alumnos. En el resultado de la consulta, la
columna “Nombre” debe aparecer con la etiqueta “Nombre y apellidos” (ALIAS
DE COLUMNAS).*/
SELECT nombre  "Nombre y apellidos" FROM alumnos

/*
4 Obtén el nombre y el número de faltas multiplicado por 2 de todos los
alumnos (COLUMNAS CALCULADAS). En el resultado de la consulta, la
columna faltas debe aparecer con la etiqueta “Faltas de asistencia” (ALIAS DE
COLUMNAS)*/

SELECT nombre, faltas*2 "Faltas de asistencia" FROM alumnos 

/*
5 Consulta los datos de los alumnos que son de Lorca.*/
SELECT * FROM alumnos WHERE localidad LIKE("Lorca");

/*6 Obtén los datos de los alumnos que son de Murcia o Alhama de Murcia.
*/
SELECT * FROM alumnos WHERE localidad="Murcia" OR localidad="Alhama de Murcia";

/*
7 Obtén los datos de los alumnos que son de Murcia y están en el primer curso
de E.S.O.
*/
SELECT * FROM alumnos WHERE localidad="Murcia" AND curso=1 AND nivel LIKE("ESO");

/*
8 Muestra los alumnos que son de Lorca, están en segundo curso de
Bachillerato y tienen más de 10 faltas.
*/
SELECT * FROM alumnos WHERE localidad="Lorca" AND curso=2 AND nivel="BACHILLERATO" AND faltas>10;

/*
9 Obtén los datos de aquellos alumnos que son de Murcia ordenados por
nombre.
*/
SELECT * FROM alumnos WHERE localidad="Murcia" ORDER BY nombre;


/*
10 Obtén los datos de todos los alumnos ordenados por nivel, y dentro de cada
nivel por curso.
*/
SELECT * FROM alumnos ORDER BY nivel, curso;                                      


/*
12 Muestra los datos de todos aquellos alumnos que tengan menos de 10
faltas en 3º o 4º curso y además sean de Murcia.
*/
SELECT * FROM alumnos WHERE faltas<10 AND (curso=3 OR curso=4) AND localidad = "Murcia"; 

/*
13 Obtén con una consulta todos los cursos que hay sin repeticiones
(DISTINCT).
*/
SELECT DISTINCT curso FROM alumnos;

/*
14 Obtén los datos de los alumnos que no tengan 10 faltas en 1º de E.S.O.
*/
SELECT * FROM alumnos WHERE faltas!=10 AND nivel=1 AND curso="ESO";

/*
15 Muestra los datos de aquellos alumnos cuyo nombre empiece por la letra
'B'.
*/

/*
16 Con una consulta obtén los alumnos que son de Murcia y cuyo nombre
termina con una letra 'O'.
*/

/*
17 Muestra los datos de todos aquellos alumnos que están en 1º curso de
E.S.O. Y tienen una letra 'U' en la segunda posición del nombre.
*/


/*
18 Obtén los datos de los alumnos cuya columna “Faltas” es nula.
*/


/*
19 Muestra los datos de aquellos alumnos que tienen entre 10 y 20 faltas
(BETWEEN). Ordena el resultado por nombre.
*/


/*
20 Muestra los datos de los alumnos que tienen entre 10 y 20 faltas y además
son de Murcia.
*/

/*
21 Muestra los datos de los alumnos que tienen entre 10 y 20 faltas, son de
Murcia y están matriculados en 1º de E.S.O.
*/

/*
22 Con una consulta muestra los datos de los alumnos cuyas faltas sean
menores que 10 y mayores que 20.
*/

/*
23 Muestra los datos de los alumnos cuya fecha de nacimiento comprenda los
años 1993 y 1994. Ordena el resultado por nombre.
*/


/*
24 Muestra los datos de los alumnos que sean de primer o segundo curso (no
importa que sean de E.S.O. O Bachiller). Utiliza el operador IN.
*/

/*
25 Obtén los datos de aquellos alumnos que sean de tercer o cuarto curso y
sean de Murcia. Utiliza el operador IN.
*/


/*
26 Muestra los datos de los alumnos que no sean de E.S.O, ordenados por
curso y por nombre descendentemente. Utiliza el operador IN.
*/


/*
27 Muestra los datos de los alumnos que sean de primer o segundo curso y no
sean de Bachiller. Ordena el resultado por nombre.
*/


/*
Ejercicios de SQL (III). Pág. 328 Obtén los datos de los alumnos cuyo nombre empiece por la letra 'J', que
tengan más de 10 faltas y no sean de Bachiller. Ordena el resultado por curso,
y dentro de cada curso, por nombre.
*/


/*
29 Con una consulta obtén el expediente, nombre, curso y nivel de todos los
alumnos ordenado por curso, nivel ascendentemente y nombre
descendentemente cuyo nivel no sea 'BACHILLER'.
*/


/*
30 Con una consulta obtén el nombre de cada alumno en mayúscula cuya
localidad sea Murcia.
*/


/*
31 Muestra el nombre de cada alumno en mayúscula y la localidad a la que
pertenecen en minúscula, ordenados por localidad.
*/


/*
32 Con una consulta concatena el nombre de cada alumno y la localidad y
sustituye 'BACHILLER' por 'Bachillerato'.
*/

/*
33 Con una consulta obtén el nombre de cada alumno y la longitud de la
cadena “Nombre”.
*/

/*
34 Con una consulta obtén el nombre, año de nacimiento y mes de nacimiento
de cada uno de los alumnos.
*/

/*
35 Con una consulta muestra el nombre y edad de cada uno de los alumnos (la
edad se calcula restando al año de nacimiento 2008)
*/
