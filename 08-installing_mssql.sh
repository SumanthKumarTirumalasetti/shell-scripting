#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "user must have supervison privilages to execute this script"
fi

dnf list installed mysql-server

if [ $? -ne 0 ]
then
    echo "Mysql is already installed"
else
    dnf install mysql-server -y
fi