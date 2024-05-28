#!/bin/bash

read -p "Enter your user: " USER_ID

USER_NAME=$(id -un $USER_ID 2>/dev/null)

if [[ $? -ne 0 ]]
then
    echo "user id is not valid"
else
    echo $USER_NAME
fi
