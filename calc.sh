#!/bin/bash

set -u

cd "$(dirname "$0")" || exit

math="exit 2"
float=()
f=0
int=()
i=0

if [ $# -lt 3 ]; then	
	echo "exit 2"
	
fi

if [ -x ./ops/"$1.sh" ]; then
	math=$1
	shift
fi

while [ -n "$1" ]; do
    if [[ $1 = *.* ]] then
        float[$f]=$1
        ((f++))
    elif  [[ $1 = * ]] then
        int[$i]=$1
        ((i++))
	fi
	shift
done


