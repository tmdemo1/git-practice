#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "Please login with SUDO"
    exit 1
fi

dnf list installed git
if [ $? -ne 0 ]
then
    echo "Git is not installed. Going to install Git."
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Git installed successfully."
    else
        echo "Git installation is not success... please check"
        exit 1
    fi
else
    echo "Git already installed. Nothing to do."
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql is not installed. Going to install Mysql."
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Mysql installed successfully."
    else
        echo "Mysql installation is not success... please check"
        exit 1
    fi
else
    echo "Mysql already installed. Nothing to do."
fi