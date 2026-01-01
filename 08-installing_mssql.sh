#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "user must have supervison privilages to execute this script"
    exit 1
fi

dnf list installed mysql-server 

if [ $? -ne 0 ]
then
    dnf install mysql-server -y
    if [ $? -eq 0 ]
    then
        echo "Mysql installed Successfully"
    fi
else
    echo "Mysql is already installed"
fi