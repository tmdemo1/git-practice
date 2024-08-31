#!/bin/bash

#text colors
#31m -> Red
#31m -> Green
#33m -> Yellow

R="\e[31m"
G="\e[32m"
N="\e[0m"


CHECK_ROOT(){
    if [ $USER -ne 0 ]
    then
        echo -e $R "Please login with SUDO" $N
        exit 1
    fi

}

VALIDATE() {
    if [ $1 -eq 0 ]
    then
        echo -e $G "$2 is successful." $N
    else
        echo -e $R "$2 is failed.... please check" $N
        exit 1
    fi
}

USER=$(id -u)

CHECK_ROOT

dnf list installed git
if [ $? -ne 0 ]
then
    echo -e $G "Git is not installed. Going to install Git." $N
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo -e $G "Git already installed. Nothing to do." $N
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e $G "Mysql is not installed. Going to install Mysql." $N
    dnf install mysql -y
    echo " ************* After installing Mysql. Status is: $?"
    VALIDATE $? "Installing Mysql"
else
    echo -e $G "Mysql already installed. Nothing to do." $N
fi