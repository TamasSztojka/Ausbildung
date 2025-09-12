import json
import os
from datetime import date

COOLDOWN_FILE = "quest_cooldown.json"

def load_cooldowns():
    if not os.path.exists(COOLDOWN_FILE):
        return {}
    with open(COOLDOWN_FILE, "r", encoding="utf-8") as file:
        return json.load(file)

def save_cooldowns(data):
    with open(COOLDOWN_FILE, "w", encoding="utf-8") as file:
        json.dump(data, file, indent=2)

def has_completed_today(username, quest_id):
    data = load_cooldowns()
    today = str(date.today())
    return str(quest_id) in data.get(username, {}).get(today, [])

def mark_completed(username, quest_id):
    data = load_cooldowns()
    today = str(date.today())

    if username not in data:
        data[username] = {}
    if today not in data[username]:
        data[username][today] = []

    if quest_id not in data[username][today]:
        data[username][today].append(quest_id)

    save_cooldowns(data)