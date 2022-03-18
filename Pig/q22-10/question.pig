-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname,
--        color
--    FROM 
--        u
--    WHERE 
--        color REGEXP '.n';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
-- Se cargan los datos en una bolsa
data = LOAD 'data.csv' using PigStorage(',') AS (id:INT, nombre:CHARARRAY, apellido:CHARARRAY, nacimiento:CHARARRAY, color:CHARARRAY, item:INT);
-- Se extraen los campos con los colores
consulta = FOREACH data GENERATE nombre,color;
-- Se filtra por colores que empiecen con B
resultado = FILTER consulta BY color MATCHES '.n*';
-- Almaceno el resultado en un archivo
STORE resultado INTO './output' using PigStorage(',');