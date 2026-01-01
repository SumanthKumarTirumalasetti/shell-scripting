#!/bin/bash

USERID=$(id -u)

VALIDATE() {

    if [ $1 -ne 0 ]
    then
        echo "$2 FAILURE"
        exit1
    else
        echo "$2 SUCCESS"
    fi

}


if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1
fi

dnf list mysql

if [ $? -ne 0 ]
then
    dnf install mysql-server -y
    VALIDATE $? "Installing Mysql"
else
    echo "Mysql is already installed"
fi

dnf list git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git is already installed"
fi