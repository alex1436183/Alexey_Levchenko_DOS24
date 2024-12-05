#!/bin/bash

dir="$1"
search_string="$2"


if [[ "$#" -ne 2 ]]; then
    echo "Пример использования $0: test text"
    exit 1
fi


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

if grep -q "$search_string" "$file"; then
    size_file=$(stat -c%s "$file")
    echo "Искомая строка в файле: $file Размер: $size_file байт"
fi
done
