import os

def sort_directory(path="."):
    path = os.path.abspath(path)
    if not os.path.exists(path):
        print(f"Ошибка: Путь '{path}' не существует или недоступен.")
        return

    output_lines = []  # Список для хранения строк вывода

    for root, dirs, files in os.walk(path):
        output_lines.append(f"\n Текущий каталог: {root}")

        dirs.sort()
        files.sort()

        if dirs:
            output_lines.append(" Подкаталоги:")
            output_lines.extend(f"   - {dir}" for dir in dirs)
        else:
            output_lines.append(" Нет подкаталогов.")

        if files:
            output_lines.append(" Файлы:")
            output_lines.extend(f"   - {file}" for file in files)
        else:
            output_lines.append(" Файлов нет.")



    for line in output_lines:
        print(line)

    output_file_path = os.path.join(path, "output.txt")

    try:
        with open(output_file_path, "w", encoding="utf-8") as file:
            file.write("\n".join(output_lines))
        print(f"\n Файл с результатами сохранен: {output_file_path}")
    except PermissionError:
        print("\n Ошибка: Нет прав для записи в этот каталог.")

folder_path = input("Введите путь к каталогу для просмотра его содержимого в отсортированном виде: ").strip()
sort_directory(folder_path)