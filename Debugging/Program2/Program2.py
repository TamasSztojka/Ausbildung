print("Starte Sensoranalyse...")

temperatures = [21, 19, 23, 22, 18, 17, 20, 21, 24, 19]

def calculate_average(values):
    print("Berechne Durchschnitt...")
    total = 0
    for v in values:
        total += v
    avg = total / len(values) #The problem was here
    return avg

def find_threshold_exceed(values, threshold):
    print("Suche Werte über Schwelle...")
    result = []
    index = 0

    while index < len(values):
        if values[index] > threshold:
            result.append(index)
        index += 1

    return result

THRESHOLD = 25

avg_temp = calculate_average(temperatures)
exceed = find_threshold_exceed(temperatures, THRESHOLD)

print("\nTemperaturen:")
for i, t in enumerate(temperatures):
    print(f"Messpunkt {i+1}: {t}°C")

print("\nDurchschnittstemperatur:", avg_temp)
print("Temperaturen über Schwelle:", exceed)

print("\nAnalyse abgeschlossen.")