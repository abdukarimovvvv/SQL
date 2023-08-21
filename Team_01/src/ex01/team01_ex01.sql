INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH CTE AS
         (SELECT b.user_id,
                 b.money,
                 b.updated as bal_upd,
                 c.name,
                 c.updated as cur_upd
          FROM balance b
                   JOIN currency c
                        ON c.id = b.currency_id),

     t1 AS
         (SELECT user_id,
                 name,
                 money,
                 bal_upd,
                 MIN(bal_upd - cur_upd) AS period
          FROM CTE
          WHERE (bal_upd - cur_upd) > '0 SEC':: interval
          GROUP BY 1, 2, 3, 4),
     t2 AS
         (SELECT user_id,
                 name,
                 money,
                 bal_upd,
                 MAX(bal_upd - cur_upd) AS period
          FROM CTE
          WHERE (bal_upd - cur_upd) < '0 SEC':: interval
          GROUP BY 1, 2, 3, 4),
     t_common AS
         (SELECT t2.user_id,
                 t2.name,
                 t2.money,
                 t2.bal_upd,
                 COALESCE(t1.period, t2.period) AS period
          FROM t1
                   FULL JOIN t2
                             ON
                                         t1.user_id = t2.user_id AND
                                         t1.name = t2.name AND
                                         t1.money = t2.money AND
                                         t1.bal_upd = t2.bal_upd)

SELECT COALESCE(u.name, 'not defined')     AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       t.name                              AS currency_name,
       t.money * c.rate_to_usd             AS currency_in_usd
FROM t_common t
         LEFT JOIN "user" u
                   ON u.id = t.user_id
         LEFT JOIN currency c
                   ON t.period = (t.bal_upd - c.updated)
                       AND t.name = c.name
ORDER BY name DESC, lastname, currency_name;