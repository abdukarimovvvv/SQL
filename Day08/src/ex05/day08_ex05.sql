-- Сессия 1 
BEGIN;
-- Сессия 2
BEGIN;

-- Сессия 1 
SELECT SUM(rating) FROM pizzeria;

-- Сессия 2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut'; 
COMMIT;

-- Сессия 1
SELECT SUM(rating) FROM pizzeria;
-- Сессия 2
SELECT SUM(rating) FROM pizzeria;