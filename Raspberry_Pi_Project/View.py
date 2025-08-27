import tkinter as tk
from tkinter import ttk
import tkinter.font as tkFont
import sv_ttk

def login_window(root):
    root.title("Quest Log")
    root.configure(background="black")
    root.geometry("1024x600")

    title_font = ("MedievalSharp", 24, "bold")u

    custom_font = tkFont.Font(family="Arial", size=25)
    tk.Label(root, text="Welcome Adventurer", font=title_font, fg='#FFD700', background="black", pady=20).pack()

    tk.Label (root, text="Present thy credentials to pass the gate.", font=custom_font, fg='#FFD700', background='black', pady=20).pack()

    label_username = tk.Label(root, text="Adventurer's name", font=custom_font, fg='#FFD700', background="black", pady = 20)
    label_username.pack(pady=5)
    entry_username = tk.Entry(root, width=30, font=("Arial", 14))
    entry_username.pack(pady=5)

    label_password = tk.Label(root, text="Secret Rune", font=custom_font, fg='#FFD700', background="black", pady = 20)
    label_password.pack(pady=5)
    entry_password = tk.Entry(root, width=30, font=("Arial", 14))
    entry_password.pack(pady=5)



