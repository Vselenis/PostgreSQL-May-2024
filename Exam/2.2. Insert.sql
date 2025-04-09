INSERT INTO spaceships(name, manufacturer, speed)

SELECT
    CONCAT(REVERSE(last_name), identity) as name,
    UPPER(SUBSTRING(first_name FROM 1 FOR 2)) || to_char(birth_date, 'MM') as manufacturer,
    EXTRACT(YEAR FROM birth_date) + 100 as speed
FROM colonists as speed
WHERE birth_date > '2001-01-01';