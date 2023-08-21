SELECT missing_date
FROM (SELECT generate_series('2022-01-01'::DATE,'2022-01-10'::DATE,'1 day')::DATE AS missing_date) t
LEFT JOIN person_visits ON missing_date = visit_date AND (person_id = 1 OR person_id = 2)
WHERE visit_date IS NULL
ORDER BY missing_date;