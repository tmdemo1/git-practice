#!/bin/bash

CHECK_ROOT(){
    if [ $USER -ne 0 ]
    then
        echo "Please login with SUDO"
        exit 1
    fi

}

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo "$2 is successful."
    else
        echo "$2 is failed.... please check"
        exit 1
    fi
}

USER=$(id -u)

CHECK_ROOT

dnf list installed git
if [ $? -ne 0 ]
then
    echo "Git is not installed. Going to install Git."
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git already installed. Nothing to do."
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql is not installed. Going to install Mysql."
    dnf install mysql -y
    VALIDATE $? "Installing Git"
else
    echo "Mysql already installed. Nothing to do."
fi