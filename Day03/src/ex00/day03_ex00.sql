SELECT menu.pizza_name AS pizza_name, 
    menu.price AS price, 
    pizzeria.name AS pizzeria_name,
    person_visits.visit_date AS visit_date
FROM menu
JOIN person_visits ON menu.pizzeria_id = person_visits.pizzeria_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person_visits.person_id = (SELECT id FROM person WHERE name = 'Kate')
AND menu.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name;