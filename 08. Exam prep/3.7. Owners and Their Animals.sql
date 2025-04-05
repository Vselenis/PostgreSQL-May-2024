SELECT
    o.name,
    COUNT(*) as count_of_animals
FROM owners as o
JOIN animals as a
on o.id = a.owner_id
GROUP BY o.name
ORDER BY count_of_animals DESC, o.name
LIMIT 5;
