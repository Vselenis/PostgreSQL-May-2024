CREATE OR REPLACE PROCEDURE udp_update_max_capacity(
    planet_name VARCHAR(60),
    increment INT
)
AS
$$
BEGIN
    UPDATE stations
    SET max_capacity = max_capacity + increment
    WHERE id IN (
        SELECT s.id
        FROM planets as p
        JOIN stations as s on p.id = s.planet_id
        WHERE p.name = planet_name
        );

END;
$$ LANGUAGE plpgsql;

CALL udp_update_max_capacity('Teutera', 50);