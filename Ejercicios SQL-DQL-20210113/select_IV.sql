CREATE DATABASE select_IV;

CREATE TABLE EMPLE(
    emp_no SMALLINT,
    apellido VARCHAR(20),
    oficio VARCHAR(20),
    dir SMALLINT,
    fecha_alt DATE,
    salario MEDIUMINT,
    comision MEDIUMINT,
    dept_no TINYINT
);



CREATE TABLE DEPART(
    dept_no TINYINT,
    dnombre VARCHAR(20),
    loc VARCHAR(20)
);

/*valores para EMPLE*/
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

/*
1. Mostrar los datos de los empleados que pertenezcan al mismo departamento
que ʻGILʼ.*/
SELECT * 
FROM EMPLE 
WHERE dept_no IN(SELECT dept_no
FROM EMPLE
WHERE apellido IN('GIL')) and apellido NOT IN('GIL');

/*
2. Mostrar los datos de los empleados que tengan el mismo oficio que
ʻCEREZOʼ. El resultado debe ir ordenado por apellido.*//*NO HAY NINGUN CEREZO*/
SELECT *
FROM EMPLE 
WHERE oficio IN(SELECT oficio 
FROM EMPLE 
WHERE apellido IN('NEGRO')) AND apellido NOT IN('NEGRO')
ORDER BY apellido;



/*3. Mostrar los empleados (nombre, oficio, salario y fecha de alta) que
desempeñen el mismo oficio que ʻJIMÉNEZʼ o que tengan un salario mayor o
igual que ʻFERNÁNDEZʼ.*/
SELECT *
FROM EMPLE e 
WHERE e.apellido IN('JIMENEZ') OR e.salario>=(SELECT salario
FROM EMPLE e2
WHERE e2.apellido = "FERNANDEZ");



/*4. Mostrar en pantalla el apellido, oficio y salario de los empleados del
departamento de ʻFERNÁNDEZʼ que tengan su mismo salario.*/

SELECT e.apellido, e.oficio, e.salario
FROM EMPLE e, DEPART d
WHERE e.salario = (SELECT e2.salario
                   FROM EMPLE e2
                  WHERE e2.apellido = "FERNANDEZ") and e.dept_no IN(SELECT e2.dept_no
                                                                   FROM EMPLE e2) and e.apellido NOT IN("FERNANDEZ")
GROUP BY e.apellido;


/*5. Mostrar los datos de los empleados que tengan un salario mayor que ʻGILʼ y
que pertenezcan al departamento número 10.*/

SELECT * 
FROM EMPLE e
WHERE e.salario>(SELECT e2.salario
                FROM EMPLE e2
                WHERE e2.apellido = "GIL")
                and e.dept_no IN(SELECT e2.dept_no
                                FROM EMPLE e2
                                WHERE e2.dept_no = 10)
                                GROUP BY e.apellido;

/*6. Mostrar los apellidos, oficios y localizaciones de los departamentos de cada
uno de los empleados.*/
SELECT e.apellido, e.oficio, d.loc
FROM EMPLE e, DEPART d
WHERE e.dept_no = d.dept_no


/*7. Seleccionar el apellido, el oficio y la localidad de los departamentos donde
trabajan los ANALISTAS.*/
SELECT e.apellido, e.oficio, d.dept_no, d.loc
FROM depart d, emple e
WHERE e.dept_no = d.dept_no and e.oficio = "ANALISTA";



/*8. Seleccionar el apellido, el oficio y salario de los empleados que trabajan en
Madrid.*/
SELECT e.apellido, e.oficio, e.salario
FROM emple e, depart d
WHERE d.loc = "Madrid" and d.dept_no = e.dept_no;


/*9. Seleccionar el apellido, salario y localidad donde trabajan de los empleados
que tengan un salario entre 200000 y 300000.*/

SELECT e.apellido, e.salario, d.loc
FROM emple e, depart d
WHERE e.dept_no = d.dept_no and e.salario BETWEEN 200000 AND 300000; 



/*10. Mostrar el apellido, salario y nombre del departamento de los empleados
que tengan el mismo oficio que ʻGILʼ.*/

SELECT e.apellido, e.salario, d.dept_no
FROM depart d, emple e 
WHERE e.dept_no = d.dept_no and e.oficio IN(SELECT e2.oficio
                                           FROM emple e2
                                           WHERE e2.apellido IN('GIL') and e.apellido NOT IN('GIL'));



/*11. Mostrar el apellido, salario y nombre del departamento de los empleados
que tengan el mismo oficio que ʻGILʼ y que no tengan comisión.*/
SELECT e.apellido, salario, e.dept_no
FROM emple e
WHERE e.oficio IN(SELECT e2.oficio
                FROM emple e2
                WHERE e2.apellido = "GIL") and e.comision is null;



/*12. Mostrar los datos de los empleados que trabajan en el departamento de
contabilidad, ordenados por apellidos.*/

SELECT *
FROM emple e JOIN depart d ON e.dept_no = d.dept_no
WHERE d.dnombre = "CONTABILIDAD" ORDER BY e.apellido;



/*13. Apellido de los empleados que trabajan en Sevilla y cuyo oficio sea analista
o empleado.*/

SELECT e.apellido
FROM emple e, depart d 
WHERE e.dept_no = d.dept_no and d.loc = "Sevilla" and e.oficio = "ANALISTA" or e.oficio = "EMPLEADO"
GROUP BY e.apellido;



/*14. Calcula el salario medio de todos los empleados.*/

SELECT avg(e.salario)
FROM emple e;



/*15. ¿Cuál es el máximo salario de los empleados del departamento 10?*/

SELECT MAX(e.salario) 
FROM emple e 
WHERE e.dept_no = 10 
GROUP BY e.dept_no;




/*16. Calcula el salario mínimo de los empleados del departamento 'VENTAS'.*/
SELECT MIN(e.salario)
FROM emple e, depart d 
WHERE d.dept_no = e.dept_no and d.dnombre = "VENTAS"
GROUP BY d.dnombre;



/*17. Calcula el promedio del salario de los empleados del departamento de
'CONTABILIDAD'.*/
SELECT AVG(e.salario)
FROM emple e, depart d 
WHERE e.dept_no = e.dept_no and d.dnombre = "CONTABILIDAD"
GROUP BY d.dnombre;



/*18. Mostrar los datos de los empleados cuyo salario sea mayor que la media de
todos los salarios.*/

SELECT *
FROM emple e 
WHERE e.salario > (SELECT AVG(e2.salario)
                    FROM emple e2);



/*19. ¿Cuántos empleados hay en el departamento número 10?*/

SELECT dept_no, COUNT(e.apellido)
FROM emple e 
WHERE e.dept_no = 10
GROUP BY e.dept_no;



/*20. ¿Cuántos empleados hay en el departamento de 'VENTAS'?*/

SELECT COUNT(e.apellido)
FROM emple e, depart d  
WHERE e.dept_no = d.dept_no and d.dnombre = "VENTAS"
GROUP BY d.dnombre;


/*21. Calcula el número de empleados que hay que no tienen comisión.*/
SELECT COUNT(*) 
FROM emple e 
WHERE e.comision 
IS NULL OR e.comision=0;


/*22. Seleccionar el apellido del empleado que tiene máximo salario.*/
SELECT e.apellido
FROM emple e 
WHERE e.salario IN(SELECT MAX(e2.salario)
                    FROM emple e2);



/*23. Mostrar los apellidos del empleado que tiene el salario más bajo.*/

SELECT e.apellido 
FROM emple e 
WHERE e.salario IN(SELECT MIN(e2.salario)
                FROM emple e2);




/*24. Mostrar los datos del empleado que tiene el salario más alto en el
departamento de 'VENTAS'.*/
SELECT *
FROM emple e, depart d 
WHERE e.dept_no = d.dept_no and d.dnombre = "VENTAS" and e.salario IN(SELECT MAX(e2.salario)
                                                                    FROM emple e2);


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



