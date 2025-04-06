SELECT
    first_name,
    last_name,
    make,
    model,
    mileage
FROM cars_drivers as cd
JOIN public.cars c on c.id = cd.car_id
JOIN public.drivers d on cd.driver_id = d.id
WHERE mileage is NOT NULL
ORDER BY mileage DESC, first_name
