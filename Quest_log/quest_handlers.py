import threading
from view import style_template
import tkinter as tk
import time
from tkinter import ttk, simpledialog, messagebox
from sensors import read_distance_cm
import session
from model import load_adventurers, save_adventurers, load_random_riddle, load_random_spell

def cancel_and_return(frame, parent):
    frame.pack_forget()
    from view import main_menu_window
    main_menu_window(parent, frame)

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

def handle_pushup_training(quest, parent_frame, parent):
    from view import style_template
    style_template()

    parent_frame.pack_forget()

    pushup_frame = ttk.Frame(parent, style="My.TFrame")
    pushup_frame.pack(fill="both", expand=True)

    ttk.Label(pushup_frame, text="Puss-Up Training", style="Title.TLabel").pack(pady=10)
    ttk.Label(pushup_frame, text="Do 10 push-ups by lowering and raising your body over and over the sensor", style="Subtitle.TLabel").pack(pady=10)

    pushup_count = tk.IntVar(value=0)
    display = ttk.Label(pushup_frame, text="Push-Ups: 0", style="Stat.TLabel")
    display.pack(pady=10)

    def sensor_loop():
        prev_state = "up"
        while pushup_count.get() < 10:
            distance = read_distance_cm()

            if prev_state == "up" and distance < 8:
                prev_state = "down"
            elif prev_state == "down" and distance > 15:
                prev_state = "up"
                pushup_count.set(pushup_count.get() + 1)
                display.config(text=f"Push-Ups: {pushup_count.get()}")

            time.sleep(0.2)

        messagebox.showinfo("Quest Complete", "10 push-ups done!")
        apply_reward(quest)
        cancel_and_return(pushup_frame, parent)

    ttk.Button(pushup_frame, text="Start", style="My.TButton", command=lambda: threading.Thread(target=sensor_loop, daemon=True).start()).pack(pady=10)
    ttk.Button(pushup_frame, text="Cancel", style="My.TButton", command=lambda: cancel_and_return(pushup_frame, parent)).pack(pady=10)

def handle_plank_endurance(quest, parent_frame, parent):
    from view import style_template
    style_template()

    parent_frame.pack_forget()

    plank_frame = ttk.Frame(parent, style="My.TFrame")
    plank_frame.pack(fill="both", expand=True)

    ttk.Label(plank_frame, text="Plank Endurance", style="Title.TLabel").pack(pady=10)
    ttk.Label(plank_frame, text="Hold your body within 10-20cm of the sensor for 30 seconds.", style="Subtitle.TLabel").pack(pady=10)

    timer_label  = ttk.Label(plank_frame, text="Time: 0s", style="Stat.TLabel")
    timer_label.pack(pady=10)

    def plank_loop():
        start_time = None
        total_held = 0

        while total_held < 30:
            distance = read_distance_cm()

            if 10 <= distance <= 20:
                if start_time is None:
                    start_time = time.time()
                else:
                    total_held = int(time.time() - start_time)
                    timer_label.config(text=f"Time: {total_held}s")

            else:
                start_time = None
                timer_label.config(text="Resetting...")

            time.sleep(0.3)

        messagebox.showinfo("Quest Complete", "You held the plank for 30 seconds!")
        apply_reward(quest)
        cancel_and_return(plank_frame, parent)

    ttk.Button(plank_frame, text="Start", style="MyTButton", command=lambda: threading.Thread(target=plank_loop, daemon=True).start()).pack(pady=10)
    ttk.Button(plank_frame, text="Cancel", style="MyTButton", command=lambda: cancel_and_return(plank_frame, parent)).pack(pady=10)


QUEST_HANDLERS = {
    1: handle_pushup_training,
    2: handle_plank_endurance,
    5: handle_memory_spell,
    6: handle_riddle_quest,
}


