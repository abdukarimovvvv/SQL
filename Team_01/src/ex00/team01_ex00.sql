SELECT balance_filter.name, balance_filter.lastname, balance_filter.type, balance_filter.volume,
       COALESCE(fresh_currency.name, 'not defined') AS currency_name,
       COALESCE(fresh_currency.rate_to_usd, 1) AS last_rate_to_usd,
       balance_filter.volume * COALESCE(fresh_currency.rate_to_usd, 1) AS total_volume_in_usd
FROM (SELECT COALESCE("user".name, 'not defined') as name, COALESCE("user".lastname, 'not defined') AS lastname,
             balance.type, SUM(balance.money) AS volume, currency_id
      FROM balance
      LEFT JOIN currency ON currency.id = balance.currency_id AND currency.updated = balance.updated
      LEFT JOIN "user" ON "user".id = balance.user_id
      GROUP BY "user".id, type, currency_id
      ORDER BY name DESC, lastname ASC, type ASC) AS balance_filter
LEFT JOIN (SELECT currency.*  FROM currency
           RIGHT JOIN (SELECT id, MAX(updated) AS updated FROM currency
           GROUP BY id) AS fresh_currency
ON currency.id = fresh_currency.id AND currency.updated = fresh_currency.updated) AS fresh_currency
ON fresh_currency.id = balance_filter.currency_id;
