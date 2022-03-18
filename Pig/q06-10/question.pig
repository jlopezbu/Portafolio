-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
-- Se cargan los datos en una bolsa
data = LOAD 'data.tsv' using PigStorage('\t') AS (letra:CHARARRAY, col2:BAG{t:(p:CHARARRAY)}, col3:map[]);
-- Filtro la información por la tercera columna
columna = FOREACH data GENERATE FLATTEN(col3) AS codigo;
-- Se agrupan los datos filtrados
agg = GROUP columna BY codigo;
-- Y se realiza el conteo por código
resultado = FOREACH agg GENERATE group, COUNT(columna);
-- Almaceno el resultado en un archivo
STORE resultado INTO './output' using PigStorage(',');