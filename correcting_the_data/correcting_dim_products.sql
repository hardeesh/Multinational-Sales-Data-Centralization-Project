UPDATE dim_products
SET product_price = REPLACE(product_price, '£', '')


ALTER TABLE dim_products
ADD weight_class VARCHAR;


UPDATE dim_products
SET weight_class = CASE 
        WHEN weight_kg < 2 THEN 'Light'
        WHEN weight_kg >= 2 AND weight_kg < 40 THEN 'Mid_Sized'
        WHEN weight_kg >= 40 AND weight_kg < 140  THEN 'Heavy'
        WHEN weight_kg >= 140 THEN 'Truck_Required'
    END;


SELECT
     "EAN", length("EAN")
FROM
    dim_products
GROUP BY
    "EAN" 
ORDER BY
    length("EAN") desc;


ALTER TABLE dim_products
ALTER COLUMN "EAN"                                                                                                                                                                                      
TYPE VARCHAR(17);

SELECT
     product_code    , length(product_code    )
FROM
    dim_products
GROUP BY
     product_code
ORDER BY
    length(product_code) desc;


ALTER TABLE dim_products
ALTER COLUMN product_code                                                                                                                                                                                      
TYPE VARCHAR(11);


SELECT
     weight_class        , length(weight_class        )
FROM
    dim_products
GROUP BY
     weight_class    
ORDER BY
    length(weight_class    ) desc;


ALTER TABLE dim_products
ALTER COLUMN weight_class                                                                                                                                                                                          
TYPE VARCHAR(14);


ALTER TABLE dim_products
ALTER COLUMN uuid
TYPE uuid
USING uuid::uuid


ALTER TABLE dim_products
ALTER COLUMN date_added                
TYPE DATE
USING (date_added::text::date);


ALTER TABLE dim_products
ALTER COLUMN weight_kg
TYPE FLOAT
USING (weight_kg::FLOAT);


ALTER TABLE dim_products
ALTER COLUMN product_price                        
TYPE FLOAT
USING (product_price::FLOAT);


ALTER TABLE dim_products
RENAME COLUMN removed TO still_available;


ALTER TABLE dim_products
ALTER COLUMN still_available
TYPE BOOLEAN 
USING CASE
    when still_available = 'Removed' then false
    when still_available = 'Still_avaliable' then true
end;


SELECT column_name, data_type
current
FROM
INFORMATION_SCHEMA.COLUMNS
WHERE
table_name = 'dim_products';


SELECT*
from dim_products

ALTER TABLE dim_products 
ADD PRIMARY KEY (product_code);

SELECT * FROM orders_table
WHERE product_code 
NOT IN(SELECT dim_products.product_code 
FROM dim_products);