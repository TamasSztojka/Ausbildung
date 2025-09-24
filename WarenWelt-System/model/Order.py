from datetime import datetime
from decimal import Decimal
from CompanyCustomer import CompanyCustomer

class Order:
    def __init__(self, customer, products = None):
        self.__order_time = datetime.now()
        self.__products = products if products else []
        self.__total = 0.00
        self.__customer = customer

        self.calculate_total()

    @property
    def order_time(self):
        return self.__order_time

    @property
    def products(self):
        return self.__products

    @property
    def total(self):
        return self.__total

    @property
    def customer(self):
        return self.__customer

    def calculate_total(self):
        total_sum = Decimal("0.00")

        for product, quantity in self.__products:
            price_as_decimal = Decimal(str(product.price))
            line_total = price_as_decimal * quantity
            total_sum += line_total

        self.__total = total_sum

        if isinstance(self.__customer, CompanyCustomer):
            discount = total_sum * Decimal("0.05")
            total_sum -= discount

        self.__total = total_sum

    def create_invoice(self, filename="invoice.txt"):
        with open(filename, "w", encoding="utf-8") as f:
            f.write("==== INVOICE ====\n")
            f.write(f"Customer: {self.__customer.name}\n")
            f.write(f"Date: {self.__order_time}\n\n")
            f.write("Products:\n")
            for product, quantity in self.__products:
                price_as_decimal = Decimal(str(product.price))
                line_total = price_as_decimal * quantity
                f.write(f"- {product.name} ({quantity}x) = {line_total:.2f}\n")

            f.write("\n")
            f.write(f"Total: {self.__total:.2f}\n")

        print(f"Invoice written to {filename}")


