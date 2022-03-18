--
-- Pregunta
-- ===========================================================================
-- 
-- El archivo `truck_event_text_partition.csv` tiene la siguiente estructura:
-- 
--   driverId       INT
--   truckId        INT
--   eventTime      STRING
--   eventType      STRING
--   longitude      DOUBLE
--   latitude       DOUBLE
--   eventKey       STRING
--   correlationId  STRING
--   driverName     STRING
--   routeId        BIGINT
--   routeName      STRING
--   eventDate      STRING
-- 
-- Escriba un script en Pig que carge los datos y obtenga los primeros 10 
-- registros del archivo para las primeras tres columnas, y luego, ordenados 
-- por driverId, truckId, y eventTime. 
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba su respuesta a partir de este punto <<<
-- Cargo en la bolsa data los registros
data = LOAD 'truck_event_text_partition.csv' using PigStorage(',') AS (driverId:INT,truckId:INT,eventTime:CHARARRAY,eventType:CHARARRAY,longitude:DOUBLE,latitude:DOUBLE,eventKey:CHARARRAY,correlationId:CHARARRAY,driverName:CHARARRAY,routeId:BIGINTEGER,routeName:CHARARRAY,eventDate:CHARARRAY);
-- Se hace un filtro por los primeros 10 registros
filtro = LIMIT data 10;
-- Se crea una nueva bolsa con las primeras 3 columnas
camiones = FOREACH filtro GENERATE driverId,truckId,eventTime;
-- Se ordena por todas las columnas y se entrega el resultado
resultado = ORDER camiones BY driverId,truckId,eventTime;
-- Almaceno el resultado en un archivo
STORE resultado INTO './output' using PigStorage(',');