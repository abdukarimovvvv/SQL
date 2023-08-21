SELECT person.name AS name,
    menu.pizza_name AS pizza_name,
    menu.price AS price,
    ROUND (CASE
        WHEN person_discounts.discount IS NULL THEN menu.price
        ELSE menu.price - (menu.price * person_discounts.discount / 100)
    END) AS discounted_price,
    pizzeria.name AS pizzeria_name
FROM menu
JOIN person_order ON menu.id = person_order.menu_id
JOIN person ON person_order.person_id = person.id
JOIN pizzeria on menu.pizzeria_id = pizzeria.id
JOIN person_discounts ON person.id = person_discounts.person_id AND pizzeria.id = person_discounts.pizzeria_id
ORDER BY person.name, menu.pizza_name;