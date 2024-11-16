#!/bin/bash
if [[ "$#" -ne 3 ]]; then
    echo "Для выполнения скрипта введите 3 переменные"
    exit 1
fi    

out_file="$1"
ext="$2"
dir="$3"

if [[ ! -d "$dir" ]]; then
    echo " Директория: "$dir" недоступна или не существует " 
    exit 1
fi

find "$dir" -name "*$ext" > "$out_file"
echo "Имена файлов с заданными расширениями перемещены в файл $out_file"
