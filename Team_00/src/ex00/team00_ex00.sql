CREATE TABLE IF NOT EXISTS nodes (
    point1 char NOT NULL,
    point2 char NOT NULL, 
    cost int NOT NULL);
                                  
INSERT INTO nodes VALUES
('a', 'b', 10),
('b', 'a', 10),
('b', 'c', 35),
('c', 'b', 35),
('c', 'a', 15),
('a', 'c', 15),
('a', 'd', 20),
('d', 'a', 20),
('b', 'd', 25),
('d', 'b', 25),
('c', 'd', 30),
('d', 'c', 30);

CREATE VIEW journey AS 
(WITH RECURSIVE way AS 
(SELECT n.point1::bpchar AS tour,
        n.point1,
        n.point2,
        n.cost AS sum
FROM nodes n
WHERE n.point1 = 'a'
UNION
SELECT prev.tour || ',' || prev.point2 AS tour,
        curr.point1,
        curr.point2,
        curr.cost + prev.sum AS sum
FROM nodes curr
    JOIN way prev ON curr.point1 = prev.point2
 WHERE prev.tour NOT LIKE '%' || prev.point2 || '%')
 SELECT * FROM way);
-- Вызов SQL-запроса для нахождения минимальной стоимости проезда
SELECT sum AS total_cost,
      '{' || tour || ',' || point2 || '}' AS tour
FROM journey
WHERE point2 = 'a' AND 
      sum = (SELECT min(sum)
             FROM journey
             WHERE length(tour) = 7 AND point2 = 'a')
ORDER BY 1, 2;
                    