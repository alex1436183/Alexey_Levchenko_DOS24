#!/bin/bash

if [[ "$1" == "--resync" ]]; then
    echo "Запуск rclone с параметром --resync"
    rclone -v bisync /home/avl1/mys3 mys3://avl-mys3/mys3 --resync
else
    echo "Запуск rclone без параметра --resync"
    rclone -v bisync /home/avl1/mys3 mys3://avl-mys3/mys3
fi

echo "Запуск rsync для синхронизации с BM"
rsync -av /home/avl1/mys3/ avl@192.168.1.210:/home/avl/mys3
