#!/bin/bash

read -p "Primer número: " n1
read -p "Segundo número: " n2
read -p "Operación (+,-,*,/): " operation

if [ "$operation" == "+" ]; then
  result=$((n1+n2))
elif [ "$operation" == "-" ]; then
  result=$((n1-n2))
elif [ "$operation" == "*" ]; then
  result=$((n1*n2))
elif [ "$operation" == "/" ]; then
  result=$((n1/n2))
else
  echo "Operación no encontrada" >&2
  exit 1
fi

echo "Resultado: $result"

