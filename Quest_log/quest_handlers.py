from view import style_template
from tkinter import ttk, simpledialog, messagebox
import time
import session
from model import load_adventurers, save_adventurers, load_random_riddle, load_random_spell

def handle_memory_spell(quest, parent_frame, parent):
    spell = load_random_spell()

    def check_answer(spell_words, entry, frame):
        user_input = entry.get().strip()
        if user_input.lower() == spell_words.lower():
            messagebox.showinfo("Success", "Correct spell! Intelligence increased")
            apply_reward(quest)
        else:
            messagebox.showinfo("Failed", "Incorrect spell!")

        frame.pack_forget()
        from view import main_menu_window
        main_menu_window(parent, frame)

    messagebox.showinfo("Memoize This Spell", f"Spell: {spell}")
    parent.after(10000, lambda: show_input_field(spell, parent_frame, parent, quest, check_answer))

def show_input_field(spell, parent_frame, parent, quest, check_answer):
    style_template()
    parent_frame.pack_forget()

    input_frame = ttk.Frame(parent, style="My.TFrame")
    input_frame.pack(fill="both", expand=True)

    ttk.Label(input_frame, text="Enter the spell", style="Subtitle.TLabel").pack(pady=10)
    entry = ttk.Entry(input_frame, width=30, font=("MedievalSharp", 18))
    entry.pack(pady=10)

    submit_button = ttk.Button(input_frame, text="Submit", style="My.TButton",
                               command=lambda: check_answer(spell, entry, input_frame))
    submit_button.pack(pady=10)

def handle_riddle_quest(quest, parent_frame, parent):
    riddle = load_random_riddle()
    question = riddle["question"]
    answer = riddle["answer"].strip().lower()

    user_answer = simpledialog.askstring("Riddle", f"{quest['goal']}\n\n{question}")
    if user_answer and user_answer.strip().lower() == answer:
        messagebox.showinfo("Success", "Correct answer! Intelligence increased")
        apply_reward(quest)

    else:
        messagebox.showerror("Incorrect", f"Wrong answer!")

    parent_frame.pack_forget()
    from view import main_menu_window
    main_menu_window(parent, parent_frame)

def apply_reward(quest):
    username = session.current_user
    adventures = load_adventurers()
    user = adventures["adventurers"].get(username)
    user["experience"] += quest["reward"]["exp"]

    for stat, value in quest["reward"]["stat"].items():
        stat_key = stat.lower()
        user["stats"][stat_key] = user["stats"].get(stat_key, 0) + value

    save_adventurers(adventures)

QUEST_HANDLERS = {
    5: handle_memory_spell,
    6: handle_riddle_quest,
}


