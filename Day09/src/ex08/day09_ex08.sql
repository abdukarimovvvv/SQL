CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop INT DEFAULT 10) RETURNS SETOF INT AS
$$
DECLARE
    i int = 0;
    j int = 1;
BEGIN
    IF pstop >= 0 THEN RETURN NEXT i;
    END IF;
    LOOP
        EXIT WHEN i > pstop OR j > pstop;
        RETURN NEXT j;
        SELECT  j, i+j INTO i, j;
    end loop;
END;
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();

