#!/bin/bash

# Создаем  функцию
get_star_wars_characters() {
  local name=$1
  local name_sp="${name// /%20}"
  local api_url="https://swapi.dev/api/people/?search=${name_sp}"
  local next_page_url="$api_url"
  local found=0

  echo "Searching for character(s) with the name '$name'..."

  # Запускаем цикл для поиска на всех страницах
  while [ -n "$next_page_url" ]; do
    # Получаем данные с текущей страницы
    returns=$(curl -s "$next_page_url")

    # Проверяем, есть ли результаты
    if echo "$returns" | grep -q '"results"'; then
      results=$(echo "$returns" | jq -r '.results[] | "Name: \(.name), Height: \(.height) cm, Mass: \(.mass) kg, Eye color: \(.eye_color)"')

      # Если данные найдены, выводим их и отмечаем, что данные были найдены
      if [ -n "$results" ]; then
       echo "$results"
        found=1
      fi

      # Получаем URL для следующей страницы
      next_page_url=$(echo "$returns" | jq -r '.next')
    else
     break
    fi
  done

  # Если данные не были найдены, выводим сообщение, что ничего не найдено
  if [ $found -eq 0 ]; then
   echo "No characters found with the name '$name'."
  fi
}

# Запрашиваем имя персонажа
read -p "Please enter a character name: " name

get_star_wars_characters "$name"
