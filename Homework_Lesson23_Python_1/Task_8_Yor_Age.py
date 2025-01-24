age=input("Введите вашь возраст: ")

if not age.strip():
    print("Вы не ввели возраст")

elif not age.isdigit():
    print("Нужно вводить только цифры")

else:
    print(f"Вашь возраст: {age} ")