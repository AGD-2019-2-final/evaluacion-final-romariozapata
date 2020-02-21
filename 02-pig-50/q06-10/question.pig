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
--
u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (col1:CHARARRAY,
        col2:BAG{t: TUPLE(p:CHARARRAY)},
        col3:MAP[]);

Resp6 = FOREACH u GENERATE FLATTEN($2);
Resp61 = FOREACH Resp6 GENERATE $0;
Resp62 = GROUP Resp61 BY $0;
Resp = FOREACH Resp62 GENERATE CONCAT($0,',',(CHARARRAY)COUNT($1));
DUMP Resp;


STORE Resp INTO 'output';