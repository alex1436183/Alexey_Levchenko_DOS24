def count_words(filename):
    try:
        with open(filename, 'r', encoding='utf-8') as file:
            text = file.read()
            words = text.split()
            return len(words)
    except FileNotFoundError:
        print(f"Файл '{filename}' не найден.")
        return None
    except Exception as e:
        print(f"Ошибка при обработке файла: {e}")
        return None


filename = input("Введите путь к файлу: ")
word_count = count_words(filename)

if word_count is not None:
    print(f"Количество слов в файле '{filename}': {word_count}")