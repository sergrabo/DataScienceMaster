---------------------------------------------------------------------------------------------------------
-- Práctica final SQLite 
-- Sergio Gracia Borobia
-- 
-- Máster en Data Science 
-- Modelos de Datos y Sistemas de Información 2021-2022
-----------------------------------------------------------------------------------------------------------

-- 1
create table TEMPORADAS (
    idserie int not null,
    numTemporada int not null,
    fechaEstreno date not null,
    fechaRegistro date not null,
    disponible bool not null,
    
    primary key (idserie, numTemporada),
    foreign key (idserie) references SERIES (idSerie),
    check (fechaRegistro > fechaEstreno)
    check (disponible in (0,1))
);

-- 2
alter table PROFESIONES
add descripcion char not null
default 'Sin descripcion';

-- 3
create index idxFin on SERIES (titulo, anyoFin);

-- 4
select ser.idSerie, ser.titulo, ser.tituloOriginal, ser.sinopsis
from SERIES ser
order by ser.titulo DESC;

-- 5
select usu.* 
from USUARIOS usu
where usu.pais in ('Francia', 'Noruega');

-- 6
select act.*, ser.*
from ACTORES act
    join REPARTO rep on act.idActor = rep.idActor
    join SERIES ser on rep.idSerie = ser.idSerie 
;

-- 7    
select usu.*
from USUARIOS usu
where usu.idUsuario not in (
    select val.idUsuario
    from VALORACIONES val
    );
    
-- 8 
select usu.*, prof.*
from PROFESIONES prof
    left join USUARIOS usu on usu.idProfesion = prof.idProfesion;
    
-- 9
select ser.*, idi.*
from SERIES ser
    join IDIOMAS idi on ser.idIdioma = idi.idIdioma 
where (idi.idioma = 'Español') AND
      (ser.titulo like 'E%' or
       ser.titulo like 'G%');
       
-- 10
select ser.idSerie, ser.titulo, ser.sinopsis, AVG(val.puntuacion), MIN(val.puntuacion), MAX(val.puntuacion)
from SERIES ser
    join VALORACIONES val on ser.idSerie = val.idSerie
group by ser.idSerie, ser.titulo, ser.sinopsis;

-- 11
update SERIES set sinopsis = 'Sin sinopsis'
where sinopsis is null and 
    idIdioma = (select idi.idIdioma from IDIOMAS idi
                where idi.idioma = 'Inglés');
                
-- 12
select val.*, usu.nombre || ' ' || usu.apellido1 || ' ' || usu.apellido2 as nombreApellidos, 
       AVG(val.puntuacion) over (partition by val.idUsuario) as PuntuacionMedia
from VALORACIONES val 
    join USUARIOS usu on val.idUsuario = usu.idUsuario;   
    
select * from USUARIOS;        