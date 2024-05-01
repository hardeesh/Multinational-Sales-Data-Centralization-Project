SELECT
     day, length(day)
FROM
    dim_date_times
GROUP BY
    day
ORDER BY
    length(day) desc;


ALTER TABLE dim_date_times
ALTER COLUMN day                                                                                                                                                                                      
TYPE VARCHAR(2);


ALTER TABLE dim_date_times
ALTER COLUMN date_uuid 
TYPE uuid
USING date_uuid::uuid


ALTER TABLE dim_date_times
ALTER COLUMN day 
TYPE VARCHAR
USING day::VARCHAR



SELECT column_name, data_type
current
FROM
INFORMATION_SCHEMA.COLUMNS
WHERE
table_name = 'dim_date_times';


SELECT*
FROM dim_date_times

ALTER TABLE dim_date_times 
ADD PRIMARY KEY (date_uuid);