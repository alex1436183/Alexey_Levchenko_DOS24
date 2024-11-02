#!/bin/bash

if [[ "$#" -ne 3 ]]; then
    echo "Ошибка: Введите имя файла и два параметра для выделения текста"
    exit 1
fi

filename=$1
par1=$2
par2=$3
alloc=$(cut -c "$par1"-"$par2" "$filename") 

if [[ "$?" -eq 0 ]]; then
    echo "Выделенный текст: $alloc"
else
    echo "Ошибка выделения"
fi
    
