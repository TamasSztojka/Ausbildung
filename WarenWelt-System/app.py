from flask import Flask, render_template, request, redirect, url_for, flash, session
from model.Customer import Customer
from controllers.Validation import Validation
from model.Storage import Storage
from model.ShoppingCart import ShoppingCart
from model.Electronics import Electronics
from model.Clothes import Clothes
from model.Books import Books
from model.Product import Product
from model.Order import Order

app = Flask(__name__)
app.secret_key = "my_secret_key"

def get_storage():
    storage = Storage("warenwelt_datenbank")
    storage.connect()
    return storage


@app.route("/")
@app.route("/products")
def products_page():
    storage = get_storage()
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
            storage = get_storage()
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

        storage = get_storage()
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
def cart():
    if "cart" not in session:
        session["cart"] = []

    if request.method == "POST":
        product_id = int(request.form.get("product_id"))

        storage = get_storage()
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

@app.route("/checkout", methods=["GET", "POST"])
def checkout():
    if request.method == "POST":
        delivery_method = request.form.get("delivery")

        if "cart" not in session or not session["cart"]:
            flash("Your cart is empty!", "error")
            return redirect(url_for("cart"))

        storage = get_storage()
        products = []
        for item in session["cart"]:
            product = Product.load_product(storage, item["id"])
            if product:
                products.append((product, 1))

        storage = get_storage()
        customer = None
        if "customer_id" in session:
            customer = Customer.load_customer(storage, session["customer_id"])

        if not customer:
            flash("Please login to order", "error")
            return redirect(url_for("login"))

        order = Order(customer, products)
        order.create_invoice("invoice.txt")

        session["cart"] = []
        session.modified = True

        flash(f"Order Confirmed ({'Delivery' if delivery_method=='delivery' else 'Pickup'})", "success")
        return redirect(url_for("products_page"))

    return render_template("checkout.html")


if __name__ == "__main__":
    app.run(debug=True)