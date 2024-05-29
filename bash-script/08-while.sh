#!/bin/bash

while [[ $# -gt 0 ]]
do
    echo $1
    shift
done

while [[ true ]]
do
    echo $RANDOM
    sleep 1
done
