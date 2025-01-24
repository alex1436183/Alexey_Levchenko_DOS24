word = input("Введите слово:")
not_space = word.strip()

if not_space:
    print("Первая буква слова:  " + not_space[0])
else:
    print("Вы ничего не ввели")


