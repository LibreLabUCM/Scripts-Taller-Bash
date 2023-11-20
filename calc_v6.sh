#!/bin/bash

isNumeric() {
  n=$1
  re='^[0-9]+$'
  if [[ $n =~ $re ]]; then
    return 0
  else
    return 1
  fi
}

operate() {
  n1=$1
  n2=$2
  operation=$3

  if ! isNumeric "$n1"; then
    echo "El primer valor no es numérico" >&2
    return 1
  fi
  if ! isNumeric "$n1"; then
    echo "El segundo valor no es numérico" >&2
    return 1
  fi

  if [[ "$operation" == "+" ]]; then
    result=$((n1+n2))
  elif [[ "$operation" == "-" ]]; then
    result=$((n1-n2))
  elif [[ "$operation" == "*" ]]; then
    result=$((n1*n2))
  elif [[ "$operation" == "/" ]]; then
    if [[ $n2 -eq 0 ]]; then
      echo "No se puede dividir entre 0" >&2
      return 1
    else
      result=$((n1/n2))
    fi
  else
    echo "Operación no encontrada" >&2
    return 1
  fi
  echo $result
}

for i in $(seq 0 2); do
  read -p "Primer número: " n1
  read -p "Segundo número: " n2
  read -p "Operación (+,-,*,/): " operation

  result=$(operate "$n1" "$n2" "$operation")
  err_code=$?
  if [[ $err_code -eq 0 ]]; then
    echo -e "Resultado: ${result}\n"
  else
    echo -e "Resultado: error ${err_code}\n"
  fi
done
