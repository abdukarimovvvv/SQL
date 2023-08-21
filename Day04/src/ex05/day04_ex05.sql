CREATE VIEW v_price_with_discount AS
SELECT name,
       pizza_name,
       price,
       ROUND(price - price * 0.1) AS discount_price
FROM person_order
         JOIN person p on person_order.person_id = p.id
         JOIN menu m on person_order.menu_id = m.id
ORDER BY name, pizza_name;

-- SELECT * FROM v_price_with_discount;