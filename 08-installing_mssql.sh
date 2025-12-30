#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "user must have supervison privilages to execute this script"
fi

#dnf install mysql -y