CREATE TABLE EMPLE(
	emp_no SMALLINT(5) PRIMARY KEY,
	apellido VARCHAR(20),
    oficio VARCHAR(20),
	dir SMALLINT(5),
	fecha_alt DATE,
	salario MEDIUMINT(10),
	comision MEDIUMINT(7),
	dept_no TINYINT(2));



CREATE TABLE DEPART(
	dept_no TINYINT(3)PRIMARY KEY,
	dnombre VARCHAR(20),
	loc VARCHAR(20));


CREATE TABLE HERRAMIENTAS(
	descripcion VARCHAR(20),
	estanteria TINYINT(2),
	unidades TINYINT(2));


CREATE TABLE PERSONAS(
	cod_hospital TINYINT(2),
	dni CHAR(8),
	apellidos VARCHAR(50),
	funcion VARCHAR(15),
	salario SMALLINT(4) 
);

CREATE TABLE MEDICOS(
	cod_hospital TINYINT(2),
	dni CHAR(8),
	apellidos VARCHAR(50),
	especialidad VARCHAR(12)
);

CREATE TABLE HOSPITALES(
	cod_hospital TINYINT(2),
	nombre VARCHAR(50),
	direccion VARCHAR(50),
	num_plazas SMALLINT(4)
);


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

/*VALORES DE HOSPITALES*/

INSERT INTO HOSPITALES( cod_hospital, nombre, direccion, num_plazas)VALUES(1, 'Rafael Méndez', 'Gran Vía, 7', 250);
INSERT INTO HOSPITALES( cod_hospital, nombre, direccion, num_plazas)VALUES(2, 'Reina Sofía', 'Junterones, 5', 225);
INSERT INTO HOSPITALES( cod_hospital, nombre, direccion, num_plazas)VALUES(3, 'Principe Asturias', 'Avenida Colón', 150);
INSERT INTO HOSPITALES( cod_hospital, nombre, direccion, num_plazas)VALUES(4, 'Virgen de la Arrixia', 'Avenida Juan Carlos, I', 250);
/*25. A partir de la tabla EMPLE visualizar cuántos apellidos de los empleados
empiezan por la letra ʻA'.*/
SELECT COUNT(e.apellido)
FROM emple e
WHERE e.apellido LIKE 'A%';



/*26. Dada la tabla EMPLE, obtener el sueldo medio, el número de comisiones no
nulas, el máximo sueldo y el sueldo mínimo de los empleados del departamento 30.
*/
SELECT round(avg(e.salario),0), COUNT(e.comision), MAX(e.salario), MIN(e.salario)
FROM emple e 
WHERE e.comision IS NOT NULL and e.dept_no = 30
GROUP BY e.dept_no; 



