-- Сессия 1
BEGIN;
-- Сессия 2
BEGIN;
-- Сессия 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Сессия 2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;

-- Сессия 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';