#!/bin/bash

export LC_ALL=C

printf "%6s | %5s | %5s | %8s \n" "f3" "f2" "round" "1st char"
printf "%-33s\n" "" | tr ' ' '-'
for i in $(seq 0 0.25 10); do
  firstCharacter=${i:0:1}
  printf "%6.3f | %5.2f | %5.0f | %-8d \n" "$i" "$i" "$i" "$firstCharacter"
done

# https://tldp.org/LDP/abs/html/string-manipulation.html


