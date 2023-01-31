ALTER TABLE proyecto ADD CONSTRAINT CHECK(fechaInicio>=CURDATE()); 

ALTER TABLE departamento ADD codigo SMALLINT(4);
ALTER TABLE empleado ADD codDepart SMALLINT(4);


/*ejercicios DDL Y DML 1.3*/

CREATE DATABASE hospitales;

CREATE TABLE personas(
	cod_hospital SMALLINT(4),
	dni VARCHAR(20),
	apellidos VARCHAR(100),
	funcion VARCHAR(50),
	salario SMALLINT(10)
);

INSERT INTO personas (cod_hospital,dni,apellidos,funcion,salario)
VALUES (1,"1245678","Garcia Hernández, Eladio","CONSERJE",1500),
(4,"22233311","Martinez Molina, Gloria","MEDICO",1600),
(2,"22233322","Tristán García, Ana","MEDICO",1900),
(2,"22233333","Martinez Molina, Andres","MEDICO",1600),
(4,"33222111","Mesa del Castillo, Juan","MEDICO",2200),
(3,"55544411","Ruiz Hernández, Caridad","MEDICO",1900),
(4,"55544412","Jiménez Jiménez, Dolores","CONSERJE",1200),
(2,"55544433","González MArín, Alicia","CONSERJE",1200),
(1,"66655544","Castillo Montes, Pedro","MEDICO",1700),
(1,"87654321","Fuentes Bermejo, Carlos","DIRECTOR",2000),
(3,"99988333","Serrano Díaz, Alejandro","DIRECTOR",2400);


/*
1. Dada la tabla PERSONAS insertar a un persona de apellidos y nombre ʻQuiroga Rojas, Leopoldoʼ, cuya función sea ʻCONSERJEʼ, con DNI 456788999 y con el código de hospital 4.*/
INSERT INTO personas VALUES(4,456788999,"Quiroga Rojas, Leopoldo","CONSERJE",0);
/*
2. Inserta en la tabla PERSONAS una persona de nombre ʻSerrano Ruiz,
Antonioʼ, con DNI 111333222 perteneciente al hospital número 3.*/
INSERT INTO personas VALUES(3,111333222,"Serrano Ruiz, Antonio",NULL,0);
/*
3. Inserta en la tabla PERSONAS1 los datos de las personas que trabajan en
el hospital número 1 (INSERT con SELECT).*/
INSERT INTO personas SELECT * FROM personas WHERE cod_hospital = 1;
/*
4. Se ha creado una nueva tabla llamada PERSONAS2. Esta tabla tiene los
siguientes campos (DNI, APELLIDOS, FUNCIÓN). ¿Cómo podremos
introducir en esa tabla los datos de las PERSONAS del código de hospital
4?*/
/*
5. Inserta en la tabla PERSONAS una persona con DNI 99887766 y apellidos
ʻMartínez Martínez, Alejandroʼ en el hospital que tiene tan sólo 1 persona
(INSERT con SELECT).*/

/*
6. En la tabla HOSPITALES cambiar el código de los hospitales que tienen el
código 3 al código 4. (Utilizar UPDATE).
*/
UPDATE personas
SET cod_hospital = 4
WHERE cod_hospital = 3;


/*Tablas EMPLE y DEPART*/
CREATE TABLE emple(
	emp_no SMALLINT(5),
	apellido VARCHAR(20),
	oficio VARCHAR(20),
	dir SMALLINT(5),
	fecha_alt DATE,
	salario MEDIUMINT,
	comision MEDIUMINT,
	dept_no SMALLINT(10)
);

CREATE TABLE depart(
	dept_no SMALLINT(3),
	dnombre VARCHAR(20),
	loc VARCHAR(20)
);


/*DELETE FROM emple -> elimina todas las tuplas de emple*/
INSERT INTO emple(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)
VALUES(7369, "SANCHEZ", "EMPLEADO",7902, '1960-12-17', 104000, NULL, 20),
(7499, "ARROYO","VENDEDOR",7698, '1980-02-20', 208000, 39000, 30),
(7521, "SALA","VENDEDOR",7698, '1981-02-22', 162500, 162500, 30),
(7566, "JIMÉNEZ", "DIRECTOR", 7839, '1981-04-02', 386750, NULL, 20),
(7654, "MARTÍN", "VENDEDOR", 7698, '1981-09-29', 162500, 182000, 30),
(7698, "NEGRO", "DIRECTOR", 7839, '1981-05-01', 370500, NULL, 30),
(7788, "GIL", "ANALISTA", 7566, '1981-11-09', 390000, NULL, 20),
(7839, "REY", "PRESIDENTE", NULL, '1981-11-17', 650000, NULL, 10),
(7844, "TOVAR", "VENDEDOR", 7698, '1981-09-08', 195000, 0, 30),
(7876, "ALONSO", "EMPLEADO", 7788, '1981-09-23', 143000, NULL, 20),
(7900, "JIMENO", "EMPLEADO", 7698, '1981-12-03', 1235000, NULL, 30),
(7902, "FERNÁNDEZ", "ANALISTA", 7566, '1981-12-03', 390000, NULL, 20),
(7934, "MUÑOZ", "EMPLEADO", 7782, '1982-01-23', 390000, NULL, 10);

INSERT INTO depart(dept_no, dnombre, loc)
VALUES(10, "CONTABILIDAD","SEVILLA"),
(20, "INVESTIGACIÓN","MADRID"),
(30, "VENTAS", "BARCELONA"),
(40, "PRODUCCIÓN", "BILBAO");


/*
7.- Insertar en la tabla EMPLE un empleado con código 9999, apellido
ʻGONZÁLEZʼ y código de departamento 10.*/
INSERT INTO emple(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)
VALUES(9999, "GONZÁLEZ", NULL, NULL, NULL, NULL, NULL, 10);
/*
8. Insertar en la tabla EMPLE un empleado con código 5000, apellido
ʻMORAGAʼ, oficio ʻEMPLEADOʼ, su director es el empleado 7902, la fecha de
alta en la empresa es ʻ17/10/99ʼ, su salario es 100000, no tiene comisión y
pertenece al departamento número 20. (para indicar que no tiene comisión
deberás poner NULL en el campo comisión).*/
INSERT INTO emple(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)
VALUES(5000, "MORAGA","EMPLEADO",7902,'1999-10-17',100000, NULL, 20);
/*
9. Insertar en la tabla DEPART un departamento cuyo número sea 50, de
nombre ʻGENERALʼ y cuya localización sea ʻSEVILLAʼ.*/
INSERT INTO depart VALUES(50, "GENERAL","SEVILLA");
/*
10. Insertar en la tabla DEPART un departamento cuyo número sea 60 y de
nombre ʻPRUEBASʼ.*/
INSERT INTO depart VALUES(60, "PRUEBAS", NULL);
/*
11. Insertar en la tabla EMPLE30 los datos de los empleados que pertenecen al
departamento número 30.*/
INSERT INTO emple SELECT * FROM emple WHERE dept_no = 30;

/*
12. Insertar en la tabla EMPLE20 el dni, número de departamento y salario de
los empleados que pertenecen al departamento número 20.*/
INSERT INTO emple SELECT * FROM emple WHERE dept_no = 20;

/*
13. Doblar el salario a todos los empleados del departamento 30. (Utilizar
UPDATE).*/
UPDATE emple
SET salario = salario*2
WHERE dept_no=30;
/*
14. Cambiar todos los empleados del departamento número 30 al
departamento número 20.*/
UPDATE emple
SET dept_no=20
where dept_no=30;

/*
15. Incrementar en un 10% el sueldo de los empleados del departamento 10.
(salario*1.1).*/
UPDATE emple
SET salario = salario + (salario*10/100)
WHERE dept_no = 10;

/*
16. Cambiar la localidad del departamento número 10 a ʻBILBAOʼ.*/
UPDATE depart
SET loc = "BILBAO"
WHERE dept_no = 10

/*
17. Igualar el salario de ʻARROYOʼ al salario de ʻNEGROʼ, de la tabla
EMPLE30.*/
/*no se como se podra hacer con consulta*/
UPDATE emple
SET salario = 41600
WHERE apellido = "NEGRO";

/*
18. Igualar el salario y oficio de ʻMUÑOZʼ al salario y oficio de ʻJIMENOʼ, de la
tabla EMPLE30.*/
INSERT INTO emple(emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)
SELECT emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no
FROM emple
WHERE apellido = "MUÑOZ"

UPDATE emple SET oficio = "EMPLEADO" 
WHERE apellido = "MUÑOZ";

UPDATE emple SET salario = 2470000
WHERE apellido = "MUÑOZ";

/*19. En la tabla DEPART borrar el departamento número 50.*/
DELETE FROM depart WHERE dept_no = 50;



/*20. En la tabla EMPLE borrar todos los empleados que sean del departamento
20 y sean ʻANALISTASʼ.*/
DELETE FROM emple WHERE dept_no = 20 AND oficio = "ANALISTAS";
/*
21. Borrar de la tabla EMPLE todos los empleados que no tengan comisión.
*/
DELETE FROM emple WHERE comision IS NULL OR comision LIKE 0;

/*Tabla hospital*/
CREATE TABLE hospitales(
	cod_hospital SMALLINT(10),
	nombre VARCHAR(50),
	direccion VARCHAR(50),
	num_plazas SMALLINT(10)
);


INSERT INTO hospitales VALUES(1, "Rafael Méndez", "Gran Vía, 7", 250),
(2, "Reina Sofía", "Junterones, 5", 225),
(3, "Principe Asturias", "Avenida Colón", 150),
(4, "Virgen de la Arrixaca", "Avenida Juan Carlos, I", 250);

/*
22. Establecer el número de plazas de todos los hospitales a 250.*/

/*23. Poner en 2000 el número de plazas del hospital número 3.*/

/*24. Borra todos los hospitales cuyo nombre comience por la letra ʻRʼ.*/

/*25. Con una sentencia UPDATE dobla el número de plazas de todos los
hospitales.*/