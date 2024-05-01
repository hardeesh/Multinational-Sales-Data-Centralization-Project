ALTER TABLE orders_table
DROP COLUMN index;


SELECT
     card_number, length(card_number)
FROM
    orders_table
GROUP BY
    card_number
ORDER BY
    length(card_number) desc
LIMIT 1;


ALTER TABLE orders_table
ALTER COLUMN card_number      
TYPE VARCHAR(19);


ALTER TABLE orders_table
ALTER COLUMN store_code      
TYPE VARCHAR(12);

ALTER TABLE orders_table
ALTER COLUMN product_code      
TYPE VARCHAR(11);

ALTER TABLE orders_table
ALTER COLUMN user_uuid
TYPE uuid
USING user_uuid::uuid

ALTER TABLE orders_table
ALTER COLUMN date_uuid        
TYPE uuid
USING date_uuid::uuid

ALTER TABLE orders_table
ALTER COLUMN product_quantity         
TYPE SMALLINT


SELECT column_name, data_type
current
FROM
INFORMATION_SCHEMA.COLUMNS
WHERE
table_name = 'orders_table';


ALTER TABLE orders_table 
ADD CONSTRAINT fk_card_number
FOREIGN KEY (card_number) 
REFERENCES dim_card_details (card_number);

ALTER TABLE orders_table 
ADD CONSTRAINT fk_dim_date_times 
FOREIGN KEY (date_uuid) 
REFERENCES dim_date_times (date_uuid);

ALTER TABLE orders_table 
ADD CONSTRAINT fk_product_code 
FOREIGN KEY (product_code) 
REFERENCES dim_products (product_code);

ALTER TABLE orders_table 
ADD CONSTRAINT fk_store_code 
FOREIGN KEY (store_code) 
REFERENCES dim_store_details (store_code);

ALTER TABLE orders_table 
ADD CONSTRAINT fk_user_uuid 
FOREIGN KEY (user_uuid) 
REFERENCES dim_users (user_uuid);

SELECT constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_name = 'orders_table';



