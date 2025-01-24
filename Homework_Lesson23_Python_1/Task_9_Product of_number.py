number = input("Ведите два числа через пробел для вычисления произведения:")

breaks = number.split()

if len(breaks) != 2:
    print("Вы не два числа" )
else:
    x, y = map(float, breaks)
    product = x * y
    print(f"Произведение {x} и {y}  равно {product}")