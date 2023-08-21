WITH not_order AS (SELECT menu.id AS menu_id FROM menu
                   EXCEPT
                   SELECT menu_id
                   FROM person_order
                   ORDER BY 1)
SELECT pizza_name, price,
       pizzeria.name AS pizzeria_name
FROM not_order
JOIN menu ON not_order.menu_id = id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY pizza_name, price;