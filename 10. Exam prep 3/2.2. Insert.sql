INSERT INTO actors (first_name, last_name, birthdate, height, awards, country_id)

    SELECT
    REVERSE(first_name) as first_name,
    REVERSE(last_name) as last_name,
    birthdate - 2 as birthdate,

    CASE
        WHEN height IS NULL THEN 10
        ELSE height+10
    END as height,
    country_id as awards,
    (SELECT id FROM countries
    WHERE name = 'Armenia') as country_id
FROM actors
WHERE (id BETWEEN 10 AND 20);