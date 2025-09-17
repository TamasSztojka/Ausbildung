from Product import Product

class Electronics(Product):
    def __init__(self, name, price, weight, brand, warranty_years):
        super().__init__(name, price, weight)
        self.__brand = brand
        self.__warranty_years = warranty_years

    @property
    def brand(self):
        return self.__brand

    @brand.setter
    def brand(self, value):
        self.__brand = value

    @property
    def warranty_years(self):
        return self.__warranty_years

    @warranty_years.setter
    def warranty_years(self, value):
        self.__warranty_years = value