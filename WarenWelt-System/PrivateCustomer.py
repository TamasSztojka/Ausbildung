from Customer import Customer
from Exception import DatabaseExecutionError
from Validation import Validation
from datetime import date


class PrivateCustomer(Customer):
    def __init__(self, name, address, email, phone_number, password, birthday):
        super().__init__(name, address, email, phone_number, password)
        self._birthday = self._validate_birthday(birthday)

    @staticmethod
    def _validate_birthday(value):
        validated = Validation.validate_birthday(value)
        if validated is None:
            raise ValueError("Invalid Birthday. Expected Format: YYYY-MM-DD")
        return validated

    @property
    def birthday(self):
        return self._birthday

    @birthday.setter
    def birthday(self, value):
        self._birthday = self._validate_birthday(value)

    def calculate_age(self) -> int:
        today = date.today()
        age = today.year - self._birthday.year - (
            (today.month, today.day) < (self._birthday.month, self._birthday.day)
        )
        return age

    def save_private_customer(self, storage):
        conn = storage.connection

        try:
            conn.autocommit = False

            super().save_customer(storage)

            query = "INSERT INTO private_customers(customer_id, birthday) VALUES (%s, %s)"
            storage.execute_query(query, (self.id, self.birthday.strftime("%Y-%m-%d")))
            conn.commit()

        except DatabaseExecutionError as err:
            conn.rollback()
            raise DatabaseExecutionError(f"Error while saving private customer: {err}")

        finally:
            conn.autocommit = True
