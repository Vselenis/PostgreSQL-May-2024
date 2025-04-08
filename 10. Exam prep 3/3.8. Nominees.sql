SELECT
    c.name,
    count(country_id) as productions_count,
    CASE
        WHEN avg(pi.budget) IS NULL THEN 0
        ELSE avg(pi.budget)
    END as avg_budget
FROM productions as p
JOIN public.productions_info as pi on pi.id = p.production_info_id
JOIN public.countries c on p.country_id = c.id
GROUP BY c.name
HAVING count(country_id) > 0
ORDER BY count(country_id) DESC, c.name
