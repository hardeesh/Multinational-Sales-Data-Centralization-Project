import yaml
import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy import inspect

class DatabaseConnector:
    def __init__(self, yaml_file):
        self.yaml_data = self.read_db_creds(yaml_file)
        self.engine = self.init_db_engine(self.yaml_data)
        
    def read_db_creds(self, yaml_file):
        with open(yaml_file) as file:
            data = yaml.safe_load(file)
        return data

    def init_db_engine(self, data):
        self.engine = create_engine(f"{data['DATABASE_TYPE']}+{data['DBAPI']}://{data['USER']}:{data['PASSWORD']}@{data['HOST']}:{data['PORT']}/{data['DATABASE']}")
        engine = self.engine.connect()
        return engine
    
    def list_db_tables(self):
        insp = inspect(self.engine)
        return insp.get_table_names()
    
    def upload_to_db(self, df, table_name):
        df.to_sql(table_name, self.engine, if_exists='replace', index=False)
        


    


