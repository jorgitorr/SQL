CREATE DATABASE select_II;

CREATE TABLE alumnos(
    expediente MEDIUMINT,
    nombre VARCHAR(50),
    localidad VARCHAR(20),
    fecha_nacimiento DATE,
    direccion VARCHAR(100),
    curso TINYINT,
    nivel VARCHAR(50),
    faltas TINYINT
);


INSERT INTO alumnos VALUES(123456, "Juan Miguel Soer Bakero", "Murcia", '1995-10-1',"Gran Vía, 2, 4A", 1, "ESO",15),
(654321, "Laura Gómez Fernández", "Lorca",'1994-10-0', "Junterones,10,5B",2,"ESO", 25),
(765432, "Beatriz Martínez Hernández","Murcia",'1993-05-0',"Plaza Mayor,6,3B",3,"ESO",5),
();