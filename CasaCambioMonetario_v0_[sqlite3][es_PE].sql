/*
@description Registro de la tasa de cambio monetario en una CASA de CAMBIO
@author Luis Carrillo Gutiérrez
@date Agosto/Septiembre, 2014
@version 0.0.1
*/

-- ISO 4217 Alpha Version 2001 / ISO 4217
DROP TABLE IF EXISTS [Abreviatura Monetaria];
CREATE TABLE IF NOT EXISTS [Abreviatura Monetaria]
(
	[id] CHAR(3) NOT NULL,
	[país] VARCHAR(64) NOT NULL,
	[símbolo] CHAR(8) NOT NULL,
	PRIMARY KEY ([id])
) WITHOUT RowId;

DROP TABLE IF EXISTS [Fluctuación de dinero];
CREATE TABLE IF NOT EXISTS [Fluctuación de dinero]
(
	[id] INTEGER NOT NULL,
	-- posible fluctuación en el mismo día
	[fecha de registro] DATETIME NOT NULL, -- DEFAULT CURRENT_TIMESTAMP
	[moneda de origen] CHAR(3) NOT NULL REFERENCES [Abreviatura Monetaria](id),
	[moneda de destino] CHAR(3) NOT NULL REFERENCES [Abreviatura Monetaria](id),
	[tasa de cambio] DECIMAL(8, 3) NOT NULL CHECK([tasa de cambio] > 0.0),
	[observaciones adicionales] TEXT NULL,
	PRIMARY KEY ([id])
) WITHOUT RowId;

INSERT INTO [Fluctuación de dinero] VALUES (1920, '2014-09-12', 'USD', 'PEN', 2.80, NULL );
INSERT INTO [Fluctuación de dinero] VALUES (1921, '2014-09-12', 'PEN', 'USD', (1 / 2.82), NULL );

