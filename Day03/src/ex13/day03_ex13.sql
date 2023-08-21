DELETE FROM person_order
WHERE menu_id IN (SELECT id FROM menu WHERE pizza_name = 'greek pizza')
AND order_date = '2022-02-25';

DELETE FROM menu
WHERE pizza_name = 'greek pizza';