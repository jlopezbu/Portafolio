-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
-- Se cargan los datos en una bolsa
data = LOAD 'data.tsv' using PigStorage('\t') AS (letra:CHARARRAY, col2:BAG{t:(p:CHARARRAY)}, col3:map[]);
-- Se toma la letra de la primera columna, y el número de registros de las columnas 2 y 3
tabla = FOREACH data GENERATE letra AS letra, SIZE(col2) AS col2, SIZE(col3) AS col3;
-- Se ordenan los registros por cada columna
orden = ORDER tabla BY letra, col2, col3;
-- Almaceno el resultado en un archivo
STORE orden INTO './output' using PigStorage(',');