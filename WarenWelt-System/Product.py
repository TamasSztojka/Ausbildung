from Storage import Storage

class Product:
    def __init__(self, name, price, weight, product_id=None):
        self.__id = product_id
        self.__name = name
        self.__price = price
        self.__weight = weight

    @property
    def id(self):
        return self.__id

    @property
    def name(self):
        return self.__name

    @name.setter
    def name(self, new_name):
        self.__name = new_name

    @property
    def price(self):
        return self.__price

    @price.setter
    def price(self, new_price):
        self.__price = new_price

    @property
    def weight(self):
        return self.__weight

    @weight.setter
    def weight(self, new_weight):
        self.__weight = new_weight

    @staticmethod
    def load_product(storage, product_id):
        query = "SELECT id, name, price, weight FROM products WHERE id = %s"
        row = storage.fetch_one(query, (product_id,))
        if row:
            return Product(row[1], row[2], row[3], product_id=row[0])
        return None

    @staticmethod
    def load_all_products(storage):
        query = "SELECT id, name, price, weight FROM products"
        results = storage.fetch_all(query)
        products = [Product(row[1], row[2], row[3], product_id=row[0]) for row in results]
        return products