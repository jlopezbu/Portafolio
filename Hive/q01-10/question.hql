-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
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

DROP TABLE IF EXISTS letras;

CREATE TABLE letras AS
SELECT letra,COUNT(letra) FROM datos GROUP BY letra;

INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM letras;