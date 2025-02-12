import math


class Circle:
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return math.pi * self.radius ** 2


class Rectangle:
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def area(self):
        return self.width * self.height


shapes = [Circle(8), Rectangle(5, 7)]
for shape in shapes:
    if isinstance(shape, Circle):
        print(f"Площадь круга: {shape.area():.2f}")
    elif isinstance(shape, Rectangle):
        print(f"Площадь прямоугольника: {shape.area()}")
