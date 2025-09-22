from Product import Product

class Books(Product):
    def __init__(self, name, price, weight, author, page_amount):
        super().__init__(name, price, weight)
        self.__author = author
        self.__page_amount = page_amount

    @property
    def author(self):
        return self.__author

    @author.setter
    def author(self, value):
        self.__author = value

    @property
    def page_amount(self):
        return self.__page_amount

    @page_amount.setter
    def page_amount(self, value):
        self.__page_amount = value