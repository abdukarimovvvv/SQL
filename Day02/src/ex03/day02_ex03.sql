WITH date_range AS (
    SELECT generate_series('2022-01-01'::DATE, '2022-01-10'::DATE, '1 day')::DATE AS missing_date
)
SELECT missing_date
FROM date_range
LEFT JOIN person_visits ON missing_date = visit_date AND (person_id = 1 OR person_id = 2)
WHERE visit_date IS NULL
ORDER BY missing_date;
