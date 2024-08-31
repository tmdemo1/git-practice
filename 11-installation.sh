#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "Please login with SUDO"
else
    echo "User $USER started executing the script $0"
fi