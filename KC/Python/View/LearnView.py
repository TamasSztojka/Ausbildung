from tkinter import ttk

class LearnView(ttk.Frame):
    def __init__(self, parent, controller):
        super().__init__(parent, padding=16)
        self.controller = controller

        ttk.Label(self, text="Lernen", font=("Segoe UI", 16, "bold")).pack(pady=(0, 6))

        self.counter_label = ttk.Label(self, text="")
        self.counter_label.pack()

        self.question_label = ttk.Label(self, text="", font=("Segoe UI", 14))
        self.question_label.pack(pady=10)

        self.feedback_label = ttk.Label(self, text="")
        self.feedback_label.pack(pady=(0, 8))

        self.button_frame = ttk.Frame(self)
        self.button_frame.pack(pady=8)

        self.answer_buttons = []
        for i in range(4):
            button = ttk.Button(self.button_frame, text="...", width=30)
            button.grid(row=i//2, column=i%2, padx=10, pady=10, sticky="nsew")
            self.answer_buttons.append(button)

        nav = ttk.Frame(self)
        nav.pack(pady=10)
        self.next_button = ttk.Button(nav, text="Weiter", command=self.controller.next_question, state="disabled")
        self.next_button.grid(row=0, column=0, padx=8)
        ttk.Button(nav, text="Abbrechen", command=self.controller.show_start).grid(row=0, column=1, padx=8)

    def show_item(self, item, index, total, options):
        self.feedback_label.config(text="")
        self.next_button.config(state="disabled")
        self.counter_label.config(text=f"Vokabel {index}/{total}")
        self.question_label.config(text=f"German: {item['german']}")

        for button, option in zip(self.answer_buttons, options):
            button.config(text=option, state="normal", command=lambda x=option: self.controller.answer(x))

    def lock_answers(self):
        for b in self.answer_buttons:
            b.config(state="disabled")
        self.next_button.config(state="normal")

    def set_feedback(self, text):
        self.feedback_label.config(text=text)
