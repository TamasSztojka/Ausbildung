from Customer import Customer
from Validation import Validation

class CompanyCustomer(Customer):
    def __init__(self, name, address, email, phone_number, password, company_number):
        super(CompanyCustomer, self).__init__(name, address, email, phone_number, password)
        self._company_number = Validation.validate_company_number(company_number)


