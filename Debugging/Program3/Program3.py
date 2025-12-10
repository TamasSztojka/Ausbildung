# Debugging_01-03
# Ziel: Auswertung eines Bestellsystems

print("Starte Bestell-Analyse...")

orders = [
    {"id": 1, "customer": "Müller", "items": [{"name": "Brot", "price": 3.50},
                                              {"name": "Milch", "price": 1.20}]},
    {"id": 2, "customer": "Schmidt", "items": [{"name": "Apfel", "price": 0.50},
                                               {"name": "Käse", "price": 4.00},
                                               {"name": "Butter", "price": 2.10}]},
    {"id": 3, "customer": "Lehmann", "items": [{"name": "Mehl", "price": 1.00}]}
]

def calculate_total(order):
    print(f"Berechne Gesamtpreis für Bestellung {order['id']}...")
    total = 0
    for item in order["items"]:
        total += item["price"]
    return round(total, 2)

def find_customer_with_most_items(order_list):
    print("Suche Kunden mit meisten Artikeln...")
    max_items = -1
    max_customer = ""

    for order in order_list:
        count = 0
        for item in order["items"]:
            count += 1

        if count > max_items: #also problematic. Wrong comparison sign used!
            max_items = count
            max_customer = order["customer"]

    return max_customer

def calculate_average_price(order_list):
    print("Berechne durchschnittlichen Artikelpreis...")

    total_price = 0
    total_items = 0

    for order in order_list:
        for item in order["items"]:
            total_items += 1
            total_price += item["price"] #replaced total_price = total_price

    if total_items == 0:
        return 0

    return round(total_price / total_items, 2)

summary = {}
for o in orders:
    summary[o["id"]] = calculate_total(o)

top_customer = find_customer_with_most_items(orders)
avg_price = calculate_average_price(orders)

print("\nBestellübersicht:")
for key, val in summary.items():
    print(f"Bestell-ID {key}: {val:.2f} €")

print("\nKunde mit den meisten Artikeln:", top_customer)
print("Durchschnittlicher Artikelpreis:", avg_price)

print("\nAnalyse abgeschlossen.")