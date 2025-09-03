import tkinter as tk
from view import login_window
from view import scale_fonts

root = tk.Tk()
root.geometry("1024x600")
scale_fonts(root, base_width=1024)
login_window(root)
root.mainloop() 