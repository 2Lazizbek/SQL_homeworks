CREATE TABLE orders (
    order_id INT CONSTRAINT pk_orders PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATE
);

ALTER TABLE orders
DROP CONSTRAINT pk_orders;

ALTER TABLE orders
ADD CONSTRAINT pk_orders PRIMARY KEY (order_id);