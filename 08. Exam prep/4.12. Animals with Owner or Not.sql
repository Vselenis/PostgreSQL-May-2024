CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
IN animal_name VARCHAR(30),
OUT result VARCHAR(30)
)
AS
$$
    BEGIN
        SELECT o.name
        INTO result
        FROM owners AS o
            join animals as a
            on o.id = a.owner_id
        WHERE a.name = animal_name;

        IF result is NULL THEN result := 'For adoption';
        end if;
    END;
    $$
LANGUAGE plpgsql;


CALL sp_animals_with_owners_or_not('Hippo')