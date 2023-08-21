CREATE TABLE person_audit (
    created timestamp with time zone DEFAULT now() NOT NULL,
    type_event char(1) DEFAULT 'I' NOT NULL CHECK (type_event IN ('I','U','D')),
    row_id bigint NOT NULL,
    name varchar,
    age integer,
    gender varchar,
    address varchar
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() 
  RETURNS trigger AS
$$
BEGIN
  INSERT INTO person_audit (row_id, name, age, gender, address)
  VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
  AFTER INSERT ON person
  FOR EACH ROW
  EXECUTE PROCEDURE fnc_trg_person_insert_audit();
  
INSERT INTO person(id, name, age, gender, address) 
VALUES (10,'Damir', 22, 'male', 'Irkutsk');