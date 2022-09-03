---------------------------------------------------------------------------------------------------------
-- Estructura de base de datos para consultas en SQLite
-- 
-- M�ster en Data Science 
-- M1967 - Modelos de Datos y Sistemas de Informaci�n 2021-2022
-- DIego Garc�a Saiz
-----------------------------------------------------------------------------------------------------------



-- Tabla Proveedores (Table Providers)
CREATE TABLE Proveedores (
  codigpro	  CHAR(4)    NOT NULL    CONSTRAINT id_pro PRIMARY KEY, -- código de los proveedores (providers code or number)
  cifpro      CHAR(12)   NOT NULL    CONSTRAINT u_cif UNIQUE, -- cif de los proveedores (idcard of the providers)
  nombrpro    CHAR(30)   NOT NULL, -- nombre de los proveedores (providers' name)
  direcpro	  CHAR(30)   NOT NULL, -- dirección de los proveedores (providers' addres)
  cpostpro	  CHAR(5)	 NOT NULL, -- código postal de los proveedores(postal code of the providers)
  localpro	  CHAR(20)   NOT NULL, -- localidad de los provedores (providers' locality)
  telefpro	  CHAR(17)   NOT NULL, -- teléfono de los proveedores (providers' telephone number)
  faxpro	  CHAR(17), -- fax de los proveedores (providers' fax number)
  emailpro    CHAR(25), -- email de los proveedores (providers' email)
  -- procediencia de los proveedores, si son o no de la UE (origin of the providers, indicates if they are from the EU or not)
  procepro	  CHAR(5)  NOT NULL CHECK (procepro in ('UE', 'No UE'))); 

-- Tabla Articulos (Table Articles)
CREATE TABLE Articulos (
	codigart	CHAR(6)  NOT NULL    CONSTRAINT id_art PRIMARY KEY, -- código de los artículos (articles' code)
	descrart	CHAR(40) NOT NULL, -- descripción de los artículos (articles description)
	preunart	DECIMAL(9,2)	 NOT NULL, -- precio unitario del artículo (unitary prize of the aricle)
	stockart	INTEGER  NOT NULL check (stockart >=0), -- stock disponible de los artículos (articles' stock)
	stockmin	INTEGER  NOT NULL check (stockmin >=0), -- stock mínimo de los artículos (articles' minimum stock)
    fecbaja     DATE); -- fecha de baja de los artículos (withdrawal date of the articles)

-- Tabla Pedidos (Table Orders)
CREATE TABLE Pedidos (
	numped 		INTEGER  	 NOT NULL   CONSTRAINT id_ped PRIMARY KEY, -- número de los pedidos (number or code of the orders)
	fechaped	DATE	NOT NULL, -- fecha de realización del pedido (orders' date)
	codigpro	CHAR(4)	  	 NOT NULL, -- código del proveedor del pedido (providers' code)
	ivaped		DECIMAL(4,1) NOT NULL CHECK (ivaped>0 and ivaped<100), -- iva del pedido (orders' iva - vat)
	fentrped	DATE		 NOT NULL, -- fecha de entrega o envío del pedido (ship date of the orders)
           CONSTRAINT f_pro FOREIGN KEY (codigpro) REFERENCES Proveedores (codigpro),
           CONSTRAINT c_fecha CHECK (fechaped<=fentrped));


CREATE TABLE Lineas (
	numped		INTEGER		 NOT NULL, -- número del pedido (number or code of the order)
	numlin		SMALLINT	 NOT NULL, -- número de línea del pedido (number line of the order)
	codigart	CHAR(6)		 NOT NULL, -- código del artículo comprado en la línea (code or number of the bougth article)
	unilin		DECIMAL(6,0) NOT NULL, -- cantidad de unidades compradas del artículo (number of units bougth of the article)
	preunlin	DECIMAL(9,2) NOT NULL, -- precio unitario del artículo (unitary prize of the article)
	desculin	DECIMAL(4,1) NOT NULL CHECK (desculin>=0 and desculin<=100),	-- porcentaje de descuento aplicado en la línea (percentage of the applied discount in the line)
          CONSTRAINT id_lin PRIMARY KEY (numped, numlin),
          CONSTRAINT f_ped FOREIGN KEY (numped) REFERENCES Pedidos (numped),
          CONSTRAINT f_art FOREIGN KEY (codigart) REFERENCES Articulos (codigart));


