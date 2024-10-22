#!/bin/bash

if [[ "$#" -ne 2 ]]; then
    echo "Не корректно введены параметры"
    exit 1
fi
filename=$1
new_ext=$2

if [[ "$filename" == *.* ]]; then
    name="${filename%.*}"
else
    name="$filename"
fi

    new_filename="$name"."$new_ext"
    cp "$filename" "$new_filename" 2>/dev/null

if [[ $? -eq 0 ]]; then
    echo "Файл $new_filename с новым расширение скопирован"
else
    echo "Ошибка копирования: проверьте правильно ли указан исходный файл"
fi
