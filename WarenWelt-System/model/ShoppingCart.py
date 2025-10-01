from model.Storage import Storage
from decimal import Decimal

class ShoppingCart:
    def __init__(self, customer, storage):
        self.__customer = customer
        self.__products = []
        self.__price = Decimal(0.00)
        self.__storage = storage
        self.__cart_id = None
        self.__create_cart_in_databases()

    def __create_cart_in_databases(self):
        query = "INSERT INTO shopping_carts (customer_id, total) VALUES (%s, %s)"
        self.__cart_id = self.__storage.execute_query(query, (self.__customer.id, 0.0))

    @property
    def customer(self):
        return self.__customer

    @property
    def products(self):
        return self.__products

    @property
    def price(self):
        return self.__price

    @property
    def cart_id(self):
        return self.__cart_id

    def add_product(self, product, quantity=1):
        self.__products.append((product, quantity))
        self.__price += product.price * quantity

        query = "INSERT INTO cart_products (cart_id, product_id, quantity, price) VALUES (%s, %s, %s, %s)"
        self.__storage.execute_query(query, (self.__cart_id, product.id, quantity, product.price))

        query = "UPDATE shopping_carts SET total = %s WHERE id = %s"
        self.__storage.execute_query(query, (self.__price, self.__cart_id))

    def remove_product(self, product_id):
        for product, quantity in self.products:
            if product.id == product_id:
                self.__price -= product.price * quantity
                self.__products.remove((product, quantity))

                query = "DELETE FROM cart_products WHERE cart_id = %s AND product_id = %s"
                self.__storage.execute_query(query, (self.__cart_id, product_id))

                query = "UPDATE shopping_carts SET total = %s WHERE id = %s"
                self.__storage.execute_query(query, (self.__price, self.__cart_id))
                break

    def clear_cart(self):
        self.__products = []
        self.__price = 0.0

        query = "DELETE FROM cart_products WHERE cart_id = %s"
        self.__storage.execute_query(query, (self.__cart_id,))

        query = "UPDATE shopping_carts SET total = %s WHERE id = %s"
        self.__storage.execute_query(query, (0.0, self.__cart_id))