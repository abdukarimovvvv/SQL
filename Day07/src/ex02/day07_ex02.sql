(SELECT pizzeria.name, pizzeria_visits_count.count, 'visit' AS action_type
FROM (SELECT pizzeria_id, COUNT(pizzeria_id) AS count
      FROM person_visits
      GROUP BY pizzeria_id) AS pizzeria_visits_count
LEFT JOIN pizzeria ON pizzeria.id = pizzeria_visits_count.pizzeria_id
ORDER BY count DESC
LIMIT 3)
UNION ALL
(SELECT pizzeria.name, pizzeria_order_count.count, 'order' AS action_type
FROM(SELECT pizzeria_id, COUNT(pizzeria_id) AS count
     FROM person_order LEFT JOIN menu ON menu.id = person_order.menu_id
     GROUP BY pizzeria_id) AS pizzeria_order_count
LEFT JOIN pizzeria ON pizzeria.id = pizzeria_order_count.pizzeria_id
ORDER BY count DESC
LIMIT 3)
ORDER BY action_type ASC, count DESC;
