#!/bin/bash

cd "$(dirname "$0")" || exit

math=add
float=()
f=0
int=()
i=0

if [ ./ops/"$1.sh" ]; then
	math=$1
	shift
fi

while [ -n "$1" ]; do
    if [[ $1 = ---* ]] then
        float[$f]=$1
        ((f++))
    elif  [[ $1 = --* ]] then
        int[$i]=$1
        ((i++))
    elif  [[ $1 = -* ]] then
	fi
	shift
done

echo  > ./ops/$math.sh
echo  > ./ops/$math.sh
./ops/$math.sh

