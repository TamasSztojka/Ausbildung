from model.Product import Product

class Electronics(Product):
    def __init__(self, name, price, weight, brand, warranty_years, product_id=None):
        super().__init__(name, price, weight, product_id=product_id)
        self.__brand = brand
        self.__warranty_years = warranty_years

    @property
    def brand(self): return self.__brand
    @property
    def warranty_years(self): return self.__warranty_years

    @staticmethod
    def load_all(storage, sort=None):
        query = """
            SELECT p.id, p.name, p.price, p.weight, e.brand, e.warranty_years
            FROM products p
            JOIN electronics e ON p.id = e.product_id
        """
        if sort == "price":
            query += " ORDER BY p.price"
        elif sort == "name":
            query += " ORDER BY p.name"

        rows = storage.fetch_all(query)
        return [Electronics(row[1], row[2], row[3], row[4], row[5], product_id=row[0]) for row in rows]