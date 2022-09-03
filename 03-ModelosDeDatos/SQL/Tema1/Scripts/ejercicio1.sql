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

CREATE TABLE Plan (
    idplan int,
    nombre char NOT NULL,
    credits int  NOT NULL,
    area char NOT NULL,
    alta date NOT NULL,
    baja date NULL,
    idprofesor int NOT NULL,
    FOREIGN KEY (idprofesor) REFERENCES Profesor(idprofesor),
    PRIMARY KEY (idplan),
    UNIQUE (nombre),
    CHECK (credits >= 60 AND credits <= 120),
    CHECK (area IN ('ciencias', 'ciencias de la salud', 'ciencias sociales', 'humanidades', 'ingenieria') ),
    CHECK (baja > alta) 
);

DROP TABLE Plan;

INSERT INTO Plan (idplan, nombre, credits, area, alta, baja, idprofesor)
    VALUES (1, 'Datascience', 60, 'ciencias', '2019-09-11', NULL, 1);    
    
SELECT * FROM Plan;

--6.1
INSERT INTO Plan (idplan, nombre, credits, area, alta, baja, idprofesor)
    VALUES (2, NULL, 60, 'ciencias', '2019-09-11', NULL, 1);
--El error que saca es que se está violando el not null

--6.2
INSERT INTO Plan (idplan, nombre, credits, area, alta, baja, idprofesor)
    VALUES (1, 'Datascience3', 60, 'ciencias', '2019-09-11', NULL, 1);
--El error que saca es que se viola el UNIQUE de idplan (que es la primary key)    
    
--6.3
INSERT INTO Plan (idplan, nombre, credits, area, alta, baja, idprofesor)
    VALUES (4, 'Datascience4', 80, 'ciencias sociales', '2019-09-23', NULL, 1);
--El error que saca es que se está violando el UNIQUE

--6.4
INSERT INTO Plan (idplan, nombre, credits, area, alta, baja, idprofesor)
    VALUES (5, 'Datascience5', 60, 'derecho', '2019-09-11', NULL, 1); 
--El error que saca es que se está violando el CHECK

--6.5
INSERT INTO Plan (idplan, nombre, credits, area, alta, baja, idprofesor)
    VALUES (6, 'Datascience6', 50, 'ciencias', '2019-09-11', NULL, 1); 
INSERT INTO Plan (idplan, nombre, credits, area, alta, baja, idprofesor)
    VALUES (6, 'Datascience6', 130, 'ciencias', '2019-09-11', NULL, 1); 
--El error que saca es que se está violando el CHECK

--6.6
INSERT INTO Plan (idplan, nombre, credits, area, alta, baja, idprofesor)
    VALUES (7, 'Canicas', 60, 'ciencias', '2019-09-11', NULL, 3);
--El error que saca es que el FOREING KEY está fallando     
    
--6.7   
INSERT INTO Plan (idplan, nombre, credits, area, alta, baja, idprofesor)
    VALUES ('Pablo', 'Datascience8', 60, 'ciencias', '2019-09-11', NULL, 1);
--No da error al meter un char donde tendría que ir un int porque SQLite está hecho para ser eficiente y supone que eres suficientemente listo como para no mezclar tipos de datos xD
    
SELECT * FROM Plan;