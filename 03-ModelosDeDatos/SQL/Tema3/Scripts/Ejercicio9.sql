--- Ejercicio 9 ---

-- 1 
select pel.* from peliculas pel 
    where pel.id_pelicula in (select alq.id_pelicula from alquileres alq);
    
select pel.* from peliculas pel 
    where exists (select * from alquileres alq where pel.id_pelicula = alq.id_pelicula);
    
-- 2
select soc.* from socios soc
    where soc.nro_socio not in (select alq.nro_socio from alquileres alq);
    
select soc.* from socios soc
    where not exists (select * from alquileres alq where alq.nro_socio = soc.nro_socio);
    
-- 3
select pel.* from peliculas pel 
    where pel.fecha_estreno = (select min(pel.fecha_estreno) from peliculas pel);
    
-- 4
select tar.* from tarifas tar
    where tar.importeDia > (select avg(tar.importeDia) from tarifas tar);
    
-- 5
update alquileres set fecha_devolucion = date('now')
    where nro_socio in 
    (select soc.nro_socio from socios soc join localidades loc on loc.id_localidad = soc.id_localidad where loc.nombre = 'Santander');
    
-- 5 Alternativa
update alquileres set fecha_devolucion = date('now')
    where nro_socio in 
    (select s.nro_socio from socios s where s.id_localidad = 
        (select l.id_localidad from localidades l where l.nombre = 'Santander'));
        
-- 6
delete from generos
    where id_genero not in (select pe.id_genero from peliculas pe);