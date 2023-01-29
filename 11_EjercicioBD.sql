CREATE DATABASE empresa;

/*
CREATE TABLE empleado(
    codigo SMALLINT(5),
    nombre VARCHAR(15) NOT NULL,
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20) NOT NULL,
    dni VARCHAR(9) NOT NULL,
    fechaNacimiento DATE,
    salario SMALLINT(7) NOT NULL,
    CONSTRAINT cod_pk PRIMARY KEY(codigo),
    CONSTRAINT dni_nom_ap1_ap2_uk UNIQUE(dni, nombre, apellido1, apellido2)
);

ALTER TABLE empleado ADD CONSTRAINT salario_min CHECK(salario>0);


me lo señala como que está mal pero luego me lo acepta, así que no hace
falta ni si quiera usar ALTER*/

CREATE TABLE empleado(
    codigo SMALLINT(5),
    nombre VARCHAR(15) NOT NULL,
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20) NOT NULL,
    dni VARCHAR(9) NOT NULL,
    fechaNacimiento DATE,
    salario SMALLINT(7) NOT NULL,
    CONSTRAINT cod_pk PRIMARY KEY(codigo),
    CONSTRAINT dni_nom_ap1_ap2_uk UNIQUE(dni, nombre, apellido1, apellido2),
    CONSTRAINT sal_min CHECK(salario>0)
);


CREATE TABLE departamento(
    nombre VARCHAR(20),
    descripcion VARCHAR(100),
    CONSTRAINT nom_pk PRIMARY KEY(nombre)
);

CREATE TABLE proyecto(
    codigo SMALLINT(4) PRIMARY KEY,
    nombre VARCHAR(3) UNIQUE NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    presupuesto SMALLINT(11) CHECK(presupuesto>0),
    fechaInicio DATE NOT NULL /*CHECK(fechaInicio >= CURDATE())*/,
    fechaFinalizacion DATE NOT NULL CHECK(fechaFinalizacion>fechaInicio)
);

/*NO DEJA HACER EL CHECK CON CURDATE(), ASI QUE ESE NO LO VOY A PONER*/

ALTER TABLE proyecto ADD CONSTRAINT CHECK(presupuesto>0); 

/*
no SE PUEDE HACER constraint de not null
*/

CREATE TABLE participa(
    empleado SMALLINT(5),
    proyecto SMALLINT(4),
    fechaIngreso DATE NOT NULL,
    rol CHAR(1) NOT NULL,
    presupuesto SMALLINT(5),
    CONSTRAINT em_pr_pk PRIMARY KEY(empleado, proyecto),
    CONSTRAINT em_fk FOREIGN KEY(empleado) REFERENCES empleado(codigo),
    CONSTRAINT pr_fk FOREIGN KEY(proyecto) REFERENCES proyecto(codigo));

ALTER TABLE participa ADD CONSTRAINT CHECK(presupuesto>0);

/*como he dicho no deja hacer check con curdate()*/

INSERT INTO empleado(codigo,nombre,apellido1,apellido2,dni,fechaNacimiento, salario) VALUES(1,"Manolo","Jimenez","Vega","4534534A",0000-00-00,4334);
INSERT INTO empleado(codigo,nombre,apellido1,apellido2,dni,fechaNacimiento, salario) VALUES(1,"Manolo","Jimenez","Vega","4534534A",0000-00-00,4334);
/*lo raro es que si cambio la pk ya me lo acepta
a pesar de que tengo como clave candidata un conjunto de valores que se repiten en este caso


3) Borrar algún empleado, algún departamento, algún proyecto.
   ¿Hay alguna incoherencia con las tuplas de la tabla 'Participa'.
   Eliminar las tuplas de 'Participa' que sea necesario.
*/
DELETE FROM empleado WHERE(codigo>0);
DELETE FROM departamento WHERE(nombre="ASIR");
DELETE FROM proyecto WHERE(codigo>=3);

/*
4) Modificar las tablas anteriores:
-Añadir columna 'departamento: Cadena(20)' a la tabla 'Empleado'
-Añadir columna 'codigo:Number(4)' a la tabla 'Departamento'
-Lograr que 'código' sea la clave primaria de 'Departamento'
-Modificar la columna 'descripcion' de departamento para que sea 'Cadena(150)'
-Sustituir la columna 'departamento' de la tabla 'Empleado' para que sea 'Number(4)'
*/

ALTER TABLE empleado ADD departamento VARCHAR(20);

ALTER TABLE departamento ADD codigo SMALLINT(4);

ALTER TABLE departamento DROP PRIMARY KEY;/*o con DISABLE EN VEZ DE DROP*/
ALTER TABLE departamento ADD CONSTRAINT cod_pk PRIMARY KEY(codigo);

ALTER TABLE departamento MODIFY descripcion VARCHAR(150);

ALTER TABLE empleado MODIFY departamento NUMBER(4);


/*
5) Actualizaciones
-Actualizar las tuplas de la tabla 'Empleado' para asignar un código de departamento a cada empleado
-Cambiar el nombre de algún empleado
-Cambiar de departamento a algunos empleados
-Cambiar el presupuesto de algún proyecto
-Cambiar los participantes en algún proyecto
*/

ALTER TABLE empleado ADD codigoDepart SMALLINT(4);
ALTER TABLE empleado ADD CONSTRAINT codDepart_fk FOREIGN KEY(codigoDepart) REFERENCES departamento(codigo);

UPDATE empleado
SET nombre="Leoncio"
WHERE nombre="Gonzalo";

UPDATE empleado 
SET departamento=7
WHERE departamento=3;

UPDATE proyecto 
SET presupuesto=100
WHERE presupuesto=20

/*
6) Restricciones de clave ajena

-Definir una restricción de clave ajena del atributo 'departamento' de la tabla 'Empleado', respecto al atributo 'código' de la tabla 'Departamento'.
-Insertar tuplas en la tabla Empleado, estableciendo como departamento alguno de los existentes
-Tratar de insertar tuplas en la tabla Empleado, estableciendo como departamento uno que no exista
-Modificar la restricción de clave ajena anterior, para indicar que en caso de borrado establecer NULO y en caso de actualización establecer 'EN CASCADA' 
-Establecer restricciones de clave ajena en la tabla 'Participa', de manera que tanto en el caso de borrado como actualización se realice 'EN CASCADA'
*/

/*
7) Restricciones con nombre

-Modificar todas las tablas para definir restricciones con nombre para todas las restricciones definidas en las tablas



*/



/*tablas que he insertado para realizar los ejercicios*/


INSERT INTO departamento(nombre, descripcion, codigo)VALUES("DAM","Desarrollo de apps",587);
INSERT INTO departamento(nombre, descripcion, codigo)VALUES("ASIR","Desarrollo de ordenadores",567);
INSERT INTO departamento(nombre, descripcion, codigo)VALUES("DAW","Desarrollo web",564);

INSERT INTO empleado(codigo,nombre,apellido1,apellido2,dni,fechaNacimiento, salario, departamento, codigoDepart) VALUES(2,"Paco","Jimenez","Sanchez","657563G",0000-00-00,4334, 3, 587);
INSERT INTO empleado(codigo,nombre,apellido1,apellido2,dni,fechaNacimiento, salario, departamento, codigoDepart) VALUES(3,"Gonzalo","Terminator","Ponce","4656456A",0000-00-00,4334, 4, 567);
INSERT INTO empleado(codigo,nombre,apellido1,apellido2,dni,fechaNacimiento, salario, departamento, codigoDepart) VALUES(4,"Jose","Ramirez","Vazquez","895612F",0000-00-00, 4334, 2, 564);