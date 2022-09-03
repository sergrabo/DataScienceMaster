---------------------------------------------------------------------------------------------------------
-- Práctica 2: consultas, borrados y actualizados
-- 
-- Sergio Gracia Borobia
-----------------------------------------------------------------------------------------------------------

-- 1

select ped.* from Pedidos ped
where  ped.fechaHoraPedido between '2018-10-01' and '2018-12-01';
--Tiene que ser hasta el 1 Dic por la presencia de la hora
-- Si ponemos sólo hasta el 30 Nov, coge hasta las 00:00, dejando de lado el resto de horas del día

-- 2
select per.idpersonal, per.nombre, per.apellido1, per.apellido2, per.fechaAlta, per.fechaBaja
from Personal per
where per.fechaBaja is NULL
order by per.fechaAlta ASC, per.nombre DESC;
-- Concatenando nombre y apellidos
select per.idpersonal, per.nombre || ' ' || per.apellido1 || ' ' || per.apellido2 as nombreCompleto, per.fechaAlta, per.fechaBaja
from Personal per
where per.fechaBaja is NULL
order by per.fechaAlta DESC, per.nombre ASC;

-- 3
select cli.* from Clientes cli
where (cli.nombre like 'G%' or cli.nombre like 'J%') and (cli.observaciones is not null);

-- 4
select piz.idpizza, piz.importeBase, ing.idingrediente, ing.descripcion 
from Pizzas piz
    join IngredienteDePizza ingNN on piz.idpizza = ingNN. idpizza
    join Ingredientes ing on ingNN.idingrediente = ing.idingrediente
where piz.importeBase > 3;


-- 5 
select piz.*
from Pizzas piz
where piz.idpizza not in (select lp.idpizza from LineasPedidos lp)
order by piz.idpizza ASC;

-- 6 

select bas.*, piz.* 
from Bases bas 
    left join Pizzas piz on bas.idbase = piz.idbase;
 
-- 7 

select ped.*, lin.*, piz.*
from Pedidos ped
    join LineasPedidos lin on ped.idpedido = lin.idpedido
    join Pizzas piz on lin.idpizza = piz.idpizza
where ped.idcliente = 1 and lin.precioUnidad < piz.importeBase;


-- 8 
select cli.idcliente, cli.nif, COUNT(*) as numPedidos
from Clientes cli
    join Pedidos ped on cli.idcliente = ped.idcliente
group by cli.idcliente, cli.nif
having numPedidos > 1;

-- 9
update Pizzas
set importeBase = importeBase + 0.5
where idpizza in (
    select idp.idpizza 
    from IngredienteDePizza idp
    where idp.idingrediente = 'JAM'
);

select * from Pizzas;

--10
delete from LineasPedidos 
where idpedido in (
    select ped.idpedido
    from Pedidos ped
    where ped.fechaHoraPedido < '2018-01-01'
);

select * from LineasPedidos;

--11
select cli.idcliente, cli.nif, cli.nombre || ' ' || cli.apellido1 
|| ' ' || cli.apellido2 as nombreCompleto, SUM(lp.cantidad) as numPizzas
from Clientes cli
    join Pedidos ped on cli.idcliente = ped.idcliente
    join LineasPedidos lp on ped.idpedido = lp.idpedido
group by cli.idcliente, cli.nif, nombreCompleto;