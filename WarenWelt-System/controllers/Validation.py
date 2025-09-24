import re
from datetime import datetime

class Validation:
    @staticmethod
    def validate_email(email):
        pattern = r"^[\w\.-]+@[\w\.-]+\.\w+$"
        return re.match(pattern, email) is not None

    @staticmethod
    def validate_phone_number(phone_number):
        pattern = r"^\+?\d{8,20}$"
        return re.match(pattern, phone_number) is not None

    @staticmethod
    def validate_name(name):
        pattern = r"^[A-Za-zÄÖÜäöüß\s\-']+$"
        return re.match(pattern, name) is not None

    @staticmethod
    def validate_address(address):
        pattern = r"^[A-Za-z0-9ÄÖÜäöüß\s\.,\-]+$"
        return re.match(pattern, address) is not None

    @staticmethod
    def validate_birthday(birthday: str):
        try:
            return datetime.strptime(birthday, "%Y-%m-%d").date()
        except ValueError:
            return None

    @staticmethod
    def validate_company_number(company_number):
        pattern = r"^\d{5,15}$"
        return re.match(pattern, company_number) is not None

    @staticmethod
    def validate_password(password):
        pattern = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
        return re.match(pattern, password) is not None












