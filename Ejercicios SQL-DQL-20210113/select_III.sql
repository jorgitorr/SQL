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