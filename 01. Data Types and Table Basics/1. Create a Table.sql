CREATE TABLE IF NOT EXISTS minions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    age INTEGER
);

SELECT * FROM minions;