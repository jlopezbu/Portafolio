-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS datos;

CREATE TABLE datos (
    letra STRING,
    fecha STRING,
    numero INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE datos;

DROP TABLE IF EXISTS min_numero;

CREATE TABLE min_numero AS

SELECT DISTINCT numero FROM datos ORDER BY numero LIMIT 5;

INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM min_numero;