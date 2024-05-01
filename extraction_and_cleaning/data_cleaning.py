import pandas as pd
import re

class DataCleaning:
    def drop_nulls(self, df):
        df = df.dropna(inplace=True)
        return df

    def to_datetime(self, df, column):
        df[column] = pd.to_datetime(df[column], errors='coerce')
        return df[column] 

  