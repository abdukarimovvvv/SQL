/* (<=, >=) */
SELECT name, rating from pizzeria
WHERE rating >= 3.5 AND rating <= 5
ORDER BY rating;
/* BETWEEN */
SELECT name, rating from pizzeria
WHERE rating BETWEEN 3.5 and 5
ORDER BY rating;
