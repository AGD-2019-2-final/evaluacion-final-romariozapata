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
--
u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (col1:CHARARRAY,
        col2:BAG{t: TUPLE(p:CHARARRAY)},
        col3:MAP[]);

Resp5 = FOREACH u GENERATE FLATTEN($1);
Resp51 = GROUP Resp5 BY $0;
Resp = FOREACH Resp51 GENERATE CONCAT($0,'\t',(CHARARRAY)COUNT($1));
DUMP Resp;


STORE Resp INTO 'output';




