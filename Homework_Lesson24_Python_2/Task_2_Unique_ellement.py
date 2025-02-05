def check_unique_elements(tup):
    return len(tup) == len(set(tup))

user_input = input("Введите элементы кортежа через пробел: ")

tup = tuple(user_input.split())

if check_unique_elements(tup):
    print("Все элементы уникальны")
else:
    print("Не все элементы уникальны")