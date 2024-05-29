#!/bin/bash

if [[ $# -lt 1 ]]
then
    echo "Usage: ${0} USER_NAME [USER_NAME]..."
    exit 1
fi


for user in $@
do
    PASSWORD=$(date +%N%s | sha256sum | head -c48)
    echo "$user: $PASSWORD"
done
