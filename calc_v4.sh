#!/bin/bash


operate() {
  n1=$1
  n2=$2
  operation=$3
  if [ "$operation" == "+" ]; then
    result=$((n1+n2))
  elif [ "$operation" == "-" ]; then
    result=$((n1-n2))
  elif [ "$operation" == "*" ]; then
    result=$((n1*n2))
  elif [ "$operation" == "/" ]; then
    if [ $n2 -eq 0 ]; then
      echo "No se puede dividir entre 0" >&2
      exit 1
    else
      result=$((n1/n2))
    fi
  else
    echo "Operación no encontrada" >&2
    exit 1
  fi
  echo $result
}

i=0
while [ $i -lt 3 ]; do
  read -p "Primer número: " n1
  read -p "Segundo número: " n2
  read -p "Operación (+,-,*,/): " operation

  result=$(operate "$n1" "$n2" "$operation")

  echo "Resultado: ${result}"

  i=$((i+1))
done
