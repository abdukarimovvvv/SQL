CREATE OR REPLACE FUNCTION fnc_persons(
    pgender character varying DEFAULT 'female'
) 
RETURNS TABLE (
    id integer,
    name character varying, 
    age integer, 
    gender character varying,
    address character varying
) AS $$
SELECT * 
FROM person
WHERE gender = pgender;
$$ LANGUAGE sql;

SELECT *
FROM fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();