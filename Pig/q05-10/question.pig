-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
-- Se cargan los datos en una bolsa
data = LOAD 'data.tsv' using PigStorage('\t') AS (letra:CHARARRAY, col2:BAG{t:(p:CHARARRAY)}, col3:CHARARRAY);
-- Filtro la información por la segunda columna
columna = FOREACH data GENERATE FLATTEN(col2) AS letra;
-- Se agrupan los datos filtrados
agg = GROUP columna BY letra;
-- Y se realiza el conteo por letra
resultado = FOREACH agg GENERATE group, COUNT(columna);
-- Almaceno el resultado en un archivo
STORE resultado INTO './output' using PigStorage('\t');