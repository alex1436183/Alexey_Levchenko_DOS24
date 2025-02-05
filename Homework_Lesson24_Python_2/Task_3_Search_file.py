import os


def search_files(directory, substring):
    matching_files = []

    for root, dirs, files in os.walk(directory):
        for file in files:
            if substring in file:
                matching_files.append(os.path.join(root, file))

    return matching_files


directory = input("Введите путь к директории: ")
substring = input("Введите подстроку в имени файла для поиска: ")

result = search_files(directory, substring)

if result:
    print("Найденные файлы:")
    print("\n" .join(result))
else:
    print("Файлы не найдены.")
