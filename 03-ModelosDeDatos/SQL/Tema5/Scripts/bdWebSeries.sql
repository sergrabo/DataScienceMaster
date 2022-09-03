---------------------------------------------------------------------------------------------------------
-- Base de datos de una plataforma de series online para la práctica final
-- 
-- Máster en Data Science 
-- M1967 - Modelos de Datos y Sistemas de Información 2021-2022
-- DIego García Saiz
-----------------------------------------------------------------------------------------------------------

-- Tabla que contiene los níveles de educación de los usuarios
-- Education level of users
create table NIVELES_EDUC
(
	idNivel int not null primary key, --id
	nivelEduc char(30) not null -- level name
);

insert into NIVELES_EDUC values (1,'Postgrado');
insert into NIVELES_EDUC values (2, 'Primaria');
insert into NIVELES_EDUC values (3, 'Secundaria');
insert into NIVELES_EDUC values (4, 'FP');
insert into NIVELES_EDUC values (5, 'Universitaria');

-- Tabla que contiene las profesiones de los usuarios
-- Users professions
create table PROFESIONES
(
	idProfesion int not null constraint pk_profesiones primary key, --id
	profesion char(30) not null -- profession name
);

insert into PROFESIONES values (1, 'Abogado/a');
insert into PROFESIONES values (2, 'Amo/a de casa');
insert into PROFESIONES values (3, 'Arquitecto/a');
insert into PROFESIONES values (4, 'Dependiente/a');
insert into PROFESIONES values (5, 'Desempleado/a');
insert into PROFESIONES values (6, 'Empresario/a');
insert into PROFESIONES values (7, 'Estudiante');
insert into PROFESIONES values (8, 'Funcionario/a');
insert into PROFESIONES values (9, 'Ingeniero/a');
insert into PROFESIONES values (10, 'Jubilado/a');
insert into PROFESIONES values (11, 'Médico');
insert into PROFESIONES values (12, 'Profesor/a');



-- Tabla que almacena los datos de los usuarios
-- Users
create table USUARIOS
(
	idUsuario int not null constraint pk_usuarios primary key, -- id
	email char(40) not null unique constraint ck_email check (email like '%@%'), -- email
	nombreUsuario char(20) not null unique, -- username
	contraseña char(10) not null, -- password
	nombre char(20) not null, -- name
	apellido1 char(20) not null, --surname1
	apellido2 char(20), -- surname2 
	fechaNacimiento date not null, -- birthday
	fechaReg datetime not null, -- registration date
	facebook varchar(150), -- facebook
	twitter varchar(150), -- twitter
	pais char(10) not null constraint ck_pais check (pais in ('España','Francia','Noruega','Andorra')), -- country
	idProfesion int not null, -- profession
	idNivelEducativo int not null, -- educational level
	constraint fk_usuario_profesion foreign key (idProfesion) references PROFESIONES(idProfesion),
	constraint fk_usuario_nivel foreign key (idNivelEducativo) references NIVELES_EDUC(idNivel)
);

insert into usuarios (idUsuario, email, nombreUsuario, contraseña, nombre, apellido1, apellido2, fechaNacimiento, fechaReg, 
	pais, idProfesion, idNivelEducativo) VALUES
	(1, 'missgranger@gmail.com', 'HermioneGranger', '123456', 'María', 'López', 'Pérez', '1989-02-19', '2012-01-20', 'España', 12, 5);
insert into usuarios (idUsuario, email, nombreUsuario, contraseña, nombre, apellido1, apellido2, fechaNacimiento, fechaReg, 
	pais, idProfesion, idNivelEducativo) VALUES
	(2, 'eli_barrera@gmail.com', 'lisasimpson', '654321', 'Elisa', 'Barrera', 'Martínez', '1992-12-9', '2013-12-20', 'Noruega', 1, 5);
insert into usuarios (idUsuario, email, nombreUsuario, contraseña, nombre, apellido1, apellido2, fechaNacimiento, fechaReg, 
	pais, idProfesion, idNivelEducativo) VALUES
	(3, 'gonzalezmar@gmail.com', 'Mafalda', '456789', 'Marisa', 'González', 'García', '12-09-1970', '24-10-2014', 'España', 2, 4);
insert into usuarios (idUsuario, email, nombreUsuario, contraseña, nombre, apellido1, apellido2, fechaNacimiento, fechaReg, 
	pais, idProfesion, idNivelEducativo) VALUES
	(4, 'lepetitnicolas@gmail.com', 'PequeñoNicolas', '123321', 'Francisco Nicolás', 'Gómez', 'Iglesias', '25-12-1994', '01-02-2013', 'España', 4,1);
insert into usuarios (idUsuario, email, nombreUsuario, contraseña, nombre, apellido1, apellido2, fechaNacimiento, fechaReg, 
	pais, idProfesion, idNivelEducativo) VALUES
	(5, 'fernandogomez@gmail.com', 'Sheldon', '8543712', 'Fernando', 'Gómez', 'Fernández', '16-04-1976',  '23-03-2015', 'España', 5, 2);
insert into usuarios (idUsuario, email, nombreUsuario, contraseña, nombre, apellido1, fechaNacimiento, fechaReg, 
	pais, idProfesion, idNivelEducativo) VALUES
	(6, 'voldy@gmail.com', 'LordVoldemort', '666666', 'Thomas', 'Riddle', '31-12-1985', '06-06-2006', 'Francia', 5, 4);
insert into usuarios (idUsuario, email, nombreUsuario, contraseña, nombre, apellido1, apellido2, fechaNacimiento, fechaReg, 
	pais, idProfesion, idNivelEducativo) VALUES
	(7, 'soniaramirez@gmail.com', 'Katniss', '456789', 'Sonia', 'Ramírez', 'Vázquez', '06-08-1990', '03-07-2014', 'España', 4, 3);
insert into usuarios (idUsuario, email, nombreUsuario, contraseña, nombre, apellido1, apellido2, fechaNacimiento, fechaReg, 
	pais, idProfesion, idNivelEducativo) VALUES
	(8, 'anita@gmail.com', 'AnnaAllen', '548427247', 'Anna', 'Allen', 'Rocasolano', '08-06-1980', '04-03-2015', 'España', 6, 5);


-- Tabla que almacena la información sobre los posibles géneros de los contenidos
-- Series genre
create table GENEROS
(
	idGenero int not null constraint pk_generos primary key, --id
	genero char(30) not null-- genre name
);

insert into GENEROS values (1,'Suspense');
insert into GENEROS values (2,'Aventura') ;
insert into GENEROS values (3,'Drama'); 
insert into GENEROS values (4,'Comedia'); 
insert into GENEROS values (5,'Acción'); 
insert into GENEROS values (6,'Misterio'); 
insert into GENEROS values (7,'Historia'); 
insert into GENEROS values (8,'Fantasía'); 


-- Tabla que almacena los idiomas
-- Series languages
create table IDIOMAS
(
	idIdioma int not null constraint pk_idiomas primary key, -- id
	idioma char(30) not null-- language
);


insert into IDIOMAS values (1,'Español');
insert into IDIOMAS values (2,'Inglés');
insert into IDIOMAS values (3,'Alemán');


-- Tabla que almacena el estado en el que se encuentran las series
-- Series state
create table ESTADOS_SERIES
(
	idEstadoSerie int not null constraint pk_estados_series primary key, --id
	estadoSerie char(40) not null -- state name
);


insert into ESTADOS_SERIES values (1,'En emisión');
insert into ESTADOS_SERIES values (2,'Esperando nueva temporada'); 
insert into ESTADOS_SERIES values (3,'Finalizada') ;
insert into ESTADOS_SERIES values (4,'Pendiente de estreno'); 
insert into ESTADOS_SERIES values (5,'Cancelada'); 

-- Tabla que almacena los datos de las series
-- Tv series
create table SERIES
(
	idSerie int not null constraint pk_series primary key, --id
	titulo varchar(100) not null, --title
	tituloOriginal varchar(100) not null, --original title
	anyoEstreno char(4), -- year of release
	anyoFin char(4), -- year of end
	sinopsis varchar(500), -- synopsis
	idGenero int not null, -- genre
	idIdioma int not null, -- language
	idEstado int not null, -- state
	constraint fk_serie_genero foreign key (idGenero) references GENEROS(idGenero),
	constraint fk_serie_idioma foreign key (idIdioma) references IDIOMAS(idIdioma),
	constraint fk_serie_estado foreign key (idEstado) references ESTADOS_SERIES(idEstadoSerie)
);


insert into series (idSerie, titulo, tituloOriginal, anyoEstreno, idGenero, idIdioma, idEstado) values
	(1, 'Modern Family', 'Modern Family', '2009', 4, 2, 1);
insert into series (idSerie, titulo, tituloOriginal, anyoEstreno, idGenero, idIdioma, idEstado) values
	(2, 'The Big Bang Theory', 'The Big Bang Theory', '2007', 4, 2, 1);
insert into series (idSerie, titulo, tituloOriginal, anyoEstreno, anyoFin, idGenero, idIdioma, idEstado) values
	(3, 'Isabel', 'Isabel', '2012', '2014', 7, 1, 3);
insert into series (idSerie, titulo, tituloOriginal, anyoEstreno, anyoFin, idGenero, idIdioma, idEstado) values
	(4, 'El tiempo entre costuras', 'El tiempo entre costuras', '2013', '2014', 3, 1, 3);
insert into series (idSerie, titulo, tituloOriginal, anyoEstreno, idGenero, idIdioma, idEstado) values
	(5, 'Juego de tronos', 'Game of Thrones', '2011', 8, 1, 2);
insert into series (idSerie, titulo, tituloOriginal, anyoEstreno, anyoFin, idGenero, idIdioma, idEstado) values
	(6, 'Perdidos', 'Lost', '2004', '2010', 2, 2, 3);
insert into series (idSerie, titulo, tituloOriginal, anyoEstreno, idGenero, idIdioma, idEstado) values
	(7, 'Érase una vez', 'Once Upon a Time', '2011',  8, 2, 5);
insert into series (idSerie, titulo, tituloOriginal, anyoEstreno, idGenero, idIdioma, idEstado) values
	(8, 'Sherlock', 'Sherlock', '2010', 2, 2, 2);
insert into series (idSerie, titulo, tituloOriginal, anyoEstreno, idGenero, idIdioma, idEstado) values
	(9, 'Downton Abbey', 'Downton Abbey', '2010', 2, 2, 2);
insert into series (idSerie, titulo, tituloOriginal, anyoEstreno, anyoFin, idGenero, idIdioma, idEstado) values
	(10, 'Matrimonio con hijos', 'Married...with childrea', '1987', '1997', 4, 2, 3);
insert into series (idSerie, titulo, tituloOriginal, anyoEstreno, idGenero, idIdioma, idEstado) values
	(11, 'El Ministerio del Tiempo', 'El Ministerio del tiempo', '2015', 2, 1, 1);
insert into series (idSerie, titulo, tituloOriginal, anyoEstreno, anyoFin, idGenero, idIdioma, idEstado) values
	(12, 'Embrujadas', 'Charmed', '1998', '2006', 8, 2, 3);


-- Tabla que almacena los datos de los actores
-- Actors
create table ACTORES
(
	idActor int not null constraint pk_actores primary key, --id
	nombreArtistico char(100) not null --artistic name
);

insert into ACTORES(idActor, nombreArtistico) values (1, 'Ed Oneill');
insert into ACTORES(idActor, nombreArtistico) values (2, 'Sofia Vergara');
insert into ACTORES(idActor, nombreArtistico) values (3, 'Jim Parsons');
insert into ACTORES(idActor, nombreArtistico) values (4, 'Kaley Cuoco');
insert into ACTORES(idActor, nombreArtistico) values (5, 'Michelle Jenner');
insert into ACTORES(idActor, nombreArtistico) values (6, 'Rodolfo Sancho');
insert into ACTORES(idActor, nombreArtistico) values (7, 'Adriana Ugarte');
insert into ACTORES(idActor, nombreArtistico) values (8, 'Peter Vives');
insert into ACTORES(idActor, nombreArtistico) values (9, 'Benedict Cumberbatch');
insert into ACTORES(idActor, nombreArtistico) values (10, 'Martin Freeman');
insert into ACTORES(idActor, nombreArtistico) values (11, 'Aura Garrido');
insert into ACTORES(idActor, nombreArtistico) values (12, 'Holly Marie Combs');

-- Tabla que almacena la participación de actores en series
-- Cast (Many to many relationship between actos and series)
create table REPARTO
(
	idReparto int not null constraint pk_reparto primary key, -- id
	personaje varchar(150) not null, -- character
	idSerie int not null, -- serie
	idActor int not null, -- actor
	constraint fk_reparto_serie foreign key (idSerie) references SERIES(idSerie),
	constraint fk_reparto_actor foreign key (idActor) references ACTORES(idActor)

);


insert into REPARTO(idreparto, personaje, idSerie, idActor) values
	(1,'Jay Pritchett',1,1);
insert into REPARTO(idreparto, personaje, idSerie, idActor) values
	(2,'Gloria Delgado',1,2);
insert into REPARTO(idreparto, personaje, idSerie, idActor) values
	(3,'Sheldon Cooper',2,3);
insert into REPARTO(idreparto, personaje, idSerie, idActor) values
	(4,'Penny',2,4);
insert into REPARTO(idreparto, personaje, idSerie, idActor) values
	(5,'Isabel la Católica',3,5);
insert into REPARTO(idreparto, personaje, idSerie, idActor) values
	(6,'Fernando el Católico',3,6);
insert into REPARTO(idreparto, personaje, idSerie, idActor) values
	(7,'Sira Quiroga',4,7);
insert into REPARTO(idreparto, personaje, idSerie, idActor) values
	(8,'Marcus Logan',4,8);
insert into REPARTO(idreparto, personaje, idSerie, idActor) values
	(9,'Marcus Logan',4,8);
insert into REPARTO(idreparto, personaje, idSerie, idActor) values
	(10,'Al Bundy',10,1);
insert into REPARTO(idreparto, personaje, idSerie, idActor) values
	(11,'Julián Martínez',11,6);
insert into REPARTO(idreparto, personaje, idSerie, idActor) values
	(12,'Aura Garrido',11,11);
insert into REPARTO(idreparto, personaje, idSerie, idActor) values
	(13,'Piper Halliwell',12,12);
insert into REPARTO(idreparto, personaje, idSerie, idActor) values
	(14,'Billi Jenkins',12,4);

-- Tabla con las valoraciones que los usuarios dan a las series
-- Assessments
create table VALORACIONES
(
            idValoracion int not null primary key, --id
	idUsuario int not null, -- user
	idSerie int not null, -- serie
	puntuacion int not null constraint ck_puntuacion check (puntuacion >=1 and puntuacion <=10), -- punctuation
	constraint fk_valoraciones_usuarios foreign key(idUsuario) references Usuarios(idUsuario),
	constraint fk_valoraciones_series foreign key(idSerie) references SERIES(idSerie)
);

insert into VALORACIONES values (1,1,1,9);
insert into VALORACIONES values (2,1,3,9);
insert into VALORACIONES values (3,1,4,8);
insert into VALORACIONES values (4,2,12,6);
insert into VALORACIONES values (5,2,11,7);
insert into VALORACIONES values (6,3,10,4);
insert into VALORACIONES values (7,3,8,6);
insert into VALORACIONES values (8,4,5,10);
insert into VALORACIONES values (9,4,6,6);
insert into VALORACIONES values (10,5,2,10);
insert into VALORACIONES values (11,5,6,9);
insert into VALORACIONES values (12,5,7,2);
insert into VALORACIONES values (13,6,4,10);
insert into VALORACIONES values (14,6,5,1);

