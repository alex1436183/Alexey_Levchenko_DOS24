
#!/bin/bash

# Create a function
get_star_wars_characters() {
  local page=${1:-1}
  local api_url="https://swapi.dev/api/people/?page=${page}"

  echo "Requested character data from page ${page}..."
  returns=$(curl -s "$api_url")

  # Checking if there is data
  if echo "$returns" | grep -q '"results"'; then
    # Extract data using jq
    echo "Character Star Wars, page $page :"
    echo "$returns" | jq -r '.results[] | "Name: \(.name), Height: \(.height) cm, Mass: \(.mass) kg, Eye color: \(.eye_color)"'
  else
    echo "Failed to get data"
  fi
}

# Requesting an argument input
read -p "Please enter a number page (default 1): " page
page=${page:-1}


# Calling a function
get_star_wars_characters "$page"
