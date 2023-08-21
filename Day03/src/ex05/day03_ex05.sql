SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
JOIN person ON person.id = person_visits.person_id
LEFT JOIN person_order ON person.id = person_order.person_id
                        AND person_order.menu_id IN (SELECT id FROM menu WHERE menu.pizzeria_id = pizzeria.id)
WHERE person.name = 'Andrey'
      AND person_order.menu_id IS NULL
ORDER BY pizzeria_name;
