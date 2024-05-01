--How many stores does the business have and in which countries?

SELECT
     country_code, COUNT(country_code) as total_no_stores
FROM
    dim_store_details
GROUP BY
    country_code
ORDER BY COUNT(country_code) DESC


--Which locations currently have the most stores?

SELECT
     locality, COUNT(locality) as total_no_stores
FROM
    dim_store_details
GROUP BY
    locality
ORDER BY COUNT(locality) DESC
LIMIT 10


--Which months produces the largest amount of sales?

SELECT 
    sum(dim_products.product_price * orders_table.product_quantity) as total_sales,
    dim_date_times.month
FROM dim_products
JOIN orders_table ON dim_products.product_code = orders_table.product_code
JOIN dim_date_times ON orders_table.date_uuid = dim_date_times.date_uuid
GROUP BY 
    dim_date_times.month
ORDER BY total_sales DESC
    

--How many sales are comning from online?

SELECT 
    CASE 
        WHEN store_code = 'WEB-1388012W' THEN 'Web'
        ELSE 'Offline'
    END AS location,
    COUNT(product_quantity) AS number_of_sales,
    SUM(product_quantity) AS suproduct_quantity_countm
FROM 
    orders_table
GROUP BY 
    CASE 
        WHEN store_code = 'WEB-1388012W' THEN 'Web'
        ELSE 'Offline'
    END;

--OR--

SELECT 
    'Web' AS location,
    COUNT(product_quantity) AS number_of_sales,
    SUM(product_quantity) AS product_quantity_count
FROM 
    orders_table
WHERE 
    store_code = 'WEB-1388012W'
UNION ALL
SELECT 
    'Offline' AS location,
    COUNT(product_quantity) AS number_of_sales,
    SUM(product_quantity) AS product_quantity_count
FROM 
    orders_table
WHERE 
    store_code != 'WEB-1388012W';



--What percentage of sales come through each type of store?

SELECT 
    dim_store_details.store_type,
    sum(dim_products.product_price * orders_table.product_quantity) as total_sales, 
    count(dim_products.product_price * orders_table.product_quantity) * 100 / sum(count(dim_products.product_price * orders_table.product_quantity)) over () AS percentage_total
FROM 
    dim_products
JOIN 
    orders_table ON dim_products.product_code = orders_table.product_code
JOIN 
    dim_store_details ON orders_table.store_code = dim_store_details.store_code
GROUP BY 
    dim_store_details.store_type
ORDER BY 
    total_sales DESC;


--Which month in each year produced the highest cost of sales?

SELECT
    sum(dim_products.product_price * orders_table.product_quantity) as total_sales,
    dim_date_times.year,
    dim_date_times.month
FROM 
    dim_products
JOIN 
    orders_table ON dim_products.product_code = orders_table.product_code
JOIN 
    dim_date_times ON orders_table.date_uuid = dim_date_times.date_uuid
GROUP BY 
    dim_date_times.year, dim_date_times.month
ORDER BY 
    total_sales DESC
LIMIT
    10;


-- What is our staff headcount?

SELECT 
    SUM(staff_numbers),
    country_code
FROM
    dim_store_details
GROUP BY
    country_code


-- Which German store type is selling the most?

SELECT 
    sum(dim_products.product_price * orders_table.product_quantity) as total_sales,
    dim_store_details.store_type,
    dim_store_details.country_code
FROM
    dim_products
JOIN 
    orders_table ON dim_products.product_code = orders_table.product_code
JOIN 
    dim_store_details ON orders_table.store_code = dim_store_details.store_code
WHERE
    country_code = 'DE'
GROUP BY
    country_code, store_type
ORDER BY 
    total_sales ASC


-- How quickly is the company making sales?

SELECT 
    year,
    AVG(next_date - full_date) AS actual_time_taken
FROM
    (
        SELECT
            to_timestamp(concat(year, '-', (EXTRACT(MONTH FROM TO_DATE(month, 'Mon'))), '-', day, '-', timestamp), 'YYYY-MMM-DD HH24:MI:SS') AS full_date,
            LEAD(to_timestamp(concat(year, '-', (EXTRACT(MONTH FROM TO_DATE(month, 'Mon'))), '-', day, '-', timestamp), 'YYYY-MMM-DD HH24:MI:SS')) OVER (ORDER BY to_timestamp(concat(year, '-', (EXTRACT(MONTH FROM TO_DATE(month, 'Mon'))), '-', day, '-', timestamp), 'YYYY-MMM-DD HH24:MI:SS')) AS next_date,
            year
        FROM 
            dim_date_times       
    ) AS dates
GROUP BY
    year
ORDER BY
    actual_time_taken asc


