from flask import Flask, render_template, request, redirect, url_for, flash

app = Flask(__name__)
app.secret_key = "my_secret_key"

@app.route("/")
def home():
    return render_template("login.html")

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

app.run(debug=True)