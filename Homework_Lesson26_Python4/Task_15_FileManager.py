class FileManager:
    def __init__(self, filename: str, mode: str):
        if not isinstance(filename, str) or not filename.strip():
            raise ValueError("Имя файла должно быть непустой строкой")

        self.filename = filename
        self.mode = mode
        self.file = None

    def __enter__(self):
        self.file = open(self.filename, self.mode, encoding="utf-8")
        return self.file

    def __exit__(self, exc_type, exc_value, traceback):
        if self.file:
            self.file.close()


filename = input("Введите имя файла для последующей записи в него текста: ")
text = input("Введите текст для записи в файл: ")

with FileManager(filename, "w") as file:
    file.write(text)

with FileManager(filename, "r") as file:
    print("Содержимое файла:")
    print(file.read())
