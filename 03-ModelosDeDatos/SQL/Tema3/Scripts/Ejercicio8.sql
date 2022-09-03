--- Ejercicio 8 ---

-- 1
select loc.id_Localidad, COUNT(*) numsocios
from socios soc join Localidades loc on soc.id_Localidad = loc.id_Localidad
group by loc.id_Localidad;

-- 2
select loc.id_Localidad, loc.Nombre, COUNT(*) numsocios
from socios soc join Localidades loc on soc.id_Localidad = loc.id_Localidad
group by loc.id_Localidad, loc.Nombre;

-- 3 
select gen.desc_genero, AVG(tar.importeDia) media, MIN(tar.importeDia) minimo, MAX(tar.importeDia) maximo
from generos gen join peliculas pel on gen.id_genero = pel.id_genero
                 join tarifas tar on pel.refTarifa = tar.codigo
group by gen.desc_genero;               

-- 4 
select gen.desc_genero, AVG(tar.importeDia) media, MIN(tar.importeDia) minimo, MAX(tar.importeDia) maximo
from generos gen join peliculas pel on gen.id_genero = pel.id_genero
                 join tarifas tar on pel.refTarifa = tar.codigo
where pel.fecha_estreno > '2011-01-01'
group by gen.desc_genero; 

select peliculas.fecha_estreno from peliculas;
-- Es normal que salga exactamente lo mismo porque 
-- las peliculas son todas del 2012 para alante

-- 5
-- Es lo que he hecho en la anterior, literalmente

-- Lo que pasa es que en la 3 y 4 debería haberlo hecho
-- sacando el id_genero 

-- 6
select pel.id_pelicula, pel.nombre_pelicula, MAX(cop.nro_copia) cantCopias
from peliculas pel join copias cop on pel.id_pelicula = cop.id_pelicula
group by pel.id_pelicula, pel.nombre_pelicula
having cantCopias > 1;

-- 7 