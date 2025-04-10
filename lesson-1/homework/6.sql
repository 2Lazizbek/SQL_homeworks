CREATE TABLE customer (
    customer_id INT CONSTRAINT pk_customer PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100) CONSTRAINT def_city_customer DEFAULT 'Unknown'
);

ALTER TABLE customer
DROP CONSTRAINT def_city_customer;

ALTER TABLE customer
ADD CONSTRAINT def_city_customer DEFAULT 'Unknown' FOR city;