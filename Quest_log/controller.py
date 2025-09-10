from tkinter import messagebox
from model import load_adventurers, save_adventurers
import re
import session

def login(username_entry, password_entry, root, menu_frame):
    username = username_entry.get().strip()
    password = password_entry.get()

    if not username or not password:
        messagebox.showerror("Missing info", "Both Name and Arcane Key are required")
        return

    adventurers = load_adventurers()

    if username not in adventurers["adventurers"]:
        messagebox.showerror("Invalid Username", "Username is not registered")
        return

    if adventurers["adventurers"][username]["password"] == password:
        session.current_user = username
        messagebox.showinfo("Success", f"Gate opened. Welcome back, {username}!")
        show_main_menu(menu_frame, root)
    else:
        messagebox.showerror("Denied", "Arcane Key incorrect.")


def register(username_entry, password_entry, root, menu_frame):
    username = username_entry.get().strip()
    password = password_entry.get()

    if not username or not password:
        messagebox.showerror("Missing info", "Both Name and Arcane Key are required")
        return

    adventurers = load_adventurers()

    ok, err = validate_registration(username, password, adventurers)
    if not ok:
        messagebox.showerror("Denied", err or "Please enter a valid username and password.")
        return

    default_stats = {
        "health": 100,
        "stamina": 100,
        "mana": 100,
        "strength": 1,
        "dexterity": 1,
        "intelligence": 1,
    }

    adventurers["adventurers"][username] = {
        "password": password,
        "class": None,
        "level": 1,
        "experience": 0,
        "stats": default_stats
    }
    session.current_user = username
    save_adventurers(adventurers)

    show_main_menu(menu_frame, root)


def validate_registration(username, password, adventurers):
    if username in adventurers["adventurers"]:
        return False, "Username already exists"

    if not re.match(r"^[a-zA-Z0-9]+$", username):
        return False, "Username must be alphanumeric"

    if not (3 <= len(password) <= 120):
        return False, "Password must be between 3 and 120 characters"

    return True, None

def show_main_menu(menu_frame, root):
    from view import main_menu_window

    menu_frame.pack_forget()
    main_menu_window(root, menu_frame)

def logout_function(main_menu_frame, parent):
    from view import login_window

    main_menu_frame.pack_forget()
    login_window(parent)

def choose_class_function(main_menu_frame, parent):
    from view import choose_class_window

    main_menu_frame.pack_forget()
    choose_class_window(main_menu_frame, parent)

def choose_class(chosen_class, main_menu_frame, choose_class_frame):
    username = session.current_user

    adventurers = load_adventurers()
    if username in adventurers["adventurers"]:
        adventurers["adventurers"][username]["class"] = chosen_class
        save_adventurers(adventurers)

    choose_class_frame.pack_forget()
    main_menu_frame.pack(fill="both", expand=True)

def back_to_menu(status_frame, parent):
    from view import main_menu_window

    status_frame.pack_forget()
    main_menu_window(parent, status_frame)




