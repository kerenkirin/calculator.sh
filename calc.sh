#!/bin/bash

set -u

cd "$(dirname "$0")" || exit

math="exit 2"
float=()
f=0
int=()
i=1

if [ $# -lt 3 ]; then	
	echo "not enough arguments"
	exit 2
fi

if ! [ -x ./ops/"$1.sh" ]; then
    echo "there is no such operation"
    exit 2
fi

if [ -x ./ops/"$1.sh" ]; then
	math=$1
	shift
fi

while [ $i -le $# ]; do
    if [[ ! ${!i} =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
	    echo "unsupported characters are present"
        echo "supported"
        echo " - 1 2 3 4 5 6 7 8 9 0 . "
        exit 2
    fi
    ((i++))
done

"./ops/$math.sh" "$@"


