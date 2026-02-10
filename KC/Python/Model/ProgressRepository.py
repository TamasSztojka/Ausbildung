import mysql.connector

class ProgressRepository:
    def __init__(self):
        # Open a persistent connection to the progress database
        self.connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Sztojka5728",   # change
            database="progress"             # your DB name
        )
        self._init_db()

    def _init_db(self):
        # Ensure progress table exists
        cursor = self.connection.cursor()
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS progress (
                id INT PRIMARY KEY,
                learned INT DEFAULT 0,
                wrong_count INT DEFAULT 0,
                correct_count INT DEFAULT 0
            )
        """)
        self.connection.commit()
        cursor.close()

    def get(self, vocab_id):
        # Fetch progress for one vocab entry
        cursor = self.connection.cursor()
        cursor.execute(
            "SELECT learned, wrong_count, correct_count FROM progress WHERE id=%s",
            (vocab_id,)
        )
        row = cursor.fetchone()
        cursor.close()
        return row if row else (0, 0, 0)

    def set(self, vocab_id, learned, wrong, correct):
        cursor = self.connection.cursor()
        cursor.execute("""
            INSERT INTO progress (id, learned, wrong_count, correct_count)
            VALUES (%s, %s, %s, %s)
            ON DUPLICATE KEY UPDATE
                learned = VALUES(learned),
                wrong_count = VALUES(wrong_count),
                correct_count = VALUES(correct_count)
        """, (vocab_id, learned, wrong, correct))
        self.connection.commit()
        cursor.close()

    def reset(self):
        # Reset progress
        cursor = self.connection.cursor()
        cursor.execute("DELETE FROM progress")
        self.connection.commit()
        cursor.close()

    def all_rows(self):
        #fetch all rows
        cursor = self.connection.cursor()
        cursor.execute("SELECT id, learned, wrong_count, correct_count FROM progress")
        rows = cursor.fetchall()
        cursor.close()
        return {row[0]: (row[1], row[2], row[3]) for row in rows}