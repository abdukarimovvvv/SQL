INSERT INTO person_order
    (SELECT generate_series((SELECT MAX(id) + 1 FROM person_order),
                            (SELECT MAX(id) + COUNT(DISTINCT person_id) FROM person_order)),
            generate_series(1, 9),
            menu.id,
            '2022-02-25' AS order_date
     FROM menu
     WHERE pizza_name = 'greek pizza');