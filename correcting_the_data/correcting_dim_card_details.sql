SELECT
     expiry_date, length(expiry_date)
FROM
    dim_card_details
GROUP BY
    expiry_date
ORDER BY
    length(expiry_date) desc;


ALTER TABLE dim_card_details
ALTER COLUMN card_number                                                                                                                                                                                      
TYPE VARCHAR(19);


ALTER TABLE dim_card_details
ALTER COLUMN expiry_date             
TYPE VARCHAR(19)


ALTER TABLE dim_card_details
ALTER COLUMN date_payment_confirmed  
TYPE DATE
using date_payment_confirmed::date


SELECT column_name, data_type
current
FROM
INFORMATION_SCHEMA.COLUMNS
WHERE
table_name = 'dim_card_details';


SELECT*
FROM dim_card_details

ALTER TABLE dim_card_details 
ADD PRIMARY KEY (card_number);

SELECT constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_name = 'dim_card_details';


SELECT * FROM orders_table
WHERE card_number 
NOT IN(SELECT dim_card_details.card_number 
FROM dim_card_details);