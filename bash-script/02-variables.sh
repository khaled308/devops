#!/bin/bash

NAME='khaled'
CURRENT_DIR="$(pwd)"

declare AGE=24
declare -r COUNTRY='Egypt'
# COUNTRY='US' #error readonly variable

echo "Hi $NAME"
echo "Hi ${NAME}"
echo "$CURRENT_DIR"
echo "$(ls $CURRENT_DIR)"

echo $AGE
echo $COUNTRY

unset NAME
echo $NAME
