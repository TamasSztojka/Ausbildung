import tkinter as tk
from tkinter import ttk

class StatsView(ttk.Frame):
    def __init__(self, parent, controller):
        super().__init__(parent, padding=16)
        self.controller = controller

        ttk.Label(self, text="Statistik", font=("Segoe UI", 16, "bold")).pack(pady=(0, 8))

        top = ttk.Frame(self)
        top.pack(fill="x", pady=(0, 8))

        self.progress_label = ttk.Label(top, text="")
        self.progress_label.pack(side="left")

        self.filter_var = tk.StringVar(value="all")
        ttk.Label(top, text="Filter:").pack(side="right", padx=(0, 6))
        combo_box = ttk.Combobox(top, textvariable=self.filter_var, width=18, state="readonly",
                          values=["all", "problematic", "unlearned"])
        combo_box.pack(side="right")
        combo_box.bind("<<ComboboxSelected>>", lambda e: self.refresh())

        self.tree = ttk.Treeview(self, columns=("id","german","english","learned","wrong","err"), show="headings", height=14)
        for column, w in [("id", 60), ("german", 140), ("english", 140), ("learned", 80), ("wrong", 80), ("err", 80)]:
            self.tree.heading(column, text=column)
            self.tree.column(column, width=w, anchor="w")
        self.tree.pack(fill="both", expand=True)

        ttk.Button(self, text="Zurück", command=self.controller.show_start).pack(pady=10)

    def refresh(self):
        learned, total, total_correct = self.controller.model.overall_progress()
        self.progress_label.config(text=f"Gesamt: {learned}/{total} ({total_correct:.1f}%)")

        for row in self.tree.get_children():
            self.tree.delete(row)

        mode = self.filter_var.get()
        rows = self.controller.model.stats_rows()

        for vocab, learned_flag, wrong, correct, error in rows:
            # simple rule: problematic = wrong >= 3
            if mode == "problematic" and wrong < 3:
                continue
            if mode == "unlearned" and learned_flag == 1:
                continue

            self.tree.insert("", "end", values=(
                vocab["id"],
                vocab["german"],
                vocab["english"],
                learned_flag,
                wrong,
                f"{error*100:.0f}%"
            ))