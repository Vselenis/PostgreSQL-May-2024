CREATE OR REPLACE FUNCTION udf_category_productions_count(
    category_name VARCHAR(50)
) RETURNS TEXT
AS
$$
DECLARE count_prod INTEGER;
BEGIN
    SELECT
        CASE
            WHEN count(name) > 0 THEN count(name)
            ELSE 0
        END
        INTO count_prod
        FROM categories as c
        JOIN categories_productions as cp on c.id = cp.category_id
        WHERE c.name = category_name;
    RETURN 'Found ' || count_prod || ' productions.';
end;
$$ LANGUAGE plpgsql;

SELECT udf_category_productions_count('Nonexistent') AS message_text;