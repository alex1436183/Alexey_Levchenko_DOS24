number = input("Введите число: ")

if not number.strip():
    print("Вы ничего не ввели")
else:
    number = float(number)
    for x in range(1, 11):
        print(f"{number} * {x} = {number * x}")

