-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
--
-- >>> Escriba su respuesta a partir de este punto <<<
-- Se cargan los datos en una bolsa
data = LOAD 'data.csv' using PigStorage(',') AS (id:INT, nombre:CHARARRAY, apellido:CHARARRAY, nacimiento:CHARARRAY, color:CHARARRAY, item:INT);
-- Se filtran los apellidos y se genera su longitud
longitud = FOREACH data GENERATE apellido, SIZE(apellido) AS size;
-- Se ordena por longitud y por apellido
orden = ORDER longitud BY size DESC, apellido;
-- Y se imprimen los primeros 5 registros
resultado = LIMIT orden 5;
-- Almaceno el resultado en un archivo
STORE resultado INTO './output' using PigStorage(',');