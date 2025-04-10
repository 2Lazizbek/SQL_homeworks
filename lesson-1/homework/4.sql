CREATE TABLE category (
    category_id INT CONSTRAINT pk_category PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE item (
    item_id INT CONSTRAINT pk_item PRIMARY KEY,
    item_name VARCHAR(100),
    category_id INT CONSTRAINT fk_item FOREIGN KEY REFERENCES category(category_id)
);

ALTER TABLE item
DROP CONSTRAINT fk_item;

ALTER TABLE item
ADD CONSTRAINT fk_item FOREIGN KEY (category_id) REFERENCES category(category_id);