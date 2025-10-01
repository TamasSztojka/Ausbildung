from flask import Flask, render_template, request, redirect, url_for, flash, session
from model.Customer import Customer
from controllers.Validation import Validation
from model.Storage import Storage
from model.ShoppingCart import ShoppingCart
from model.Electronics import Electronics
from model.Clothes import Clothes
from model.Books import Books
from model.Product import Product

app = Flask(__name__)
app.secret_key = "my_secret_key"

storage = Storage("warenwelt_datenbank")
storage.connect()

@app.route("/")
@app.route("/products")
def products_page():
    selected_category = request.args.get("category", "")
    selected_sort = request.args.get("sort", "")

    products = []
    if selected_category == "Electronics":
        products = Electronics.load_all(storage, sort=selected_sort)
    elif selected_category == "Clothes":
        products = Clothes.load_all(storage, sort=selected_sort)
    elif selected_category == "Books":
        products = Books.load_all(storage, sort=selected_sort)
    else:
        # All categories combined
        products = (
            Electronics.load_all(storage, sort=selected_sort)
            + Clothes.load_all(storage, sort=selected_sort)
            + Books.load_all(storage, sort=selected_sort)
        )

    return render_template(
        "products.html",
        products=products,
        categories=["Electronics", "Clothes", "Books"],
        selected_category=selected_category,
        selected_sort=selected_sort,
    )

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

@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        email = request.form.get("email")
        password = request.form.get("password")

        customer = Customer.authenticate(storage, email, password)

        if customer:
            flash("Login Successful", "success")

            cart = ShoppingCart(customer, storage)
            session["customer_id"] = customer.id
            session["cart_id"] = cart.cart_id

            return redirect(url_for("products_page"))
        else:
            flash("Invalid email or password", "error")

    return render_template("login.html")

@app.route("/cart", methods=["GET", "POST"])
@app.route("/cart", methods=["GET", "POST"])
def cart():
    if "cart" not in session:
        session["cart"] = []

    if request.method == "POST":
        product_id = int(request.form.get("product_id"))
        product = Product.load_product(storage, product_id)
        if product:
            session["cart"].append({
                "id": product.id,
                "name": product.name,
                "price": product.price
            })
            session.modified = True
            flash(f"{product.name} added to cart", "success")

    return render_template("cart.html", cart=session["cart"])

@app.route("/checkout")
def checkout():
    return render_template("checkout.html")


app.run(debug=True)

