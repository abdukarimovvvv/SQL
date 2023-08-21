WITH pizzeria_man AS (
    SELECT person_visits.person_id, person_visits.pizzeria_id, 
    person_visits.visit_date, person.name, person.gender, 
    pizzeria.name AS pizzeria_name
    FROM person_visits
    LEFT JOIN person ON person_visits.person_id = person.id
    LEFT JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
)
(SELECT pizzeria_name FROM pizzeria_man WHERE gender = 'male'
EXCEPT ALL
SELECT pizzeria_name FROM pizzeria_man WHERE gender = 'female')
UNION ALL
(SELECT pizzeria_name FROM pizzeria_man WHERE gender = 'female'
EXCEPT ALL
SELECT pizzeria_name FROM pizzeria_man WHERE gender = 'male')
ORDER BY pizzeria_name;
