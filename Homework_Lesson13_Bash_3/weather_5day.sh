#!/bin/bash

API_KEY="2acaef1f83e00b718d6ab7309f1abf6d"
BASE_URL="https://api.openweathermap.org/data/2.5"

# Функция для получения данных о погоде
get_weather() {
    local city="$1"
    local units="$2"

    url="${BASE_URL}/forecast?q=${city}&appid=${API_KEY}&units=${units}"
    response=$(curl -s "$url")

    if [ $? -ne 0 ]; then
        echo "Ошибка: не удалось выполнить запрос."
        exit 1
    fi

    if echo "$response" | jq -e '.cod | tonumber' 2>/dev/null | grep -q -v '^2'; then
        echo "Ошибка вывода API"
        exit 1
    fi

    echo "$response"
}

# Функция для вычисления средней температуры за день
format_weather() {
    local data="$1"

    echo "Прогноз погоды на 5 дней со средней температурой:"
    echo "$data" | jq -r '.list | group_by(.dt_txt[0:10])[] |
        { date: .[0].dt_txt[0:10], avg_temp: ([.[].main.temp] | add / length) } |
        "\(.date): Средняя температура: \(.avg_temp | round)°"'
}

read -p "Введите название города: " city
read -p "Выберите единицу измерения температуры ('C' или 'F'): " unit_choice

case "$unit_choice" in
    c|C)
        units="metric"
        ;;
    f|F)
        units="imperial"
        ;;
    *)
        echo "Неверный выбор единицы измерения. Допустимы только 'C' или 'F'."
        exit 1
        ;;
esac

weather_data=$(get_weather "$city" "$units")
format_weather "$weather_data"
