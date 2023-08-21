CREATE VIEW v_symmetric_union AS
WITH R AS (SELECT * FROM person_visits
           WHERE visit_date = '2022-01-02'),
     S AS (SELECT * FROM person_visits
           WHERE visit_date = '2022-01-06'),
     R_S AS (SELECT *
           FROM R
            EXCEPT ALL
            SELECT * FROM S),
     S_R AS (SELECT * FROM S
            EXCEPT ALL
            SELECT * FROM R)
    (SELECT person_id FROM R_S
     UNION
     SELECT person_id FROM S_R
     ORDER BY person_id);