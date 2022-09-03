---------------------------------------------------------------------------------------------------------
-- Ejercicio4
---------------------------------------------------------------------------------------------------------

-- 1
select ar.* from Articulos ar;

-- 2
select pr.* from Proveedores pr ORDER BY nombrpro ASC, cpostpro DESC;

-- 3 
select pd.numped, pd.fechaped, pd.ivaped from Pedidos pd;

-- 4
select ln.*, (unilin*preunlin) from Lineas ln where ln.numped = 2 order by (unilin*preunlin) ASC; 

-- 5
select ln.* from Lineas ln where ln.numped = 2 and ln.desculin = 0 order by ln.preunlin ASC;

-- 6 
select pd.numped, pd.fechaped, pd.fentrped from Pedidos pd where pd.fechaped <> pd.fentrped;

-- 7
select a.* from Articulos a where a.fecbaja is null;

-- 8 
select a.* from Articulos a where a.fecbaja is not null;

--9
select a.* from Articulos a where a.fecbaja between '2018-01-01' and '2018-06-30';

-- 10
select a.* from Articulos a where a.fecbaja between '2018-01-01' and '2018-06-30' and stockart > 0;

-- 11
select pr.codigpro, pr.nombrpro from Proveedores pr where pr.nombrpro like 'Z%' or pr.nombrpro like 'B%';

-- 12
select pr.codigpro, pr.nombrpro from Proveedores pr where pr.nombrpro not like 'Z%';

-- 13
select pr.codigpro, pr.nombrpro from Proveedores pr where pr.nombrpro like in '%a';
