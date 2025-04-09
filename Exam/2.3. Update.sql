UPDATE journeys

SET purpose =
    CASE
        WHEN purpose = 'Military' THEN 'Civil'
    ELSE 'Military'
    END;