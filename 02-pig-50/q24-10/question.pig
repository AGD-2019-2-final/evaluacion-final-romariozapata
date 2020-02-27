-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        REGEX_EXTRACT(birthday, '....-..-..', 2) 
--    FROM 
--        u;
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--

-- >>> Escriba su respuesta a partir de este punto <<<

data1 = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);


Resp = FOREACH data1 GENERATE REGEX_EXTRACT($3, '(\\d{4})-(\\d{2})-(\\d{2})', 2);
DUMP Resp;


STORE Resp INTO 'output' USING PigStorage(',');

