SELECT

    a.name,
    at.animal_type,
    to_char(a.birthdate, 'DD.MM.YYYY')


FROM animals as a
JOIN animal_types as at
on at.id = a.animal_type_id
ORDER BY a.name