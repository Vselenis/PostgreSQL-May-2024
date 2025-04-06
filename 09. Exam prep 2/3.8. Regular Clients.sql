SELECT
    full_name,
    count(client_id),
    sum(bill)
    AS count_of_cars
from courses as c
JOIN clients c2 on c2.id = c.client_id
WHERE substr(full_name,2,1) = 'a'
GROUP BY full_name
HAVING (COUNT(car_id)) > 1
ORDER BY full_name;
