#!/bin/bash

if [[ "$#" -ne 2 ]]; then
    echo "Введите путь и строку поиска"
    exit 1
fi

dir="$1"
string="$2"

find "$dir" 2>/dev/null | while read file; do
    if [[ -d "$file" ]]; then

	if [[ ! -r "$file" ]]; then
	echo "нет доступа к директории $file"
	continue
	fi

	continue
    fi

    if [[ ! -r "$file" ]]; then
        echo "нет доступа к файлу $file"
        continue
    fi

if grep -q "$string" "$file"; then
    size_file=$(stat -c%s "$file")
    echo "Искомая строка в файле: $file Размер: $size_file байт"
fi
done
