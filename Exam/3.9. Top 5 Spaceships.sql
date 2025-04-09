SELECT
    s.name as spaceship_name,
       (SELECT COUNT(j2.id)
        FROM journeys j2
        WHERE j2.spaceship_id = s.id
    ) AS journeys_count,
    count(c.id) as colonists_count
FROM spaceships as s
LEFT JOIN journeys as j on s.id = j.spaceship_id
LEFT JOIN assignments as a on j.id = a.journey_id
LEFT JOIN colonists as c on c.id = a.colonist_id
GROUP BY s.id, s.name
ORDER BY journeys_count DESC, colonists_count DESC, s.name
LIMIT 5;