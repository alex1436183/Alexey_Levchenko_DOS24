class Person:
    def __init__(self, name: str, age: int):
        if not isinstance(name, str) or not name.strip():
            raise ValueError("Имя должно быть непустой строкой")
        if not isinstance(age, int) or age < 0:
            raise ValueError("Возраст должен быть неотрицательным целым числом")

        self.name = name
        self.age = age

    def introduce(self):
        print(f"Привет, меня зовут {self.name}, мне {self.age}.")



name = input("Введите имя: ")
age = int(input("Введите возраст: "))
person = Person(name, age)
person.introduce()