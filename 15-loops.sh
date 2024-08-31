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
        echo -e "$R Please run this script with root privileges $N"
        exit 1
    fi

}

VALIDATE() {
    if [ $1 -eq 0 ]
    then
        echo -e "$2 is $G successful. $N"
    else
        echo -e "$2 is $R failed.... please check $N"
        exit 1
    fi
}

USER=$(id -u)

CHECK_ROOT

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo -e "$Y $package is not installed. Going to install $package. $N"
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo -e "$Y $package already installed. Nothing to do. $N"
    fi
done