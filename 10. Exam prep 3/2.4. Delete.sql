DELETE FROM countries c
WHERE NOT EXISTS
    (SELECT 1
     FROM actors a
     WHERE a.country_id = c.id)
  AND NOT EXISTS
    (SELECT 1 FROM productions p
    WHERE p.country_id = c.id);
