WITH orders AS (
  SELECT pizzeria.name, COUNT(person_order.id) AS orders_count
  FROM person_order 
  JOIN menu ON person_order.menu_id = menu.id
  JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
  GROUP BY pizzeria.name
),

visits AS (
  SELECT pizzeria.name, COUNT(person_visits.id) AS visits_count
  FROM person_visits
  JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id 
  GROUP BY pizzeria.name  
)

SELECT COALESCE(orders.name, visits.name) AS name,
       COALESCE(orders.orders_count, 0) + COALESCE(visits.visits_count, 0) AS total_count
FROM orders
FULL JOIN visits ON orders.name = visits.name
ORDER BY total_count DESC, name ASC;