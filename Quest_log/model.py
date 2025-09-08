import os
import json
import random


USERS_FILE = "adventurers.json"

def ensure_adventurers_file():
    if not os.path.exists(USERS_FILE):
        with open(USERS_FILE, "w", encoding="utf-8") as adventurers_file:
            json.dump({"adventurers":{}}, adventurers_file, indent=2)

def load_adventurers():
    ensure_adventurers_file()
    with open(USERS_FILE, "r", encoding="utf-8") as adventurers_file:
        return json.load(adventurers_file)

def save_adventurers(adventurers):
    with open(USERS_FILE, "w", encoding="utf-8") as adventurers_file:
        json.dump(adventurers, adventurers_file, indent=2)

def load_random_spell():
    with open("spell_names.json", "r", encoding="utf-8") as file:
        data = json.load(file)
    return random.choice(data["spells"])

def load_random_riddle():
    with open("mage_riddles.json", "r", encoding="utf-8") as file:
        data = json.load(file)
    return random.choice(data)