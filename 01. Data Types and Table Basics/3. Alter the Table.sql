ALTER TABLE minions_info
ADD COLUMN code CHAR(4),
ADD COLUMN task TEXT,
ADD COLUMN salary NUMERIC(8,3);


SELECT * FROM minions_info