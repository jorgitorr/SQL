CREATE DATABASE hospital;

CREATE TABLE personas(
    	cod_hospital TINYINT(2) PRIMARY KEY,
    	dni CHAR(9),
		apellidos VARCHAR(20),
    	funcion VARCHAR(20),
    	salario SMALLINT(6),
   		localidad VARCHAR(10)
);


INSERT INTO personas VALUES(1,12345678, "García Hernández, Eladio", "CONSERJE", 1200, "LORCA");

ALTER TABLE
