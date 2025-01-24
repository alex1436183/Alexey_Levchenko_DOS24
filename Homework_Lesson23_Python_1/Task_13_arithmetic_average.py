number = input("Введи два числа через пробол: ")

breaks = number.split()

if not breaks != 2:
    print("Вы ввели не 2 числа")
else:
    x, y = map(float, breaks)
    average = (x + y) /2
    print(f"Среднее арифметическое {x} и {y} равно {average}")

