from Product import Product

class Clothes(Product):
    def __init__(self, name, price, weight, size, color):
        super().__init__(name, price, weight)
        self.__size = size
        self.__color = color

    @property
    def size(self):
        return self.__size

    @size.setter
    def size(self, value):
        self.__size = value

    @property
    def color(self):
        return self.__color

    @color.setter
    def color(self, value):
        self.__color = value