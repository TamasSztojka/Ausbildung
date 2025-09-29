from flask import Flask, render_template, request, redirect, url_for, flash

app = Flask(__name__)
app.secret_key = "my_secret_key"

@app.route("/")
def home():
    return render_template("register.html")

@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password")
        if username == "test" and password == "123":
            flash("Login Successful", "Success")
            return redirect(url_for("home"))
        else:
            flash("Invalid Login", "Error")

    return render_template("login.html")

@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        name = request.form.get("name")
        address = request.form.get("address")
        email = request.form.get("email")
        phone_number = request.form.get("phone_number")
        password = request.form.get("password")

        # ⚡ right now we just print it out and flash success
        print(f"New user: {name}, {address}, {email}, {phone_number}, {password}")

        flash("Registrierung erfolgreich! Bitte logge dich ein.", "success")
        return redirect(url_for("login"))

    return render_template("register.html")

app.run(debug=True)