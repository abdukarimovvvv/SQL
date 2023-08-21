INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT
    ROW_NUMBER() OVER(),
    po.person_id,
    po.pizzeria_id,
    CASE 
        WHEN order_count = 1 THEN 10.5
        WHEN order_count = 2 THEN 22
        ELSE 30
    END AS discount
FROM (SELECT person_id, pizzeria_id,
        COUNT(*) AS order_count
        FROM person_order AS po
            LEFT JOIN menu AS me ON po.menu_id = me.id
        GROUP BY po.person_id, 
        me.pizzeria_id) po;