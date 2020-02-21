
-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
--

u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (col1:CHARARRAY,
        col2:CHARARRAY,
        col3:INT);
DUMP u;

p1 = GROUP u BY $0;
Resp1 = FOREACH p1 GENERATE $0,COUNT(u);
DUMP Resp1;

STORE Resp1 INTO 'output';
