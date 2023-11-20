#!/bin/bash

# Disk
temp_path=$(mktemp)
echo "Created temporary file on disk: ${temp_path}"
curl -s 'https://pokeapi.co/api/v2/pokemon/ditto' > "$temp_path"
read -p "Pulsa enter para continuar"
rm "$temp_path"
echo "Deleted temporary file on disk: ${temp_path}"

echo ""


# Ram
temp_path=$(mktemp -p /dev/shm/)
echo "Created temporary file on ram: ${temp_path}"
curl -s 'https://pokeapi.co/api/v2/pokemon/ditto' > "$temp_path"
read -p "Pulsa enter para continuar"
rm "$temp_path"
echo "Deleted temporary file on ram: ${temp_path}"
