#!/bin/bash

echo "Mensaje mandado a stdout (standard output)"
echo "Mensaje mandado a stderr (standard error)" >&2
read -p "Texto leido desde stdin (standard input): " variable

while IFS= read -r l; do
  echo "Linea leida de archivo: $l"
done < printf_v1.sh
