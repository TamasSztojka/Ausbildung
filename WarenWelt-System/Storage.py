import mysql.connector

class Storage:
    def __init__(self, warenwelt_datenbank):
        self.__warenwelt_datenbank = warenwelt_datenbank
        self.__connection = None

    def connect(self):
        if self.__connection is None:
            self.__connection = mysql.connector.connect(
                host="localhost",
                user="root",
                password="Sztojka5728",
                database=self.__warenwelt_datenbank
            )

    def is_connected(self):
        if self.__connection is None:
            return False
        try:
            self.__connection.ping(reconnect=False, attempts=1, delay=0)
            return True
        except mysql.connector.Error:
            return False

    def disconnect(self):
        if self.__connection:
            self.__connection.close()
            self.__connection = None

    def execute_query(self, query, params=None):
        if self.__connection is None:
            raise Exception("No database connection")
        cursor = self.__connection.cursor()
        cursor.execute(query, params)
        self.__connection.commit()
        return cursor

    def fetch_one(self, query, params=None):
        if self.__connection is None:
            raise Exception("No database connection")
        cursor = self.__connection.cursor()
        cursor.execute(query, params)
        return cursor.fetchone()

    def fetch_all(self, query, params=None):
        if self.__connection is None:
            raise Exception("No database connection")
        cursor = self.__connection.cursor()
        cursor.execute(query, params)
        return cursor.fetchall()

