SELECT deposit_group, sum(deposit_interest) AS total_interest
FROM wizard_deposits
GROUP BY deposit_group
ORDER BY total_interest DESC ;