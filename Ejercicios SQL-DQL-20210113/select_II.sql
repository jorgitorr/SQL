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
(654321, "Laura Gómez Fernández", "Lorca",'1994-10-09', "Junterones,10,5B",2,"ESO", 25),
(765432, "Beatriz Martínez Hernández","Murcia",'1993-05-04',"Plaza Mayor,6,3B",3,"ESO",5),
(987654, "Diego Martín Llorente", "Alhama de Murcia", '1990-03-03',"Diego de la Cierva, 5, 7A", 1, "BACHILLERATO",34),
(445544, "Juan Francisco Cano", "Murcia",'1992-01-07',"San Juan,14, 3B",1,"ESO",13),
(223322, "Raquel Riquelme Rubio", "Lorca", '1992-12-13', "San Juan, 14, 3B", 1, "BACHILLERATO", 7),
(9988877, "Cristina Sánchez Bermejo","Murcia", '1995-03-02', "Torre de Romo, 7", 1, "ESO", 1),
(334455, "Pedro Jesús Rodriguez", "Alhama de Murcia", '1994-10-05',"Camino de Badel, 4", 2, "ESO", 11),
(334400, "Javier Ramirez Rodriguez", "Murcia", '1993-09-03', "Gran Via, 4, 3A", 1, "ESO", 0),
(993322, "Gema Rubio Colero", "Lorca", '1992-09-05', "Plaza Fuentesanta, 5, 7A", 1, "BACHILLERATO", 19),
(554411, "Joaquin Hernández", "Lorca", '1991-12-15', "Junterones, 4, 5A", 2, "BACHILLERATO", 14);
