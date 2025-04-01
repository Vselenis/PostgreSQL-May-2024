SELECT
    c.country_name,
    r.river_name

FROM rivers AS r
RIGHT JOIN countries_rivers AS cr
ON r.id = cr.river_id
RIGHT JOIN countries AS c
USING (country_code)
WHERE c.continent_code = 'AF'
ORDER BY c.country_name
LIMIT 5;