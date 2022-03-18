-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código que genere la siguiente salida.
-- 
--    Boyer,BOYER,boyer
--    Coffey,COFFEY,coffey
--    Conway,CONWAY,conway
--    Crane,CRANE,crane
--    Diaz,DIAZ,diaz
--    Estes,ESTES,estes
--    Fry,FRY,fry
--    Garrett,GARRETT,garrett
--    Guy,GUY,guy
--    Hamilton,HAMILTON,hamilton
--    Holcomb,HOLCOMB,holcomb
--    Jarvis,JARVIS,jarvis
--    Kinney,KINNEY,kinney
--    Klein,KLEIN,klein
--    Knight,KNIGHT,knight
--    Noel,NOEL,noel
--    Sexton,SEXTON,sexton
--    Silva,SILVA,silva
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
-- Se cargan los datos en una bolsa
data = LOAD 'data.csv' using PigStorage(',') AS (id:INT, nombre:CHARARRAY, apellido:CHARARRAY, nacimiento:CHARARRAY, color:CHARARRAY, item:INT);
-- Se filtran los apellidos y se genera su longitud
apellido = FOREACH data GENERATE apellido, UPPER(apellido), LOWER(apellido);
-- Se ordenan los registros
resultado = ORDER apellido BY apellido;
-- Almaceno el resultado en un archivo
STORE resultado INTO './output' using PigStorage(',');