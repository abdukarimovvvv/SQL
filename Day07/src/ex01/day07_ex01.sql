SELECT person.name AS person_name, COUNT(person_visits.pizzeria_id) AS count_of_visits
FROM person_visits
JOIN person ON person_visits.person_id = person.id
GROUP BY person_name
ORDER BY count_of_visits DESC,
    person.name ASC
LIMIT 4;
