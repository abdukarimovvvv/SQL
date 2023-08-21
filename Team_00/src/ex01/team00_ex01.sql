(SELECT sum AS total_cost,
        '{' || tour || ',' || point2 || '}' AS tour
FROM journey
WHERE point2 = 'a' AND
    sum = (SELECT min(sum)
            FROM journey
            WHERE length(tour) = 7 AND point2 = 'a')
ORDER BY 1,2)
UNION
(SELECT sum AS total_cost,
    '{' || tour || ',' || point2 || '}' AS tour
FROM journey
WHERE point2 = 'a' AND
      sum = (SELECT max(sum)
            FROM journey
            WHERE length(tour) = 7 AND point2 = 'a')
ORDER BY 1,2);