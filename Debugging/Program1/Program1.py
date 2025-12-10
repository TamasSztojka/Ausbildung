# Debugging_01-01

print("Starte Auswertung...")

text = "Python macht Spaß. Debugging hilft, Programme besser zu verstehen."

words = text.split(" ")

def count_long_words(word_list):
    count = 0
    for w in word_list:
        if len(w) > 5:
            count += 1 #Was always returning 0 because the code was count = count. Debugger told me that count wasn't increasing.
    return count

def find_longest_word(word_list):
    longest = ""
    idx = 0

    while idx < len(word_list): # if you put idx <= than it causes a list out of range exception.
        if len(word_list[idx]) > len(longest):
            longest = word_list[idx]
        idx += 1

    return longest

print("Wörter werden analysiert...\n")

long_word_count = count_long_words(words)
longest_word = ""

# Ausgabeschleife zur Übersicht
for i, w in enumerate(words):
    print(f"Wort {i+1}: '{w}', Länge: {len(w)}")

print("\nStarte längstes-Wort-Berechnung...")

longest_word = find_longest_word(words)

print("\nErgebnisse")
print("----------")
print("Anzahl Wörter länger als 5 Zeichen:", long_word_count)
print("Längstes Wort im Text:", longest_word)

print("\nProgramm abgeschlossen.")