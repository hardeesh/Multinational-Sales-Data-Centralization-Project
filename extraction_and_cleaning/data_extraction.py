import yaml
from sqlalchemy import create_engine
import pandas as pd
import tabula
import requests
import boto3

class DataExtractor:
    def read_rds_tables(engine):
        legacy_users = pd.read_sql_table('legacy_users', engine)
        return pd.DataFrame(legacy_users)
    
    def read_orders_tables(engine):
        orders_table = pd.read_sql_table('orders_table', engine)
        return pd.DataFrame(orders_table)

    def read_pdf_data(self, link):
        pdf_extraction = tabula.read_pdf(link, pages='all')
        return pd.concat(pdf_extraction)
    
    def list_number_of_stores(self, endpoint, header):
        response = requests.get(endpoint, headers=header)
        number_stores = response.json()['number_stores']
        return (f'There are {number_stores} stores')
    
    def retrieve_stores_data(self, endpoint, header):
        stores_data = []
        for i in range(0, 451):
            url = (f'{endpoint}/{i}')
            response = requests.get(url, headers = header)
            stores_data.append(response.json())
        return pd.DataFrame(stores_data)
    
    def extract_from_s3(self, bucket, key):
        s3 = boto3.client('s3')
        download = s3.get_object(Bucket=bucket, Key=key)
        df = pd.read_csv(download['Body'])
        return df
    
    def extract_from_s3_json(self, bucket, key):
        s3 = boto3.client('s3')
        download = s3.get_object(Bucket=bucket, Key=key)
        df = pd.read_json(download['Body'])
        return df


