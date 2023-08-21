SELECT menu.pizza_name AS pizza_name,
       pizzeria.name AS pizzeria_name,
       menu.price AS price 
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE menu.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY pizza_name, pizzeria_name;
