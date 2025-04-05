SELECT
    a.name AS animal,
    to_char(a.birthdate, 'YYYY') AS birth_year,
    at.animal_type

FROM animals AS a
LEFT JOIN animal_types AS at on at.id = a.animal_type_id
WHERE birthdate > '01/01/2017' AND at.animal_type != 'Birds' AND a.owner_id IS NULL
ORDER BY name;

