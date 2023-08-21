CREATE TABLE IF NOT EXISTS person_discounts (
    id INTEGER PRIMARY KEY,
    person_id INTEGER,
    pizzeria_id INTEGER,
    discount NUMERIC,
CONSTRAINT fk_person_discounts_person_id
FOREIGN KEY(person_id) REFERENCES person(id),
CONSTRAINT fk_person_discounts_pizzeria_id
FOREIGN KEY(pizzeria_id) REFERENCES pizzeria(id)
);