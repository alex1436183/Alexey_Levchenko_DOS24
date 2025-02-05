def replace_vowels(input_string):
    vowels = "аеёиоуыэюяАЕЁИОУЫЭЮЯaeiouAEIOU"
    result = ""
    for char in input_string:
        if char in vowels:
            result += "-"
        else:
            result += char
    return result


input_string = input("Введите строку: ")
print("Результат:", replace_vowels(input_string))



