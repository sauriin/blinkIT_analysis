import sqlite3
import pandas as pd

df = pd.read_csv('Dataset/blinkit_cleaned_dataset.csv')

conn = sqlite3.connect('blinkit.db')

df.to_sql(
    'blinkit',
    conn,
    if_exists='replace',
    index=False
)

conn.close()

print("Database created successfully")