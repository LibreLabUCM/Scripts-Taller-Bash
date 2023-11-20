#!/bin/bash


zapdos=$( curl -s 'https://pokeapi.co/api/v2/pokemon/zapdos')

# echo "$zapdos" | jq
echo "Types: "
echo "$zapdos" | jq -r '.types[].type.name'
echo ""


echo "Moves:"
for move_b46 in $(echo "$zapdos" | jq -r '.moves[] | @base64'); do
  move=$(echo "$move_b46" | base64 -d | jq .)
  move_name=$(echo "$move" | jq -r '.move.name')
  echo -e "\t* $move_name"
done | head -n5

echo ""

echo "Move 'leer':"

move_leer_url=$(echo "$zapdos" | jq -r '.moves[] | select(.move.name=="leer") | .move.url')
move_leer=$(curl -s "$move_leer_url")

move_leer_accuracy=$(echo "$move_leer" | jq -r '.accuracy')
move_leer_effect_chance=$(echo "$move_leer" | jq -r '.effect_chance')
move_leer_effect=$(echo "$move_leer" | jq -r '.effect_entries[0].effect')

echo "Accuracy: $move_leer_accuracy"
echo "Effect chance: $move_leer_effect_chance"
echo "Effect: $move_leer_effect"
