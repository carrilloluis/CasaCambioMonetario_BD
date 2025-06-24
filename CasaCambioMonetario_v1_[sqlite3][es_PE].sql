DROP TABLE IF EXISTS [Abreviatura Monetaria];
CREATE TABLE IF NOT EXISTS [Abreviatura Monetaria]
(
	[id] CHAR(3) NOT NULL, -- código de la moneda
	[región geográfica] VARCHAR(64) NOT NULL,
	[denominación] VARCHAR(128) NOT NULL,
	[símbolo] CHAR(4) NOT NULL,
	[estado] INTEGER UNSIGNED NOT NULL DEFAULT 7 CHECK([estado] >= 0 AND [estado] < 8),
	PRIMARY KEY ([id])
) WITHOUT RowId;

INSERT INTO [Abreviatura Monetaria] VALUES (UPPER('eur'), 'europa', 'euro', '€', 7);
INSERT INTO [Abreviatura Monetaria] VALUES (UPPER('usd'), 'ee.uu.', 'dólar', '$', 7);
INSERT INTO [Abreviatura Monetaria] VALUES (UPPER('pen'), 'perú', 'nuevo sol', 'S/.', 7);

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

