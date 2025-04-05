SELECT
    CONCAT(o.name, ' - ',a.name),
    phone_number,
    c.cage_id
FROM owners as o
JOIN animals as a
on o.id = a.owner_id
JOIN animal_types as t
on t.id = a.animal_type_id
JOIN animals_cages as c
ON a.id = c.animal_id
WHERE t.animal_type = 'Mammals'
ORDER BY o.name, a.name DESC;