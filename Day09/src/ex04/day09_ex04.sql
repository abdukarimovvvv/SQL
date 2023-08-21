CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE (
    id integer,
    name character varying, 
    age integer, 
    gender character varying,
    address character varying
) AS $$
    SELECT *
    FROM person
    WHERE gender = 'female';
$$ LANGUAGE sql;

CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE (
    id integer, 
    name character varying,
    age integer,
    gender character varying,
    address character varying  
) AS $$
    SELECT *
    FROM person 
    WHERE gender = 'male';
$$ LANGUAGE sql;

SELECT * FROM fnc_persons_female();

SELECT * FROM fnc_persons_male();