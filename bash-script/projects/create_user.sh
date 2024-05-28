#!/bin/bash

# This script create user on local system

if [[ $UID -ne 0 ]]
then
    echo "Error: This script must be run as root."
    exit 1
fi

read -p "username: " USER_NAME
read -p "name: " NAME
read -p "password: " PASSWORD

useradd -c $NAME -m $USER_NAME

if [[ $? -ne 0 ]]
then
    exit 1
fi

echo $PASSWORD | passwd --stdin $USER_NAME >/dev/null

# force user to change password 
passwd -e $USER_NAME >/dev/null

echo "user created successfully!"