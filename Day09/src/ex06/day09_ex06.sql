CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson character varying DEFAULT 'Dmitriy',
    pprice integer DEFAULT 500, 
    pdate date DEFAULT '2022-01-08'
)
RETURNS TABLE (
    pizzeria_name character varying 
) AS $$
SELECT
  p.name as pizzeria_name
FROM person as pe
  JOIN person_visits as v ON v.person_id = pe.id
  JOIN pizzeria as p ON p.id = v.pizzeria_id
  JOIN menu as m ON m.pizzeria_id = p.id
WHERE 
  pe.name = pperson
  AND m.price < pprice
  AND v.visit_date = pdate; 
$$ LANGUAGE sql;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');