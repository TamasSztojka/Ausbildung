from tkinter import ttk
from tkinter import messagebox
import tkinter as tk
import tkinter.font as tkfont
import session
from controller import register, login, logout_function, choose_class_function, choose_class, back_to_menu
from model import load_adventurers, save_adventurers
import json


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

def style_template():
    style = ttk.Style()
    style.theme_use("clam")
    style.configure("Title.TLabel", font=("MedievalSharp", 25), foreground="gold", background="black")
    style.configure("Subtitle.TLabel", font=("MedievalSharp", 20), foreground="gold", background="black")
    style.configure("Stat.TLabel", font=("MedievalSharp", 20), foreground="white", background="black")
    style.configure("My.TEntry", foreground="black", insertcolor="black", font=("MedievalSharp", 20))
    style.configure("Frame.TButton", foreground="Black", background="black", fieldbackground="black")
    style.configure("My.TButton", foreground="black", font=("MedievalSharp", 20), background="#FFA500")

def login_window_body(menu_frame, root):
    style_template()

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
    style_template()

    main_menu_frame = ttk.Frame(parent, style="My.TFrame")
    main_menu_frame.pack(padx=20, pady=20)

    ttk.Label(main_menu_frame, text="Welcome Back, Adventurer", style="Title.TLabel").pack(pady=20)

    button_frame = ttk.Frame(main_menu_frame, style="My.TFrame")
    button_frame.pack(padx=20, pady=20)
    choose_class_button = ttk.Button(button_frame, text="Choose Class", command=lambda:choose_class_function(main_menu_frame, parent), style="My.TButton")
    choose_class_button.grid(row=0, column=0, padx=10, pady=10)
    status_button = ttk.Button(button_frame, text="Status", command=lambda: show_status_window(main_menu_frame, parent), style="My.TButton")
    status_button.grid(row=1, column=0, padx=10, pady=10)
    quests_button = ttk.Button(button_frame, text="Quests", command=lambda: show_quest_window(main_menu_frame, parent), style="My.TButton")
    quests_button.grid(row=2, column=0, padx=10, pady=10)
    logout_button = ttk.Button(button_frame, text="Logout", command=lambda:logout_function(main_menu_frame, parent), style="My.TButton")
    logout_button.grid(row=3, column=0, padx=10, pady=10)
    quit_button = ttk.Button(button_frame, text="Quit", command=lambda:quit(), style="My.TButton")
    quit_button.grid(row=4, column=0, padx=10, pady=10)

    return main_menu_frame

def choose_class_window(main_menu_frame, parent):
    style_template()

    choose_class_frame = ttk.Frame(parent, style="My.TFrame")
    choose_class_frame.pack(padx=20, pady=20)

    ttk.Label(choose_class_frame, text="Choose your class", style="Title.TLabel").pack(pady=20)

    button_frame = ttk.Frame(choose_class_frame, style="My.TFrame")
    button_frame.pack(padx=20, pady=20)
    warrior_button = ttk.Button(button_frame, text="Warrior", command=lambda:choose_class("Warrior", main_menu_frame, choose_class_frame), style="My.TButton")
    warrior_button.grid(row=0, column=0, padx=10, pady=10)
    mage_button = ttk.Button(button_frame, text="Mage", command=lambda:choose_class("Mage", main_menu_frame, choose_class_frame), style="My.TButton")
    mage_button.grid(row=1, column=0, padx=10, pady=10)
    thief_button = ttk.Button(button_frame, text="Thief", command=lambda:choose_class("Thief", main_menu_frame, choose_class_frame), style="My.TButton")
    thief_button.grid(row=2, column=0, padx=10, pady=10)

def show_status_window(main_menu_frame, parent):
    style_template()

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

def show_quest_window(main_menu_frame, parent):
    import session
    from model import load_adventurers

    style_template()

    with open("quests.json", "r", encoding="utf-8") as quest_file:
        quests = json.load(quest_file)

    adventurers = load_adventurers()
    username = session.current_user
    user_class = adventurers["adventurers"].get(username, {}).get("class")

    class_quests = [q for q in quests if q["class"] == user_class]

    main_menu_frame.pack_forget()
    quest_list_frame = ttk.Frame(parent, style="My.TFrame")
    quest_list_frame.pack(fill="both", expand=True, padx=20, pady=20)

    ttk.Label(quest_list_frame, text=f"{user_class} Quests", style="Title.TLabel").pack(pady=20)

    if not class_quests:
        ttk.Label(quest_list_frame, text="No quests available for your class.", style="Quest.TLabel").pack()
    else:
        for quest in class_quests:
            frame = ttk.Frame(quest_list_frame, style="My.TFrame")
            frame.pack(fill="x", pady=10)

            ttk.Label(frame, text=quest["name"], style="Title.TLabel").pack(anchor="w", padx=10)
            ttk.Label(frame, text=quest["description"], style="Stat.TLabel").pack(anchor="w", padx=20, pady=5)

            ttk.Button(
                frame,
                text="Accept Quest",
                style="My.TButton",
                command=lambda selected_quest=quest: show_quest_detail_window(quest_list_frame, parent, selected_quest)
            ).pack(anchor="e", padx=20, pady=5)

    ttk.Button(quest_list_frame, text="Back", style="My.TButton", command=lambda: back_to_menu(quest_list_frame, parent)
    ).pack(pady=20)

def show_quest_detail_window(quest_list_frame, parent, quest):
    style_template()

    quest_list_frame.pack_forget()
    detail_frame = ttk.Frame(parent, style="My.TFrame")
    detail_frame.pack(fill="both", expand=True, padx=20, pady=20)

    ttk.Label(detail_frame, text=quest["name"], style="Title.TLabel").pack(pady=10)
    ttk.Label(detail_frame, text=quest["description"], style="Subtitle.TLabel", wraplength=800).pack(pady=5)
    ttk.Label(detail_frame, text="Goal:", style="Subtitle.TLabel").pack(pady=(15, 0))
    ttk.Label(detail_frame, text=quest["goal"], style="Subtitle.TLabel", wraplength=800).pack(pady=5)

    sensors = quest["sensor"]
    sensor_display = ", ".join(sensors) if isinstance(sensors, list) else (sensors or "None")
    ttk.Label(detail_frame, text=f"Sensor Required: {sensor_display}", style="Subtitle.TLabel").pack(pady=5)

    reward = quest["reward"]
    reward_string = f"EXP: {reward['exp']} | Stat: " + ", ".join(f"{k} +{v}" for k, v in reward["stat"].items())
    ttk.Label(detail_frame, text=f"Reward: {reward_string}", style="Subtitle.TLabel").pack(pady=10)

    ttk.Button(detail_frame, text="Start Quest", style="My.TButton", command=lambda: start_quest(detail_frame, quest, parent)).pack(pady=20)
    ttk.Button(detail_frame, text="Back to Quest List", style="My.TButton", command=lambda: show_quest_window(detail_frame, parent)).pack(pady=20)

def start_quest(detail_frame, quest, parent):
    from quest_handlers import QUEST_HANDLERS

    detail_frame.pack_forget()
    handler = QUEST_HANDLERS.get(quest["id"])

    if handler:
        handler(quest, detail_frame, parent)
    else:
        # Default/future sensor-based placeholder
        messagebox.showinfo("Coming Soon", "This quest requires a special sensor and is not yet implemented.")
        from view import main_menu_window
        main_menu_window(parent, detail_frame)


def scale_fonts(root, base_width=1024, min_size=9, max_size=18):
    sw = root.winfo_screenwidth()
    scale = max(0.75, min(1.25, sw / base_width))
    try:
        root.tk.call("tk", "scaling", scale)
    except tk.TclError:
        pass

    for name in ("TkDefaultFont", "TkTextFont", "TkFixedFont",
                 "TkMenuFont", "TkHeadingFont", "TkIconFont", "TkTooltipFont"):
        font = tkfont.nametofont(name)
        font.configure(size=int(max(min_size, min(max_size, round(font.cget("size") * scale)))))











