--
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        color 
--    FROM 
--        u 
--    WHERE 
--        color NOT LIKE 'b%';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
-- Se cargan los datos en una bolsa
data = LOAD 'data.csv' using PigStorage(',') AS (id:INT, nombre:CHARARRAY, apellido:CHARARRAY, nacimiento:CHARARRAY, color:CHARARRAY, item:INT);
-- Se extraen los campos con los colores
color = FOREACH data GENERATE color;
-- Se filtra por colores que empiecen con B
resultado = FILTER color BY NOT(color MATCHES '^b.*');
-- Almaceno el resultado en un archivo
STORE resultado INTO './output' using PigStorage(',');