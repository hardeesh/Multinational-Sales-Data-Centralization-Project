ALTER TABLE dim_store_details
DROP COLUMN lat;

SELECT
     store_code, length(store_code)
FROM
    dim_store_details
GROUP BY
    store_code
ORDER BY
    length(store_code) desc;


ALTER TABLE dim_store_details
ALTER COLUMN store_code                                                                                                                                                                                  
TYPE VARCHAR(12);

ALTER TABLE dim_store_details
ALTER COLUMN locality                                                                                                                                                                                  
TYPE VARCHAR(225);

ALTER TABLE dim_store_details
ALTER COLUMN store_type                                                                                                                                                                                  
TYPE VARCHAR(225);

ALTER TABLE dim_store_details
ALTER COLUMN continent                                                                                                                                                                                  
TYPE VARCHAR(225);

ALTER TABLE dim_store_details
ALTER COLUMN country_code                                                                                                                                                                                  
TYPE VARCHAR(2);

ALTER TABLE dim_store_details
ALTER COLUMN opening_date          
TYPE DATE;

ALTER TABLE dim_store_details
ALTER COLUMN staff_numbers                            
TYPE smallint
USING (staff_numbers::integer);


UPDATE dim_store_details
SET longitude = REPLACE(longitude, 'N/A', 'NULL')

UPDATE dim_store_details
SET longitude = REPLACE(longitude, 'NULL', '0')


ALTER TABLE dim_store_details
ALTER COLUMN longitude                     
TYPE FLOAT
USING (longitude::FLOAT);


SELECT *, CONCAT(latitude, lat) as latitude 
FROM dim_store_details;

UPDATE dim_store_details
SET latitude = REPLACE(latitude, 'N/A', 'NULL')

ALTER TABLE dim_store_details
ALTER COLUMN latitude                     
TYPE FLOAT
USING (latitude::FLOAT);


SELECT column_name, data_type
current
FROM
INFORMATION_SCHEMA.COLUMNS
WHERE
table_name = 'dim_store_details';


SELECT*
from dim_store_details


ALTER TABLE dim_store_details 
ADD PRIMARY KEY (store_code);

SELECT * FROM orders_table
WHERE store_code 
NOT IN(SELECT dim_store_details.store_code 
FROM dim_store_details);