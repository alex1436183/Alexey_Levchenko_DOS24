class Animal:
    def make_sound(self):
        print("Животное издаёт звуки: ")

class Dog(Animal):
    def make_sound(self):
        print("Собака: Гав-гав-гав!")

class Cat(Animal):
    def make_sound(self):
        print("Кот: Мяу-мяу-мяу!")

animal = Animal()
animal.make_sound()

dog = Dog()
dog.make_sound()

cat = Cat()
cat.make_sound()