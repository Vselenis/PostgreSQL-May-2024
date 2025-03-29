SELECT
    count(CASE department_id WHEN 1 THEN 1 END) "Engineering",
    count(CASE department_id WHEN 2 THEN 2 END) "Tool Design",
    count(CASE department_id WHEN 3 THEN 3 END) "Sales",
    count(CASE department_id WHEN 4 THEN 4 END) "Marketing",
    count(CASE department_id WHEN 5 THEN 5 END) "Purchasing",
    count(CASE department_id WHEN 6 THEN 6 END) "Research and Development",
    count(CASE department_id WHEN 7 THEN 7 END) "Production"
FROM employees
