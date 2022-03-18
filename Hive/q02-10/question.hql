-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Construya una consulta que ordene la tabla por letra y valor (3ra columna).
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

DROP TABLE IF EXISTS ordenado;

CREATE TABLE ordenado AS
SELECT * FROM datos ORDER BY letra,numero,fecha;

INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM ordenado;