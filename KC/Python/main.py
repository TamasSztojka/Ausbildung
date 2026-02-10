import tkinter as tk
from Controller.AppController import AppController

root = tk.Tk()
root.title("Vokabeltrainer")
root.geometry("800x500")

AppController(root)

root.mainloop()
