from flask import Flask, render_template, request, redirect, url_for, flash
from model.Customer import Customer
from controllers.Validation import Validation
from model.Storage import Storage

app = Flask(__name__)
app.secret_key = "my_secret_key"

storage = Storage("warenwelt_datenbank")
storage.connect()

products = [
    {"id": 1, "name": "Laptop", "price": 999},
    {"id": 2, "name": "Phone", "price": 499},
    {"id": 3, "name": "Headphones", "price": 99},
    {"id": 4, "name": "Smartwatch", "price": 199},
]

@app.route("/")
def products_page():
    return render_template("products.html", products=products)

@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        email = request.form.get("email")
        password = request.form.get("password")

        customer = Customer.authenticate(storage, email, password)

        if customer:
            flash("Login Successful", "success")
            return redirect(url_for("products_page"))
        else:
            flash("Invalid email or password", "error")

    return render_template("login.html")

@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        name = request.form.get("name")
        address = request.form.get("address")
        email = request.form.get("email")
        phone_number = request.form.get("phone_number")
        password = request.form.get("password")

        errors = validate_entrys(name, address, email, phone_number, password)

        if errors:
            for error in errors:
                flash(error, "Error")
            return render_template("register.html")

        try:
            customer = Customer(
                name=name,
                address=address,
                email=email,
                phone_number=phone_number,
                password=password
            )
            customer.save_customer(storage)

            flash("Registration Successful! Please log in", "Success")
            return redirect(url_for("login"))
        except Exception as exception:
            flash("An error occurred while register. Please try again", "error")
            print("DEBUG: ", exception)

    return render_template("register.html")

def validate_entrys(name, address, email, phone_number, password):
    errors = []
    if not Validation.validate_name(name):
        errors.append("Invalid name: only letters, spaces, - and ' allowed.")
    if not Validation.validate_address(address):
        errors.append("Invalid address: please use valid characters.")
    if not Validation.validate_email(email):
        errors.append("Invalid email format.")
    if phone_number and not Validation.validate_phone_number(phone_number):
        errors.append("Invalid phone number.")
    if not Validation.validate_password(password):
        errors.append("Password must be at least 8 characters, contain letters and numbers.")
    return errors

@app.route("/cart")
def cart():
    cart = []  # dummy cart
    return render_template("cart.html", cart=cart)

@app.route("/checkout")
def checkout():
    return render_template("checkout.html")


app.run(debug=True)

