# Multinational Sales Data Centralization Project 

## Description
The Multinational Sales Data Centralization Project is my initiative to centralize the sales data of our multinational company, providing a single source of truth for sales data. Throughout this project, I've gone through three main stages:

### 1. Data Collection
I utilized Python to collect sales data from various sources:
- **AWS RDS Database**: I extracted two pieces of data using SQL queries.
- **AWS S3 Bucket**: Retrieved data stored in PDF files using the tabula-py package.
- **External APIs**: I developed custom classes to extract data via API calls, allowing for easy input of API keys and values.

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
git clone https://github.com/your-username/multinational-sales-centralization.git



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





## License
This project is licensed under the MIT License. See the `LICENSE` file for more information.
