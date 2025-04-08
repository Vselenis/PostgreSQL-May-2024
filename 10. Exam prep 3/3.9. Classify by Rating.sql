SELECT
    p.title,
    CASE
        WHEN rating <= 3.50 THEN 'poor'
        WHEN rating > 3.50 AND rating <= 8.00 THEN 'good'
        ELSE 'excellent'
    END as rating,
    CASE
        WHEN has_subtitles = true THEN 'Bulgarian'
        ELSE 'N/A'
    END as subtitles,
    count(pa.actor_id)
FROM
    productions_info as pi
JOIN productions as p on pi.id = p.production_info_id
JOIN productions_actors as pa on p.id = pa.production_id
GROUP BY p.title, pi.rating, pi.has_subtitles
ORDER BY rating, count(pa.actor_id) DESC, p.title