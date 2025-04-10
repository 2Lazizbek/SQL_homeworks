ALTER TABLE product
ADD CONSTRAINT unique_product_combo
UNIQUE (product_id, product_name);