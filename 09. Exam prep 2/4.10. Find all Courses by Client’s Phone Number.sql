CREATE OR REPLACE FUNCTION fn_courses_by_client(
    phone_num VARCHAR(20)
) RETURNS NUMERIC
AS
$$
    DECLARE num_courses INT;
    BEGIN
        SELECT COUNT(courses.id)
        INTO num_courses
        FROM courses
        JOIN public.clients c on c.id = courses.client_id
        WHERE phone_number = phone_num;

        RETURN num_courses;
    end;
$$ LANGUAGE plpgsql;

SELECT fn_courses_by_client('(803) 6386812')