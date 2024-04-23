CREATE TABLE winemag130k(
	cod_top_wine SERIAL PRIMARY KEY,
	rank INT,
	country VARCHAR (200),
	description VARCHAR(2000),
 	points NUMERIC(10,2),
	price NUMERIC (10,2)
);


