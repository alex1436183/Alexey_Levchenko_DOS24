class Car:
    def __init__(self, brand, model, year, run, color):
        self.brand = brand
        self.model = model
        self.year = year
        self.run = run
        self.color = color

    def get_info(self):
        return f"{self.year} {self.brand} {self.model} {self.run} {self.color}"

car1 = Car("BMW", "X6", 2020, "127 km", "Blue" )
car2 = Car("Mersedes", "GLN", 2022, " 50 km", "Silver")

print(car1.get_info())
print(car2.get_info())