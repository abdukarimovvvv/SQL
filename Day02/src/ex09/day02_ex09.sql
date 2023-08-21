WITH female AS (SELECT person.name, pizza_name FROM person
JOIN person_order ON person_id = person.id
JOIN menu ON menu_id = menu.id
WHERE person.gender = 'female')
SELECT female.name AS name
FROM female 
WHERE pizza_name = 'pepperoni pizza' 
INTERSECT
SELECT female.name AS name
FROM female  
WHERE pizza_name = 'cheese pizza'
ORDER BY 1;