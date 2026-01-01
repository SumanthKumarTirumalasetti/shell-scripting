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
    if [ $? -ne 0 ]
    then
        echo "Installing MSSQL FAILURE"
    else
        echo "Installing MSSQL SUCCESS"
    fi
else
    echo "Mysql is already installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Installing Git FAILURE"
    else
        echo "Installing Git SUCCESS"
    fi
else
    echo "Git is alreay installed"
fi
