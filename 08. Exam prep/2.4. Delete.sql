DELETE FROM volunteers
WHERE department_id = (SELECT id FROM volunteers_departments
WHERE department_name = 'Education program assistant');



DELETE FROM volunteers_departments
WHERE department_name = 'Education program assistant';