#!/bin/bash

set -e # setting the automatic exit, if we get error, set -ex for debug

failure(){
    echo "Failed at: $1:$2"
}

trap 'failure "${LINENO} $BASH_COMMAND"' ERR # ERR is the error signal

echo "Hello World Success"
echoo "Hello World Failure"
echo "Hello World After Failure"