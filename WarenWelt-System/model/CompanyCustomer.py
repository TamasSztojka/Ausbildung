from model.Customer import Customer
from controllers.Exception import DatabaseExecutionError
from controllers.Validation import Validation

class CompanyCustomer(Customer):
    def __init__(self, name, address, email, phone_number, password, company_number):
        super(CompanyCustomer, self).__init__(name, address, email, phone_number, password)
        if Validation.validate_company_number(company_number):
            self._company_number = company_number
        else:
            raise ValueError("Invalid company number")

    def save_company_customer(self, storage):
        conn = storage.connection

        try:
            conn.autocommit = False

            super().save_customer(storage)

            query = "INSERT INTO company_customers(customer_id, company_number) VALUES (%s, %s)"
            storage.execute_query(query, (self.id, self._company_number))
            conn.commit()

        except DatabaseExecutionError as error:
            conn.rollback()
            raise DatabaseExecutionError(f"Error while saving company customer {error}")

        finally:
            conn.autocommit = True

