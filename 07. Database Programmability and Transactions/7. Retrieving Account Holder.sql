CREATE OR REPLACE PROCEDURE sp_retrieving_holders_with_balance_higher_than(
searched_balance NUMERIC
)
AS
$$
DECLARE
    holder_info RECORD;
BEGIN
     FOR holder_info IN
         SELECT
            ah.first_name || ' ' || ah.last_name as full_name,
                    sum(balance) as total_balance
                FROM accounts as a
                JOIN account_holders ah
                on ah.id = a.account_holder_id
                GROUP BY account_holder_id, full_name
                HAVING SUM(balance) > searched_balance
                ORDER BY full_name

    LOOP
    RAISE NOTICE '% - %', holder_info.full_name, holder_info.total_balance;
    END LOOP;
end;

$$ LANGUAGE plpgsql;


CALL sp_retrieving_holders_with_balance_higher_than(200000)









