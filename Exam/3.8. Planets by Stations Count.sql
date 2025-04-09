SELECT
    'Planet: ' || p.name as planet_name,
    count(s.id) as station_count,
    trunc(avg(s.max_capacity),2) as avg_capacity
FROM planets as p
LEFT JOIN stations as s on p.id = s.planet_id
GROUP BY p.id, p.name
ORDER BY station_count DESC, avg_capacity DESC, p.name ASC