from tkinter import ttk

class StartView(ttk.Frame):
    def __init__(self, parent, controller):
        super().__init__(parent, padding=16)
        self.controller = controller

        ttk.Label(self, text="Vokabeltrainer", font=("Segoe UI", 18, "bold")).pack(pady=(0, 10))
        self.progress_label = ttk.Label(self, text="")
        self.progress_label.pack(pady=(0, 10))

        buttons = ttk.Frame(self)
        buttons.pack(pady=10)

        ttk.Button(buttons, text="Lerneinheit starten", command=self.controller.start_learning)\
            .grid(row=0, column=0, padx=8)
        ttk.Button(buttons, text="Statistik", command=self.controller.show_stats)\
            .grid(row=0, column=1, padx=8)
        ttk.Button(buttons, text="Reset", command=self.controller.reset_progress)\
            .grid(row=0, column=2, padx=8)

    def refresh(self):
        learned, total, pct = self.controller.model.overall_progress()
        self.progress_label.config(text=f"Gesamt: {learned}/{total} gelernt ({pct:.1f}%)")