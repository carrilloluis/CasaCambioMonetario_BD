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

