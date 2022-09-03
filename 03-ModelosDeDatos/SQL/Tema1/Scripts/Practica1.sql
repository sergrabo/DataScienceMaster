--1. Creacion de la tabla director
create table Director(
    iddirector int not null,
    dni char not null,
    nombre char not null,
    apellido1 char not null,
    apellido2 char null,
    fechaNacimiento date not null,
    fechaRegistro date not null,
    fechaDeceso date null,
    enActivo bool not null,
    
    primary key (iddirector),
    check(iddirector > 0),
    unique (dni),
    check (fechaRegistro > fechaNacimiento),
    check (fechaDeceso > fechaNacimiento),
    check (enActivo in (0,1))
);
--2. Creacion de la tabla pelicula
create table Pelicula(

    idpelicula int not null,
    titulo char not null,
    fechaEstreno date not null,
    duracionMin real not null,
    genero char not null,
    iddirector int not null,
    
    primary key (idpelicula),
    check (idpelicula > 0),
    unique(titulo),
    check(duracionMin > 0),
    check(genero in ('terror', 'scifi', 'aventura')),
    foreign key (iddirector) references Director(iddirector)
);

--3. Insercion en las tablas
--Insercion de elementos en la tabla Director
insert into Director (iddirector, dni, nombre, apellido1, apellido2, fechaNacimiento, fechaRegistro, fechaDeceso, enActivo)
    values (1, '79412546H', 'Eddie', 'Murphy', NULL, '1977-04-12', '2000-05-03', NULL, 1);
insert into Director (iddirector, dni, nombre, apellido1, apellido2, fechaNacimiento, fechaRegistro, fechaDeceso, enActivo)
    values (2, '79412681W', 'Pedro', 'Almodovar', 'Gómez', '1956-02-16', '2000-05-03', NULL, 1);
insert into Director (iddirector, dni, nombre, apellido1, apellido2, fechaNacimiento, fechaRegistro, fechaDeceso, enActivo)
    values (3, '52149357V', 'James', 'Cameron', NULL, '1985-10-07', '2000-05-03', NULL, 0);

select * from Director;

--Insercion de elementos en la tabla Pelicula

insert into Pelicula (idpelicula, titulo, fechaEstreno, duracionMin, genero, iddirector) 
    values (1, 'Las rosas rosas', '2015-02-14', 148.3, 'aventura', 2);
insert into Pelicula (idpelicula, titulo, fechaEstreno, duracionMin, genero, iddirector) 
    values (2, '1954', '1954-12-25', 69.9, 'terror', 1);
insert into Pelicula (idpelicula, titulo, fechaEstreno, duracionMin, genero, iddirector) 
    values (3, 'No me busques', '2018-09-9', 128, 'scifi', 1);

select * from Pelicula;

--4. Adiccion de una nueva columna con la recaudaccion

alter table Pelicula add recaudacion real not null check(recaudacion >= 0) default 0;

--5. Almacenamiento alternativo de los generos en la tabla Pelicula

create table Genero(
    idgenero int not null,
    nombre char not null,
    
    primary key (idgenero)
);

create table PeliculaPunto5(

    idpelicula int not null,
    titulo char not null,
    fechaEstreno date not null,
    duracionMin real not null,
    idgenero int not null,
    iddirector int not null,
    
    primary key (idpelicula),
    check (idpelicula > 0),
    unique(titulo),
    check(duracionMin > 0),
    foreign key (idgenero) references Genero(idgenero)
    check(idgenero > 0),
    foreign key (iddirector) references Director(iddirector)
);

--6. Relaccion N-N con la tabla Actores.

create table Actor(
    idactor int not null,
    dni char not null,
    nombre char not null,
    apellido1 char not null,
    apellido2 char null,
    fechaNacimiento date not null,
    fechaRegistro date not null,
    fechaDeceso date null,
    enActivo bool not null,
    
    primary key (idactor),
    check(idactor > 0),
    unique (dni),
    check (fechaRegistro > fechaNacimiento),
    check (fechaDeceso > fechaNacimiento),
    check (enActivo in (0,1))
);

create table RelacionActorPelicula(
    idactor int not null,
    idpelicula int not null,
    
    foreign key (idactor) references Actor(idactor)
    foreign key (idpelicula) references Pelicula(idpelicula)
    primary key (idactor, idpelicula)
);