SELECT person.name AS name, COUNT(person_visits.pizzeria_id) AS count_of_visits
FROM person_visits
JOIN person ON person_visits.person_id = person.id
GROUP BY name
HAVING COUNT(person_visits.pizzeria_id) > 3
ORDER BY count_of_visits DESC, name ASC;
