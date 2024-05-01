ALTER TABLE dim_users
DROP COLUMN index;

SELECT
     country_code, length(country_code)
FROM
    dim_users
GROUP BY
    country_code   
ORDER BY
    length(country_code) desc;


ALTER TABLE dim_users
ALTER COLUMN last_name
TYPE VARCHAR(255);

ALTER TABLE dim_users
ALTER COLUMN first_name
TYPE VARCHAR(255);

ALTER TABLE dim_users
ALTER COLUMN country_code
TYPE VARCHAR(2);


ALTER TABLE dim_users
ALTER COLUMN date_of_birth  
TYPE DATE;

ALTER TABLE dim_users
ALTER COLUMN join_date        
TYPE DATE;

ALTER TABLE dim_users
ALTER COLUMN user_uuid
TYPE uuid
USING user_uuid::uuid;


SELECT column_name, data_type
current
FROM
INFORMATION_SCHEMA.COLUMNS
WHERE
table_name = 'dim_users';


ALTER TABLE dim_users 
ADD PRIMARY KEY (user_uuid);


SELECT * FROM orders_table
WHERE user_uuid 
NOT IN(SELECT dim_users.user_uuid 
FROM dim_users);