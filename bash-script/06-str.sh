#!/bin/bash

P1="${RANDOM}${RANDOM}${RANDOM}"
P2=$(date +%s)
P3=$(date +%N%s)
P4=$(date +%N%s | sha256sum)
P5=$(date +%N%s | sha256sum | head -c 10)

SPECIAL_CHAR=$(echo '!@#$%^&*()=' | fold -w1 | shuf | head -c1)

echo $P1
echo $P2
echo $P3
echo $P4
echo $P5
echo "${P5}${SPECIAL_CHAR}"
