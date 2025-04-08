SELECT
    first_name || ' ' || last_name as full_name,
    lower(substring(first_name,1,1)) || right(last_name,2) || length(last_name) || '@sm-cast.com' as email,
    awards
FROM actors as a
WHERE NOT EXISTS (SELECT 1 FROM productions_actors as pa
WHERE a.id = pa.actor_id)
ORDER BY awards DESC, id;