import random

from Model.VocabRepository import VocabRepository
from Model.ProgressRepository import ProgressRepository


class Trainer:
    def __init__(self, vocab_repo: VocabRepository, progress_repo: ProgressRepository, session_size=10):
        self.vocab_repo = vocab_repo
        self.progress_repo = progress_repo
        self.session_size = session_size
        self.vocab = self.vocab_repo.load_all()

    def overall_progress(self):
        total = len(self.vocab)
        learned = 0
        for vocab in self.vocab:
            l, _, _ = self.progress_repo.get(vocab["id"])
            learned += 1 if l == 1 else 0
        correct_total = (learned / total * 100.0) if total else 0.0
        return learned, total, correct_total

    def new_session(self):
        pool = []
        for vocab in self.vocab:
            learned, _, _ = self.progress_repo.get(vocab["id"])
            if learned == 0:
                pool.append(vocab)

        random.shuffle(pool)
        return pool[: min(self.session_size, len(pool))]

    def multi_choice_options(self, item):
        correct = item["english"]
        wrong = list(item.get("wrong_answers", []))

        if len(wrong) < 3:
            candidates = [v["english"] for v in self.vocab if v["id"] != item["id"]]
            random.shuffle(candidates)
            for candidate in candidates:
                if candidate != correct and candidate not in wrong:
                    wrong.append(candidate)
                if len(wrong) >= 3:
                    break

        options = [correct] + wrong[:3]
        random.shuffle(options)
        return options

    def submit_answer(self, item, chosen):
        vocab_id = item["id"]
        correct_answer = item["english"]
        learned, wrong, correct = self.progress_repo.get(vocab_id)

        is_correct = (chosen == correct_answer)
        if is_correct:
            correct += 1
            learned = 1
        else:
            wrong += 1

        self.progress_repo.set(vocab_id, learned, wrong, correct)
        return is_correct, correct_answer

    def stats_rows(self):
        rows = []
        for vocab in self.vocab:
            learned, wrong, correct = self.progress_repo.get(vocab["id"])
            attempts = wrong + correct
            error = (wrong / attempts) if  attempts else 0.0
            rows.append((vocab, learned, wrong, correct, error))
        return rows