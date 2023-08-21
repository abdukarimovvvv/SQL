SELECT address, pizzeria.name AS pizzeria_name,
        COUNT(pizzeria.name) AS count_of_orders
FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY address, pizzeria_name
ORDER BY address, pizzeria_name;