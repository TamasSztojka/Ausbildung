from tkinter import messagebox
from Model.VocabRepository import VocabRepository
from Model.Trainer import Trainer
from Model.ProgressRepository import ProgressRepository
from tkinter import ttk
from View.StartView import StartView
from View.StatsView import StatsView
from View.LearnView import LearnView


class AppController:
    def __init__(self, root):
        self.root = root
        self.model = Trainer(VocabRepository(), ProgressRepository(), session_size=10)

        self.session = []
        self.idx = 0
        self.correct_in_session = 0
        self.wrong_in_session = 0
        self.current_item = None

        self.container = ttk.Frame(root)#
        self.container.pack(fill="both", expand=True)

        self.start_view = StartView(self.container, self)
        self.learn_view = LearnView(self.container, self)
        self.stats_view = StatsView(self.container, self)

        for vocab in (self.start_view, self.learn_view, self.stats_view):
            vocab.grid(row=0, column=0, sticky="nsew")

        self.show_start()

    def show_start(self):
        self.start_view.refresh()
        self.start_view.tkraise()

    def show_stats(self):
        self.stats_view.refresh()
        self.stats_view.tkraise()

    def start_learning(self):
        self.session = self.model.new_session()
        self.idx = 0
        self.correct_in_session = 0
        self.wrong_in_session = 0

        if not self.session:
            messagebox.showinfo("Info", "Keine neuen (ungelernten) Vokabeln mehr")
            self.show_start()
            return

        self.learn_view.tkraise()
        self._show_current()

    def _show_current(self):
        self.current_item = self.session[self.idx]
        options = self.model.multi_choice_options(self.current_item)
        self.learn_view.show_item(self.current_item, self.idx + 1, len(self.session), options)

    def next_question(self):
        self.idx += 1
        if self.idx >= len(self.session):
            messagebox.showinfo("Zusammenfassung",
                                f"Fertig!\n\nRichtig! {self.correct_in_session}\nFalsch: {self.wrong_in_session}")
            self.show_start()
            return
        self._show_current()

    def reset_progress(self):
        if messagebox.askyesno("Reset", "Wirklich alles zurücksetzen?"):
            self.model.progress_repo.reset()
            messagebox.showinfo("Reset", "Fortschritt wurde zurückgesetzt")
            self.show_start()

    def answer(self, chosen):
        is_correct, correct_answer = self.model.submit_answer(self.current_item, chosen)

        if is_correct:
            self.correct_in_session += 1
            self.learn_view.set_feedback("Richtig!")
        else:
            self.wrong_in_session += 1
            self.learn_view.set_feedback(f"Falsch! Richtig: {correct_answer}")

        self.learn_view.lock_answers()