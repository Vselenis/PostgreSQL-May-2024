SELECT
    SUM(booked_for) AS total_values

FROM
    bookings
WHERE
    apartment_id = 90;