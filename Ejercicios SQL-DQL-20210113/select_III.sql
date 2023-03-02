CREATE DATABASE select_III;

CREATE TABLE FABRICANTE(
		ID_Fab TINYINT,
    	Nombre VARCHAR(20),
    	Pais VARCHAR(50),

	CONSTRAINT fab_id_pk PRIMARY KEY(ID_Fab)
);


INSERT INTO FABRICANTE(ID_Fab, Nombre, Pais)VALUES(1, "Oracle", "Estados Unidos");
INSERT INTO FABRICANTE(ID_Fab, Nombre, Pais)VALUES(2, "Microsoft", "Estados Unidos");
INSERT INTO FABRICANTE(ID_Fab, Nombre, Pais)VALUES(3, "IBM", "Estados Unidos");
INSERT INTO FABRICANTE(ID_Fab, Nombre, Pais)VALUES(4, "Dinamic", "España");
INSERT INTO FABRICANTE(ID_Fab, Nombre, Pais)VALUES(5, "Borland", "Estados Unidos");
INSERT INTO FABRICANTE(ID_Fab, Nombre, Pais)VALUES(6, "Symantec", "Estados Unidos");


/*TABLA PROGRAMA*/

CREATE TABLE PROGRAMA(
	codigo TINYINT,
    nombre VARCHAR(60),
    version VARCHAR(30),

	CONSTRAINT PRO_cod_pk PRIMARY KEY(codigo)
);


INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(1, "Application Server", "9i");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(2, "Database", "8i");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(3, "Database", "9i");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(4, "Database", "10g");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(5, "Developer", "6i");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(6, "Access", "97");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(7, "Access", "2000");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(8, "Access", "XP");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(9, "Windows", "98");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(10, "Windows", "XP Professional");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(11, "Windows", "XP Home Edition");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(12, "Windows", "2003 Server");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(13, "Norton Internet Security", "2004");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(14, "Freddy Hardest", "-");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(15, "Paradox", "2");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(16, "C++ Builder", "55");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(17, "DB/2", "20");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(18, "OS/2", "10");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(19, "JBuilder", "X");
INSERT INTO PROGRAMA(codigo, nombre, version)VALUES(20, "La prisión", "10");



/*TABLA COMERCIO*/
    
CREATE TABLE COMERCIO(
	CIF TINYINT(2),
    Nombre VARCHAR(30),
    Ciudad VARCHAR(20),
	CONSTRAINT DIS_cod_pk PRIMARY KEY(CIF)
);

INSERT INTO COMERCIO(CIF, Nombre, Ciudad)VALUES(1,"El Corte Inglés", "Sevilla");
INSERT INTO COMERCIO(CIF, Nombre, Ciudad)VALUES(2,"El Corte Inglés", "Madrid");
INSERT INTO COMERCIO(CIF, Nombre, Ciudad)VALUES(3,"Jump", "Valencia");
INSERT INTO COMERCIO(CIF, Nombre, Ciudad)VALUES(4,"Centro Mail", "Sevilla");
INSERT INTO COMERCIO(CIF, Nombre, Ciudad)VALUES(5,"FNAC", "Barcelona");



/*TABLA CLIENTE*/

CREATE TABLE CLIENTE(
	DNI TINYINT,
    Nombre VARCHAR(50),
    Edad TINYINT(2),

	CONSTRAINT CLI_DNI_pk PRIMARY KEY(DNI)
);


INSERT INTO CLIENTE(DNI,Nombre,Edad)VALUES(1,'Pepe Pérez', 45);
INSERT INTO CLIENTE(DNI,Nombre,Edad)VALUES(2, 'Juan González', 45);
INSERT INTO CLIENTE(DNI,Nombre,Edad)VALUES(3, 'María Gómez', 33);
INSERT INTO CLIENTE(DNI,Nombre,Edad)VALUES(4, 'Javier Casado', 18);
INSERT INTO CLIENTE(DNI,Nombre,Edad)VALUES(5, 'Nuria Sánchez', 29);
INSERT INTO CLIENTE(DNI,Nombre,Edad)VALUES(6, 'Antonio Navarro', 58);


/*TABLA DESARROLLA*/

CREATE TABLE DESARROLLA(
	ID_Fab TINYINT, 
    Codigo TINYINT,
	CONSTRAINT DES_ID_FK FOREIGN KEY(ID_Fab) REFERENCES FABRICANTE(ID_Fab),
	CONSTRAINT DES_cod_FK FOREIGN KEY(Codigo) REFERENCES PROGRAMA(codigo)
);

INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(1,1);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(1,2);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(1,3);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(1,4);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(1,5);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(2,6);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(2,7);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(2,8);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(2,9);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(2,10);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(2,11);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(2,12);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(6,13);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(4,14);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(5,15);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(5,16);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(3,17);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(3,18);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(5,19);
INSERT INTO DESARROLLA(ID_FAB,Codigo)VALUES(4,20);

/*DISTRIBUYE*/
CREATE TABLE DISTRIBUYE( 
	CIF TINYINT, 
	codigo TINYINT, 
	cantidad TINYINT,
	CONSTRAINT DIS_cif_fk FOREIGN KEY(cif) REFERENCES COMERCIO(CIF),
	CONSTRAINT DIS_cod_fk FOREIGN KEY(codigo) REFERENCES PROGRAMA(codigo)
);
 
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(1,1,10);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(1,2, 11);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(1,6, 5);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(1,7, 3);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(1,10, 5);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(1,13, 7);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(2, 1, 6);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(2, 2, 6);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(2, 6, 4);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(2, 7, 7);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(3, 10, 8);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(3,13,5);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(4,14,3);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(4,20,6);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(5,15,8);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(5,16,2);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(5,17,3);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(5,19,6);
INSERT INTO DISTRIBUYE(cif,codigo,cantidad)VALUES(5,8,8);


/*TABLA REGISTRA*/

CREATE TABLE REGISTRA(
	cif TINYINT(2),
    dni TINYINT(2),
    codigo TINYINT(2),
    medio VARCHAR(30)
);

INSERT INTO REGISTRA(cif, dni, codigo, medio)VALUES(1,1,1,"Internet");
INSERT INTO REGISTRA(cif, dni, codigo, medio)VALUES(1,3,4,"Tarjeta postal");
INSERT INTO REGISTRA(cif, dni, codigo, medio)VALUES(4,2,10,"Teléfono");
INSERT INTO REGISTRA(cif, dni, codigo, medio)VALUES(4,1,10,"Tarjeta postal");
INSERT INTO REGISTRA(cif, dni, codigo, medio)VALUES(4,1,10,"Internet");
INSERT INTO REGISTRA(cif, dni, codigo, medio)VALUES(2,4,15,"Internet");

/*
1 Averigua el DNI de todos los clientes.*/
SELECT DNI FROM CLIENTE;

/*
2 Consulta todos los datos de todos los programas.*/

SELECT * FROM PROGRAMA;

/*
3 Obtén un listado con los nombres de todos los programas.*/

SELECT nombre FROM PROGRAMA;


/*
4 Genera una lista con todos los comercios.*/

SELECT Nombre FROM COMERCIO;


/*
5 Genera una lista de las ciudades con establecimientos donde se venden programas, sin que aparezcan valores duplicados (utiliza DISTINCT).*/

SELECT DISTINCT ciudad FROM COMERCIO JOIN DISTRIBUYE ON COMERCIO.CIF=DISTRIBUYE.CIF;


/*
6 Obtén una lista con los nombres de programas, sin que aparezcan valores.
duplicados (utiliza DISTINCT).*/

SELECT DISTINCT Nombre FROM COMERCIO;

/*
7 Obtén el DNI más 4 de todos los clientes.*/

SELECT DNI+4 AS SUMA FROM CLIENTE;

/*
8 Haz un listado con los códigos de los programas multiplicados por 7.*/

SELECT codigo*7 FROM PROGRAMA;

/*
9 ¿Cuáles son los programas cuyo código es inferior o igual a 10?*/

SELECT codigo FROM PROGRAMA WHERE codigo<=10;

/*
10 ¿Cuál es el programa cuyo código es 11?*/

SELECT codigo FROM PROGRAMA WHERE codigo=11;
/*
11 ¿Qué fabricantes son de Estados Unidos?*/

SELECT nombre FROM FABRICANTE WHERE Pais="Estados Unidos";

/*
12 ¿Cuáles son los fabricantes no españoles? Utilizar el operador IN.*/

SELECT codigo FROM FABRICANTE WHERE Pais NOT IN("Españoles");

/*
13 Obtén un listado con los códigos de las distintas versiones de Windows.*/

SELECT DISTINCT version FROM PROGRAMA;

/*
14 ¿En qué ciudades comercializa programas El Corte Inglés?*/

SELECT DISTINCT c.Ciudad FROM COMERCIO c, DISTRIBUYE d WHERE c.cif = d.cif and c.Nombre = "El Corte Inglés";

/*
15 ¿Qué otros comercios hay, además de El Corte Inglés? Utilizar el operador
IN.*/

SELECT DISTINCT nombre FROM COMERCIO WHERE nombre NOT IN("El Corte Inglés");


/*
16 Genera una lista con los códigos de las distintas versiones de Windows y
Access. Utilizar el operador IN.*/

SELECT p.Codigo FROM PROGRAMA p WHERE p.nombre IN("Access");


/*
17 Obtén un listado que incluya los nombres de los clientes de edades
comprendidas entre 10 y 25 y de los mayores de 50 años. Da una solución con
BETWEEN y otra sin BETWEEN.*/

SELECT c.nombre FROM CLIENTE c WHERE c.edad>50 OR c.edad BETWEEN 10 AND 25;


/*
18 Saca un listado con los comercios de Sevilla y Madrid. No se admiten
valores duplicados.*/

SELECT DISTINCT c.nombre  FROM COMERCIO c WHERE c.ciudad IN("Sevilla","Madrid");

/*
19 ¿Qué clientes terminan su nombre en la letra “o”?*/

SELECT c.nombre FROM CLIENTE c WHERE c.nombre LIKE '%o';


/*
20 ¿Qué clientes terminan su nombre en la letra “o” y, además, son mayores de 30 años?*/

SELECT c.nombre FROM CLIENTE c WHERE c.nombre LIKE '%o' AND c.edad>30;

/*
21 Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, o cuyo nombre comience por una A o por una W.*/

SELECT DISTINCT p.Nombre FROM PROGRAMA p WHERE p.version LIKE '%i' AND p.nombre LIKE 'A%' OR p.nombre LIKE 'W%';


/*22 Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, o cuyo nombre comience por una A y termine por una S.*/

SELECT p.nombre, p.version FROM PROGRAMA p WHERE p.version LIKE '%i' OR p.nombre LIKE 'A%s';

/*23 Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, y cuyo nombre no comience por una A.*/

SELECT * FROM PROGRAMA p LIKE p.nombre LIKE '%i' AND p.nombre LIKE 'A%';

/*24 Obtén una lista de empresas por orden alfabético ascendente.*/

SELECT c.Nombre 
FROM COMERCIO c ORDER BY c.Nombre ASC;

/*
25 Genera un listado de empresas por orden alfabético descendente.*/
SELECT c.Nombre FROM COMERCIO c ORDER BY c.Nombre DESC;

/*
26 Obtén un listado de programas por orden de versión*/

SELECT p.Nombre FROM PROGRAMA p ORDER BY p.version;

/*27 Genera un listado de los programas que desarrolla Oracle.*/
SELECT f.nombre, p.nombre 
FROM DESARROLLA d, PROGRAMA p, FABRICANTE f 
WHERE f.id_fab = d.id_fab AND d.codigo = p.codigo AND f.nombre = "Oracle" 
GROUP BY f.nombre, p.nombre;

/*28 ¿Qué comercios distribuyen Windows?*/

SELECT c.Nombre FROM COMERCIO c, PROGRAMA p, DISTRIBUYE d WHERE c.cif = d.cif AND d.codigo = p.codigo AND p.Nombre = "Windows"; 

/*29 Genera un listado de los programas y cantidades que se han distribuido a El Corte Inglés de Madrid.*/

SELECT p.nombre, SUM(d.cantidad) 
FROM programa p, distribuye d, comercio c 
where p.codigo = d.codigo and d.CIF = c.CIF and c.Nombre = "El Corte Inglés" and c.Ciudad = "Madrid" 
GROUP BY p.nombre;

/*
30 ¿Qué fabricante ha desarrollado Freddy Hardest?*/
SELECT f.Nombre
FROM FABRICANTE f, desarrolla d, programa p 
WHERE f.ID_Fab = d.ID_Fab and d.Codigo = p.codigo and p.nombre = "Freddy Hardest";

/*
31 Selecciona el nombre de los programas que se registran por Internet.*/

SELECT DISTINCT p.nombre FROM programa p, registra r WHERE p.codigo = r.codigo and r.medio="Internet";

/*
32 Selecciona el nombre de las personas que se registran por Internet.*/

SELECT DISTINCT c.Nombre FROM cliente c, registra r WHERE c.DNI = r.dni and r.medio = "Internet";

/*
33 ¿Qué medios ha utilizado para registrarse Pepe Pérez?*/
SELECT r.medio 
FROM registra r, cliente c 
WHERE r.dni = c.DNI and c.Nombre = "Pepe Perez" GROUP BY r.medio;

/*
34 ¿Qué usuarios han optado por Internet como medio de registro?*/

SELECT DISTINCT c.Nombre FROM cliente c, registra r WHERE c.DNI = r.dni and r.medio = "Internet";

/*
35 ¿Qué programas han recibido registros por tarjeta postal?*/
SELECT p.nombre 
FROM PROGRAMA p, registra r 
WHERE p.codigo = r.codigo and r.medio = "tarjeta postal";

/*
36 ¿En qué localidades se han vendido productos que se han registrado por Internet?*/

SELECT DISTINCT c.Ciudad
FROM registra r, comercio c
WHERE r.cif = c.CIF  and r.medio = "Internet";


/*
37 Obtén un listado de los nombres de las personas que se han registrado por Internet, junto al nombre de los programas para los que ha efectuado el registro.*/

SELECT c.Nombre, p.nombre
FROM cliente c, registra r, programa p
WHERE c.DNI = r.dni and p.codigo = r.codigo and r.medio = "Internet";

/*38 Genera un listado en el que aparezca cada cliente junto al programa que ha registrado, el medio con el que lo ha hecho y el comercio en el que lo ha adquirido.*/

SELECT c.Nombre cliente, p.nombre programa, r.medio medio, c2.Nombre comercio
FROM cliente c, programa p, registra r, comercio c2
WHERE c.DNI = r.dni and p.codigo = r.codigo and c2.CIF = r.cif;

/*39 Genera un listado con las ciudades en las que se pueden obtener los productos de Oracle.*/
SELECT DISTINCT c2.Ciudad
FROM cliente c, registra r, programa p, desarrolla d, fabricante f, comercio c2
WHERE c.DNI = r.dni and p.codigo = r.codigo and p.codigo = d.Codigo and d.ID_Fab = f.ID_Fab and c2.CIF = r.cif
and f.Nombre = "Oracle";

/*40 Obtén el nombre de los usuarios que han registrado Access XP.*/
/*¿Ninguno?*/
SELECT c.nombre
FROM cliente c, registra r, programa p
WHERE c.DNI = r.dni and r.codigo = p.codigo and p.nombre = "Access" and p.version = "XP"; 

/*41 Nombre de aquellos fabricantes cuyo país es el mismo que ʻOracleʼ.(Subconsulta).*/

SELECT f.nombre
FROM fabricante f
WHERE f.Pais IN(SELECT f.Pais
               FROM fabricante f
               WHERE f.Nombre = "Oracle");

/*42 Nombre de aquellos clientes que tienen la misma edad que Pepe Pérez.(Subconsulta).*/
SELECT c.nombre
FROM cliente c 
WHERE c.edad IN(SELECT c2.Edad
               FROM cliente c2
               WHERE c2.Nombre IN("Pepe Pérez") and c.Nombre NOT IN("Pepe Pérez"));

/*43 Genera un listado con los comercios que tienen su sede en la misma ciudad que tiene el comercio ʻFNACʼ. (Subconsulta).*/
SELECT c.Nombre
FROM comercio c
WHERE c.Ciudad IN(SELECT c2.Ciudad
                 FROM comercio c2
                 WHERE c.Nombre IN("FNAC"));

/*44 Nombre de aquellos clientes que han registrado un producto de la misma forma que el cliente ʻPepe Pérezʼ. (Subconsulta).*/
SELECT c.nombre, r.medio FROM cliente c, registra r WHERE r.dni = c.DNI and r.medio IN(
    SELECT r2.medio
	FROM registra r2, cliente c2
	WHERE r2.dni = c2.DNI and c2.Nombre = "Pepe Pérez") and c.Nombre NOT IN("Pepe Pérez");


/*45 Obtener el número de programas que hay en la tabla programas.*/
SELECT COUNT(*)
FROM programa p; 

/*46 Calcula el número de clientes cuya edad es mayor de 40 años.*/
SELECT COUNT(c.Nombre)
FROM cliente c
WHERE c.Edad>40;


/*47 Calcula el número de productos que ha vendido el establecimiento cuyo CIF es 1.*/
SELECT COUNT(*) 
FROM distribuye d 
WHERE d.CIF = 1;

/*48 Calcula la media de programas que se venden cuyo código es 7.*/
/*(El round te devuelve un valor con muchos decimales por lo tanto hay que usar la funcion round para redondearlo)*/

SELECT ROUND(AVG(d.cantidad),0)
FROM programa p, distribuye d
WHERE p.codigo = d.codigo and p.codigo IN(7)
GROUP BY p.codigo;

/*49 Calcula la mínima cantidad de programas de código 7 que se ha vendido*/
SELECT MIN(d.cantidad)
FROM distribuye d
WHERE d.codigo = 7
GROUP BY d.codigo;

/*49 Calcula la mínima cantidad de programas de código 7 que se ha vendido en cada comercio*/
SELECT c.nombre, COUNT(r.codigo)
FROM REGISTRA r , COMERCIO c
WHERE r.codigo = 7 and r.cif = c.cif
GROUP BY c.nombre/*filtra por nombre de comercio, ya que comparten el mismo cif y por tanto solo sale 1 nombre*/
HAVING COUNT(*)=(SELECT COUNT(*) total
				FROM REGISTRA r 
				WHERE r.codigo = 7
				GROUP BY r.cif
                ORDER BY total ASC /*TE COGE EL MIN, YA QUE EN MISQL NO PERMITE HACER FUNCION DE FUNCION MIN(COUNT(*))*/
                LIMIT 1);

/*50 Calcula la máxima cantidad de programas de código 7 que se ha vendido.*/
SELECT MAX(d.cantidad)
FROM distribuye d
WHERE d.codigo = 7
GROUP BY d.codigo;

/*51 ¿En cuántos establecimientos se vende el programa cuyo código es 7?*/
SELECT COUNT(c.Nombre)
FROM programa p, distribuye d, comercio c 
WHERE p.codigo = 7 and p.codigo = d.codigo and c.CIF = d.CIF;


/*52 Calcular el número de registros que se han realizado por Internet.*/
SELECT COUNT(*)
FROM registra r
WHERE r.medio = "Internet"
GROUP BY r.medio;


/*53 Obtener el número total de programas que se han vendido en ʻSevillaʼ.*/
SELECT COUNT(*)
FROM comercio c, registra r
WHERE c.cif=r.cif and c.Ciudad IN("Sevilla")
GROUP BY c.Ciudad;


/*54 Calcular el número total de programas que han desarrollado los fabricantes cuyo país es ʻEstados Unidosʼ.*/
SELECT COUNT(p.nombre)
FROM programa p, desarrolla d, fabricante f
WHERE p.codigo = d.codigo and d.id_fab = f.id_fab and f.Pais IN(
    SELECT f.Pais 
    FROM fabricante f 
    WHERE f.Pais="Estados Unidos")
GROUP BY f.Pais;

/*55 Visualiza el nombre de todos los clientes en mayúscula. En el resultado de la consulta debe aparecer también la longitud de la 
cadena nombre.*/
SELECT UPPER(c.nombre) nombre, LENGTH(c.nombre) longuitud
FROM cliente c
GROUP BY c.nombre;



/*56 Con una consulta concatena los campos nombre y versión de la tabla PROGRAMA.*/
SELECT CONCAT(nombre, " ", version)
FROM programa;
