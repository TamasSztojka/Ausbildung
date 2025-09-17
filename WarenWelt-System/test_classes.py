from Validation import Validation
from Customer import Customer
from PrivateCustomer import PrivateCustomer
from CompanyCustomer import CompanyCustomer
from Product import Product



def test_validator():
    print("=== Validator Tests ===")
    print("Email valid:", Validation.validate_email("test@mail.de"))
    print("Email invalid:", Validation.validate_email("testmail"))
    print("Phone-number valid:", Validation.validate_phone_number("+49123456789"))
    print("Phone-number invalid:", Validation.validate_phone_number("12"))
    print("Password valid:", Validation.validate_password("Abc123!x"))
    print("Password invalid:", Validation.validate_password("abc"))
    print("Name valid:", Validation.validate_name("Max Mustermann"))
    print("Name invalid:", Validation.validate_name("M@x!"))
    print("Address valid:", Validation.validate_address("Musterstraße 12, 12345 Berlin"))
    print("Address invalid:", Validation.validate_address("x"))
    print("Birthday valid:", Validation.validate_birthday("1990-01-01"))
    print("Birthday invalid:", Validation.validate_birthday("01.01.1990"))
    print("Company-number valid:", Validation.validate_company_number("1234567"))
    print("Company-number invalid:", Validation.validate_company_number("12ab"))
    print()

def test_customer():
    print("=== Customer Tests ===")
    try:
        customer = Customer("Max Mustermann", "Musterstraße 1", "max@test.com", "+49123456789", "Password1!")
        print(customer)
        customer.email = "new@mail.com"
        print("New Email", customer.email)
        customer.phone_number = "abc"   #should be an error
    except ValueError as exception:
        print("Error:", exception)
    print()

def test_private_customer():
    print("=== Privatkunde Tests ===")
    private_customer = PrivateCustomer(
        "Anna Schmidt", "Hauptstraße 5", "anna@test.de", "+43123456789", "StrongPwd1!", "1990-01-01"
    )
    print("Age:", private_customer.calculate_age(), "Years old")
    print()

def test_company_customer():
    print("=== Company Customer Tests ===")
    try:
        company_customer = CompanyCustomer("Müller GmbH", "Industriestraße 7", "firma@test.de", "+49111111111", "FirmPwd123!", "1234567")
        print(company_customer)
    except ValueError as exception:
        print("Error:", exception)
    print()

from Storage import Storage


db = Storage("warenwelt_datenbank")
db.connect()

if db.is_connected():
    print("Connected to database!")
else:
    print("Not connected!")

test_validator()
test_customer()
test_private_customer()
test_company_customer()

all_products = Product.load_all_products(db)

for products in all_products:
    print(f"ID={products.id}, Name={products.name}, Price={products.price}, Weight={products.weight}")

product_id_to_load = 3
products = Product.load_product(db, product_id_to_load)

if products:
    print(f"ID={products.id}, Name={products.name}, Price={products.price}, Weight={products.weight}")
else:
    print("No product found with that ID.")



