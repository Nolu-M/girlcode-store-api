import os 
from psycopg2 import pool

conn_pool = pool.SimpleConnectionPool(
    1, 100,
    database=os.getenv('DB_NAME'),
    host=os.getenv('DB_HOST'),
    port=os.getenv('DB_POST'),
    user=os.getenv('DB_USER'),
    password=os.getenv('DB_PASS')
)

class db:
    def __init__(self, table):
        self.table = table
        self.pool = conn_pool


    def select(self,columns='*', condition=None, joins=None):
        conn = self.pool.getconn()
        cursor = conn.cursor()

        joins_stat=None

        if joins:
            for j in joins:
                tmp_st = f'FULL OUTER JOIN {j["table"]} ON {j["on_cond"]}'
                joins_stat = f'{str(joins_stat or"")} {tmp_st} '

        cursor.execute(f'SELECT {columns} FROM {self.table} {str(joins_stat or "")} {str(condition or "")} ORDER BY {self.table}.id ASC')

        rows = cursor.fetchall()




        conn.close()

        return rows