CREATE TABLE search_results (
    id SERIAL PRIMARY KEY,
    address_name VARCHAR(50),
    full_name VARCHAR(100),
    level_of_bill VARCHAR(20),
    make VARCHAR(30),
    condition CHAR(1),
    category_name VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE sp_courses_by_address(
    addresses_name VARCHAR(100)
)
AS
$$
BEGIN
    TRUNCATE search_results;

            INSERT INTO search_results (
                address_name,
                full_name,
                level_of_bill,
                make,
                condition,
                category_name
            )

            SELECT
                a.name AS address_name,
                c2.full_name,
                CASE
                    WHEN c.bill <= 20 THEN 'Low'
                    WHEN c.bill <= 30 THEN 'Medium'
                        ELSE 'High'
                        END AS level_of_bill,
                c3.make,
                c3.condition,
                c4.name AS category_name
            FROM addresses as a
            JOIN courses c on a.id = c.from_address_id
            JOIN clients c2 on c2.id = c.client_id
            JOIN public.cars c3 on c3.id = c.car_id
            JOIN public.categories c4 on c4.id = c3.category_id
            WHERE a.name = addresses_name
            ORDER BY c3.make, c2.full_name;
end;
$$ LANGUAGE plpgsql;


CALL sp_courses_by_address('700 Monterey Avenue');

SELECT * FROM search_results;
