SELECT (SELECT NAME
        FROM person
        WHERE person.id = person_id) AS person_name,
        (SELECT NAME
        FROM pizzeria
        WHERE pizzeria.id = pizzeria_id) AS pizzeria_name
FROM 
    (SELECT * 
    FROM person_visits
    WHERE visit_date BETWEEN '2022-01-07' and '2022-01-09') AS pv
ORDER BY person_name, pizzeria_name DESC;