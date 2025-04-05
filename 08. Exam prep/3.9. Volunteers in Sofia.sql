SELECT
    name,
    phone_number,
    split_part(address,', ', 2)
FROM volunteers as v
JOIN volunteers_departments as vd
ON v.department_id = vd.id
WHERE vd.department_name = 'Education program assistant'
AND v.address LIKE '%Sofia%'
ORDER BY v.name;

SELECT * FROM volunteers