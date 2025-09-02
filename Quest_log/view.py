from tkinter import ttk

import session
from controller import register, login, logout_function, choose_class_function, choose_class, back_to_menu
from model import load_adventurers, save_adventurers


def login_window(root):
    root.title("Quest Log")
    root.configure(background="black")

    style = ttk.Style()
    style.theme_use("clam")
    style.configure("My.TFrame", background="black")

    menu_frame = ttk.Frame(root, style="My.TFrame", padding=20)
    menu_frame.pack()

    login_window_body(menu_frame, root)

    return menu_frame

def login_window_body(menu_frame, root):
    style = ttk.Style()
    style.theme_use("clam")
    style.configure("Title.TLabel", font=("MedievalSharp", 25), foreground="gold")
    style.configure("Subtitle.TLabel", font=("MedievalSharp", 20), foreground="gold")
    style.configure("My.TEntry", foreground="black", insertcolor="black", font=("MedievalSharp", 20))
    style.configure("Frame.TButton", foreground="Black", background="black", fieldbackground="black")
    style.configure("My.TButton", foreground="black", font=("MedievalSharp", 20), background="#FFA500")

    ttk.Label(menu_frame, text="Welcome Adventurer", background="black", style="Title.TLabel").pack(pady=20)
    ttk.Label(menu_frame, text="Please enter thy credentials to open the gate", background="black", style="Title.TLabel").pack(pady=20)

    ttk.Label(menu_frame, text="Please enter your name", background="black", style="Subtitle.TLabel").pack(pady=20)
    username = ttk.Entry(menu_frame, style="My.TEntry", width=30)
    username.pack(pady=20)
    ttk.Label(menu_frame, text="Please enter your Arcane Key", background="black", style="Subtitle.TLabel").pack(pady=20)
    password = ttk.Entry(menu_frame, style="My.TEntry", width=30, show="*")
    password.pack(pady=20)

    button_frame = ttk.Frame(menu_frame, padding=10, style= "Frame.TButton", borderwidth=0, relief="flat")
    button_frame.pack(padx=20, pady=20)

    continue_button = ttk.Button(button_frame, text="Continue", command=lambda:login(username, password, root, menu_frame), style="My.TButton")
    start_button = ttk.Button(button_frame, text="Start", command=lambda:register(username, password, root, menu_frame), style="My.TButton")
    continue_button.grid(row=0, column=0, padx=10, pady=10)
    start_button.grid(row=0, column=1, padx=10, pady=10)

def main_menu_window(parent, menu_frame):
    style = ttk.Style()
    style.theme_use("clam")
    style.configure("My.TFrame", background="black")
    style.configure("Title.TLabel", font=("MedievalSharp", 25), foreground="gold", background="black")
    style.configure("Frame.TButton", foreground="Black", background="black", fieldbackground="black")
    style.configure("My.TButton", foreground="black", font=("MedievalSharp", 20), background="#FFA500")

    main_menu_frame = ttk.Frame(parent, style="My.TFrame")
    main_menu_frame.pack(padx=20, pady=20)

    ttk.Label(main_menu_frame, text="Welcome Back, Adventurer", style="Title.TLabel").pack(pady=20)

    button_frame = ttk.Frame(main_menu_frame, style="My.TFrame")
    button_frame.pack(padx=20, pady=20)
    choose_class_button = ttk.Button(button_frame, text="Choose Class", command=lambda:choose_class_function(main_menu_frame, parent), style="My.TButton")
    choose_class_button.grid(row=0, column=0, padx=10, pady=10)
    status_button = ttk.Button(button_frame, text="Status", command=lambda: show_status_window(main_menu_frame, parent), style="My.TButton")
    status_button.grid(row=1, column=0, padx=10, pady=10)
    quests_button = ttk.Button(button_frame, text="Quests", style="My.TButton")
    quests_button.grid(row=2, column=0, padx=10, pady=10)
    logout_button = ttk.Button(button_frame, text="Logout", command=lambda:logout_function(main_menu_frame, parent), style="My.TButton")
    logout_button.grid(row=3, column=0, padx=10, pady=10)
    quit_button = ttk.Button(button_frame, text="Quit", command=lambda:quit(), style="My.TButton")
    quit_button.grid(row=4, column=0, padx=10, pady=10)

    return main_menu_frame

def choose_class_window(main_menu_frame, parent):
    style = ttk.Style()
    style.theme_use("clam")
    style.configure("My.TFrame", background="black")
    style.configure("Title.TLabel", font=("MedievalSharp", 25), foreground="gold", background="black")
    style.configure("Frame.TButton", foreground="Black", background="black", fieldbackground="black")
    style.configure("My.TButton", foreground="black", font=("MedievalSharp", 20), background="#FFA500")

    choose_class_frame = ttk.Frame(parent, style="My.TFrame")
    choose_class_frame.pack(padx=20, pady=20)

    ttk.Label(choose_class_frame, text="Welcome Back, Adventurer", style="Title.TLabel").pack(pady=20)

    button_frame = ttk.Frame(choose_class_frame, style="My.TFrame")
    button_frame.pack(padx=20, pady=20)
    warrior_button = ttk.Button(button_frame, text="Warrior", command=lambda:choose_class("Warrior", main_menu_frame, choose_class_frame), style="My.TButton")
    warrior_button.grid(row=0, column=0, padx=10, pady=10)
    mage_button = ttk.Button(button_frame, text="Mage", command=lambda:choose_class("Mage", main_menu_frame, choose_class_frame), style="My.TButton")
    mage_button.grid(row=1, column=0, padx=10, pady=10)
    thief_button = ttk.Button(button_frame, text="Thief", command=lambda:choose_class("Thief", main_menu_frame, choose_class_frame), style="My.TButton")
    thief_button.grid(row=2, column=0, padx=10, pady=10)

def show_status_window(main_menu_frame, parent):
    style = ttk.Style()
    style.theme_use("clam")
    style.configure("My.TFrame", background="black")
    style.configure("Title.TLabel", font=("MedievalSharp", 25), foreground="gold", background="black")
    style.configure("Stat.TLabel", font=("MedievalSharp", 16), foreground="white", background="black")
    style.configure("My.TButton", foreground="black", font=("MedievalSharp", 16), background="#FFA500")

    main_menu_frame.pack_forget()
    username = session.current_user

    adventurers = load_adventurers()
    user_data = adventurers["adventurers"].get(username, {})
    stats = user_data.get("stats", {})
    user_class = user_data.get("class", "Unassigned")

    status_frame = ttk.Frame(parent, style="My.TFrame")
    status_frame.pack(fill="both", expand=True)

    ttk.Label(status_frame, text=f"{username}'s Status", style="Title.TLabel").pack(pady=10)
    ttk.Label(status_frame, text=f"Class: {user_class}", style="Stat.TLabel").pack(pady=5)
    for stat, value in stats.items():
        ttk.Label(status_frame, text=f"{stat.capitalize()}: {value}", style="Stat.TLabel").pack(pady=2)

    ttk.Button(status_frame, text="Back", command=lambda: back_to_menu(status_frame, parent), style="My.TButton").pack(
        pady=20)











