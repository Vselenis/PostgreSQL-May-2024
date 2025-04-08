CREATE OR REPLACE PROCEDURE udp_awarded_production(
    production_title VARCHAR(70)
)
AS
$$
BEGIN
    UPDATE actors
    SET awards = awards + 1
    WHERE id IN (

        SELECT
        pa.actor_id
        FROM productions as p
        JOIN productions_actors as pa on p.id = pa.production_id
        WHERE p.title = production_title);


END;
$$ LANGUAGE plpgsql;

CALL udp_awarded_production('Tea For Two');