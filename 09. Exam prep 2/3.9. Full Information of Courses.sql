SELECT
    a.name as address,
    CASE
        WHEN EXTRACT(HOUR FROM start) BETWEEN 6 AND 20 THEN 'Day'
        ELSE 'Night'
    END AS day_time,
    bill,
    full_name,
    make,
    model,
    c3.name as category_name
FROM courses
JOIN addresses a on a.id = courses.from_address_id
JOIN clients c on c.id = courses.client_id
JOIN cars c2 on courses.car_id = c2.id
JOIN categories c3 on c2.category_id = c3.id