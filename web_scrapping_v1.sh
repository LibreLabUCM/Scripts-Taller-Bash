#!/bin/bash

html=$(curl -s 'https://www.ucm.es/la-casa-del-estudiante/asociaciones-de-estudiantes-ucm')

getInfo() {
  name="$1"

  linenumber=$(echo "$html" | grep -n "$name" | head -n1 | cut -d : -f 1)
  #echo $linenumber

  html=$(tail -n "+${linenumber}" <(echo "$html") )

  linenumber=$(echo "$html" | grep -n "</ul>" | head -n1 | cut -d : -f 1)
  #echo $linenumber

  html=$(head -n "+${linenumber}" <(echo "$html") )

  html=$(echo "$html" | grep "<a href" )

  IFS=$'\n'
  for line in $html; do
    echo "$line"
  done
}

getInfo "LibreLab UCM"
