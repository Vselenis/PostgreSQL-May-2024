CREATE OR REPLACE FUNCTION udf_spaceship_journeys_count(
    spaceship_name VARCHAR(60)
) RETURNS INT
AS
$$
DECLARE count_spaceship_journeys INT;
BEGIN
        SELECT count(*)
        INTO count_spaceship_journeys
        FROM spaceships as s
        JOIN journeys as j on s.id = j.spaceship_id
        WHERE s.name = spaceship_name;

        RETURN count_spaceship_journeys;
END;
$$ LANGUAGE plpgsql;

SELECT udf_spaceship_journeys_count('Nonexistent') AS journey_count;
SELECT udf_spaceship_journeys_count('Fade') AS journey_count;