from datetime import datetime

class Order:
    def __init__(self, customer):
        self.__order_time = datetime.now()
        self.__products = []
        self.__total = 0.00
        self.__customer = customer

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


