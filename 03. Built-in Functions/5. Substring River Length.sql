SELECT
    SUBSTRING("River Information", '[0-9]{1,4}')
    AS river_lenght
FROM
    view_river_info;