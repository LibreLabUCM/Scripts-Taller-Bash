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


operation="+"
for n1 in $(seq 0 5); do
  for n2 in $(seq 0 5); do
    result=$(operate "$n1" "$n2" "$operation")
    echo "${n1} + ${n2} = ${result}"
  done
done
