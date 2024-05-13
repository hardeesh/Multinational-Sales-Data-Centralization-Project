# Multinational Sales Data Centralization Project 

## Description
The Multinational Sales Data Centralization Project is my initiative to centralize the sales data of our multinational company, providing a single source of truth for sales data. Throughout this project, I've gone through three main stages:

### 1. Data Collection
I utilized Python to collect sales data from various sources:

AWS RDS Database: Initially, I extracted data from an AWS RDS database. This process involved executing SQL queries to retrieve two distinct datasets.

AWS S3 Bucket (PDF Files): Subsequently, I accessed sales data stored in PDF files within an AWS S3 bucket. Utilizing the tabula-py package, I extracted the relevant information from these documents.

External APIs: To acquire additional data, I developed custom classes to interact with external APIs. These classes facilitated the retrieval of data via API calls. Access to these APIs required the inclusion of API keys and corresponding values for authentication.

AWS S3 Bucket (CSV Files): Another source of data was CSV files stored in an AWS S3 bucket. I accessed and processed these files as part of the data collection process.

AWS RDS Database (Additional Data): Additionally, I retrieved supplementary data stored in a database on AWS RDS. This enriched the dataset and provided further insights into sales metrics.

JSON File: Finally, I obtained data from a JSON file, serving as another valuable source for analysis and exploration.

### 2. Database Schema Design
Once I collected the data, I collated it into a star-based schema database using PostgreSQL. This involved:
- Designing a schema that reflects the relationships between different aspects of sales data.
- Ensuring the columns are of the correct type and defining primary and foreign keys for efficient querying.
- Implementing SQL scripts to create tables and establish relationships within the database.

### 3. Data Analysis and Querying
With all my sales data centralized in the database, I performed data analysis and answered business questions by querying the data using SQL. This allowed me to:
- Extract up-to-date metrics and insights from the sales data.

## Installation
To install and set up the project, follow these steps:

1. Clone the repository:
```git clone https://github.com/your-username/multinational-sales-centralization.git```

## Usage
To use the project, follow these guidelines:

1. Set up the PostgreSQL database:
- Create a PostgreSQL database and configure the connection details in the `database.py` file.
- Use the provided SQL scripts to create the star-based schema, tables, and relationships in the database.

2. Collect sales data:
- Utilize tabula-py to extract data from PDF files stored in AWS S3.
- Implement custom classes to extract data from external APIs, providing API keys and values as input parameters.

3. Import data into the database:
- Populate the database tables with the collected sales data using SQL `INSERT` statements or Python scripts.

4. Run queries:
- Utilize SQL queries to extract up-to-date metrics and insights from the centralized sales data.
- Answer business questions and analyze the data to make informed, data-driven decisions.

## File Structure
MRDC/
├── correcting_the_data/
│   ├── correcting_dim_card_details.sql
│   ├── correcting_dim_date_times.sql
│   ├── correcting_dim_products.sql
│   ├── correcting_dim_store_details.sql
│   ├── correcting_dim_users.sql
│   └── correcting_orders_table.sql

├── extraction_and_cleaning/
│   ├── card_details_cleaning.ipynb
│   ├── data_cleaning.py
│   ├── data_extraction.py
│   ├── database_utils.py
│   ├── date_events_cleaning.ipynb
│   ├── legend_user_cleaning.ipynb
│   ├── orders_table.ipynb
│   ├── product_details.ipynb
│   └── store_details_cleaning.ipynb

└── querying_the_data/
    ├── querying_the_data.ipynb
    └── querying_the_data.sql

## Acknowledgements
I would like to give credit to the support received from the AiCore team for their continuous support and guidance throughout this project. Their expertise and encouragement have been invaluable in driving the success of this endeavor.
