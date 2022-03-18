-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
-- Cargo en la bolsa data los registros
data = LOAD 'data.tsv' using PigStorage('\t') AS (letra:CHARARRAY, fecha:CHARARRAY, numero:INT);
-- Ordeno los registros por la tercera columna
sort = ORDER data BY numero;
-- Filtro la columna "numero" en una nueva bolsa
numeros = FOREACH sort GENERATE numero;
-- Por último, se extraen los 5 registros
resultado = LIMIT numeros 5;
-- Almaceno el resultado en un archivo
STORE resultado INTO './output' using PigStorage('\t');