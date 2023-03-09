CREATE TABLE DEPART(
	dept_no TINYINT,
	dnombre VARCHAR(20),
	loc VARCHAR(20),
	CONSTRAINT DEP_DEPT_PK PRIMARY KEY(dept_no)
);


CREATE TABLE EMPLE(
	emp_no SMALLINT PRIMARY KEY,
	apellido VARCHAR(20),
    oficio VARCHAR(20),
	dir SMALLINT(5),
	fecha_alt DATE,
	salario MEDIUMINT,
	comision MEDIUMINT,
	dept_no TINYINT,
	CONSTRAINT EMP_DEPT_FK FOREIGN KEY(dept_no) REFERENCES DEPART(dept_no)
);



CREATE TABLE HERRAMIENTAS(
	descripcion VARCHAR(20),
	estanteria TINYINT(2),
	unidades TINYINT(2)
);

CREATE TABLE HOSPITALES(
	cod_hospital TINYINT(2),
	nombre VARCHAR(50),
	direccion VARCHAR(50),
	num_plazas SMALLINT(4),
	CONSTRAINT HOS_PK PRIMARY KEY(cod_hospital)
);

CREATE TABLE PERSONAS(
	cod_hospital TINYINT,
	dni CHAR(8),
	apellidos VARCHAR(50),
	funcion VARCHAR(15),
	salario SMALLINT,
	CONSTRAINT PER_HOS_FK FOREIGN KEY(cod_hospital) REFERENCES HOSPITALES(cod_hospital)
);

CREATE TABLE MEDICOS(
	cod_hospital TINYINT(2),
	dni CHAR(8),
	apellidos VARCHAR(50),
	especialidad VARCHAR(12),
	CONSTRAINT MED_HOS_FK FOREIGN KEY(cod_hospital) REFERENCES HOSPITALES(cod_hospital) 
);





/*VALORES DE DEPART*/
INSERT INTO DEPART(dept_no, dnombre, loc) VALUES(10, 'CONTABILIDAD', 'SEVILLA');
INSERT INTO DEPART(dept_no, dnombre, loc) VALUES(20, 'INVESTIGACIÓN', 'MADRID');
INSERT INTO DEPART(dept_no, dnombre, loc) VALUES(30, 'VENTAS', 'BARCELONA');
INSERT INTO DEPART(dept_no, dnombre, loc) VALUES(40, 'PRODUCCIÓN', 'BILBAO');

/*VALORES DE HERRAMIENTAS*/
INSERT INTO HERRAMIENTAS( descripcion, estanteria, unidades)VALUES('Alicates', 1, 10);
INSERT INTO HERRAMIENTAS( descripcion, estanteria, unidades)VALUES('Cortador', 4, 5);
INSERT INTO HERRAMIENTAS( descripcion, estanteria, unidades)VALUES('Destornillador', 3, 7);
INSERT INTO HERRAMIENTAS( descripcion, estanteria, unidades)VALUES('Escofina', 6, 5);
INSERT INTO HERRAMIENTAS( descripcion, estanteria, unidades)VALUES('Guantes', 2, 7);
INSERT INTO HERRAMIENTAS( descripcion, estanteria, unidades)VALUES('Lima', 6, 10);
INSERT INTO HERRAMIENTAS( descripcion, estanteria, unidades)VALUES('Martillo', 3, 10);
INSERT INTO HERRAMIENTAS( descripcion, estanteria, unidades)VALUES('Metro', 5, 15);
INSERT INTO HERRAMIENTAS( descripcion, estanteria, unidades)VALUES('Sierra', 4, 5);
INSERT INTO HERRAMIENTAS( descripcion, estanteria, unidades)VALUES('Soldador', 1, 15);

/*VALORES DE EMPLE*/
INSERT INTO EMPLE(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)VALUES(7369, 'SANCHEZ', 'EMPLEADO', 7902, '1980/12/17', 104000, null , 20);
INSERT INTO EMPLE(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)VALUES(7499, 'ARROYO', 'VENDEDOR', 7698, '1980/02/20', 208000, 39000, 30);
INSERT INTO EMPLE(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)VALUES(7521, 'SARA', 'VENDEDOR', 7698, '1981/02/22', 162500, 162500, 30);
INSERT INTO EMPLE(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)VALUES(7566, 'JIMÉNEZ', 'DIRECTOR', 7839, '1981/04/02', 386750, null, 20);
INSERT INTO EMPLE(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)VALUES(7654, 'MARTÍN', 'VENDEDOR', 7698, '1981/09/29', 162500, 182000, 30);
INSERT INTO EMPLE(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)VALUES(7698, 'NEGRO', 'DIRECTOR', 7839, '1981/05/01', 370500, null, 30);
INSERT INTO EMPLE(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)VALUES(7788, 'GIL', 'ANALISTA', 7566, '1981/11/09', 390000, null, 20);
INSERT INTO EMPLE(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)VALUES(7839, 'REY', 'PRESIDENTE', null, '1981/11/17', 650000, null, 10);
INSERT INTO EMPLE(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)VALUES(7844, 'TOVAR', 'VENDEDOR', 7698, '1981/09/08', 195000, 0, 30);
INSERT INTO EMPLE(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)VALUES(7876, 'ALONSO', 'EMPLEADO', 7788, '1981/09/23', 143000, null, 20);
INSERT INTO EMPLE(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)VALUES(7900, 'JIMENO', 'EMPLEADO', 7698, '1981/12/03', 1235000, null, 30);
INSERT INTO EMPLE(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)VALUES(7902, 'FERNANDEZ', 'ANALISTA', 7566, '1981/12/03', 390000, null, 20);
INSERT INTO EMPLE(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)VALUES(7934, 'MUÑOZ', 'EMPLEADO', 7782, '1982/01/23', 169000, null, 10);

/*VALORES DE HOSPITALES*/

INSERT INTO HOSPITALES( cod_hospital, nombre, direccion, num_plazas)VALUES(1, 'Rafael Méndez', 'Gran Vía, 7', 250);
INSERT INTO HOSPITALES( cod_hospital, nombre, direccion, num_plazas)VALUES(2, 'Reina Sofía', 'Junterones, 5', 225);
INSERT INTO HOSPITALES( cod_hospital, nombre, direccion, num_plazas)VALUES(3, 'Principe Asturias', 'Avenida Colón', 150);
INSERT INTO HOSPITALES( cod_hospital, nombre, direccion, num_plazas)VALUES(4, 'Virgen de la Arrixia', 'Avenida Juan Carlos, I', 250);

/*VALORES DE PERSONAS*/
INSERT INTO PERSONAS( cod_hospital, dni, apellidos, funcion, salario)VALUES(1, '12345678', 'Garcia Hernández, Eladio', 'CONSERJE', 1500);
INSERT INTO PERSONAS( cod_hospital, dni, apellidos, funcion, salario)VALUES(4, '22233311', 'Martinez Molina, Gloria', 'MEDICO', 1600);
INSERT INTO PERSONAS( cod_hospital, dni, apellidos, funcion, salario)VALUES(2, '22233322', 'Tristán García, Ana', 'MEDICO', 1900);
INSERT INTO PERSONAS( cod_hospital, dni, apellidos, funcion, salario)VALUES(2, '22233333', 'Martinez Molina, Andrés', 'MEDICO', 1600);
INSERT INTO PERSONAS( cod_hospital, dni, apellidos, funcion, salario)VALUES(4, '33222111', 'Mesa del Castillo, Juan', 'MEDICO', 2200);
INSERT INTO PERSONAS( cod_hospital, dni, apellidos, funcion, salario)VALUES(3, '55544411', 'Ruiz Hernández, Caridad', 'MEDICO', 1900);
INSERT INTO PERSONAS( cod_hospital, dni, apellidos, funcion, salario)VALUES(4, '55544412', 'Jiménez Jiménez, Dolores', 'CONSERJE', 1200);
INSERT INTO PERSONAS( cod_hospital, dni, apellidos, funcion, salario)VALUES(2, '55544433', 'González Marín, Alicia', 'CONSERJE', 1200);
INSERT INTO PERSONAS( cod_hospital, dni, apellidos, funcion, salario)VALUES(1, '66655544', 'Castillo Montes, Pedro', 'MEDICO', 1700);
INSERT INTO PERSONAS( cod_hospital, dni, apellidos, funcion, salario)VALUES(1, '87654321', 'Fuentes Bermejo, Carlos', 'DIRECTOR', 2000);
INSERT INTO PERSONAS( cod_hospital, dni, apellidos, funcion, salario)VALUES(3, '99988333', 'Serrano Díaz, Alejandro', 'DIRECTOR', 2400);


/*VALORES DE MÉDICOS*/
INSERT INTO MEDICOS( cod_hospital, dni, apellidos, especialidad)VALUES(4, '22233311', 'Martinez Molina, Gloria', 'PSIQUIATRA');
INSERT INTO MEDICOS( cod_hospital, dni, apellidos, especialidad)VALUES(2, '22233322', 'Tristán García, Ana', 'CIRUJANO');
INSERT INTO MEDICOS( cod_hospital, dni, apellidos, especialidad)VALUES(2, '22233333', 'Martinez Molina, Andrés', 'CIRUJANO');
INSERT INTO MEDICOS( cod_hospital, dni, apellidos, especialidad)VALUES(4, '33222111', 'Mesa del Castillo, Juan', 'DERMATOLOGO');
INSERT INTO MEDICOS( cod_hospital, dni, apellidos, especialidad)VALUES(1, '66655544', 'Castillo Montes, Pedro', 'PSIQUIATRA');




/*
1. Visualizar el número de empleados de cada departamento. Utilizar
GROUP BY para agrupar por departamento.*/
SELECT d.dept_no, COUNT(*) /*tambien puedo poner cualquier fila de emple*/
FROM depart d, emple e
WHERE d.dept_no = e.dept_no
GROUP BY d.dept_no

/*2. Visualizar los departamentos con más de 5 empleados. Utilizar GROUP
BY para agrupar por departamento y HAVING para establecer la condición
sobre los grupos.*/
SELECT d.dept_no
FROM depart d, emple e
WHERE d.dept_no = e.dept_no
GROUP BY d.dept_no
HAVING COUNT(e.apellido)>5;


/*3. Hallar la media de los salarios de cada departamento (utilizar la función
avg y GROUP BY).*/

SELECT d.dept_no, ROUND(AVG(e.salario),2)
FROM depart d, emple e 
WHERE d.dept_no = e.dept_no
GROUP BY d.dept_no;



/*4. Visualizar el nombre de los empleados vendedores del departamento
ʻVENTASʼ (Nombre del departamento=ʼVENTASʼ, oficio=ʼVENDEDORʼ).*/

SELECT e.apellido
FROM emple e, depart d
WHERE e.dept_no = e.dept_no and d.dnombre = "VENTAS" and e.oficio = "VENDEDOR"
GROUP BY e.apellido;



/*5. Visualizar el número de vendedores del departamento ʻVENTASʼ (utilizar
la función COUNT sobre la consulta anterior).*/

SELECT COUNT(e.apellido)
FROM emple e, depart d 
WHERE e.dept_no = d.dept_no and d.dnombre = "VENTAS" and e.oficio = "VENDEDOR";


/*6. Visualizar los oficios de los empleados del departamento ʻVENTASʼ.*/

SELECT e.oficio
FROM emple e, depart d 
WHERE e.dept_no = d.dept_no and d.dnombre = "VENTAS"
GROUP BY e.oficio;

/*7. A partir de la tabla EMPLE, visualizar el número de empleados de cada
departamento cuyo oficio sea ʻEMPLEADOʼ (utilizar GROUP BY para
agrupar por departamento. En la cláusula WHERE habrá que indicar que el
oficio es ʻEMPLEADOʼ).*/

SELECT e.apellido
FROM emple e, depart d 
WHERE e.dept_no = d.dept_no and e.oficio = "EMPLEADO"
GROUP BY d.dept_no;


/*8. Visualizar el departamento con más empleados.*/

SELECT d.dept_no
FROM depart d, emple e 
WHERE d.dept_no = e.dept_no 
GROUP BY d.dept_no
ORDER BY COUNT(e.apellido) DESC
LIMIT 1;

/*nuevo*/

/*9. Mostrar los departamentos cuya suma de salarios sea mayor que la
media de salarios de todos los empleados.*/
SELECT d.dept_no
FROM depart d, emple e 
WHERE e.dept_no = e.dept_no 
GROUP BY d.dept_no
HAVING SUM(e.salario)>AVG(e.salario)

/*10. Para cada oficio obtener la suma de salarios.*/
SELECT SUM(e.salario)
FROM depart d, emple e 
WHERE d.dept_no = e.dept_no
GROUP BY e.oficio;


/*11. Visualizar la suma de salarios de cada oficio del departamento
ʻVENTASʼ.*/
SELECT e.oficio, SUM(e.salario)
FROM EMPLE e, DEPART d
WHERE e.dept_no = d.dept_no and d.dnombre = "VENTAS"
GROUP BY e.oficio; 


/*12. Visualizar el número de departamento que tenga más empleados cuyo
oficio sea empleado.*/
SELECT d.dept_no
FROM EMPLE e, DEPART d 
WHERE e.dept_no = d.dept_no
ORDER BY e.apellido DESC
LIMIT 1;


/*13. Mostrar el número de oficios distintos de cada departamento.*/

SELECT d.dept_no, COUNT(e.oficio)
FROM DEPART d, EMPLE e
WHERE d.dept_no = e.dept_no
GROUP BY d.dept_no;  



/*14. Mostrar los departamentos que tengan más de dos personas
trabajando en la misma profesión.*/

select e.dept_no
FROM EMPLE e 
GROUP BY e.dept_no, e.oficio
HAVING COUNT(*)>2;

/*si la tupla es nula no contaría la fila con COUNT()*/

/*15. Dada la tabla HERRAMIENTAS, visualizar por cada estantería la suma
de las unidades.*/

SELECT h.estanteria, SUM(h.unidades)
FROM HERRAMIENTAS h 
GROUP BY h.estanteria;



/*16. Visualizar la estantería con más unidades de la tabla HERRAMIENTAS.
Estantería
-
1
Tablas PERSONAS, MEDICOS, HOSPITALES.*/

SELECT h.estanteria
FROM HERRAMIENTAS h
GROUP BY h.estanteria
ORDER BY h.unidades DESC
LIMIT 1;


/*17. Mostrar el número de médicos que pertenecen a cada hospital,
ordenado por número descendente de hospital.*/

SELECT h.cod_hospital, COUNT(m.apellidos)
FROM HOSPITALES h, MEDICOS m 
WHERE m.cod_hospital = h.cod_hospital 
GROUP BY h.cod_hospital
ORDER BY h.cod_hospital DESC;


/*18. Realizar una consulta en la que se muestre por cada hospital el
nombre de las especialidades que tiene.*/

SELECT h.nombre, m.especialidad
FROM HOSPITALES h, MEDICOS m 
WHERE h.cod_hospital = m.cod_hospital
GROUP BY h.nombre, m.especialidad;



/*19. Realizar una consulta en la que aparezca por cada hospital y en cada
especialidad el número de médicos (tendrás que partir de la consulta anterior
y utilizar GROUP BY).*/

SELECT h.cod_hospital, m.especialidad, COUNT(*) 
FROM HOSPITALES h, MEDICOS m
WHERE h.cod_hospital = m.cod_hospital
GROUP BY h.cod_hospital, m.especialidad;


/*20. Obtener por cada hospital el número de empleados.*/
SELECT h.nombre, COUNT(*)
FROM HOSPITALES h, PERSONAS p
WHERE h.cod_hospital = p.cod_hospital
GROUP BY h.nombre;


/*21. Obtener por cada especialidad el número de trabajadores.*/

SELECT m.especialidad, COUNT(*) 
FROM MEDICOS m 
GROUP BY m.especialidad;

/*22. Visualizar la especialidad que tenga más médicos.*/

SELECT m.especialidad especialidad_con_mas_medicos
FROM MEDICOS m 
GROUP BY m.especialidad
ORDER BY COUNT(*) DESC
LIMIT 1;

/*23. ¿Cuál es el nombre del hospital que tiene mayor número de plazas?*/

SELECT h.nombre 
FROM HOSPITALES h, PERSONAS p 
WHERE h.cod_hospital = p.cod_hospital
GROUP BY h.cod_hospital
ORDER BY h.cod_hospital DESC
LIMIT 1;


/*24. Visualizar las diferentes estanterías de la tabla HERRAMIENTAS
ordenados descendentemente por estantería.*/

SELECT *
FROM herramientas h 
ORDER BY h.estanteria DESC;

/*25. Averiguar cuántas unidades tiene cada estantería.*/
SELECT h.estanteria, SUM(h.unidades)
FROM herramientas h
GROUP BY h.estanteria;


/*26. Visualizar las estanterías que tengan más de 15 unidades*/
SELECT h.estanteria
FROM herramientas h 
GROUP BY h.estanteria
HAVING SUM(h.unidades)>15;


/*27. ¿Cuál es la estantería que tiene más unidades?*/
SELECT h.estanteria
FROM herramientas h
ORDER BY SUM(h.unidades)
LIMIT 1;

/*28. A partir de las tablas EMPLE y DEPART mostrar los datos del
departamento que no tiene ningún empleado.*/
SELECT *
FROM emple e 
RIGHT JOIN depart d ON e.dept_no = d.dept_no
WHERE e.emp_no IS NULL;


/*29. Mostrar el número de empleados de cada departamento. En la salida
se debe mostrar también los departamentos que no tienen ningún
empleado.*/
SELECT d.dept_no, COUNT(*)
FROM depart d
LEFT JOIN emple e ON e.dept_no = d.dept_no
GROUP BY d.dept_no;



/*30. Obtener la suma de salarios de cada departamento, mostrando las
columnas DEPT_NO, SUMA DE SALARIOS y DNOMBRE. En el resultado
también se deben mostrar los departamentos que no tienen asignados
empleados.*/

SELECT d.dept_no, SUM(e.salario), d.dnombre
FROM depart d
LEFT JOIN emple e ON d.dept_no = e.dept_no
GROUP BY d.dept_no;


/*31. Utilizar la función IFNULL en la consulta anterior para que en el caso
de que un departamento no tenga empleados, aparezca como suma de
salarios el valor 0.*/

SELECT d.dept_no, IFNULL(SUM(e.salario),0), d.dnombre
FROM depart d
LEFT JOIN emple e ON d.dept_no = e.dept_no
GROUP BY d.dept_no;


/*32. Obtener el número de médicos que pertenecen a cada hospital,
mostrando las columnas COD_HOSPITAL, NOMBRE y NÚMERO DE
MÉDICOS. En el resultado deben aparecer también los datos de los
hospitales que no tienen médicos.*/

SELECT h.cod_hospital, h.nombre, COUNT(*) numeros_de_medicos
FROM hospitales h
LEFT JOIN medicos m USING(cod_hospital)
GROUP BY h.cod_hospital;





/*DUDAS*/
/*EN EL 29 ME SALE 1 EN EL DEPARTAMENTO QUE NO TIENE NINGUN EMPLEADO 
¿COMO PODRÍA CAMBIAR ESTO PARA QUE ME SALIESE 0?*/
/*en el 32 me pasa lo mismo que en el 29*/
/*HAY ALGUNA OTRA MANERA diferente DE HACER EL 28*/


replace(1,0);