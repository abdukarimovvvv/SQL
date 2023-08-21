-- Сессия 1
BEGIN;
-- Сессия 2
BEGIN;
-- Сессия 1
UPDATE pizzeria SET rating = 3.5 WHERE id = 1;
-- Сессия 2 
UPDATE pizzeria SET rating = 4.2 WHERE id = 2;

-- Сессия 1 
UPDATE pizzeria SET rating = 4.8 WHERE id = 2;
-- Сессия 2
UPDATE pizzeria SET rating = 4.6 WHERE id = 1; 

-- Сессия 1
COMMIT;
-- Сессия 2
COMMIT;