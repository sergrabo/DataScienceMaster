-- Tabla que almacena los datos de los profesores
CREATE TABLE Profesor(
	idprofesor int PRIMARY KEY,
	dni char not null UNIQUE,
	nombre char not null,
	apellido1 char not null,
	apellido2 char null,
	tipoProfesor char not null,
	email char not null UNIQUE,
	fechaNacimiento date not null,
	fechaAlta date not null,
           CHECK (fechaAlta>fechaNacimiento),
           CHECK (tipoProfesor IN ('Ayudante', 'AyudanteDoctor', 'Titular')),
           CHECK (email LIKE '%@%')
);


-- Inserción de datos en la tabla Profesor
INSERT INTO Profesor (idprofesor, dni, nombre, apellido1, apellido2, tipoProfesor, email, fechaNacimiento, fechaAlta)
    VALUES (1, '76576589J', 'Manuel', 'Váquez', 'De la Sierra', 'Ayudante', 'manu@kmail.com','1990-01-02','2016-06-07');
INSERT INTO Profesor (idprofesor, dni, nombre, apellido1, apellido2, tipoProfesor, email, fechaNacimiento, fechaAlta)
    VALUES (2, '78576182V', 'John', 'Doe', NULL, 'AyudanteDoctor', 'john@kmail.com','1992-01-02','2015-12-07');
-- Consula de datos de la tabla profesor
SELECT * FROM Profesor;    
drop table Profesor;

create table Area(
    idArea int,
    nombreArea char not null,
    primary key (idArea),
    unique(nombreArea)
);

insert into Area(idArea, nombreArea)
    values(1, 'ciencias');
insert into Area(idArea, nombreArea)
    values(2, 'ciencias de la salud');
insert into Area(idArea, nombreArea)
    values(3, 'ciencias sociales');
insert into Area(idArea, nombreArea)
    values(4, 'humanidades');
insert into Area(idArea, nombreArea)
    values(5, 'ingenieria');        

select * from Area;

CREATE TABLE Plan (
    idplan int,
    nombre char NOT NULL,
    credits int  NOT NULL,
    idArea int NOT NULL, -- Cambiamos area por su id
    alta date NOT NULL,
    baja date NULL,
    idprofesor int NOT NULL,
    FOREIGN KEY (idprofesor) REFERENCES Profesor(idprofesor),
    PRIMARY KEY (idplan),
    UNIQUE (nombre),
    CHECK (credits >= 60 AND credits <= 120),
    --Check del ej1 como tabla
    foreign key (idArea) references Area(idArea),
    CHECK (baja > alta) 
);

INSERT INTO Plan (idplan, nombre, credits, idArea, alta, baja, idprofesor)
    VALUES (1, 'Datascience1', 60, 1, '2019-09-11', NULL, 1);
INSERT INTO Plan (idplan, nombre, credits, idArea, alta, baja, idprofesor)
    VALUES (2, 'Datascience2', 60, 2, '2019-09-11', NULL, 1); 
INSERT INTO Plan (idplan, nombre, credits, idArea, alta, baja, idprofesor)
    VALUES (3, 'Datascience3', 60, 3, '2019-09-11', NULL, 2); 
INSERT INTO Plan (idplan, nombre, credits, idArea, alta, baja, idprofesor)
    VALUES (4, 'Datascience4', 60, 4, '2019-09-11', NULL, 2); 
INSERT INTO Plan (idplan, nombre, credits, idArea, alta, baja, idprofesor)
    VALUES (5, 'Datascience5', 60, 5, '2019-09-11', NULL, 1); 
     

insert into Area(idArea, nombreArea)
    values(6,'derecho');

INSERT INTO Plan (idplan, nombre, credits, idArea, alta, baja, idprofesor)
    VALUES (6, 'Mascachapeo', 60, 6, '2019-09-11', NULL, 2); 

DROP TABLE Plan;


SELECT * FROM Plan;