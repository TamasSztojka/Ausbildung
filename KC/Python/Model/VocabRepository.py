import os
import json

class VocabRepository:
    def __init__(self, json_path="vokabeln.json"):
        self.json_path = json_path

    def load_all(self):
        # load all vocab entries from json
        if not os.path.exists(self.json_path):
            raise FileNotFoundError("vokabeln.json doesn't exist")

        with open(self.json_path, "r", encoding="utf-8") as file:
            data = json.load(file)

        out = []
        for vocab in data:
            if all(key in vocab for key in ["id", "english", "german", "wrong_answers"]):
                out.append(vocab)
        return out