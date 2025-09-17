from Validation import *

class Customer(Validation):
    _id_counter = 1

    def __init__(self, name, address, email, phone_number, password):
        self.__id = Customer._id_counter
        Customer._id_counter += 1

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