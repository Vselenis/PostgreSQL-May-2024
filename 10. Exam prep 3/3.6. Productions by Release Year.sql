SELECT
    p.id,
    p.title,
    pi.duration,
    round(pi.budget, 1) AS budget,
    to_char(pi.release_date, 'MM-YY') AS release_date
FROM productions AS p
RIGHT JOIN productions_info AS pi ON p.production_info_id = pi.id
WHERE EXTRACT(YEAR FROM pi.release_date) IN (2023, 2024)
  AND pi.budget > 1500000.00
ORDER BY pi.budget, pi.duration DESC, p.id
LIMIT 3;
