from model.Product import Product

class Books(Product):
    def __init__(self, name, price, weight, author, page_amount, product_id=None):
        super().__init__(name, price, weight, product_id=product_id)
        self.__author = author
        self.__page_amount = page_amount

    @property
    def author(self): return self.__author
    @property
    def page_amount(self): return self.__page_amount

    @staticmethod
    def load_all(storage, sort=None):
        query = """
            SELECT p.id, p.name, p.price, p.weight, b.author, b.page_amount
            FROM products p
            JOIN books b ON p.id = b.product_id
        """
        if sort == "price":
            query += " ORDER BY p.price"
        elif sort == "name":
            query += " ORDER BY p.name"

        rows = storage.fetch_all(query)
        return [Books(row[1], row[2], row[3], row[4], row[5], product_id=row[0]) for row in rows]