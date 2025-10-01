from model.Product import Product

class Clothes(Product):
    def __init__(self, name, price, weight, size, color, product_id=None):
        super().__init__(name, price, weight, product_id=product_id)
        self.__size = size
        self.__color = color

    @property
    def size(self): return self.__size
    @property
    def color(self): return self.__color

    @staticmethod
    def load_all(storage, sort=None):
        query = """
            SELECT p.id, p.name, p.price, p.weight, c.size, c.color
            FROM products p
            JOIN clothes c ON p.id = c.product_id
        """
        if sort == "price":
            query += " ORDER BY p.price"
        elif sort == "name":
            query += " ORDER BY p.name"

        rows = storage.fetch_all(query)
        return [Clothes(row[1], row[2], row[3], row[4], row[5], product_id=row[0]) for row in rows]