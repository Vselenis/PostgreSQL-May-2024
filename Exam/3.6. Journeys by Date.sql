SELECT
    id,
    to_char(start_time, 'DD-MM-YY HH24:MI') AS start_time,
    station_id
FROM journeys
WHERE start_time > TO_DATE('10-02-2025', 'DD-MM-YYYY') AND
      purpose = 'Civil'
ORDER BY start_time, station_id, id DESC
LIMIT 3;