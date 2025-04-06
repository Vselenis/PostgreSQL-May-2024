INSERT INTO clients(
full_name,
phone_number
)
SELECT
first_name || ' ' || drivers.last_name as full_name,
'(088) 9999' || id*2 as phone_number
FROM drivers
WHERE id BETWEEN 10 AND 20;



