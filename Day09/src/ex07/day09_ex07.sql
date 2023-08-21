CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[]) 
RETURNS numeric AS $$
SELECT min(x)
FROM unnest(arr) as x;
$$ LANGUAGE sql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);