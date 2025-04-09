DELETE FROM colonists as c
WHERE NOT EXISTS(
    SELECT 1
    FROM assignments as a
    WHERE a.colonist_id = c.id
);

SELECT  * FROM colonists;

