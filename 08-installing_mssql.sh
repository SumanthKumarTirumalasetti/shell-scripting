#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "user must have supervison privilages to execute this script"
fi

dnf install mysql-server -y

if [ $? -ne 0 ]
then
    echo "Mysql is already installed"
else
    dnf install mysql-server -y
fi