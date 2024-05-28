#!/bin/bash

# Display the UID and username of the user executing this script
# Display if the user is root user or not

USER_NAME=$(id -un)

echo "User Id: $UID"
echo "Username: $USER_NAME"

if [[ "$UID" -eq 0 ]]
then
    echo "you are root"
else
    echo "you are not root"
fi
