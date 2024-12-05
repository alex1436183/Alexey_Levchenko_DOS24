#!/bin/bash

out_file="$1"
ext="$2"
dir="$3"


if [[ "$#" -ne 3 ]]; then
    echo "Пример использования $0:  test/output txt test/"
    exit 1
fi

if [[ ! -d "$dir" ]]; then
    echo " Директория: "$dir" не существует "
    exit 1
fi

find "$dir" -name "*$ext" > "$out_file"
echo "Имена файлов с заданными расширениями перемещены в файл $out_file"
