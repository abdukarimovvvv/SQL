WITH pizza_1 AS (
    SELECT * FROM menu LEFT JOIN (SELECT id, name FROM pizzeria) AS pizzeria 
    ON menu.pizzeria_id = pizzeria.id
)
SELECT pizza_1.pizza_name AS pizza_name, pizza_1.name AS pizzeria_name_1, 
buff.name AS pizzeria_name_2, pizza_1.price
FROM pizza_1
INNER JOIN pizza_1 AS buff
ON pizza_1.pizza_name = buff.pizza_name 
AND pizza_1.price = buff.price AND pizza_1.name != buff.name 
AND pizza_1.pizzeria_id > buff.pizzeria_id
ORDER BY pizza_name;