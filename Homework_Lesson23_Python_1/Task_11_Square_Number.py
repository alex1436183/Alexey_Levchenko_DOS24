number = (input("Веедите число: " ))

if not number.strip():
    print("Вы ничего не ввели")

else:
    number=float(number)
    square = number ** 2
    print(f"Корень квадратный числа {number} равен {square} ")

