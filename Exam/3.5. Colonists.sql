SELECT
    id,
    last_name,
    identity
FROM colonists
WHERE right(last_name,1) = 's' AND
      identity LIKE '%00%'
ORDER BY last_name DESC, identity;