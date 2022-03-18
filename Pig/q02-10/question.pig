--
-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- -- Cargo en la bolsa data los registros
data = LOAD 'data.tsv' using PigStorage('\t') AS (letra:CHARARRAY, fecha:CHARARRAY, numero:INT);
-- Ordeno los registros por letra y por el número de la tercera columna
sort = ORDER data BY letra, numero;
-- Almaceno el resultado en un archivo
STORE sort INTO './output' using PigStorage('\t');