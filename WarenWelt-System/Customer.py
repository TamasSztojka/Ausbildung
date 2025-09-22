from Validation import *

class Customer(Validation):
    def __init__(self, name, address, email, phone_number, password, customer_id=None):
        self.__id = customer_id
        self.__name = name
        self.__address = address
        self.__email = email
        self.__phone_number = phone_number
        self.__password = password

    @property
    def id(self):
        return self.__id

    @property
    def name(self):
        return self.__name

    @name.setter
    def name(self, new_name):
        if Validation.validate_name(new_name):
            self.__name = new_name
        else:
            raise ValueError("Invalid Name")

    @property
    def address(self):
        return self.__address

    @address.setter
    def address(self, new_address):
        if Validation.validate_address(new_address):
            self.__address = new_address
        else:
            raise ValueError("Invalid Address")

    @property
    def email(self):
        return self.__email

    @email.setter
    def email(self, new_email):
        if Validation.validate_email(new_email):
            self.__email = new_email
        else:
            raise ValueError("Invalid Email")

    @property
    def phone_number(self):
        return self.__phone_number

    @phone_number.setter
    def phone_number(self, new_number):
        if Validation.validate_phone_number(new_number):
            self.__phone_number = new_number
        else:
            raise ValueError("Invalid Phone Number")

    @property
    def password(self):
        return self.__password

    @password.setter
    def password(self, new_password):
        if Validation.validate_password(new_password):
            self.__password = new_password
        else:
            raise ValueError("Invalid Password")

    def __str__(self):
        return f"Customer {self.id}: {self.name}, {self.email}, {self.phone_number}"

    def save_customer(self, storage):
        query = "INSERT INTO customers (name, address, email, phone_number, password)VALUES (%s, %s, %s, %s, %s)"
        self.__id = storage.execute_query(query, (
            self.__name,
            self.__address,
            self.__email,
            self.__phone_number,
            self.__password
        ))

    @staticmethod
    def load_customer(storage, customer_id):
        query = "SELECT id, name, address, email, phone_number, password FROM customers WHERE id = %s"
        row = storage.fetch_one(query, (customer_id,))
        if row:
            return Customer(name=row[1], address=row[2], email=row[3], phone_number=row[4], password=row[5], customer_id=row[0])
        return None

    def update_customer(self, storage):
        query = "UPDATE customers SET name = %s ,address = %s, email = %s, phone_number = %s, password = %s WHERE id = %s"
        storage.execute_query(query, (self.__name, self.__address, self.__email, self.__phone_number, self.__password, self.__id))

    @staticmethod
    def load_all_customers(storage):
        query = "SELECT id, name, address, email, phone_number, password FROM customers"
        rows = storage.fetch_all(query)
        customers = [
            Customer(
                name=row[1],
                address=row[2],
                email=row[3],
                phone_number=row[4],
                password=row[5],
                customer_id=row[0]
            )
            for row in rows
        ]
        return customers