name=input("Введите свое имя:")

if not name.strip():
    print ("Вы не ввели имя!")

elif not name.isalpha():
    print ("В имени должны быть лолько буквы!")
else:
    print(f"Привет {name}")