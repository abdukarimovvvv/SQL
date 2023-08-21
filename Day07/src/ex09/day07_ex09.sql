SELECT address,
  ROUND(MAX(age::DECIMAL) - MIN(age::DECIMAL) / MAX(age::DECIMAL), 2) AS formula,
  ROUND(AVG(age::DECIMAL), 2) AS average,
  (MAX(age::DECIMAL) - MIN(age::DECIMAL) / MAX(age::DECIMAL)) > AVG(age::DECIMAL) AS comparison
FROM person
GROUP BY address
ORDER BY address;