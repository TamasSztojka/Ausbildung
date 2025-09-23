from Validation import Validation
from Customer import Customer
from PrivateCustomer import PrivateCustomer
from CompanyCustomer import CompanyCustomer
from Product import Product
from ShoppingCart import ShoppingCart



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
try:
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

    new_customer = Customer(
        name="Max Mustermann",
        address="Musterstraße 1",
        email="maxyzaaaaaaaaaaaa@example.com",
        phone_number="+49123456789",
        password="geheim"
    )

    new_customer.save_customer(db)
    print("Inserted customer ID:", new_customer.id)

    fetched = Customer.load_customer(db, new_customer.id)
    print(f"Loaded: ID={fetched.id}, Name={fetched.name}, email={fetched.email}, Phone Number={fetched.phone_number}")

    fetched.name = "Maximilian Mustermann"
    fetched.update_customer(db)

    for customer in Customer.load_all_customers(db):
        print(f"ID={customer.id}, Name={customer.name}, Address={customer.address}, Email={customer.email}, Phone={customer.phone_number}")
        print()

    private_customer = PrivateCustomer(
        name="Erika Mustermann",
        address="Nebenstraße 5",
        email="erikaaaaaaaaaaaa@example.com",
        phone_number = "+49111222333",
        password = "strenggeheim",
        birthday = "1995-07-14"
    )

    private_customer.save_private_customer(db)
    print("Inserted private customer ID:", private_customer.id)

    customer = Customer.load_customer(db, 1)
    cart = ShoppingCart(customer, db)

    apple = Product.load_product(db, 4)  # Apple
    banana = Product.load_product(db, 5)  # Banana

    print("\n--- Test ShoppingCart ---")
    print("Initial total:", cart.price)

    cart.add_product(apple, 3)
    print("After adding 3 Apples:", cart.price)

    cart.add_product(banana, 2)
    print("After adding 2 Bananas:", cart.price)

    cart.remove_product(4)  # remove Apples
    print("After removing Apples:", cart.price)

    cart.clear_cart()
    print("After clearing cart:", cart.price)

except Exception as exception:
    print("Error:", exception)
finally:


    db.disconnect()

