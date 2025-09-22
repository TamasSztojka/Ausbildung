import mysql.connector
from Exception import *

class Storage:
    def __init__(self, warenwelt_datenbank):
        self.__warenwelt_datenbank = warenwelt_datenbank
        self.connection = None

    def connect(self):
        try:
            if self.connection is None:
                self.connection = mysql.connector.connect(
                    host="localhost",
                    user="root",
                    password="Sztojka5728",
                    database=self.__warenwelt_datenbank
                )
        except mysql.connector.Error as err:
            raise DatabaseConnectionError(f"Connection failed: {err}")

    def is_connected(self):
        if self.connection is None:
            return False
        try:
            self.connection.ping(reconnect=False, attempts=1, delay=0)
            return True
        except mysql.connector.Error:
            return False

    def disconnect(self):
        try:
            if self.connection:
                self.connection.close()
                self.connection = None
        except mysql.connector.Error as err:
            raise DatabaseConnectionError(f"Error while disconnecting: {err}")

    def execute_query(self, query, params=None):
        if self.connection is None:
            raise Exception("No database connection")
        try:
            cursor = self.connection.cursor()
            cursor.execute(query, params)
            last_id = cursor.lastrowid
            cursor.close()
            if self.connection.autocommit:
                self.connection.commit()
            return last_id
        except mysql.connector.IntegrityError as err:
            raise DatabaseExecutionError(f"Integrity error: {err}")
        except mysql.connector.ProgrammingError as err:
            raise DatabaseConnectionError(f"Programming error in SQL: {err}")
        except mysql.connector.Error as err:
            raise DatabaseExecutionError(f"Database execution failed: {err}")

    def fetch_one(self, query, params=None):
        if self.connection is None:
            raise Exception("No database connection")
        try:
            cursor = self.connection.cursor()
            cursor.execute(query, params)
            row = cursor.fetchone()
            cursor.close()
            if not row:
                return None
            return row
        except mysql.connector.Error as err:
            raise DatabaseExecutionError(f"Error while fetching result: {err}")

    def fetch_all(self, query, params=None):
        if self.connection is None:
            raise Exception("No database connection")
        try:
            cursor = self.connection.cursor()
            cursor.execute(query, params)
            rows = cursor.fetchall()
            cursor.close()
            if not rows:
                return None
            return rows
        except mysql.connector.Error as err:
            raise DatabaseExecutionError(f"Error while fetching result: {err}")

